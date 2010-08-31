package tools;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.rmi.NotBoundException;
import java.util.ArrayList;
import java.util.List;
import javax.management.InstanceAlreadyExistsException;
import javax.management.MBeanRegistrationException;
import javax.management.MalformedObjectNameException;
import javax.management.NotCompliantMBeanException;
import provider.MapleData;
import provider.MapleDataProvider;
import provider.MapleDataProviderFactory;
import provider.MapleDataTool;

public class MonsterDropCreator {

    protected static String monsterQueryData = "monsterdrops"; // Modify this to suite your source
    protected static List<Pair<Integer, String>> itemNameCache = new ArrayList<Pair<Integer, String>>();
    protected static List<Pair<Integer, MobInfo>> mobCache = new ArrayList<Pair<Integer, MobInfo>>();

    public static void main(String args[]) throws FileNotFoundException, IOException, NotBoundException, InstanceAlreadyExistsException, MBeanRegistrationException, NotCompliantMBeanException, MalformedObjectNameException {
        MapleData data = MapleDataProviderFactory.getDataProvider(new File(System.getProperty("wzpath") + "/String.wz")).getData("MonsterBook.img");
        System.out.println("Don't use it, have to recode it.");
        System.out.println("Loading : Item name string.");
        getAllItems();
        System.out.println("Loading : Mob data.");
        getAllMobs();
        System.out.println("Loading : Drops from String.wz/MonsterBook.img.");

        boolean first;
        StringBuilder sb = new StringBuilder();
        //FileOutputStream out = new FileOutputStream("monsterDrops.sql", true);
        for (MapleData dataz : data.getChildren()) {
            int monsterId = Integer.parseInt(dataz.getName());
            int idtoLog = monsterId;
            first = true;

            if (monsterId != 8520000) { // Fix for pianus 1 sidded drops
                if (dataz.getChildByPath("reward").getChildren().size() > 0) { // Fix for Monster without any reward causing SQL error
                    // Fix for Monster without any reward causing SQL error
                    sb.append("INSERT INTO ").append(monsterQueryData).append(" VALUES ");
                    for (MapleData drop : dataz.getChildByPath("reward")) {
                        int itemid = MapleDataTool.getInt(drop);
                        double chance = getChance(itemid);
                        int rate = 0;
                        chance = 1 / chance;
                        rate = (int) (chance * 10000);

                        for (Pair<Integer, MobInfo> Pair : mobCache) {
                            if (Pair.getLeft() == monsterId) {
                                if (Pair.getRight().getBoss() > 0) { // Is boss or not.
                                    if (Pair.getRight().rateItemDropLevel() == 2) {
                                        rate -= 5;
                                    } else if (Pair.getRight().rateItemDropLevel() == 3) {
                                        switch (monsterId) {
                                            case 8810018:
                                                rate -= 13;
                                                break;
                                            case 8800002:
                                                rate -= 9;
                                                break;
                                            default:
                                                rate -= 8;
                                                break;
                                        }
                                    } else {
                                        rate -= 10;
                                    }
                                }
                                break;
                            }
                        }
                        if (rate <= 0) {
                            rate = 1;
                        }

                        if (first) {
                            sb.append("(DEFAULT, ").append(idtoLog).append(", ").append(itemid).append(", ").append(rate).append(", DEFAULT)");
                            first = false;
                        } else {
                            sb.append(", (DEFAULT, ").append(idtoLog).append(", ").append(itemid).append(", ").append(rate).append(", DEFAULT)");
                        }
                        sb.append("\n");
                        sb.append("-- Name : ");

                        for (Pair<Integer, String> Pair : itemNameCache) {
                            if (Pair.getLeft() == itemid) {
                                sb.append(Pair.getRight());
                                break;
                            }
                        }
                        sb.append("\n");
                    }
                    sb.append(";"); // Fix for mass executing SQL query
                }
                sb.append("\n");

                //out.write(sb.toString().getBytes());
                sb.delete(0, 2147483647); // ;P wild guess LOL
            }
        }

        System.out.println("Loading : MonsterBook drops.");
        StringBuilder SQL = new StringBuilder();
        StringBuilder bookName = new StringBuilder();
        for (Pair<Integer, String> Pair : itemNameCache) {
            if (Pair.getLeft() >= 2380000 && Pair.getLeft() <= 2388054) {
                bookName.append(Pair.getRight());
                for (Pair<Integer, MobInfo> Pair_ : mobCache) {
                    if (Pair_.getRight().getName().equalsIgnoreCase(bookName.toString())) {
                        int rate = 2;
                        if (Pair_.getRight().getBoss() > 0) {
                            rate += 10;
                        }
                        SQL.append("INSERT INTO ").append(monsterQueryData).append(" VALUES (DEFAULT, ").append(Pair_.getLeft()).append(", ").append(Pair.getLeft()).append(", ").append(rate).append(", DEFAULT);");
                        SQL.append("\n");
                        break;
                    }
                }
                bookName.delete(0, 2147483647); // ;P wild guess LOL
            }
        }
        //out.write(SQL.toString().getBytes());
        //out.close();
        System.out.println("Done.");
    }

