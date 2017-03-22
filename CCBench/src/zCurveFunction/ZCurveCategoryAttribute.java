package zCurveFunction;

import java.util.ArrayList;

/**
 * Z-Curve Function Categories Attribute.
 * @author A.K.Y. SETTOUTI.
 */
public class ZCurveCategoryAttribute extends ZCurveAttribute {
    private ArrayList<String> categoriesValues;
    private ArrayList<String> categoriesBinaryRepresentations;

    /**
     * @param categoriesValues Possible Categories.
     * @param name Attribute Name.
     * @param length Digits Number to Encode Values.
     */
    public ZCurveCategoryAttribute(ArrayList<String> categoriesValues, String name, int length) {
        super(name, length);
        String binaryRepresentation = "1";
        this.categoriesValues = categoriesValues;
        categoriesBinaryRepresentations = new ArrayList<String>();
        for(int i=0;i<categoriesValues.size();i++){
            categoriesBinaryRepresentations.add(binaryRepresentation);
            binaryRepresentation = binaryRepresentation + "0";
        }
        for(int i=0;i<categoriesBinaryRepresentations.size();i++)
            while(categoriesBinaryRepresentations.get(i).length()<super.length)
                categoriesBinaryRepresentations.set(i, "0" + categoriesBinaryRepresentations.get(i));
    }

    @Override
    public String binaryConvertion(Object value) {
        String val = ((String) value);
        if (!categoriesValues.contains(val)) throw new IllegalArgumentException("Catégorie inexistante");
        else return categoriesBinaryRepresentations.get(categoriesValues.indexOf(val));
    }
}