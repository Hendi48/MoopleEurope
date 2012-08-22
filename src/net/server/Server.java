/*
 This file is part of the OdinMS Maple Story Server
 Copyright (C) 2008 Patrick Huy <patrick.huy@frz.cc>
 Matthias Butz <matze@odinms.de>
 Jan Christian Meyer <vimes@odinms.de>

 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU Affero General Public License as
 published by the Free Software Foundation version 3 as published by
 the Free Software Foundation. You may not use, modify or distribute
 this program under any other version of the GNU Affero General Public
 License.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU Affero General Public License for more details.

 You should have received a copy of the GNU Affero General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package net.server;

import client.MapleCharacter;
import client.SkillFactory;
import constants.ServerConstants;
import gm.GMPacketCreator;
import gm.server.GMServer;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.InetSocketAddress;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import net.MapleServerHandler;
import net.mina.MapleCodecFactory;
import net.server.channel.Channel;
import net.server.guild.MapleAlliance;
import net.server.guild.MapleGuild;
import net.server.guild.MapleGuildCharacter;
import net.server.world.World;
import org.apache.mina.core.buffer.IoBuffer;
import org.apache.mina.core.buffer.SimpleBufferAllocator;
import org.apache.mina.core.filterchain.IoFilter;
import org.apache.mina.core.service.IoAcceptor;
import org.apache.mina.core.session.IdleStatus;
import org.apache.mina.filter.codec.ProtocolCodecFilter;
import org.apache.mina.transport.socket.nio.NioSocketAcceptor;
import server.CashShop.CashItemFactory;
import server.MapleItemInformationProvider;
import server.TimerManager;
import tools.DatabaseConnection;
import tools.MaplePacketCreator;
import tools.Pair;

public class Server implements Runnable {

    private IoAcceptor acceptor;
    private List<Map<Integer, String>> channels = new LinkedList<>();
    private List<World> worlds = new ArrayList<>();
    private Properties subnetInfo = new Properties();
    private static Server instance = null;
    private List<Pair<Integer, String>> worldRecommendedList = new LinkedList<>();
    private Map<Integer, MapleGuild> guilds = new LinkedHashMap<>();
    private PlayerBuffStorage buffStorage = new PlayerBuffStorage();
    private Map<Integer, MapleAlliance> alliances = new LinkedHashMap<>();
    private boolean online = false;

    public static Server getInstance() {
        if (instance == null) {
            instance = new Server();
        }
        return instance;
    }

    public boolean isOnline() {
        return online;
    }

    public List<Pair<Integer, String>> worldRecommendedList() {
        return worldRecommendedList;
    }

    public void removeChannel(int worldid, int channel) {
        channels.remove(channel);

        World world = worlds.get(worldid);
        if (world != null) {
            world.removeChannel(channel);
        }
    }

    public Channel getChannel(int world, int channel) {
        return worlds.get(world).getChannel(channel);
    }

    public List<Channel> getChannelsFromWorld(int world) {
        return worlds.get(world).getChannels();
    }

    public List<Channel> getAllChannels() {
        List<Channel> channelz = new ArrayList<>();
        for (World world : worlds) {
            for (Channel ch : world.getChannels()) {
                channelz.add(ch);
            }
        }

        return channelz;
    }

    public String getIP(int world, int channel) {
        return channels.get(world).get(channel);
    }

    @Override
    public void run() {
        Properties p = new Properties();
        try {
            p.load(new FileInputStream("moople.ini"));
        } catch (Exception e) {
            System.out.println("Please start create_server.bat");
            System.exit(0);
        }

        System.out.println("MoopleDEV v" + ServerConstants.VERSION + " starting up.\r\n");


        Runtime.getRuntime().addShutdownHook(new Thread(shutdown(false)));
        DatabaseConnection.getConnection();
        Connection c = DatabaseConnection.getConnection();
        try {
            PreparedStatement ps = c.prepareStatement("UPDATE accounts SET loggedin = 0");
            ps.executeUpdate();
            ps.close();
            ps = c.prepareStatement("UPDATE characters SET HasMerchant = 0");
            ps.executeUpdate();
            ps.close();
        } catch (SQLException sqle) {
        }
        IoBuffer.setUseDirectBuffer(false);
        IoBuffer.setAllocator(new SimpleBufferAllocator());
        acceptor = new NioSocketAcceptor();
        acceptor.getFilterChain().addLast("codec", (IoFilter) new ProtocolCodecFilter(new MapleCodecFactory()));
        TimerManager tMan = TimerManager.getInstance();
        tMan.start();
        tMan.register(tMan.purge(), 300000);//Purging ftw...
        tMan.register(new RankingWorker(), ServerConstants.RANKING_INTERVAL);

        long timeToTake = System.currentTimeMillis();
        System.out.println("Loading Skills");
        SkillFactory.loadAllSkills();
        System.out.println("Skills loaded in " + ((System.currentTimeMillis() - timeToTake) / 1000.0) + " seconds");

        timeToTake = System.currentTimeMillis();
        System.out.println("Loading Items");
        MapleItemInformationProvider.getInstance().getAllItems();

        CashItemFactory.getSpecialCashItems();
        System.out.println("Items loaded in " + ((System.currentTimeMillis() - timeToTake) / 1000.0) + " seconds");
        try {
            for (int i = 0; i < Integer.parseInt(p.getProperty("worlds")); i++) {
                System.out.println("Starting world " + i);
                World world = new World(i,
                        Integer.parseInt(p.getProperty("flag" + i)),
                        p.getProperty("eventmessage" + i),
                        Integer.parseInt(p.getProperty("exprate" + i)),
                        Integer.parseInt(p.getProperty("droprate" + i)),
                        Integer.parseInt(p.getProperty("mesorate" + i)),
                        Integer.parseInt(p.getProperty("bossdroprate" + i)));//ohlol

                worldRecommendedList.add(new Pair<>(i, p.getProperty("whyamirecommended" + i)));
                worlds.add(world);
                channels.add(new LinkedHashMap<Integer, String>());
                for (int j = 0; j < Integer.parseInt(p.getProperty("channels" + i)); j++) {
                    int channelid = j + 1;
                    Channel channel = new Channel(i, channelid);
                    world.addChannel(channel);
                    channels.get(i).put(channelid, channel.getIP());
                }
                world.setServerMessage(p.getProperty("servermessage" + i));
                System.out.println("Finished loading world " + i + "\r\n");
            }
        } catch (Exception e) {
            System.out.println("Error in moople.ini, start CreateINI.bat to re-make the file.");
            e.printStackTrace();//For those who get errors
            System.exit(0);
        }

        acceptor.getSessionConfig().setIdleTime(IdleStatus.BOTH_IDLE, 30);
        acceptor.setHandler(new MapleServerHandler());
        try {
            acceptor.bind(new InetSocketAddress(8484));
        } catch (IOException ex) {
        }
        
        System.out.println("Listening on port 8484\r\n\r\n");

        if (Boolean.parseBoolean(p.getProperty("gmserver"))) {
            GMServer.startGMServer();
        }
        System.out.println("Server is now online.");
        online = true;
    }

    public void shutdown() {
        TimerManager.getInstance().stop();
        acceptor.unbind();
        System.out.println("Server offline.");
        System.exit(0);// BOEIEND :D
    }

    public static void main(String args[]) {
        Server.getInstance().run();
    }

    public Properties getSubnetInfo() {
        return subnetInfo;
    }

    public MapleAlliance getAlliance(int id) {
        synchronized (alliances) {
            if (alliances.containsKey(id)) {
                return alliances.get(id);
            }
            return null;
        }
    }

    public void addAlliance(int id, MapleAlliance alliance) {
        synchronized (alliances) {
            if (!alliances.containsKey(id)) {
                alliances.put(id, alliance);
            }
        }
    }

    public void disbandAlliance(int id) {
        synchronized (alliances) {
            MapleAlliance alliance = alliances.get(id);
            if (alliance != null) {
                for (Integer gid : alliance.getGuilds()) {
                    guilds.get(gid).setAllianceId(0);
                }
                alliances.remove(id);
            }
        }
    }

    public void allianceMessage(int id, final byte[] packet, int exception, int guildex) {
        MapleAlliance alliance = alliances.get(id);
        if (alliance != null) {
            for (Integer gid : alliance.getGuilds()) {
                if (guildex == gid) {
                    continue;
                }
                MapleGuild guild = guilds.get(gid);
                if (guild != null) {
                    guild.broadcast(packet, exception);
                }
            }
        }
    }

    public boolean addGuildtoAlliance(int aId, int guildId) {
        MapleAlliance alliance = alliances.get(aId);
        if (alliance != null) {
            alliance.addGuild(guildId);
            return true;
        }
        return false;
    }

    public boolean removeGuildFromAlliance(int aId, int guildId) {
        MapleAlliance alliance = alliances.get(aId);
        if (alliance != null) {
            alliance.removeGuild(guildId);
            return true;
        }
        return false;
    }

    public boolean setAllianceRanks(int aId, String[] ranks) {
        MapleAlliance alliance = alliances.get(aId);
        if (alliance != null) {
            alliance.setRankTitle(ranks);
            return true;
        }
        return false;
    }

    public boolean setAllianceNotice(int aId, String notice) {
        MapleAlliance alliance = alliances.get(aId);
        if (alliance != null) {
            alliance.setNotice(notice);
            return true;
        }
        return false;
    }

    public boolean increaseAllianceCapacity(int aId, int inc) {
        MapleAlliance alliance = alliances.get(aId);
        if (alliance != null) {
            alliance.increaseCapacity(inc);
            return true;
        }
        return false;
    }

    public Set<Integer> getChannelServer(int world) {
        return new HashSet<>(channels.get(world).keySet());
    }

    public byte getHighestChannelId() {
        byte highest = 0;
        for (Iterator<Integer> it = channels.get(0).keySet().iterator(); it.hasNext();) {
            Integer channel = it.next();
            if (channel != null && channel.intValue() > highest) {
                highest = channel.byteValue();
            }
        }
        return highest;
    }

    public int createGuild(int leaderId, String name) {
        return MapleGuild.createGuild(leaderId, name);
    }

    public MapleGuild getGuild(int id, MapleGuildCharacter mgc) {
        synchronized (guilds) {
            if (guilds.get(id) != null) {
                return guilds.get(id);
            }
            if (mgc == null) {
                return null;
            }
            MapleGuild g = new MapleGuild(mgc);
            if (g.getId() == -1) {
                return null;
            }
            guilds.put(id, g);
            return g;
        }
    }

    public void clearGuilds() {//remake
        synchronized (guilds) {
            guilds.clear();
        }
        //for (List<Channel> world : worlds.values()) {
        //reloadGuildCharacters();

    }

    public void setGuildMemberOnline(MapleGuildCharacter mgc, boolean bOnline, int channel) {
        MapleGuild g = getGuild(mgc.getGuildId(), mgc);
        g.setOnline(mgc.getId(), bOnline, channel);
    }

    public int addGuildMember(MapleGuildCharacter mgc) {
        MapleGuild g = guilds.get(mgc.getGuildId());
        if (g != null) {
            return g.addGuildMember(mgc);
        }
        return 0;
    }

    public boolean setGuildAllianceId(int gId, int aId) {
        MapleGuild guild = guilds.get(gId);
        if (guild != null) {
            guild.setAllianceId(aId);
            return true;
        }
        return false;
    }

    public void leaveGuild(MapleGuildCharacter mgc) {
        MapleGuild g = guilds.get(mgc.getGuildId());
        if (g != null) {
            g.leaveGuild(mgc);
        }
    }

    public void guildChat(int gid, String name, int cid, String msg) {
        MapleGuild g = guilds.get(gid);
        if (g != null) {
            g.guildChat(name, cid, msg);
        }
    }

    public void changeRank(int gid, int cid, int newRank) {
        MapleGuild g = guilds.get(gid);
        if (g != null) {
            g.changeRank(cid, newRank);
        }
    }

    public void expelMember(MapleGuildCharacter initiator, String name, int cid) {
        MapleGuild g = guilds.get(initiator.getGuildId());
        if (g != null) {
            g.expelMember(initiator, name, cid);
        }
    }

    public void setGuildNotice(int gid, String notice) {
        MapleGuild g = guilds.get(gid);
        if (g != null) {
            g.setGuildNotice(notice);
        }
    }

    public void memberLevelJobUpdate(MapleGuildCharacter mgc) {
        MapleGuild g = guilds.get(mgc.getGuildId());
        if (g != null) {
            g.memberLevelJobUpdate(mgc);
        }
    }

    public void changeRankTitle(int gid, String[] ranks) {
        MapleGuild g = guilds.get(gid);
        if (g != null) {
            g.changeRankTitle(ranks);
        }
    }

    public void setGuildEmblem(int gid, short bg, byte bgcolor, short logo, byte logocolor) {
        MapleGuild g = guilds.get(gid);
        if (g != null) {
            g.setGuildEmblem(bg, bgcolor, logo, logocolor);
        }
    }

    public void disbandGuild(int gid) {
        synchronized (guilds) {
            MapleGuild g = guilds.get(gid);
            g.disbandGuild();
            guilds.remove(gid);
        }
    }

    public boolean increaseGuildCapacity(int gid) {
        MapleGuild g = guilds.get(gid);
        if (g != null) {
            return g.increaseCapacity();
        }
        return false;
    }

    public void gainGP(int gid, int amount) {
        MapleGuild g = guilds.get(gid);
        if (g != null) {
            g.gainGP(amount);
        }
    }

    public PlayerBuffStorage getPlayerBuffStorage() {
        return buffStorage;
    }

    public void deleteGuildCharacter(MapleGuildCharacter mgc) {
        setGuildMemberOnline(mgc, false, (byte) -1);
        if (mgc.getGuildRank() > 1) {
            leaveGuild(mgc);
        } else {
            disbandGuild(mgc.getGuildId());
        }
    }

    public void reloadGuildCharacters(int world) {
        World worlda = getWorld(world);
        for (MapleCharacter mc : worlda.getPlayerStorage().getAllCharacters()) {
            if (mc.getGuildId() > 0) {
                setGuildMemberOnline(mc.getMGC(), true, worlda.getId());
                memberLevelJobUpdate(mc.getMGC());
            }
        }
        worlda.reloadGuildSummary();
    }

    public void broadcastMessage(int world, final byte[] packet) {
        for (Channel ch : getChannelsFromWorld(world)) {
            ch.broadcastPacket(packet);
        }
    }

    public World getWorld(int id) {
        return worlds.get(id);
    }

    public List<World> getWorlds() {
        return worlds;
    }

    public void gmChat(String message, String exclude) {
        GMServer.broadcastInGame(MaplePacketCreator.serverNotice(6, message));
        GMServer.broadcastOutGame(GMPacketCreator.chat(message), exclude);
    }

    public final Runnable shutdown(final boolean restart) {//only once :D
        return new Runnable() {
            @Override
            public void run() {
                System.out.println((restart ? "Restarting" : "Shutting down") + " the server!\r\n");
                for (World w : getWorlds()) {
                    w.shutdown();
                }
                for (World w : getWorlds()) {
                    while (w.getPlayerStorage().getAllCharacters().size() > 0) {
                        try {
                            Thread.sleep(1000);
                        } catch (InterruptedException ie) {
                            System.err.println("FUCK MY LIFE");
                        }
                    }
                }
                for (Channel ch : getAllChannels()) {
                    while (ch.getConnectedClients() > 0) {
                        try {
                            Thread.sleep(1000);
                        } catch (InterruptedException ie) {
                            System.err.println("FUCK MY LIFE");
                        }
                    }
                }

                TimerManager.getInstance().purge();
                TimerManager.getInstance().stop();

                for (Channel ch : getAllChannels()) {
                    while (!ch.finishedShutdown()) {
                        try {
                            Thread.sleep(1000);
                        } catch (InterruptedException ie) {
                            System.err.println("FUCK MY LIFE");
                        }
                    }
                }
                worlds.clear();
                worlds = null;
                channels.clear();
                channels = null;
                worldRecommendedList.clear();
                worldRecommendedList = null;

                System.out.println("Worlds + Channels are offline.");
                acceptor.unbind();
                acceptor = null;
                if (!restart) {
                    System.exit(0);
                } else {
                    System.out.println("\r\nRestarting the server....\r\n");
                    try {
                        instance.finalize();//FUU I CAN AND IT'S FREE
                    } catch (Throwable ex) {
                    }
                    instance = null;
                    System.gc();
                    getInstance().run();//DID I DO EVERYTHING?! D:
                }
            }
        };
    }
}