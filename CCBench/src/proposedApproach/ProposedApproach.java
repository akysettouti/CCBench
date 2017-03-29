package proposedApproach;

import essential.CCService;
import java.util.ArrayList;
import essential.BCloudTree;

/**
 * The New BCloudTree based Proposed Approach to index and search Cloud Computing Services.
 * @author A.K.Y. SETTOUTI.
 */
public class ProposedApproach extends BCloudTree {

    /**
     * Inialise Public IaaS Cloud Computing Service List. Inialise The Z-Curve Function.
     * @param ccServices Public IaaS Cloud Computing Service List.
     */
    public ProposedApproach(ArrayList<CCService> ccServices) {
        super(ccServices, new ProposedApproachZCurveFunction());
    }
}