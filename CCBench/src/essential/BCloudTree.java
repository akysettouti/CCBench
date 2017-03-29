package essential;

import java.util.ArrayList;
import java.util.NavigableSet;
import java.util.TreeSet;
import zCurveFunction.ZCurve;

/**
 * A BCloudTree based Cloud Computing Selection approach.
 * This kind of approaches indexes service in a tree structure.
 * @author A.K.Y. SETTOUTI.
 */
public abstract class BCloudTree extends Approach {
    private TreeSet<BCloudNode> bCloudTree;
    ZCurve zCurve;

    /**
     * Prepare a BCloudTree based approach to Run.
     * @param ccServices Services to select.
     * @param zCurve SCurve Function.
     */
    public BCloudTree(ArrayList<CCService> ccServices, ZCurve zCurve) {
        super(ccServices);
        this.zCurve = zCurve;
        bCloudTree = new TreeSet<BCloudNode>();
        for(CCService ccService : ccServices)
            bCloudTree.add(new BCloudNode(ccService, this.zCurve.getValue(ccService)));
    }

    @Override
    public void solve(WSN wsn, CCUser user) {
        long debut = System.currentTimeMillis();
        CCService lowerCCService = new CCService(0, 0, 1, "CloudSigma", "Small-2", "Frankfurt-Germany", wsn.getEcu(), wsn.getRam(), wsn.getHdd(), 0, 0, 0);
        BCloudNode lowerBound = new BCloudNode(lowerCCService, this.zCurve.getValue(lowerCCService));
        NavigableSet<BCloudNode> navigableSet = bCloudTree.subSet(lowerBound, false, bCloudTree.last(), true);
        for(BCloudNode bCloudNode : navigableSet) if (bCloudNode.isValid(wsn))
            ccResults.add(new CCResult(
                    getClass().getSimpleName(),
                    System.currentTimeMillis() - debut,
                    bCloudNode,
                    wsn,
                    user
            ));
    }
}