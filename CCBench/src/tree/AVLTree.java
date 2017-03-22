package tree;

import essential.CCService;
import essential.WSN;
import java.util.ArrayList;
import zCurveFunction.ZCurve;

/**
 * AVL Tree Structure.
 * @author A.K.Y. SETTOUTI.
 */
public class AVLTree implements Comparable {
    private AVLTree parent;
    private CCService ccService;
    private long zCurveValue;
    private AVLTree left, right;
    private long debut;

    /**
     * Create the First Root Node.
     * @param ccService Public IaaS Cloud Computing Service.
     * @param zCurveValue Z-Curve Value for ccService.
     */
    public AVLTree(CCService ccService, long zCurveValue) {
        this.ccService = ccService;
        this.zCurveValue = zCurveValue;
    }
    
    /**
     * Add a new Node to The Tree.
     * @param newElement New Node.
     */
    public void add(AVLTree newElement){
        if (compareTo(newElement) < 0) {
            if (left == null) {
                newElement.parent = this;
                left = newElement;
            } else {
                left.add(newElement);
            }
        } else if (right == null) {
            newElement.parent = this;
            right = newElement;
        } else {
            right.add(newElement);
        }
        if (((left == null)&&(right!=null)&&(right.height() > 1))||((left != null)&&(right != null)&&(right.height() - left.height() > 1))) rotateLeft();
        else if (((right == null)&&(left != null)&&(left.height() > 1))||(right != null)&&(left != null)&&(left.height() - right.height() > 1)) rotateRight();
    }
    
    private void rotateLeft() {
        AVLTree right = this.right;
        right.parent = this.parent;
        AVLTree move = right.left;
        this.right = move;
        move.parent = this;
        AVLTree parent = this.parent;
        if (parent.left == this) parent.left = right;
        else parent.right = right;
        this.parent = right;
        right.left = this;
    }
    
    private void rotateRight() {
        
    }
    
    private int height(){
        if (left == null) if (right == null) return 0;
        else return 1 + right.height();
        else if (right == null) return 1 + left.height();
        else return 1 + Math.max(left.height(), right.height());
    }
    
    /**
     * @param wsn Wireless Sensor Network.
     * @param zCurve Z-Curve Function.
     * @return AVL Tree Research Results List.
     */
    public ArrayList<AVLTreeResult> search(WSN wsn, ZCurve zCurve){
        debut = System.currentTimeMillis();
        return check(wsn,
                zCurve.getValue(new CCService(
                        1,
                        1,
                        1,
                        "CloudSigma",
                        "Small-2",
                        "Frankfurt-Germany",
                        wsn.getEcu(),
                        wsn.getRam(),
                        wsn.getHdd(),
                        0.0,
                        0.0,
                        0.0
                )
                )
        );
    }
    
    private ArrayList<AVLTreeResult> check(WSN wsn, long zCurve){
        ArrayList<AVLTreeResult> results = new ArrayList<AVLTreeResult>();
        if ((zCurveValue >= zCurve)&&(ccService.isValid(wsn))) results.add(new AVLTreeResult(ccService, Long.compare(System.currentTimeMillis(), debut)));
        if ((zCurveValue >= zCurve)&&(left != null)) results.addAll(left.check(wsn,zCurve));
        if (right != null) results.addAll(right.check(wsn,zCurve));
        return results;
    }

    @Override
    public int compareTo(Object t) {
        if (t == null) {
            throw new NullPointerException("Paramètre nul.");
        } else if (getClass() != t.getClass()) {
            throw new ClassCastException("Classe incompatible");
        } else {
            return Long.compare(zCurveValue, ((AVLTree) t).zCurveValue);
        }
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 97 * hash + ccService.hashCode();
        hash = 97 * hash + (int) (this.zCurveValue ^ (this.zCurveValue >>> 32));
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final AVLTree other = (AVLTree) obj;
        if (this.zCurveValue != other.zCurveValue) {
            return false;
        }
        return true;
    }
}
