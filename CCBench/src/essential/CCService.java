/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package essential;

import input.DataBaseDataReader;
import java.util.Objects;

/**
 *
 * @author sakyb_000
 */
public class CCService {
    private int instance_id;
    private int provider_id;
    private int location_id;
    private String provider;
    private String instance;
    private String location;
    private double ECU;
    private double RAM;
    private double HDD;
    private double BW;
    private double instance_price;
    private double bw_price;

    /**
     * @return Public IaaS Cloud Computing Provider Name.
     */
    public String getProvider() {
        return provider;
    }

    /**
     * @return Public IaaS Cloud Computing Instance Name.
     */
    public String getInstance() {
        return instance;
    }

    /**
     * @return Public IaaS Cloud Computing Location Name in the form CITY, COUNTRY
     */
    public String getLocation() {
        return location;
    }

    /**
     * @return Public IaaS Cloud Computing Service Computing Frequency.
     */
    public double getECU() {
        return ECU;
    }

    /**
     * @return Public IaaS Cloud Computing Service RAM Memory Size.
     */
    public double getRAM() {
        return RAM;
    }

    /**
     * @return Public IaaS Cloud Computing Service Hard Drive Memory Size.
     */
    public double getHDD() {
        return HDD;
    }

    /**
     * @return Public IaaS Cloud Computing Service Initial Bandwidth Amount.
     */
    public double getBW() {
        return BW;
    }

    /**
     * @return Public IaaS Cloud Computing Service Hourly Price.
     */
    public double getInstance_price() {
        return instance_price;
    }

    /**
     * @return Public IaaS Cloud Computing Service 1GB Bandwidth Price.
     */
    public double getBw_price() {
        return bw_price;
    }

    /**
     * @return Public IaaS Cloud Computing Service Instance Code.
     */
    public int getInstance_id() {
        return instance_id;
    }

    /**
     * @return Public IaaS Cloud Computing Service Location Code.
     */
    public int getLocation_id() {
        return location_id;
    }

    /**
     * @return Public IaaS Cloud Computing Service Provider Code.
     */
    public int getProvider_id() {
        return provider_id;
    }

    /**
     * @param wsn Wireless Sensor Network.
     * @return Public IaaS Cloud Computing Service Response Time for the wsn passed in arguments.
     */
    public int getResponseTime(WSN wsn) {
        return new DataBaseDataReader().getResponseTime(this, wsn);
    }

    /**
     * @param wsn Wireless Sensor Network
     * @return Public IaaS Cloud Computing Service Availability for the wsn passed in arguments.
     */
    public double getAvailability(WSN wsn) {
        return new DataBaseDataReader().getAvailability(this, wsn);
    }
    
    public CCService(CCService other){
        this.provider = other.provider;
        this.instance = other.instance;
        this.location = other.location;
        this.ECU = other.ECU;
        this.RAM = other.RAM;
        this.HDD = other.HDD;
        this.BW = other.BW;
        this.instance_price = other.instance_price;
        this.bw_price = other.bw_price;
    }

    @Override
    public String toString() {
        return "CCService{" + "provider=" + provider + ", instance=" + instance + ", location=" + location + ", ECU=" + ECU + ", RAM=" + RAM + ", HDD=" + HDD + ", BW=" + BW + ", instance_price=" + instance_price + ", bw_price=" + bw_price + '}';
    }

