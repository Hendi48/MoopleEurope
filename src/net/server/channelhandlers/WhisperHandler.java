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
package net.server.channelhandlers;

import client.MapleCharacter;
import client.MapleClient;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import net.AbstractMaplePacketHandler;
import net.server.Server;
import net.server.World;
import tools.DatabaseConnection;
import tools.MaplePacketCreator;
import tools.data.input.SeekableLittleEndianAccessor;

/**
 *
 * @author Matze
 */
public final class WhisperHandler extends AbstractMaplePacketHandler {
    public final void handlePacket(SeekableLittleEndianAccessor slea, MapleClient c) {
        byte mode = slea.readByte();
        if (mode == 6) { // whisper
            String recipient = slea.readMapleAsciiString();
            String text = slea.readMapleAsciiString();
            MapleCharacter player = c.getChannelServer().getPlayerStorage().getCharacterByName(recipient);
            if (player != null) {
                player.getClient().announce(MaplePacketCreator.getWhisper(c.getPlayer().getName(), c.getChannel(), text));
                c.announce(MaplePacketCreator.getWhisperReply(recipient, (byte) 1));
            } else {// not found
                World world = Server.getInstance().getWorld(c.getWorld());
                    if (world.isConnected(recipient)) {
                        world.whisper(c.getPlayer().getName(), recipient, c.getChannel(), text);
                        c.announce(MaplePacketCreator.getWhisperReply(recipient, (byte) 1));
                    } else {
                        c.announce(MaplePacketCreator.getWhisperReply(recipient, (byte) 0));
                    }
            }
        } else if (mode == 5) { // - /find
            String recipient = slea.readMapleAsciiString();
            MapleCharacter victim = c.getChannelServer().getPlayerStorage().getCharacterByName(recipient);
            if (victim != null && c.getPlayer().gmLevel() >= victim.gmLevel()) {
                if (victim.getCashShop().isOpened()) {
                    c.announce(MaplePacketCreator.getFindReply(victim.getName(), -1, 2));
                //} else if (victim.inMTS()) {
                //    c.announce(MaplePacketCreator.getFindReply(victim.getName(), -1, 0));
                } else {
                    c.announce(MaplePacketCreator.getFindReply(victim.getName(), victim.getMap().getId(), 1));
                }
            } else { // not found
                try {
                    PreparedStatement ps = DatabaseConnection.getConnection().prepareStatement("SELECT gm FROM characters WHERE name = ?");
                    ps.setString(1, recipient);
                    ResultSet rs = ps.executeQuery();
                    if (rs.next()) {
                        if (rs.getInt("gm") > c.getPlayer().gmLevel()) {
                            c.announce(MaplePacketCreator.getWhisperReply(recipient, (byte) 0));
                            return;
                        }
                    }
                    rs.close();
                    ps.close();
                    int channel = Server.getInstance().getWorld(c.getWorld()).find(recipient) - 1;
                    if (channel > -1) {
                        c.announce(MaplePacketCreator.getFindReply(recipient, channel, 3));
                    } else {
                        c.announce(MaplePacketCreator.getWhisperReply(recipient, (byte) 0));
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        } else if (mode == 0x44) {
            //Buddy find?
        }
    }
}
