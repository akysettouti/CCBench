package zCurveFunction;

import java.util.ArrayList;

/**
 * Z-Curve Function Float Attribute.
 * @author A.K.Y. SETTOUTI.
 */
public class ZCurveFloatAttribute extends ZCurveAttribute {
    private ArrayList<Double> limits;

    /**
     * @param limits Float bounds.
     * @param name Attribute Name.
     * @param length Digits Number to Encode Values.
     */
    public ZCurveFloatAttribute(ArrayList<Double> limits, String name, int length) {
        super(name, length);
        this.limits = limits;
    }

    @Override
    public String binaryConvertion(Object value) {
        String binaryRepresentation = "";
        double val = ((Double) value);
        if ((val < 0)||(val>limits.get(limits.size()-1).doubleValue())) throw new IllegalArgumentException("Valeur hors bornes. Attribute :"+super.getName());
        int i=0;
        while(val>limits.get(i)){
            binaryRepresentation = "0" + binaryRepresentation;
            i++;
        }
        binaryRepresentation = "1" + binaryRepresentation;
        while(binaryRepresentation.length()<super.length) binaryRepresentation = "0" + binaryRepresentation;
        return binaryRepresentation;
    }
    
}
