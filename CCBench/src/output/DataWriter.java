package output;

import essential.CCResult;
import java.util.Collection;

/**
 * Save Data in a Data Source.
 * @author A.K.Y. SETTOUTI.
 */
public abstract class DataWriter {

    /**
     * Save the passed Results into Arguments in a specified Data Source.
     * @param ccResults Cloud Computing Services Research Algorithm Results.
     */
    public abstract void write(Collection<CCResult> ccResults);
}