    /**
     *
     * @param instance_id Public IaaS Cloud Computing Service Instance Code.
     * @param provider_id Public IaaS Cloud Computing Service Provider Code.
     * @param location_id Public IaaS Cloud Computing Service Location Code.
     * @param provider Public IaaS Cloud Computing Service Provider Name.
     * @param instance Public IaaS Cloud Computing Service Instance Name.
     * @param location Public IaaS Cloud Computing Service Location Name in the form CITY, COUNTRY.
     * @param ECU Public IaaS Cloud Computing Service Processor Frequency Speed.
     * @param RAM Public IaaS Cloud Computing Service RAM Memory Size.
     * @param HDD Public IaaS Cloud Computing Service ROM Memory Size.
     * @param BW Public IaaS Cloud Computing Service Initial BandWidth Amount.
     * @param instance_price Public IaaS Cloud Computing Service Hourly Instance Price.
     * @param bw_price Public IaaS Cloud Computing Service 1GB Bandwith Price.
     */
    public CCService(int instance_id, int provider_id, int location_id, String provider, String instance, String location, double ECU, double RAM, double HDD, double BW, double instance_price, double bw_price) {
        this.instance_id = instance_id;
        this.provider_id = provider_id;
        this.location_id = location_id;
        this.provider = provider;
        this.instance = instance;
        this.location = location;
        this.ECU = ECU;
        this.RAM = RAM;
        this.HDD = HDD;
        this.BW = BW;
        this.instance_price = instance_price;
        this.bw_price = bw_price;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 89 * hash + Objects.hashCode(this.provider);
        hash = 89 * hash + Objects.hashCode(this.instance);
        hash = 89 * hash + Objects.hashCode(this.location);
        hash = 89 * hash + (int) (Double.doubleToLongBits(this.ECU) ^ (Double.doubleToLongBits(this.ECU) >>> 32));
        hash = 89 * hash + (int) (Double.doubleToLongBits(this.RAM) ^ (Double.doubleToLongBits(this.RAM) >>> 32));
        hash = 89 * hash + (int) (Double.doubleToLongBits(this.HDD) ^ (Double.doubleToLongBits(this.HDD) >>> 32));
        hash = 89 * hash + (int) (Double.doubleToLongBits(this.BW) ^ (Double.doubleToLongBits(this.BW) >>> 32));
        hash = 89 * hash + (int) (Double.doubleToLongBits(this.instance_price) ^ (Double.doubleToLongBits(this.instance_price) >>> 32));
        hash = 89 * hash + (int) (Double.doubleToLongBits(this.bw_price) ^ (Double.doubleToLongBits(this.bw_price) >>> 32));
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final CCService other = (CCService) obj;
        if (!Objects.equals(this.provider, other.provider)) {
            return false;
        }
        if (!Objects.equals(this.instance, other.instance)) {
            return false;
        }
        if (!Objects.equals(this.location, other.location)) {
            return false;
        }
        if (Double.doubleToLongBits(this.ECU) != Double.doubleToLongBits(other.ECU)) {
            return false;
        }
        if (this.RAM != other.RAM) {
            return false;
        }
        if (Double.doubleToLongBits(this.HDD) != Double.doubleToLongBits(other.HDD)) {
            return false;
        }
        if (Double.doubleToLongBits(this.BW) != Double.doubleToLongBits(other.BW)) {
            return false;
        }
        if (Double.doubleToLongBits(this.instance_price) != Double.doubleToLongBits(other.instance_price)) {
            return false;
        }
        if (Double.doubleToLongBits(this.bw_price) != Double.doubleToLongBits(other.bw_price)) {
            return false;
        }
        return true;
    }
    
    /**
     * @param wsn Wireless Sensor Network.
     * @return BandWidth Price for a given wsn in arguments.
     */
    public double getBWPrice(WSN wsn){
        if (wsn.getBw() <= BW) return 0;
        else return Math.floor(wsn.getBw() - BW) * bw_price;
    }
    
    /**
     * @param wsn Wireless Sensor Network.
     * @return Total Public IaaS Cloud Computing Service Price for a given wsn in arguments.
     */
    public double getPrice(WSN wsn){
        return getBWPrice(wsn);
    }
    
    /**
     * @param wsn Wireless Sensor Network.
     * @return
     * TRUE if the Public IaaS Cloud Computing Service is compatible with the given wsn in arguments.
     * FALSE if the Public IaaS Cloud Computing Service is not compatible with the given wsn in arguments.
     */
    public boolean isValid(WSN wsn){
        if (wsn.getEcu() > ECU) return false;
        else if (new Double(wsn.getRam()).intValue() > RAM) return false;
        else if (wsn.getHdd() > HDD) return false;
        else if (wsn.getBudget() < getPrice(wsn)) return false;
        return true;
    }
}
