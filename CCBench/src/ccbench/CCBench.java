package ccbench;

import essential.Approach;
import essential.CCService;
import essential.WSN;
import essential.CCResult;
import essential.CCUser;
import input.DataBaseDataReader;
import originalBCloudTree.OriginalBCloudTree;
import proposedBCloudTree.ProposedBCloudTree;
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
        System.out.println(ccServices.size());
        // Extract users
        ArrayList<CCUser> ccUsers = dataBaseDataExtractor.getCcUsers();
        // Extract wireless sensor networks
        ArrayList<WSN> wsns = dataBaseDataExtractor.getWsns();
        ArrayList<Approach> approaches = new ArrayList<Approach>();
        approaches.add(new OriginalBCloudTree(ccServices));
        approaches.add(new ProposedBCloudTree(ccServices));
        ArrayList<CCResult> ccResults = new ArrayList<CCResult>();
        // For each approach
        approaches.stream().map((approach) -> {
            // Browse all users and wsn(s)
            ccUsers.forEach((user) -> {
                wsns.forEach((wsn) -> {
                    // For each approach, user, wsn; find the compatible service for.
                    approach.solve(wsn, user);
                });
            });
            return approach;
        }).forEachOrdered((approach) -> {
            // Collect every result in a single variable.
            ccResults.addAll(approach.getCcResults());
        });
        DataWriter dataWriter = new DataBaseDataWriter();
        // Write results in a database
        dataWriter.write(ccResults);
    }
}
