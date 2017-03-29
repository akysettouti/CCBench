/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package essential;

/**
 *
 * @author sakyb_000
 */
public class WSN {
    private int code;
    private double budget;
    private long mission_period;
    private double ecu;
    private double ram;
    private double hdd;
    private double bw;
    private int location_code;

    /**
     * @return Wireless Sensor Network Code.
     */
    public int getCode() {
        return code;
    }

    /**
     * @return Location Code.
     */
    public int getLocation_code() {
        return location_code;
    }

    /**
     * @param code WSN Code.
     * @param budget Allocated Mission Budget.
     * @param mission_period Mission Time Duration.
     * @param ecu Nacessary Processor Frequency Speed.
     * @param ram Necessary RAM Memory Size.
     * @param hdd Necessary ROM Memory Size.
     * @param bw Necessary Bandwidth Amount.
     * @param location_code Location Code.
     */
    public WSN(int code, double budget, long mission_period, double ecu, double ram, double hdd, double bw, int location_code) {
        this.code = code;
        this.budget = budget;
        this.mission_period = mission_period;
        this.ecu = ecu;
        this.ram = ram;
        this.hdd = hdd;
        this.bw = bw;
        this.location_code = location_code;
    }

    @Override
    public String toString() {
        return "WSN{" + "code=" + code + ", budget=" + budget + ", mission_period=" + mission_period + ", ecu=" + ecu + ", ram=" + ram + ", hdd=" + hdd + ", bw=" + bw + ", location_code=" + location_code + '}';
    }

    /**
     * @return Reserved Mission Budget.
     */
    public double getBudget() {
        return budget;
    }

    /**
     * @return Mission Duration.
     */
    public long getMission_period() {
        return mission_period;
    }

    /**
     * @return Necessary Processor Frequency Speed.
     */
    public double getEcu() {
        return ecu;
    }

    /**
     * @return Necessary RAM Memory Size.
     */
    public double getRam() {
        return ram;
    }

    /**
     * @return Necessary ROM Memory Size.
     */
    public double getHdd() {
        return hdd;
    }

    /**
     * @return Necessary BandWidth Traffic Amount.
     */
    public double getBw() {
        return bw;
    }
}
