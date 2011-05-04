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
/**
 * @author BubblesDev
 * @npc Tommy (HPQ)
 */
var status = 0;

function start() {
    status = -1;
    action(1, 0, 0);
}

function action(mode, type, selection) {
    if (mode < 1)
        cm.dispose();
    else {
        status++;
        if (cm.getPlayer().getMap().getId() == 910010300) {
            if (status == 0) {
                cm.sendNext("Would you like to stop hunting and leave this place?\r\n#b#L0# Yes. I would like to leave this place.#l");
            } else if (status == 1){
                cm.warp(910010400);
                cm.dispose();
            }
        } else if (cm.getPlayer().getMap().getId() == 910010100) {
            if (status == 0) {
                cm.sendNext("Hello, there! I'm Tommy. There's a Pig Town nearby where we're standing. The pigs there are rowdy and uncontrollable to the point where they have stolen numerous weapons from travelers. They were kicked out from their towns, and are currently hiding out at the Pig Town.");
            } else if (status == 1) {
                cm.sendYesNo("What do you think about making your way there with your party members and teach those rowdy pigs a lesson?\r\n#b#L0# Yeah, that sounds good! Take me there!#l");
            } else if (status == 2) {
                cm.warpParty(910010300);
                cm.dispose();
            }
        }
    }
}	