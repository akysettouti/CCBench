package bPlusCloudTree;

import essential.BCloudTree;
import essential.CCService;
import java.util.ArrayList;

/**
 * The BCloudTree Approach to index and search Cloud Computing Services.
 * @author A.K.Y. SETTOUTI.
 */
public class BPlusCloudTree extends BCloudTree {

    /**
     * Inialise Public IaaS Cloud Computing Service List. Inialise The Z-Curve Function.
     * @param ccServices Public IaaS Cloud Computing Service List.
     */
    public BPlusCloudTree(ArrayList<CCService> ccServices) {
        super(ccServices, new BPlusCloudTreeZCurveFunction());
    }
}