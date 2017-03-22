package essential;

import java.util.ArrayList;

/**
 * Represent a Cloud Computing Selection Approach.
 * @author A.K.Y. SETTOUTI.
 */
public abstract class Approach {
    //Cloud Computing Services to select
    protected ArrayList<CCService> ccServices;
    //Final selected Services with scores and retreiving period
    protected ArrayList<CCResult> ccResults;

    /**
     * Create an approach to select ccServices and with no results.
     * @param ccServices Services to be selected.
     */
    public Approach(ArrayList<CCService> ccServices) {
        this.ccServices = ccServices;
        ccResults = new ArrayList<CCResult>();
    }

    /**
     * @return approach results.
     */
    public ArrayList<CCResult> getCcResults() {
        return ccResults;
    }
    
    /**
     * Select the compatible Cloud Computing Services in ccServices according to the parameters values.
     * @param wsn Wireless Sensor Network.
     * @param user Cloud Computing User.
     */
    public abstract void solve(WSN wsn, CCUser user);
}