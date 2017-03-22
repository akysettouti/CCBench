package zCurveFunction;

import essential.CCService;
import java.util.ArrayList;

/**
 * Known Mathematical Function to Reduce Spaces Dimension.
 * @author A.K.Y. SETTOUTI.
 */
public abstract class ZCurve {

    /**
     * Atomic Function. A Z-Curve Function can hold multiple Attributes.
     */
    protected ArrayList<ZCurveAttribute> attributes;

    /**
     * Digits Number to Encode Attributes Values.
     */
    protected static int limit = 10;

    /**
     * Initialise Attributes List. The Array is still EMPTY here.
     */
    public ZCurve() {
        attributes = new ArrayList<ZCurveAttribute>();
    }
    
    /**
     * @param ccService Public IaaS Cloud Computing Service.
     * @return Z-Curve Image for the ccService passed in Arguments.
     */
    public abstract long getValue(CCService ccService);
    
    /**
     * @param binaryConvertion A Binary Representation of a Certain Number.
     * @return Decimal Representation of the binaryRepresentation passed in Arguments.
     */
    protected long convertToDecimal(String binaryConvertion){
        int k=0;
        long sum=0;
        for(int i=binaryConvertion.length()-1;i>=0;i--,k++)
            if (binaryConvertion.charAt(i)=='1')
                sum += 2^k;
        return sum;
    }
}
