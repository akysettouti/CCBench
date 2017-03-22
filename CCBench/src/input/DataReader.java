/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package input;

import essential.CCService;
import essential.CCUser;
import essential.WSN;
import java.util.ArrayList;

/**
 * Restore Data from a Data Source.
 * @author A.K.Y. SETTOUTI.
 */
public abstract class DataReader {

    /**
     * Read Public IaaS Cloud Computing Service Users.
     */
    protected ArrayList<CCUser> ccUsers;

    /**
     * Read Public IaaS Cloud Computing Services.
     */
    protected ArrayList<CCService> ccServices;

    /**
     * Read Wireless Sensor Networks.
     */
    protected ArrayList<WSN> wsns;

    /**
     * @return Read Wireless Sensor Networks.
     */
    public ArrayList<WSN> getWsns() {
        return wsns;
    }

    /**
     * @return Read Public IaaS Cloud Computing Service Users.
     */
    public ArrayList<CCUser> getCcUsers() {
        return ccUsers;
    }

    /**
     * @return Read Public IaaS Cloud Computing Services.
     */
    public ArrayList<CCService> getCcServices() {
        return ccServices;
    }

    /**
     * Initialise Users, Services and Networks Tables. Arrays are still EMPTY here.
     */
    public DataReader() {
        ccUsers = new ArrayList<CCUser>();
        ccServices = new ArrayList<CCService>();
        wsns = new ArrayList<WSN>();
    }
    
    /**
     * Read Services, users and networks data.
     */
    public abstract void read();

    /**
     * @param ccService Public IaaS Cloud Computing
     * @param wsn Wireless Sensor Network.
     * @return ccService availability rate for the wsn.
     */
    public abstract double getAvailability(CCService ccService, WSN wsn);

    /**
     * @param ccService Public IaaS Cloud Computing
     * @param wsn Wireless Sensor Network.
     * @return ccService response time for the wsn.
     */
    public abstract int getResponseTime(CCService ccService, WSN wsn);
}