    private static int getChance(int id) {
        switch (id / 10000) {
            case 100: // Hat
                switch (id) {
                    case 1002926: // Targa hat [Malaysia boss]
                    case 1002906: // Scarlion hat [Malaysia boss]
                    case 1002927: // Scarlion boss hat [Malaysia boss]
                    case 1002905: // Targa hat [Malaysia boss]
                    case 1002357: // Zakum helmet
                    case 1002390: // Zakum helmet 2
                    case 1002430: // Zakum helmet 3
                        return 8;
                }
                return 5000;
            case 105: // Overall
            case 109: // Shield
                return 5500;
            case 104: // Topwear
            case 106: // Pants
            case 107: // Shoes
                switch (id) {
                    case 1072369: // Squachy shoe [King slime, Kerning PQ]
                        return 500;
                }
                break;
            case 108: // Gloves
            case 110: // Cape
                return 5000;
            case 112: // Pendant
                switch (id) {
                    case 1122000: // HT Necklace
                        return 8;
                    case 1122011: // Timeless pendant lvl 30
                    case 1122012: // Timeless pendant lvl 140
                        return 10;
                }
                break;
            case 130: // 1 Handed sword
            case 131: // 1 Handed Axe
            case 132: // 1 Handed BW
            case 137: // Wand
            case 138: // Staff
            case 140: // 1 Handed sword and 2 Handed sword
            case 141: // 2 Handed axe
            case 142: // 2 Handed BW
            case 144: // Pole arm
                return 5500;
            case 133: // Dangger
            case 143: // Spear
            case 145: // Bow
            case 146: // Crossbow
                return 6000;
            case 147: // Claw
                return 6200;
            case 233: // Bullets and capsules
                return 7000;
            case 204: // Scrolls
                switch (id) {
                    case 2049000: // Chaos scroll
                        return 15000;
                }
                return 12000;
            case 206: // Arrows
                return 200;
            case 228: // Skillbook
                return 600;
            case 229: // Mastery book
                switch (id) {
                    case 2290096: // Maple Hero 20
                    case 2290125: // Maple Hero 30
                        return 5000;
                }
                return 7000;
            case 413: // Production stimulator
                return 1000;
            case 400:
                switch (id) {
                    case 4000157: // Seal meat
                        return 200;
                    case 4001024: // Rubian [Guild PQ]
                    case 4001023: // Key of dimension [Ludi PQ]
                        return 1;
                    case 4000245: // Dragon Scale
                        return 11000;
                    case 4000244: // Dragon Spirit
                        return 10500;
                    case 4001005: // Ancient scroll
                        return 7000;
                    case 4001006: // Flaming feather
                        return 2000;
                    case 4000017: // Pig's head
                    case 4000082: // Gold smelly tooth =.="
                        return 1000;
                    case 4000446: // Smiling cone hat
                    case 4000451: // Expressionless cone hat
                    case 4000456: // Sad cone hat
                        return 7000;
                    case 4000459:
                        return 3000; // Black armour piece
                    case 4007000: // Magic Powder (Brown)
                    case 4007001: // Magic Powder (White)
                    case 4007002: // Magic Powder (Blue)
                    case 4007003: // Magic Powder (Green)
                    case 4007004: // Magic Powder (Yellow)
                    case 4007005: // Magic Powder (Purple)
                    case 4007006: // Magic Powder (Red)
                    case 4007007: // Magic Powder (Black)
                        return 1200;
                }
                switch (id / 1000) {
                    case 4000: // ETC
                    case 4001: // Story book, manon cry, orbis rock, eraser, certificate
                        return 7;
                    case 4003:
                        return 200;
                    case 4004: // Crystal Ore
                    case 4006: // Magic rock, summoning rock
                        return 1500;
                    case 4005: // Crystal, refined
                        return 100;
                }
                break;
            case 401: // mineral Ore and refined
            case 402: // Jewel ore and refined
                switch (id) {
                    case 4020009: // Piece of time
                        return 10000;
                    case 4021010: // Time rock
                        return 8;
                }
                return 600;
            case 416: // attendance book, pet guide, production manual
                return 600;
            case 403: // Lip lock key, cracked dimension, omok, monster card
                return 300;
        }
        switch (id / 1000000) {
            case 1: // Equipment, for others that's not stated.
                return 5000;
            case 2:
                switch (id) {
                    case 2000004: // Elixir
                    case 2000005:
                    case 2000006: // Power Elixir
                        return 400;
                    case 2000000:
                    case 2000002:
                    case 2000003:
                    case 2001001:
                    case 2002000:
                    case 2002001:
                    case 2002003:
                    case 2002004:
                    case 2002006:
                    case 2002011:
                    case 2010009:
                    case 2012001:
                    case 2012002:
                    case 2022001:
                    case 2020013:
                    case 2020014:
                    case 2020015:
                    case 2022142:
                    case 2022186:
                        return 100;
                    case 2060000:
                    case 2061000:
                    case 2060001:
                    case 2061001:
                        return 200;
                    case 2070000:
                    case 2070001:
                    case 2070002:
                    case 2070003:
                    case 2070004:
                    case 2070005:
                    case 2070006:
                    case 2070007:
                    case 2070008:
                    case 2070009:
                    case 2070010:
                        return 10000;
                    default:
                        return 400;
                }
        }
        if (id == 3010008) {
            return 10000;
        }
        return 0;
    }

