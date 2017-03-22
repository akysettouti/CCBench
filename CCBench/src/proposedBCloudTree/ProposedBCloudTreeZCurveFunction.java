package proposedBCloudTree;

import essential.CCService;
import java.util.ArrayList;
import java.util.Arrays;
import zCurveFunction.ZCurve;
import zCurveFunction.ZCurveCategoryAttribute;
import zCurveFunction.ZCurveFixedAttribute;
import zCurveFunction.ZCurveFloatAttribute;

/**
 * Proposed Z-Curve Function to index and search Cloud Computing Services.
 * @author A.K.Y. SETTOUTI.
 */
public class ProposedBCloudTreeZCurveFunction extends ZCurve {

    /**
     * Add Necessary Attributes to Calculate Z-Curve Values.
     */
    public ProposedBCloudTreeZCurveFunction() {
        super();
        attributes.add(new ZCurveFloatAttribute(new ArrayList<Double>(Arrays.asList(0.013,0.02,0.032,0.048,0.109,0.244,0.461,0.679,0.897,3.00)), "HP", limit));
        attributes.add(new ZCurveFloatAttribute(new ArrayList<Double>(Arrays.asList(0.01118,0.01708,0.04,0.0402,0.418,0.0443,0.0715,1.0)), "BWP", limit));
        attributes.add(new ZCurveCategoryAttribute(new ArrayList<String>(Arrays.asList("Frankfurt-Germany","Honolulu-USA","Manila-Philippines","Miami-USA","Perth-Australia","San Jose-USA","Warsaw-Poland","Washington DC-USA","Zurich-Switzerland")), "Location", limit));
        
    }

    @Override
    public long getValue(CCService ccService) {
        String binaryRepresentation = new ZCurveFixedAttribute("Type", limit).binaryConvertion(new Object());
        ArrayList<String> binaryConvertions = new ArrayList<String>();
        binaryConvertions.add(attributes.get(0).binaryConvertion(ccService.getInstance_price()));
        binaryConvertions.add(attributes.get(1).binaryConvertion(ccService.getBw_price()));
        binaryConvertions.add(attributes.get(2).binaryConvertion(ccService.getLocation()));
        for(int i=0;i<limit;i++){
            for(String binaryConvertion: binaryConvertions) binaryRepresentation = binaryRepresentation + binaryConvertion.charAt(i);
        }
        return convertToDecimal(binaryRepresentation);
    }
    
}
