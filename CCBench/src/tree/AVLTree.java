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
        AVLTree suposedRight = this.right;
        suposedRight.parent = this.parent;
        if (suposedRight.right != null) {
            AVLTree move = suposedRight.right;
            this.right = move;
            move.parent = this;
        }
        if (this.parent != null) {
            AVLTree suposedParent = this.parent;
            if (suposedParent.left == this) {
                suposedParent.left = suposedRight;
            } else if (suposedParent.right == this) {
                suposedParent.right = suposedRight;
            }
        }
        this.parent = suposedRight;
        suposedRight.left = this;
    }
    
    private void rotateRight() {
        AVLTree suposedLeft = this.left;
        suposedLeft.parent = this.parent;
        if (suposedLeft.right != null) {
            AVLTree move = suposedLeft.right;
            this.left = move;
            move.parent = this;
        }
        if (this.parent != null) {
            AVLTree suposedParent = this.parent;
            if (suposedParent.left == this) {
                suposedParent.left = suposedLeft;
            } else if (suposedParent.right == this) {
                suposedParent.right = suposedLeft;
            }
        }
        this.parent = suposedLeft;
        suposedLeft.right = this;
    }
    
    private int height(){
        if ((left==null)&&(right==null)) return 0;
        if ((left==null)&&(right!=null)) return 1 + right.height();
        if ((left!=null)&&(right==null)) return 1 + left.height();
        if ((left!=null)&&(right!=null)) return 1 + Math.max(left.height(), right.height());
        return -1;
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
