/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package input;

import essential.CCService;
import essential.CCUser;
import essential.CCUserQualityMeasure;
import essential.WSN;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;

/**
 * Restore Data from a DataBase.
 * @author A.K.Y. SETTOUTI.
 */
public class DataBaseDataReader extends DataReader {
    private static String DEFAULT_DRIVER = "com.mysql.jdbc.Driver";
    private static String DEFAULT_HOST = "localhost";
    private static String DEFAULT_DATABASE = "cc";
    private static String DEFAULT_USER = "saky";
    private static String DEFAULT_PASSWORD = "saky";
    private static String DEFAULT_PORT = "3306";

    /**
     * Initialise Users, Services and Networks Tables. Arrays are still EMPTY here.
     */
    public DataBaseDataReader() {
        super();
    }
    

    @Override
    public void read() {
        try {
            Class.forName(DEFAULT_DRIVER);
        } catch (ClassNotFoundException ex) {
            System.out.println("Problème de pilote. Exception : "+ex.getMessage());
        }
        Connection connection = null;
        try {
            connection = DriverManager.getConnection("jdbc:mysql://"+DEFAULT_HOST+":"+DEFAULT_PORT+"/"+DEFAULT_DATABASE+"?autoReconnect=true&useSSL=false",DEFAULT_USER,DEFAULT_PASSWORD);
        } catch (SQLException ex) {
            System.out.println("Problème de connexion. Exception : "+ex.getMessage());
        }
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM cc.user_complete");
            while(resultSet.next()){
                ccUsers.add(
                        new CCUser(
                                resultSet.getInt("id"),
                                resultSet.getString("lastname"),
                                resultSet.getString("firstname"),
                                new ArrayList<CCUserQualityMeasure>(Arrays.asList(
                                        new CCUserQualityMeasure("RT",resultSet.getInt("RT")),
                                        new CCUserQualityMeasure("Av",resultSet.getInt("Av")),
                                        new CCUserQualityMeasure("SM",resultSet.getInt("SM"))
                                ))
                        )
                );
            }
        } catch (SQLException ex) {
            System.out.println("Problème de restauration des données utilisateurs. Exception : "+ex.getMessage());
        }
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM cc.instance_complete");
            while(resultSet.next()){
                ccServices.add(new CCService(
                                resultSet.getInt("instance_id"),
                                resultSet.getInt("provider_id"),
                                resultSet.getInt("location_id"),
                                resultSet.getString("name"),
                                resultSet.getString("Instance"),
                                resultSet.getString("Location"),
                                resultSet.getDouble("ECU"),
                                resultSet.getInt("RAM"),
                                resultSet.getDouble("HDD"),
                                resultSet.getDouble("BW"),
                                resultSet.getDouble("hour_price"),
                                resultSet.getDouble("bw_price")
                        )
                );
            }
        } catch (SQLException ex) {
            System.out.println("Problème de restaurationdes données services. Exception : "+ex.getMessage());
        }
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM cc.wsn_complete");
            while(resultSet.next()){
                wsns.add(
                        new WSN(
                                resultSet.getInt("id"),
                                resultSet.getDouble("budget"),
                                resultSet.getLong("mission_period"),
                                resultSet.getDouble("ecu"),
                                resultSet.getDouble("ram"),
                                resultSet.getDouble("hdd"),
                                resultSet.getDouble("bw"),
                                resultSet.getInt("location")
                        )
                );
            }
            statement.close();
            connection.close();
        } catch (SQLException ex) {
            System.out.println("Problème de restaurationdes données réseaux. Exception : "+ex.getMessage());
        }
    }

    @Override
    public double getAvailability(CCService ccService, WSN wsn) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            System.out.println("Problème de pilote. Exception : "+ex.getMessage());
        }
        Connection connection = null;
        try {
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cc","saky","saky");
        } catch (SQLException ex) {
            System.out.println("Problème de connexion. Exception : "+ex.getMessage());
        }
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            preparedStatement = connection.prepareStatement("select availability FROM cc.network_performance where provider_location = ? and client_location = ?");
            preparedStatement.setInt(1, ccService.getLocation_id());
            preparedStatement.setInt(2, wsn.getLocation_code());
            resultSet = preparedStatement.executeQuery();
            resultSet.next();
            double result = resultSet.getDouble("availability");
            preparedStatement.close();
            connection.close();
            return result;
        } catch (SQLException ex) {
            System.out.println("Problème de restauration des données (Availability). Exception : "+ex.getMessage());
        }
        return -1;
    }

    @Override
    public int getResponseTime(CCService ccService, WSN wsn) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            System.out.println("Problème de pilote. Exception : "+ex.getMessage());
        }
        Connection connection = null;
        try {
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cc","saky","saky");
        } catch (SQLException ex) {
            System.out.println("Problème de connexion. Exception : "+ex.getMessage());
        }
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            preparedStatement = connection.prepareStatement("select network_time_period FROM cc.network_performance where provider_location = ? and client_location = ?");
            preparedStatement.setInt(1, ccService.getLocation_id());
            preparedStatement.setInt(2, wsn.getLocation_code());
            resultSet = preparedStatement.executeQuery();
            resultSet.next();
            int result = resultSet.getInt("network_time_period");
            preparedStatement.close();
            connection.close();
            return result;
        } catch (SQLException ex) {
            System.out.println("Problème de restauration des données (Response Time). Exception : "+ex.getMessage());
        }
        return -1;
    }
}
