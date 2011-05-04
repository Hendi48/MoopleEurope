package net.server;

import java.io.Console;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 *
 * @author kevintjuh93
 */
public class CreateINI {
    public static void main(String args[]) {
        StringBuilder sb = new StringBuilder();
        String nextline = "\r\n";//Because I can, and it's free.
        byte worlds;
        Console con = System.console();

        System.out.println("Welcome to MoopleDEV's .ini creaton\r\n\r\n");

        sb.append("#MoopleDEV's INI file. Do NOT modify it if you are an idiot (:\r\n");
        sb.append("#Flag types: 0 = nothing, 1 = event, 2 = new, 3 = hot\r\n\r\n");

        System.out.println("Flag types: 0 = nothing, 1 = event, 2 = new, 3 = hot\r\n\r\n");

        worlds = Byte.parseByte(con.readLine("Number of worlds: "));
        sb.append("worlds=").append(worlds).append("\r\n\r\n");

        System.out.println("\r\n");


        for (byte b = 0; b < worlds; b++) {
            sb.append("#Properties for world ").append(b).append("\r\n");

            System.out.println("Properties for world " + b);
            if (b > 2) System.out.println("Make sure you create a npc folder for this world!");
            sb.append("flag").append(b).append("=").append(
                    Byte.parseByte(con.readLine("   Flag: "))).append("\r\n");

            sb.append("eventmessage").append(b).append("=").append(
                    con.readLine("   Event message: ")).append("\r\n");

            sb.append("channels").append(b).append("=").append(
                    Byte.parseByte(con.readLine("   Number of channels: "))).append("\r\n");

            sb.append("exprate").append(b).append("=").append(
                    Byte.parseByte(con.readLine("   Exp rate: "))).append("\r\n");
            
            sb.append("droprate").append(b).append("=").append(
                    Byte.parseByte(con.readLine("   Drop rate: "))).append("\r\n");
            
            sb.append("mesorate").append(b).append("=").append(
                    Byte.parseByte(con.readLine("   Meso rate: "))).append("\r\n");

            sb.append("bossdroprate").append(b).append("=").append(
                    Byte.parseByte(con.readLine("   Boss drop rate: "))).append("\r\n");
            
            System.out.println(nextline);
            sb.append("\r\n");
        }
        FileOutputStream out = null;
        try {
            out = new FileOutputStream("moople.ini", false);
            out.write(sb.toString().getBytes());
        } catch (Exception ex) {
        } finally {
            try {
                if (out != null) out.close();
            } catch (IOException ex) {
            }
        }

        sb = new StringBuilder();
        try {
            out = new FileOutputStream("launch_server.bat", false);
            System.out.println("You are about to set the Java Heap Size, if you don't know what it is, type '?'.");
            String heapsize = con.readLine("Java Heap Size : ");
            while (heapsize.equals("?")) {
                System.out.println("\r\n");
                System.out.println("WikiAnswers: Java heap is the heap size allocated to JVM applications which takes care of the new objects being created. If the objects being created exceed the heap size, it will throw an error saying memoryOutof Bound\r\n\r\n");
                heapsize = con.readLine("Java Heap Size : ");
            }
            sb.append("@echo off").append("\r\n").append("@title MoopleDEV Server v83").append("\r\n");
            sb.append("set CLASSPATH=.;dist\\*;\r\n");
            sb.append("java -Xmx").append(heapsize).append("m -Dwzpath=wz\\ -Djavax.net.ssl.keyStore=filename.keystore -Djavax.net.ssl.keyStorePassword=passwd -Djavax.net.ssl.trustStore=filename.keystore -Djavax.net.ssl.trustStorePassword=passwd net.server.Server\r\n");
            sb.append("pause");

            out.write(sb.toString().getBytes());
        } catch (Exception ex) {
        } finally {
            try {
                if (out != null) out.close();
            } catch (IOException ex) {
            }
        }
        System.out.println("\r\nMake sure that ServerConstants in modified too, and clean+compiled before you start the server.");
        System.out.println("If you want other settings; restart this .bat or modify the moople.ini");
    }
}
