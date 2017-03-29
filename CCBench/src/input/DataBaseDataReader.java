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
import java.util.logging.Level;
import java.util.logging.Logger;

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
            Logger.getLogger(DataBaseDataReader.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                resultSet.close();
            } catch (SQLException ex) {
                Logger.getLogger(DataBaseDataReader.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                statement.close();
            } catch (SQLException ex) {
                Logger.getLogger(DataBaseDataReader.class.getName()).log(Level.SEVERE, null, ex);
            }
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
            Logger.getLogger(DataBaseDataReader.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                resultSet.close();
            } catch (SQLException ex) {
                Logger.getLogger(DataBaseDataReader.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                statement.close();
            } catch (SQLException ex) {
                Logger.getLogger(DataBaseDataReader.class.getName()).log(Level.SEVERE, null, ex);
            }
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
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DataBaseDataReader.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                resultSet.close();
            } catch (SQLException ex) {
                Logger.getLogger(DataBaseDataReader.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                statement.close();
            } catch (SQLException ex) {
                Logger.getLogger(DataBaseDataReader.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(DataBaseDataReader.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public double getAvailability(CCService ccService, WSN wsn) {
        double result = -1;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            Class.forName(DEFAULT_DRIVER);
            connection = DriverManager.getConnection("jdbc:mysql://"+DEFAULT_HOST+":"+DEFAULT_PORT+"/"+DEFAULT_DATABASE+"?autoReconnect=true&useSSL=false",DEFAULT_USER,DEFAULT_PASSWORD);
            preparedStatement = connection.prepareStatement("select availability FROM cc.network_performance where provider_location = ? and client_location = ?");
            preparedStatement.setInt(1, ccService.getLocation_id());
            preparedStatement.setInt(2, wsn.getLocation_code());
            resultSet = preparedStatement.executeQuery();
            resultSet.first();
            result = resultSet.getDouble("availability");
        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println(ccService.toString()+", "+wsn.toString());
            Logger.getLogger(DataBaseDataReader.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException ex) {
                Logger.getLogger(DataBaseDataReader.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(DataBaseDataReader.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                resultSet.close();
            } catch (SQLException ex) {
                Logger.getLogger(DataBaseDataReader.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return result;
    }

    @Override
    public int getResponseTime(CCService ccService, WSN wsn) {
        int result = -1;
        try {
            Class.forName(DEFAULT_DRIVER);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DataBaseDataReader.class.getName()).log(Level.SEVERE, null, ex);
        }
        Connection connection = null;
        try {
            connection = DriverManager.getConnection("jdbc:mysql://"+DEFAULT_HOST+":"+DEFAULT_PORT+"/"+DEFAULT_DATABASE+"?autoReconnect=true&useSSL=false",DEFAULT_USER,DEFAULT_PASSWORD);
        } catch (SQLException ex) {
            Logger.getLogger(DataBaseDataReader.class.getName()).log(Level.SEVERE, null, ex);
        }
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {            
            preparedStatement = connection.prepareStatement("select network_time_period FROM cc.network_performance where provider_location = ? and client_location = ?");
            preparedStatement.setInt(1, ccService.getLocation_id());
            preparedStatement.setInt(2, wsn.getLocation_code());
            resultSet = preparedStatement.executeQuery();
            resultSet.first();
            result = resultSet.getInt("network_time_period");
        } catch (SQLException ex) {
            System.out.println(ccService.toString()+", "+wsn.toString());
            Logger.getLogger(DataBaseDataReader.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                resultSet.close();
            } catch (SQLException ex) {
                Logger.getLogger(DataBaseDataReader.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                preparedStatement.close();
            } catch (SQLException ex) {
                Logger.getLogger(DataBaseDataReader.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(DataBaseDataReader.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return result;
    }
}
