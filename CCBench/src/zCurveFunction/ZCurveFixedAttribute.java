package zCurveFunction;

/**
 * Z-Curve Function Fixed Attribute. Always return the same value.
 * @author A.K.Y. SETTOUTI.
 */
public class ZCurveFixedAttribute extends ZCurveAttribute {

    /**
     * @param name Attribute Name.
     * @param length Digits Number to Encode Values.
     */
    public ZCurveFixedAttribute(String name, int length) {
        super(name, length);
    }

    @Override
    public String binaryConvertion(Object value) {
        String binaryRepresentation="1";
        while(binaryRepresentation.length()>super.length) binaryRepresentation = "0" + binaryRepresentation;
        return binaryRepresentation;
    }   
}