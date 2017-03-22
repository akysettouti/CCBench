package zCurveFunction;

/**
 * Z-Curve Function Attribute. The Atomic Function Version.
 * @author A.K.Y. SETTOUTI.
 */
public abstract class ZCurveAttribute {
    private String name;

    /**
     * Digits Number to Encode Values.
     */
    protected int length;

    /**
     * @param name Attribute Name.
     * @param length Digits Number to Encode Values.
     * @throws IllegalArgumentException if the length is strictly less than 2.
     */
    public ZCurveAttribute(String name, int length) throws IllegalArgumentException {
        this.name = name;
        this.length = length;
        if (length<2) throw new IllegalArgumentException("Limite trop petite voir négative.");
    }

    /**
     * @return Digits Number to Encode Values.
     */
    public int getLength() {
        return length;
    }

    /**
     * @return Attribute Name.
     */
    public String getName() {
        return name;
    }

    /**
     * @param value Object to Encode.
     * @return Encoded Value for value passed in arguments.
     */
    public abstract String binaryConvertion(Object value);
}
