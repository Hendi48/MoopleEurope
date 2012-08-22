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
package net.server.world;

import client.MapleCharacter;
import client.MapleJob;
import java.awt.Point;

public class MaplePartyCharacter {
    private String name;
    private int id;
    private int level;
    private int channel, world;
    private int jobid;
    private int mapid;
    private int doorTown = 999999999;
    private int doorTarget = 999999999;
    private Point doorPosition = new Point(0, 0);
    private boolean online;
    private MapleJob job;

    public MaplePartyCharacter(MapleCharacter maplechar) {
        this.name = maplechar.getName();
        this.level = maplechar.getLevel();
        this.channel = maplechar.getClient().getChannel();
        this.world = maplechar.getWorld();
        this.id = maplechar.getId();
        this.jobid = maplechar.getJob().getId();
        this.mapid = maplechar.getMapId();
        this.online = true;
        this.job = maplechar.getJob();
        if (maplechar.getDoors().size() > 0) {
            this.doorTown = maplechar.getDoors().get(0).getTown().getId();
            this.doorTarget = maplechar.getDoors().get(0).getTarget().getId();
            this.doorPosition = maplechar.getDoors().get(0).getTargetPosition();
        }
    }

    public MaplePartyCharacter() {
        this.name = "";
    }

    public MapleJob getJob() {
        return job;
    }

    public int getLevel() {
        return level;
    }

    public int getChannel() {
        return channel;
    }

    public void setChannel(int channel) {
        this.channel = channel;
    }

    public boolean isOnline() {
        return online;
    }

    public void setOnline(boolean online) {
        this.online = online;
    }

    public int getMapId() {
        return mapid;
    }

    public void setMapId(int mapid) {
        this.mapid = mapid;
    }

    public String getName() {
        return name;
    }

    public int getId() {
        return id;
    }

    public int getJobId() {
        return jobid;
    }

    public int getDoorTown() {
        return doorTown;
    }

    public int getDoorTarget() {
        return doorTarget;
    }

    public Point getDoorPosition() {
        return doorPosition;
    }
    
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((name == null) ? 0 : name.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final MaplePartyCharacter other = (MaplePartyCharacter) obj;
        if (name == null) {
            if (other.name != null) {
                return false;
            }
        } else if (!name.equals(other.name)) {
            return false;
        }
        return true;
    }

    public int getWorld() {
        return world;
    }
}
