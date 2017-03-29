package bPlusCloudTree;

import essential.CCService;
import java.util.ArrayList;
import java.util.Arrays;
import zCurveFunction.ZCurve;
import zCurveFunction.ZCurveCategoryAttribute;
import zCurveFunction.ZCurveFloatAttribute;

/**
 * Authentic Z-Curve Function used in the BCloudTree Approach to index and search Cloud Computing Services.
 * @author A.K.Y. SETTOUTI.
 */
public class BPlusCloudTreeZCurveFunction extends ZCurve {

    /**
     * Add Necessary Attributes to Calculate Z-Curve Values.
     */
    public BPlusCloudTreeZCurveFunction() {
        super();
        attributes.add(new ZCurveCategoryAttribute(new ArrayList<String>(Arrays.asList("CloudSigma")), "Provider", limit));
        attributes.add(new ZCurveCategoryAttribute(new ArrayList<String>(Arrays.asList("Small-2","Small-3","Medium-1","Medium-3","Large-1","Large-2","Large-3","XLarge")), "Instance", limit));
        attributes.add(new ZCurveCategoryAttribute(new ArrayList<String>(Arrays.asList("Frankfurt-Germany","Honolulu-USA","Manila-Philippines","Miami-USA","Perth-Australia","San Jose-USA","Warsaw-Poland","Washington DC-USA","Zurich-Switzerland")), "Location", limit));
        attributes.add(new ZCurveFloatAttribute(new ArrayList<Double>(Arrays.asList(2.2,4.4,8.8,17.6,26.4,35.2,44.0)), "ECU", limit));
        attributes.add(new ZCurveFloatAttribute(new ArrayList<Double>(Arrays.asList(1.0,2.0,8.0,16.0,32.0,48.0,64.0)), "RAM", limit));
        attributes.add(new ZCurveFloatAttribute(new ArrayList<Double>(Arrays.asList(50.00,80.00,160.00,320.00,480.00,640.00,4000.0)), "HDD", limit));
        attributes.add(new ZCurveFloatAttribute(new ArrayList<Double>(Arrays.asList(5120.00)), "BW", limit));
        attributes.add(new ZCurveFloatAttribute(new ArrayList<Double>(Arrays.asList(0.013,0.02,0.032,0.048,0.109,0.244,0.461,0.679,0.897,3.00)), "HP", limit));
        attributes.add(new ZCurveFloatAttribute(new ArrayList<Double>(Arrays.asList(0.01118,0.01708,0.04,0.0402,0.418,0.0443,0.0715,1.0)), "BWP", limit));
    }
    
    @Override
    public long getValue(CCService ccService){
        String binaryRepresentation = "";
        ArrayList<String> binaryConvertions = new ArrayList<String>();
        binaryConvertions.add(attributes.get(0).binaryConvertion(ccService.getProvider()));
        binaryConvertions.add(attributes.get(1).binaryConvertion(ccService.getInstance()));
        binaryConvertions.add(attributes.get(2).binaryConvertion(ccService.getLocation()));
        binaryConvertions.add(attributes.get(3).binaryConvertion(ccService.getECU()));
        binaryConvertions.add(attributes.get(4).binaryConvertion(ccService.getRAM()));
        binaryConvertions.add(attributes.get(5).binaryConvertion(ccService.getHDD()));
        binaryConvertions.add(attributes.get(6).binaryConvertion(ccService.getBW()));
        binaryConvertions.add(attributes.get(7).binaryConvertion(ccService.getInstance_price()));
        binaryConvertions.add(attributes.get(8).binaryConvertion(ccService.getBw_price()));
        for(int i=0;i<limit;i++){
            for(String binaryConvertion: binaryConvertions) binaryRepresentation = binaryRepresentation + binaryConvertion.charAt(i);
        }
        return convertToDecimal(binaryRepresentation);
    }
    
}
