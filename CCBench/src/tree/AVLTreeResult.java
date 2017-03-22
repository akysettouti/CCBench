package tree;

import essential.CCService;

/**
 * AVL Tree REsearch Algorithm Result with Time Consumption Watch.
 * @author A.K.Y. SETTOUTI.
 */
public class AVLTreeResult {
    private CCService ccService;
    private long findingTime;

    /**
     * @param ccService Public IaaS Cloud Computing Service.
     * @param findingTime Algorithm Execution Retreiving Duration.
     */
    public AVLTreeResult(CCService ccService, long findingTime) {
        this.ccService = ccService;
        this.findingTime = findingTime;
    }

    /**
     * @return Public IaaS Cloud Computing Service.
     */
    public CCService getCcService() {
        return ccService;
    }

    /**
     * @return Algorithm Execution Retreiving Duration.
     */
    public long getFindingTime() {
        return findingTime;
    }
}
