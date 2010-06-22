/* 
 * This file is part of the OdinMS Maple Story Server
    Copyright (C) 2008 Patrick Huy <patrick.huy@frz.cc> 
                       Matthias Butz <matze@odinms.de>
                       Jan Christian Meyer <vimes@odinms.de>

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License version 3
    as published by the Free Software Foundation. You may not use, modify
    or distribute this program under any other version of the
    GNU Affero General Public License.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

/*
 * @Author Stereo
 * @Modified By XkelvinchiaX(Kelvin)
 * @Modified By Moogra
 * Zakum Battle
 */

var exitMap;
var minPlayers = 1;

function init() {
    em.setProperty("shuffleReactors","false");
}

function setup(eim) {
    exitMap = em.getChannelServer().getMapFactory().getMap(211042300);
    if (exitMap == null)
        debug(eim,"The exit map was not properly linked.");
    eim.setProperty("canEnter","true");
    // not currently used; could display total duration taken to kill?
    eim.setProperty("entryTimestamp",System.currentTimeMillis());
}

function playerEntry(eim,player) {
    var map = eim.getMapInstance(280030000); // Last Mission: Zakum's Altar
    player.changeMap(map,map.getPortal(0));
    if (exitMap == null)
        debug(eim,"The exit map was not properly linked.");
}

function playerRevive(eim,player) {
    player.setHp(500);
    player.setStance(0);
    eim.unregisterPlayer(player);
    player.changeMap(exitMap, exitMap.getPortal(0));
    var party = eim.getPlayers();
    if (party.size() < minPlayers)
        end(eim,"There are not enough players remaining, the Battle is over.");
    return false;
}

function playerDead(eim,player) {
}

function playerDisconnected(eim,player) {
    var party = eim.getPlayers();
    if (player.getName().equals(eim.getProperty("leader"))) {
        // tell members
        var iter = party.iterator();
        while (iter.hasNext())
            iter.next().getPlayer().dropMessage(6,"The leader of the instance has disconnected.");
    }
    // and, if the party is too small
    if (party.size() < minPlayers) {
        end(eim,"There are not enough players remaining. The Battle is over.");
    }
}

function monsterValue(eim,mobId) { // potentially display time of death? does not seem to work
    if (mobId == 8800002) { // 3rd body
        var iter = eim.getPlayers().iterator();
        while (iter.hasNext())
            iter.next().getPlayer().dropMessage(6,"Congratulations on defeating Zakum!");
    }
    return -1;
}

function leftParty(eim,player) { // do nothing in Zakum
}
function disbandParty(eim) { // do nothing in Zakum
}

function playerExit(eim,player) {
    eim.unregisterPlayer(player);
    player.changeMap(exitMap,exitMap.getPortal(0));
    if (eim.getPlayers().size() < minPlayers)//not enough after someone left
        end(eim,"There are no longer enough players to continue, and those remaining shall be warped out.");
}

function end(eim,msg) {
    var iter = eim.getPlayers().iterator();
    while (iter.hasNext()) {
        var player = iter.next();
        player.getPlayer().dropMessage(6,msg);
        eim.unregisterPlayer(player);
        if (player != null)
            player.changeMap(exitMap, exitMap.getPortal(0));
    }
    eim.dispose();
}

// for offline folk
function removePlayer(eim,player) {
    eim.unregisterPlayer(player);
    player.getMap().removePlayer(player);
    player.setMap(exitMap);
}

function clearPQ(eim) { // kinda a hack, this is used as the exit routine
    end(eim,"As the sound of battle fades away, you feel strangely unsatisfied.");

}

function finish(eim) {
    var iter = eim.getPlayers().iterator();
    while (iter.hasNext()) {
        var player = iter.next();
        eim.unregisterPlayer(player);
        player.changeMap(exitMap, exitMap.getPortal(0));
    }
    eim.dispose();
}

function allMonstersDead(eim) { // nothing normally done with altar here
}

function cancelSchedule() { // no
}

function timeOut() { // possibly useful
}

function debug(eim,msg) {
    var iter = eim.getPlayers().iterator();
    while (iter.hasNext()) {
        iter.next().getClient().getSession().write(Packages.tools.MaplePacketCreator.serverNotice(6,msg));
    }
}