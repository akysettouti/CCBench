package essential;

import java.util.ArrayList;
import java.util.Iterator;
import tree.AVLTree;
import tree.AVLTreeResult;
import zCurveFunction.ZCurve;

/**
 * A BCloudTree based Cloud Computing Selection approach.
 * This kind of approaches indexes service in a tree structure.
 * @author A.K.Y. SETTOUTI.
 */
public abstract class BCloudTree extends Approach {

    /**
     * Cloud Computing Services indexed Tree Root Element.
     */
    protected AVLTree bCloudTreeRoot;

    /**
     * ZCurve Function.
     */
    protected ZCurve zCurveFunction;

    /**
     * Prepare a BCloudTree based approach to Run.
     * @param ccServices Services to select.
     * @param zCurve SCurve Function.
     */
    public BCloudTree(ArrayList<CCService> ccServices, ZCurve zCurve) {
        super(ccServices);
        this.zCurveFunction = zCurve;
        bCloudTreeRoot = new AVLTree(ccServices.get(0), zCurveFunction.getValue(ccServices.get(0)));
        Iterator iterator = ccServices.iterator();
        iterator.next();
        while(iterator.hasNext()){
            CCService current = (CCService) iterator.next();
            bCloudTreeRoot.add(new AVLTree(current, zCurveFunction.getValue(current)));
        }
    }

    @Override
    public void solve(WSN wsn, CCUser user) {
        ArrayList<AVLTreeResult> treeResults = bCloudTreeRoot.search(wsn, zCurveFunction);
        treeResults.forEach((AVLTreeResult result) -> {
            ccResults.add(new CCResult(BCloudTree.this.getClass().getSimpleName(), result.getFindingTime(), result.getCcService(), wsn, user));
        });
    }
}