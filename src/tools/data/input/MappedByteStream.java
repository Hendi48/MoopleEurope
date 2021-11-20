package tools.data.input;

import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.BufferUnderflowException;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;

public class MappedByteStream implements SeekableInputStreamBytestream {

    private final MappedByteBuffer buf;
    private long read = 0;

    public MappedByteStream(RandomAccessFile raf, int offset, int size) throws IOException {
        super();
        buf = raf.getChannel().map(FileChannel.MapMode.READ_ONLY, offset, size);
    }

    @Override
    public int readByte() {
        int temp;
        try {
            temp = buf.get() & 0xFF;
            read++;
            return temp;
        } catch (BufferUnderflowException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void seek(long offset) throws IOException {
        buf.position((int) offset);
    }

    @Override
    public long getPosition() throws IOException {
        return buf.position();
    }

    @Override
    public long getBytesRead() {
        return read;
    }

    @Override
    public long available() {
        return buf.remaining();
    }
}
