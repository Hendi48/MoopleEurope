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
/*	
	Author : HaruTheHero Fixed by kevintjuh93
	Map(s): 		Aran Training Map 2
	Description: 		Quest - Help Kid
	Quest ID : 		21000
*/

importPackage(Packages.client);

var status = -1;

function start(mode, type, selection) {
    status++;
	if (mode != 1) {
	    if(type == 1 && mode == 0)
		    status -= 2;
		else{
			qm.sendNext("No, Aran... We can't leave a kid behind. I know it's a lot to ask, but please reconsider. Please!");
		    qm.dispose();
			return;
		}
	}
	if (status == 0)
			qm.sendAcceptDecline("Wait, where's the kid? Oh no, he must be stuck in the forest! We need to bring the kid back here before the ark leaves! Aran... please go in there and find the kid for me! I know it's a lot to ask considering you're injured... but you're our only hope!");
		else if (status == 1) {
			qm.forceStartQuest();
			qm.sendNext("#bThe Child is probably somewhere deep in the forest!#k We have to escape before the Black Mage finds us. You must rush into the forest and bring the child back with you!");
		} else if (status == 2) {
			qm.sendNextPrev("Don't panic, Aran. If you wish to check the status of the quest, press #bQ #kand view the Quest window.");
		} else if (status == 3) {
			qm.sendNextPrev("Please, Aran! I'm begging you. I can't bear to lose another person to the Black Mage!");
		} else if (status == 4) {
			qm.showInfo("Effect/OnUserEff.img/guideEffect/aranTutorial/tutorialArrow1");
			qm.dispose();
		}
		}


function end(mode, type, selection) {
    status++;
	if (mode != 1) {
	    if(type == 1 && mode == 0)
		    status -= 2;
		else{
		    qm.dispose();
			return;
		}		
		if (status == 0) {
			qm.sendOk("Wah! *Sniff sniff* Hey, that's Aran! Are you here to rescue me?");
		} else if (status == 1) {
			qm.forceCompleteQuest();
			qm.dispose();
		}
	}
}