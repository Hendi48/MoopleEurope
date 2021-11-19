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
package net;

public enum RecvOpcode {

    LOGIN_PASSWORD(1),
    GUEST_LOGIN(0x02),
    SERVERLIST_REREQUEST(3),
    CHARLIST_REQUEST(4),
    SERVERSTATUS_REQUEST(5),
    ACCEPT_TOS(6),
    SET_GENDER(7),
    AFTER_LOGIN(8),
    REGISTER_PIN(9),
    SERVERLIST_REQUEST(10),
    PLAYER_DC(11),
    CHAR_SELECT(12),
    PLAYER_LOGGEDIN(13),
    CHECK_CHAR_NAME(14),
    CREATE_CHAR(15),
    DELETE_CHAR(16),
    PONG(17),
    EXCEPTION_LOG(18),
    SECURITY_PACKET(19),
    CLIENT_ERROR(20),
    RELOG(9999),

    CHANGE_MAP(28),
    CHANGE_CHANNEL(29),
    ENTER_CASHSHOP(30),
    MOVE_PLAYER(31),
    CANCEL_CHAIR(32),
    USE_CHAIR(33),
    CLOSE_RANGE_ATTACK(34),
    RANGED_ATTACK(35),
    MAGIC_ATTACK(36),
    TOUCH_MONSTER_ATTACK(37),
    TAKE_DAMAGE(40),
    GENERAL_CHAT(41),
    CLOSE_CHALKBOARD(42),
    FACE_EXPRESSION(43),
    USE_ITEMEFFECT(44),
    USE_DEATHITEM(45),
    MONSTER_BOOK_COVER(49),
    NPC_TALK(50),
    REMOTE_STORE(51),
    NPC_TALK_MORE(52),
    NPC_SHOP(53),
    STORAGE(54),
    HIRED_MERCHANT_REQUEST(55),
    FREDRICK_ACTION(56),
    DUEY_ACTION(57),
    ADMIN_SHOP(60),
    ITEM_SORT(61),
    ITEM_SORT2(62),
    ITEM_MOVE(63),
    USE_ITEM(64),
    CANCEL_ITEM_EFFECT(65),
    USE_SUMMON_BAG(67),
    PET_FOOD(68),
    USE_MOUNT_FOOD(69),
    SCRIPTED_ITEM(70),
    USE_CASH_ITEM(71),

    USE_CATCH_ITEM(73),
    USE_SKILL_BOOK(74),
    USE_TELEPORT_ROCK(76),
    USE_RETURN_SCROLL(77),
    USE_UPGRADE_SCROLL(78),
    DISTRIBUTE_AP(79),
    AUTO_DISTRIBUTE_AP(80),
    HEAL_OVER_TIME(81),
    DISTRIBUTE_SP(82),
    SPECIAL_MOVE(83),
    CANCEL_BUFF(84),
    SKILL_EFFECT(85),
    MESO_DROP(86),
    GIVE_FAME(87),
    CHAR_INFO_REQUEST(89),
    SPAWN_PET(91),
    CANCEL_DEBUFF(92),
    CHANGE_MAP_SPECIAL(93),
    USE_INNER_PORTAL(94),
    TROCK_ADD_MAP(95),
    REPORT(99),
    QUEST_ACTION(100),
    //lolno
    SKILL_MACRO(103),
    SPOUSE_CHAT(9999),
    USE_ITEM_REWARD(107),
    MAKER_SKILL(108),
    USE_REMOTE(111),
    ADMIN_CHAT(113),
    PARTYCHAT(114),
    WHISPER(115),
    MESSENGER(116),
    PLAYER_INTERACTION(117),
    PARTY_OPERATION(118),
    DENY_PARTY_REQUEST(119),
    GUILD_OPERATION(120),
    DENY_GUILD_REQUEST(121),
    ADMIN_COMMAND(122),
    ADMIN_LOG(123),
    BUDDYLIST_MODIFY(124),
    NOTE_ACTION(125),
    USE_DOOR(127),
    CHANGE_KEYMAP(129),
    RPS_ACTION(130),
    RING_ACTION(131),
    WEDDING_ACTION(132),
    ALLIANCE_OPERATION(136),
    FAMILY_CHART_REQUEST(138),
    OPEN_FAMILY(139),
    ADD_FAMILY(140),
    FAMILY_UNREGISTER_JUNIOR(141),
    FAMILY_UNREGISTER_PARENT(142),
    ACCEPT_FAMILY(143),
    USE_FAMILY(144),
    FAMILY_SET_PRECEPT(145),
    FAMILY_SUMMON_RESULT(146),
    WEDDING_PROGRESS(147),
    CLICK_GUIDE(149),
    ARAN_COMBO_COUNTER(150),
    MOVE_PET(157),
    PET_CHAT(158),
    PET_COMMAND(159),
    PET_LOOT(160),
    PET_AUTO_POT(161),
    PET_EXCLUDE_ITEMS(162),
    MOVE_SUMMON(165),
    SUMMON_ATTACK(166),
    DAMAGE_SUMMON(167),
    BEHOLDER(168),
    QUICKSLOT_MODIFIED(173),
    MOVE_LIFE(179),
    AUTO_AGGRO(180),
    MOB_DAMAGE_MOB_FRIENDLY(183),
    MONSTER_BOMB(185),
    MOB_DAMAGE_MOB(186),
    NPC_ACTION(189),
    ITEM_PICKUP(194),
    DAMAGE_REACTOR(197),
    SNOWBALL(201),
    LEFT_KNOCKBACK(202),
    COCONUT(203),
    MATCH_TABLE(204),//Would be cool if I ever get it to work :)
    MONSTER_CARNIVAL(208),
    CONTIMOVE(210),
    INVITE_PARTY_MATCH(212),
    CANCEL_INVITE_PARTY_MATCH(213),
    CHECK_CASH(218),
    CASHSHOP_OPERATION(219),
    COUPON_CODE(220),
    RAISE_REFRESH(227),
    RAISE_UI_STATE(228),
    RAISE_INC_EXP(229),
    RAISE_ADD_PIECE(230),
    USE_HAMMER(238);

    private int value = -2;

    private RecvOpcode(int value) {
        this.value = value;
    }

    public int getValue() {
        return value;
    }
}
