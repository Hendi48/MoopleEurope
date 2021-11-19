package net.server.handlers;

import client.MapleClient;
import net.MaplePacketHandler;
import tools.FilePrinter;
import tools.data.input.SeekableLittleEndianAccessor;

public class ExceptionLogHandler implements MaplePacketHandler {

    @Override
    public void handlePacket(SeekableLittleEndianAccessor slea, MapleClient c) {
        FilePrinter.printError(FilePrinter.CLIENT_START, slea.readMapleAsciiString());
    }

    @Override
    public boolean validateState(MapleClient c) {
        return true;
    }
}
