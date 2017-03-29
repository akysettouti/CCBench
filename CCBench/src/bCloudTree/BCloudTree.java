/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bCloudTree;

import essential.CCService;
import java.util.ArrayList;
import zCurveFunction.ZCurve;

/**
 *
 * @author sakyb_000
 */
public class BCloudTree extends essential.BCloudTree {
    
    public BCloudTree(ArrayList<CCService> ccServices) {
        super(ccServices, new BCloudTreeZCurveFunction());
    }
    
}
