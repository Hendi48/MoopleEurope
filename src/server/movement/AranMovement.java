package server.movement;

import java.awt.Point;
import tools.data.output.LittleEndianWriter;

/**
 *
 * @author Someone
 */
public class AranMovement extends AbstractLifeMovement {
    public AranMovement(int type, Point position, int duration, int newstate) {
        super(type, position, duration, newstate);
    }

    @Override
    public void serialize(LittleEndianWriter lew) {
        lew.write(getType());
        lew.write(getNewstate());
        lew.writeShort(getDuration());
    }
}