package zCurveFunction;

/**
 * Z-Curve Function Integer Attribute.
 * @author A.K.Y. SETTOUTI.
 */
public class ZCurveNumberAttribute extends ZCurveAttribute {

    /**
     * @param name Attribute Name.
     * @param length Digits Number to Encode Values.
     */
    public ZCurveNumberAttribute(String name, int length) {
        super(name, length);
    }

    @Override
    public String binaryConvertion(Object value) {
        String binaryRepresentation = "";
        int val = ((Integer) value);
        while(val>0){
            int rest = val % 2;
            if (rest == 1) binaryRepresentation = "1" + binaryRepresentation;
            else binaryRepresentation = "0" + binaryRepresentation;
            val = val/2;
        }
        while(binaryRepresentation.length()<super.length) binaryRepresentation = "0" + binaryRepresentation;
        return binaryRepresentation;
    }
}
