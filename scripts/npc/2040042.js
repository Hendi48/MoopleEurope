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
@	Author : Raz
@
@	NPC = Sky-Blue Balloon
@	Map = Hidden-Street <Stage 7>
@	NPC MapId = 922010700
@	Function = LPQ - 7 Stage
@
@	Description: You need a ranged person here. The ranged person must kill the three Ratz, and they'll trigger something. What's next is for you to find out! Get me 3 passes!
*/

var status = 0;
var party;
var preamble;
var gaveItems;

function start() {
    status = -1;
    action(1, 0, 0);
}

function action(mode, type, selection) {
    if (mode == -1) {
        cm.dispose();
    }else if (mode == 0){
        cm.dispose();
    }else{
        if (mode == 1)
            status++;
        else
            status--;
        var eim = cm.getPlayer().getEventInstance();
        var nthtext = "7th";
        if (status == 0) {
            party = eim.getPlayers();
            preamble = eim.getProperty("leader" + nthtext + "preamble");
            gaveItems = eim.getProperty("leader" + nthtext + "gaveItems");
            if (preamble == null) {
                cm.sendOk("Hi. Welcome to the " + nthtext + " stage. You need a ranged person here. The ranged person must kill the three Ratz, and they'll trigger something. What's next is for you to find out! Get me 3 passes!");
                eim.setProperty("leader" + nthtext + "preamble","done");
                cm.dispose();
            }else{
                if(!isLeader()){
                    if(gaveItems == null){
                        cm.sendOk("Please tell your #bParty-Leader#k to come talk to me");
                        cm.dispose();
                    }else{
                        cm.sendOk("Hurry, goto the next stage, the portal is open!");
                        cm.dispose();
                    }
                }
                if(gaveItems == null){
                    cm.sendSimple("What's up?\r\n#L0#I've got your passes!#l\r\n#L1#There's something wrong here.#l");
                }
            }
        }else if (status == 1){
            if (selection == 0) {
                if(cm.itemQuantity(4001022) >= 3){
                    cm.sendOk("Good job! you have collected all 3 #b#t4001022#'s#k");
                }else{
                    cm.sendOk("Sorry you don't have all 3 #b#t4001022#'s#k");
                    cm.dispose();
                }
            } else if (selection == 1) {
                if (cm.mapMobCount()==0) {
                    cm.sendOk("Good job! You've killed all the Rombards!");
                }else{
                    cm.sendOk("What are you talking about? Kill those Rombards!");
                    cm.dispose();
                }
            }
        }else if (status == 2){
            cm.sendOk("You may continue to the next stage!");
            cm.removeAll(4001022);
            cm.gate();
            cm.clear();
            cm.givePartyExp(6600, eim.getPlayers());
            eim.setProperty("7stageclear","true");
            eim.setProperty("leader" + nthtext + "gaveItems","done");
            cm.dispose();
        }            
    }
}

function isLeader(){
    if(cm.getParty() == null)
        return false;
    else
        return cm.isLeader();
}