package ccbench;

import bCloudTree.BCloudTree;
import essential.Approach;
import essential.CCService;
import essential.WSN;
import essential.CCResult;
import essential.CCUser;
import greedyAppraoch.GreedyAppraoch;
import input.DataBaseDataReader;
import bPlusCloudTree.BPlusCloudTree;
import proposedApproach.ProposedApproach;
import input.DataReader;
import java.util.ArrayList;
import output.DataBaseDataWriter;
import output.DataWriter;

/**
 * Cloud Computing Services Selection WorkBench Tool Main Class.
 * @author A.K.Y. SETTOUTI
 */
public class CCBench {
    /**
     * @param args the command line arguments (useless)
     */
    public static void main(String[] args) {
        DataReader dataBaseDataExtractor = new DataBaseDataReader();
        // Read data from a default database (database default credentials are implemented in the DataBaseDataReader class)
        dataBaseDataExtractor.read();
        // Extract services
        ArrayList<CCService> ccServices = dataBaseDataExtractor.getCcServices();
        // Extract users
        ArrayList<CCUser> ccUsers = dataBaseDataExtractor.getCcUsers();
        // Extract wireless sensor networks
        ArrayList<WSN> wsns = dataBaseDataExtractor.getWsns();
        Approach approach;
        ArrayList<CCResult> ccResults = new ArrayList<CCResult>();
        approach = new GreedyAppraoch(ccServices);
        for(CCUser ccUser : ccUsers)
            for(WSN wsn : wsns)
                approach.solve(wsn, ccUser);
        ccResults.addAll(approach.getCcResults());
        approach = new BCloudTree(ccServices);
        for(CCUser ccUser : ccUsers)
            for(WSN wsn : wsns)
                approach.solve(wsn, ccUser);        
        ccResults.addAll(approach.getCcResults());
        approach = new BPlusCloudTree(ccServices);
        for(CCUser ccUser : ccUsers)
            for(WSN wsn : wsns)
                approach.solve(wsn, ccUser);
        ccResults.addAll(approach.getCcResults());
        approach = new ProposedApproach(ccServices);
        for(CCUser ccUser : ccUsers)
            for(WSN wsn : wsns)
                approach.solve(wsn, ccUser);
        ccResults.addAll(approach.getCcResults());
        DataWriter dataWriter = new DataBaseDataWriter();
        dataWriter.write(ccResults);
    }
}
