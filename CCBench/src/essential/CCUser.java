package essential;

import java.util.ArrayList;

/**
 * Public IaaS Cloud Computing Service User.
 * @author A.K.Y. SETTOUTI.
 */
public class CCUser {
    private int code;
    private String firstName;
    private String lastName;
    private ArrayList<CCUserQualityMeasure> qualityMeasures;

    /**
     * @return User Unique Code.
     */
    public int getCode() {
        return code;
    }

    /**
     * @param code User Unique Code.
     * @param firstName User First Name.
     * @param lastName USer Last Name.
     * @param qualityMeasures User Preferences.
     */
    public CCUser(int code, String firstName, String lastName, ArrayList<CCUserQualityMeasure> qualityMeasures) {
        this.code = code;
        this.firstName = firstName;
        this.lastName = lastName;
        this.qualityMeasures = qualityMeasures;
    }

    @Override
    public String toString() {
        String representativeString= "CCUser{" + "firstName=" + firstName + ", lastName=" + lastName;
        for(CCUserQualityMeasure cCUserQualityMeasure : qualityMeasures) representativeString = representativeString + ", " + cCUserQualityMeasure.toString();
        return representativeString + '}';
    }
    
    /**
     * @param ccService Public IaaS Cloud Computing Service.
     * @param wsn Wireless Sensor Network.
     * @return User Score for both ccService and wsn passed in arguments.
     */
    public double getScore(CCService ccService, WSN wsn){
        double sum = 0;
        for(CCUserQualityMeasure qualityMeasure : qualityMeasures) sum = sum + qualityMeasure.getValue(ccService, wsn);
        return sum;
    }
}
