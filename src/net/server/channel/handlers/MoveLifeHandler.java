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
package net.server.channel.handlers;

import client.MapleClient;
import java.awt.Point;
import java.util.List;
import server.life.MapleMonster;
import server.life.MobSkill;
import server.life.MobSkillFactory;
import server.maps.MapleMapObject;
import server.maps.MapleMapObjectType;
import server.movement.LifeMovementFragment;
import tools.MaplePacketCreator;
import tools.Pair;
import tools.Randomizer;
import tools.data.input.SeekableLittleEndianAccessor;

public final class MoveLifeHandler extends AbstractMovementPacketHandler {

    @Override
    public final void handlePacket(SeekableLittleEndianAccessor slea, MapleClient c) {
        int objectid = slea.readInt();
        short moveid = slea.readShort();
        MapleMapObject mmo = c.getPlayer().getMap().getMapObject(objectid);
        if (mmo == null || mmo.getType() != MapleMapObjectType.MONSTER) {
            return;
        }
        MapleMonster monster = (MapleMonster) mmo;
        List<LifeMovementFragment> res;
        byte nextFlag = slea.readByte();
        byte actionAndDir = slea.readByte();
        int skillId = slea.readByte() & 0xFF;
        int skillLevel = slea.readByte() & 0xFF;
        int option = slea.readShort();
        slea.readByte(); // upper 4 bits: is cheat mob move rand
        slea.readInt(); // hacked code
        slea.read(8); // target x/y or CC DD FF 00 if no target
        MobSkill toUse = null;
        if (nextFlag == 1 && monster.getNoSkills() > 0) {
            int random = Randomizer.nextInt(monster.getNoSkills());
            Pair<Integer, Integer> skillToUse = monster.getSkills().get(random);
            toUse = MobSkillFactory.getMobSkill(skillToUse.getLeft(), skillToUse.getRight());
            int percHpLeft = (monster.getHp() / monster.getMaxHp()) * 100;
            if (toUse.getHP() < percHpLeft || !monster.canUseSkill(toUse)) {
                toUse = null;
            }
        }
        if ((skillId >= 100 && skillId <= 200) && monster.hasSkill(skillId, skillLevel)) {
            MobSkill skillData = MobSkillFactory.getMobSkill(skillId, skillLevel);
            if (skillData != null && monster.canUseSkill(skillData)) {
                skillData.applyEffect(c.getPlayer(), monster, true);
            }
        }
        short startX = slea.readShort();
        short startY = slea.readShort();
        Point startPos = new Point(startX, startY);
        res = parseMovement(slea);
        if (monster.getController() != c.getPlayer()) {
            if (monster.isAttackedBy(c.getPlayer())) {// aggro and controller change
                monster.switchController(c.getPlayer(), true);
            } else {
                return;
            }
        } else if (actionAndDir == -1 && monster.isControllerKnowsAboutAggro() && !monster.isMobile() && !monster.isFirstAttack()) {
            monster.setControllerHasAggro(false);
            monster.setControllerKnowsAboutAggro(false);
        }
        boolean aggro = monster.isControllerHasAggro();
        if (toUse != null) {
            c.announce(MaplePacketCreator.moveMonsterResponse(objectid, moveid, monster.getMp(), aggro, toUse.getSkillId(), toUse.getSkillLevel()));
        } else {
            c.announce(MaplePacketCreator.moveMonsterResponse(objectid, moveid, monster.getMp(), aggro));
        }
        if (aggro) {
            monster.setControllerKnowsAboutAggro(true);
        }
        if (res != null) {
            c.getPlayer().getMap().broadcastMessage(c.getPlayer(), MaplePacketCreator.moveMonster(nextFlag, actionAndDir, skillId, skillLevel, option, objectid, startPos, res), monster.getPosition());
            updatePosition(res, monster, -1);
            c.getPlayer().getMap().moveMonster(monster, monster.getPosition());
        }
    }
}