    private static void getAllItems() {
        MapleDataProvider data = MapleDataProviderFactory.getDataProvider(new File(System.getProperty("wzpath") + "/String.wz"));

        List<Pair<Integer, String>> itemPairs = new ArrayList<Pair<Integer, String>>();
        MapleData itemsData;

        itemsData = data.getData("Cash.img");
        for (MapleData itemFolder : itemsData.getChildren()) {
            int itemId = Integer.parseInt(itemFolder.getName());
            String itemName = MapleDataTool.getString("name", itemFolder, "NO-NAME");
            itemPairs.add(new Pair<Integer, String>(itemId, itemName));
        }

        itemsData = data.getData("Consume.img");
        for (MapleData itemFolder : itemsData.getChildren()) {
            int itemId = Integer.parseInt(itemFolder.getName());
            String itemName = MapleDataTool.getString("name", itemFolder, "NO-NAME");
            itemPairs.add(new Pair<Integer, String>(itemId, itemName));
        }

        itemsData = data.getData("Eqp.img").getChildByPath("Eqp");
        for (MapleData eqpType : itemsData.getChildren()) {
            for (MapleData itemFolder : eqpType.getChildren()) {
                int itemId = Integer.parseInt(itemFolder.getName());
                String itemName = MapleDataTool.getString("name", itemFolder, "NO-NAME");
                itemPairs.add(new Pair<Integer, String>(itemId, itemName));
            }
        }

        itemsData = data.getData("Etc.img").getChildByPath("Etc");
        for (MapleData itemFolder : itemsData.getChildren()) {
            int itemId = Integer.parseInt(itemFolder.getName());
            String itemName = MapleDataTool.getString("name", itemFolder, "NO-NAME");
            itemPairs.add(new Pair<Integer, String>(itemId, itemName));
        }

        itemsData = data.getData("Ins.img");
        for (MapleData itemFolder : itemsData.getChildren()) {
            int itemId = Integer.parseInt(itemFolder.getName());
            String itemName = MapleDataTool.getString("name", itemFolder, "NO-NAME");
            itemPairs.add(new Pair<Integer, String>(itemId, itemName));
        }

        itemsData = data.getData("Pet.img");
        for (MapleData itemFolder : itemsData.getChildren()) {
            int itemId = Integer.parseInt(itemFolder.getName());
            String itemName = MapleDataTool.getString("name", itemFolder, "NO-NAME");
            itemPairs.add(new Pair<Integer, String>(itemId, itemName));
        }
        itemNameCache.addAll(itemPairs);
    }

    public static void getAllMobs() {
        List<Pair<Integer, MobInfo>> itemPairs = new ArrayList<Pair<Integer, MobInfo>>();
        MapleDataProvider data = MapleDataProviderFactory.getDataProvider(new File(System.getProperty("wzpath") + "/String.wz"));
        MapleDataProvider mobData = MapleDataProviderFactory.getDataProvider(new File(System.getProperty("wzpath") + "/Mob.wz"));
        MapleData mob = data.getData("Mob.img");

        int id;
        for (MapleData itemFolder : mob.getChildren()) { // Get the list of mobs from String.wz
            id = Integer.parseInt(itemFolder.getName());
            try {
                MapleData monsterData = mobData.getData(StringUtil.getLeftPaddedStr(Integer.toString(id) + ".img", '0', 11));
                MobInfo mobInfo = new MobInfo(
                        id == 8810018 ? 1 : MapleDataTool.getIntConvert("boss", monsterData.getChildByPath("info"), 0), // fix for HT
                        MapleDataTool.getIntConvert("rareItemDropLevel", monsterData.getChildByPath("info"), 0), // New info string added since v.71 MSEA
                        MapleDataTool.getString("name", itemFolder, "NO-NAME"));
                itemPairs.add(new Pair<Integer, MobInfo>(id, mobInfo));

            } catch (Exception e) {
            }
        }
        mobCache.addAll(itemPairs);
    }

    public static class MobInfo {

        public int boss;
        public int rareItemDropLevel;
        public String name;

        public MobInfo(int boss, int rareItemDropLevel, String name) {
            this.boss = boss;
            this.rareItemDropLevel = rareItemDropLevel;
            this.name = name;
        }

        public int getBoss() {
            return boss;
        }

        public int rateItemDropLevel() {
            return rareItemDropLevel;
        }

        public String getName() {
            return name;
        }
    }
}