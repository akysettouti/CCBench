/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package greedyAppraoch;

import essential.Approach;
import essential.CCService;
import essential.CCUser;
import essential.WSN;
import essential.CCResult;
import java.util.ArrayList;

/**
 * Greedy Method to
 * @author A.K.Y. SETTOUTI.
 */
public class GreedyAppraoch extends Approach {

    public GreedyAppraoch(ArrayList<CCService> ccServices) {
        super(ccServices);
    }

    @Override
    public void solve(WSN wsn, CCUser user) {
        long debut = System.currentTimeMillis();
        for(CCService ccService:ccServices)
            if (ccService.isValid(wsn))
                ccResults.add(new CCResult(getClass().getSimpleName(),System.currentTimeMillis()-debut,ccService,wsn,user));
    }
    
}
