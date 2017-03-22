package essential;

/**
 * A Cloud Computing Services Selection Algorithm Approach Result.
 * @author A.K.Y. SETOUTI.
 */
public class CCResult {
    private String approach;
    private int provider;
    private int location;
    private int instance;
    private int user;
    private int wsn;
    public long findingTime;
    public double score;

    /**
     * @return The Result Approach Name.
     */
    public String getApproach() {
        return approach;
    }

    /**
     * @return The Result IaaS Public Cloud Computing Provider Code.
     */
    public int getProvider() {
        return provider;
    }

    /**
     * @return The Result Provider Location Code.
     */
    public int getLocation() {
        return location;
    }

    /**
     * @return The Result Public IaaS Instance Code.
     */
    public int getInstance() {
        return instance;
    }

    /**
     * @return The User Code.
     */
    public int getUser() {
        return user;
    }

    /**
     * @return The Wireless Sensor Network Code.
     */
    public int getWsn() {
        return wsn;
    }

    /**
     * @return The Time Period Took to Find this Result.
     */
    public long getFindingTime() {
        return findingTime;
    }

    /**
     * @return The Score of the Result
     */
    public double getScore() {
        return score;
    }

    /**
     * Create An Novel Result according to the Parameters Values passed in arguments.
     * @param approachName Cloud Computing Selection Approach Name.
     * @param findingTime Consumed Time Period to Find the Result.
     * @param ccService Public IaaS Cloud Computing Service.
     * @param wsn Wireless Sensor Network.
     * @param user Cloud Computing User.
     */
    public CCResult(String approachName, long findingTime, CCService ccService, WSN wsn, CCUser user) {
        this.approach = approachName;
        provider = ccService.getProvider_id();
        location = ccService.getLocation_id();
        instance = ccService.getInstance_id();
        this.user = user.getCode();
        this.wsn = wsn.getCode();
        this.findingTime = findingTime;
        this.score = user.getScore(ccService, wsn);
    }

    @Override
    public String toString() {
        return "CCResult{" + "approach=" + approach + ", provider=" + provider + ", location=" + location + ", instance=" + instance + ", user=" + user + ", wsn=" + wsn + ", findingTime=" + findingTime + ", score=" + score + '}';
    }
}
