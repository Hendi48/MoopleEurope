/*
	This file is part of the OdinMS Maple Story Server
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

package client;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import tools.DatabaseConnection;
import tools.Pair;

/**
 *
 * @author Flav
 */
public enum ItemFactory {
	INVENTORY(1, false),
	STORAGE(2, true),
	CASH_EXPLORER(3, true),
	CASH_CYGNUS(4, false),
        CASH_ARAN(5, false);

	private int value;
	private boolean account;

	private ItemFactory(int value, boolean account) {
		this.value = value;
		this.account = account;
	}

	public int getValue() {
		return value;
	}

	public List<Pair<IItem, MapleInventoryType>> loadItems(int id, boolean login) throws SQLException {
		List<Pair<IItem, MapleInventoryType>> items = new ArrayList<Pair<IItem, MapleInventoryType>>();

		StringBuilder query = new StringBuilder();
		query.append("SELECT * FROM `inventoryitems` LEFT JOIN `inventoryequipment` USING(`inventoryitemid`) WHERE `type` = ? AND `");
		query.append(account ? "accountid" : "characterid");
		query.append("` = ?");

		if (login) {
			query.append(" AND `inventorytype` = ");
			query.append(MapleInventoryType.EQUIPPED.getType());
		}

		PreparedStatement ps = DatabaseConnection.getConnection().prepareStatement(query.toString());
		ps.setInt(1, value);
		ps.setInt(2, id);
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			MapleInventoryType mit = MapleInventoryType.getByType(rs.getByte("inventorytype"));

			if (mit.equals(MapleInventoryType.EQUIP) || mit.equals(MapleInventoryType.EQUIPPED)) {
                            Equip equip = new Equip(rs.getInt("itemid"), (byte) rs.getInt("position"), rs.getInt("ringid"));
                            equip.setOwner(rs.getString("owner"));
                            equip.setQuantity((short) rs.getInt("quantity"));
                            equip.setAcc((short) rs.getInt("acc"));
                            equip.setAvoid((short) rs.getInt("avoid"));
                            equip.setDex((short) rs.getInt("dex"));
                            equip.setHands((short) rs.getInt("hands"));
                            equip.setHp((short) rs.getInt("hp"));
                            equip.setInt((short) rs.getInt("int"));
                            equip.setJump((short) rs.getInt("jump"));
                            equip.setVicious((short) rs.getInt("vicious"));
                            equip.setFlag((byte) rs.getInt("flag"));
                            equip.setLuk((short) rs.getInt("luk"));
                            equip.setMatk((short) rs.getInt("matk"));
                            equip.setMdef((short) rs.getInt("mdef"));
                            equip.setMp((short) rs.getInt("mp"));
                            equip.setSpeed((short) rs.getInt("speed"));
                            equip.setStr((short) rs.getInt("str"));
                            equip.setWatk((short) rs.getInt("watk"));
                            equip.setWdef((short) rs.getInt("wdef"));
                            equip.setUpgradeSlots((byte) rs.getInt("upgradeslots"));
                            equip.setLevel((byte) rs.getInt("level"));
                            equip.setItemExp(rs.getInt("itemexp"));
                            equip.setExpiration(rs.getLong("expiration"));
                            equip.setGiftFrom(rs.getString("giftFrom"));
				items.add(new Pair<IItem, MapleInventoryType>(equip, mit));
			} else {
                            Item item = new Item(rs.getInt("itemid"), (byte) rs.getInt("position"), (short) rs.getInt("quantity"), rs.getInt("petid"));
                            item.setOwner(rs.getString("owner"));
                            item.setExpiration(rs.getLong("expiration"));
                            item.setGiftFrom(rs.getString("giftFrom"));
				items.add(new Pair<IItem, MapleInventoryType>(item, mit));
			}
		}

		rs.close();
		ps.close();
		return items;
	}

	public synchronized void saveItems(List<Pair<IItem, MapleInventoryType>> items, int id) throws SQLException {
		StringBuilder query = new StringBuilder();
		query.append("DELETE FROM `inventoryitems` WHERE `type` = ? AND `");
		query.append(account ? "accountid" : "characterid");
		query.append("` = ?");

		Connection con = DatabaseConnection.getConnection();
		PreparedStatement ps = con.prepareStatement(query.toString());
		ps.setInt(1, value);
		ps.setInt(2, id);
		ps.executeUpdate();
		ps.close();
		ps = con.prepareStatement("INSERT INTO `inventoryitems` VALUES (DEFAULT, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
		PreparedStatement pse = con.prepareStatement("INSERT INTO `inventoryequipment` VALUES (DEFAULT, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

		for (Pair<IItem, MapleInventoryType> pair : items) {
			IItem item = pair.getLeft();
			MapleInventoryType mit = pair.getRight();
			ps.setInt(1, value);
			ps.setString(2, account ? null : String.valueOf(id));
			ps.setString(3, account ? String.valueOf(id) : null);
			ps.setInt(4, item.getItemId());
			ps.setInt(5, mit.getType());
			ps.setInt(6, item.getPosition());
			ps.setInt(7, item.getQuantity());
			ps.setString(8, item.getOwner());
			ps.setInt(9, item.getPetId());
			ps.setLong(10, item.getExpiration());
                        ps.setString(11, item.getGiftFrom());
			ps.executeUpdate();

			if (mit.equals(MapleInventoryType.EQUIP) || mit.equals(MapleInventoryType.EQUIPPED)) {
				ResultSet rs = ps.getGeneratedKeys();

				if (!rs.next())
					throw new RuntimeException("Inserting item failed.");

				pse.setInt(1, rs.getInt(1));
				rs.close();
				IEquip equip = (IEquip) item;
				pse.setInt(2, equip.getUpgradeSlots());
				pse.setInt(3, equip.getLevel());
				pse.setInt(4, equip.getStr());
				pse.setInt(5, equip.getDex());
				pse.setInt(6, equip.getInt());
				pse.setInt(7, equip.getLuk());
				pse.setInt(8, equip.getHp());
				pse.setInt(9, equip.getMp());
				pse.setInt(10, equip.getWatk());
				pse.setInt(11, equip.getMatk());
				pse.setInt(12, equip.getWdef());
				pse.setInt(13, equip.getMdef());
				pse.setInt(14, equip.getAcc());
				pse.setInt(15, equip.getAvoid());
				pse.setInt(16, equip.getHands());
				pse.setInt(17, equip.getSpeed());
				pse.setInt(18, equip.getJump());
                                pse.setInt(19, equip.getRingId());
                                pse.setInt(20, 0);
				pse.setInt(21, equip.getVicious());
                                pse.setInt(22, equip.getFlag());
                                pse.setInt(23, equip.getItemExp());
				pse.executeUpdate();
			}
		}
                
		pse.close();
		ps.close();
	}
}
