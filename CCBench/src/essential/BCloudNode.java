package essential;

/**
 * AVL Tree Node representing a IaaS Public Cloud Computing Service.
 * @author A.K.Y. SETTOUTI.
 */
public class BCloudNode extends CCService implements Comparable {
    private long zCurveValue;
    
    public BCloudNode(CCService other, long zCurveValue) {
        super(other);
        this.zCurveValue = zCurveValue;
    }

    @Override
    public int compareTo(Object t) {
        if (t == null) {
            throw new NullPointerException("Paramètre nul.");
        } else if (getClass() != t.getClass()) {
            throw new ClassCastException("Classe incompatible");
        } else {
            BCloudNode obj = (BCloudNode) t;
            if (zCurveValue == obj.zCurveValue) return super.hashCode() - ((CCService) obj).hashCode();
            else return Long.compare(zCurveValue, obj.zCurveValue);
        }
    }
    
}
