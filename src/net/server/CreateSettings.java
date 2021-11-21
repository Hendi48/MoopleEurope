package net.server;

import java.io.Console;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 *
 * @author kevintjuh93
 */
public class CreateSettings {

    public static void main(String args[]) {
        StringBuilder sb = new StringBuilder();
        String nextline = "\r\n";//Because I can, and it's free.
        int worlds;
        Console con = System.console();

        System.out.println("Welcome to MoopleDEV's settings creator\n\n");

        sb.append("# MoopleDEV's settings file. Do NOT modify it if you are an idiot (:\r\n");
        sb.append("# Flag types: 0 = nothing, 1 = event, 2 = new, 3 = hot\r\n\r\n");

        System.out.println("Flag types: 0 = nothing, 1 = event, 2 = new, 3 = hot\n\n");

        String wzPath;
        do {
            wzPath = con.readLine("WZ path (e.g., C:\\Nexon\\MapleStory): ");
        } while (wzPath.equals(""));
        wzPath = wzPath.replace("\\", "/");

        var host = con.readLine("Server host (default=localhost): ");
        if (host.equals("")) {
            host = "localhost";
        }
        sb.append("host=").append(host).append("\r\n\r\n");

        var dbUrl = con.readLine("Database url (default=jdbc:mysql://localhost:3306/MoopleDEV?autoReconnect=true): ");
        if (dbUrl.equals("")) {
            dbUrl = "jdbc:mysql://localhost:3306/MoopleDEV?autoReconnect=true";
        }
        sb.append("db_url=").append(dbUrl).append("\r\n");
        var dbUser = con.readLine("Database user (default=root): ");
        if (dbUser.equals("")) {
            dbUser = "root";
        }
        sb.append("db_user=").append(dbUser).append("\r\n");
        var dbPass = con.readLine("Database password (default=): ");
        sb.append("db_pass=").append(dbPass).append("\r\n\r\n");

        var worldsStr = con.readLine("Number of worlds (default=1): ");
        if (worldsStr.equals("")) {
            worldsStr = "1";
        }
        worlds = Integer.parseInt(worldsStr);
        sb.append("worlds=").append(worlds).append("\r\n\r\n");

        System.out.println("\n");


        for (byte b = 0; b < worlds; b++) {
            sb.append("# Properties for world ").append(b).append("\r\n");

            System.out.println("Properties for world " + b);
            if (b > 1) {
                System.out.println("Make sure you create a npc folder for this world!");
            }
            sb.append("flag").append(b).append("=").append(
                    Integer.parseInt(con.readLine("   Flag: "))).append("\r\n");

            sb.append("servermessage").append(b).append("=").append(
                    con.readLine("   Server message: ")).append("\r\n");

            sb.append("eventmessage").append(b).append("=").append(
                    con.readLine("   Event message: ")).append("\r\n");

            sb.append("whyamirecommended").append(b).append("=").append(
                    con.readLine("   Recommend message: ")).append("\r\n");

            sb.append("channels").append(b).append("=").append(
                    Byte.parseByte(con.readLine("   Number of channels: "))).append("\r\n");

            sb.append("exprate").append(b).append("=").append(
                    Integer.parseInt(con.readLine("   Exp rate: "))).append("\r\n");

            sb.append("droprate").append(b).append("=").append(
                    Integer.parseInt(con.readLine("   Drop rate: "))).append("\r\n");

            sb.append("mesorate").append(b).append("=").append(
                    Integer.parseInt(con.readLine("   Meso rate: "))).append("\r\n");

            sb.append("bossdroprate").append(b).append("=").append(
                    Integer.parseInt(con.readLine("   Boss drop rate: "))).append("\r\n");

            System.out.println(nextline);
            sb.append("\r\n");
        }

        sb.append("\r\n").append("gmserver=").append(Boolean.parseBoolean(con.readLine("Do you want a GM Server? (true/false)")));
        FileOutputStream out = null;
        try {
            out = new FileOutputStream("moople.properties", false);
            out.write(sb.toString().getBytes());
        } catch (Exception ex) {
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
            } catch (IOException ex) {
            }
        }

        sb = new StringBuilder();
        try {
            String heapsize = con.readLine("Java Heap Size (in MB - default=1024): ");
            if (heapsize.equals("")) {
                heapsize = "1024";
            }
            String linux = con.readLine("\r\nAre you using a Linux platform or not? (y/n):");
            while (!linux.equals("y") && !linux.equals("n")) {
                System.out.println("Type 'y' if you use linux else type 'n'.");
                linux = con.readLine("Are you using a Linux platform or not? (y/n):");
            }
            if (linux.equals("n")) {
                out = new FileOutputStream("launch_server.bat", false);
                sb.append("@echo off").append("\r\n").append("@title MoopleEurope").append("\r\n");
                sb.append("java -cp dist\\*;lib\\* -Xmx").append(heapsize).append("m -Dwzpath=").append(wzPath).append(" net.server.Server\r\n");
                sb.append("pause");
            } else {//test
                out = new FileOutputStream("launch_server.sh", false);
                sb.append("#!/bin/sh").append("\n\n");
                sb.append("java -cp dist/MoopleEurope.jar:lib/* -Dwzpath=").append(wzPath).append(" \\\n");
                sb.append("-Xmx").append(heapsize).append("m ").append("net.server.Server");
            }
            out.write(sb.toString().getBytes());
        } catch (Exception ex) {
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
            } catch (IOException ex) {
            }
        }
        System.out.println("\nIf you want other settings, restart this script or modify moople.properties");
    }
}
