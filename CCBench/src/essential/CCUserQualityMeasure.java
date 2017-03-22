package essential;

import java.util.ArrayList;
import java.util.Arrays;

/**
 * User Quality Measure Preference.
 * @author A.K.Y. SETTOUTI.
 */
public class CCUserQualityMeasure {
    private String name;
    private int importance;
    private static ArrayList<String> POSSIBLE_NAMES = new ArrayList<String>(Arrays.asList("RT","Av","SM"));

    /**
     * @param name Quality Measure Name.
     * @param importance User preference for the Quality Measure. Must be BETWEEN 0 and 100.
     */
    public CCUserQualityMeasure(String name, int importance) {
        if ((importance > 100)||(importance < 0)) throw new IllegalArgumentException("Mesure de qualité valuée hors limites");
        if (!POSSIBLE_NAMES.contains(name)) throw new IllegalArgumentException("Nom de la mesure de qualité inconnu");
        this.name = name;
        this.importance = importance;
    }

    @Override
    public String toString() {
        return "CCUserQualityMeasure{" + "name=" + name + ", importance=" + importance + '}';
    }
    
    /**
     * @param ccService Public IaaS Cloud Computing Service.
     * @param wsn Wireless Sensor Network.
     * @return ccService Score for the wsn based on the user preference.
     */
    public double getValue(CCService ccService, WSN wsn){
        double result = importance;
        if (name.equals("SM")) result = result * (wsn.getBudget() - ccService.getPrice(wsn))/ wsn.getBudget();
        else if (name.equals("Av")) result = result * ccService.getAvailability(wsn) * 0.01;
        else if (name.equals("RT")) result = result * ccService.getResponseTime(wsn) / 3000;
        else result = -1;
        return result;
    }
}