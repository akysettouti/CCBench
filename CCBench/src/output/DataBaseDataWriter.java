package output;

import essential.CCResult;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Collection;

/**
 * Save Data in a DataBase.
 * @author A.K.Y. SETTOUTI.
 */
public class DataBaseDataWriter extends DataWriter {
    private static String DEFAULT_DRIVER = "com.mysql.jdbc.Driver";
    private static String DEFAULT_HOST = "localhost";
    private static String DEFAULT_DATABASE = "cc";
    private static String DEFAULT_USER = "saky";
    private static String DEFAULT_PASSWORD = "saky";
    private static String DEFAULT_PORT = "3306";
    

    @Override
    public void write(Collection<CCResult> ccResults) {
        try {
            Class.forName(DEFAULT_DRIVER);
        } catch (ClassNotFoundException ex) {
            System.out.println("Problème de pilote. Exception : "+ex.getMessage());
        }
        Connection connection = null;
        try {
            connection = DriverManager.getConnection("jdbc:mysql://"+DEFAULT_HOST+":"+DEFAULT_PORT+"/"+DEFAULT_DATABASE,DEFAULT_USER,DEFAULT_PASSWORD);
        } catch (SQLException ex) {
            System.out.println("Problème de connexion. Exception : "+ex.getMessage());
        }
        ResultSet resultSet = null;
        Statement statement = null;
        int date = -1;
        try {
            statement = connection.createStatement();
            statement.execute("insert into experiment(moment) values (now())");
            resultSet = statement.executeQuery("select max(id) as id from cc.experiment");
            resultSet.first();
            date = resultSet.getInt("id");
        } catch (SQLException ex) {
            System.out.println("Problème de création d'une nouvelle expérience. Exception : " + ex.getMessage());
        }
        PreparedStatement preparedStatement = null;
        if (date > -1){
            try {
                preparedStatement = connection.prepareStatement("insert into result values (?,?,?,?,?,?,?,?,?)");
            } catch (SQLException ex) {
                System.out.println("Problème de préparation de requêtes. Exception : " + ex.getMessage());
            }
            for (CCResult ccResult : ccResults) {
                try {
                    preparedStatement.setInt(1, date);
                    preparedStatement.setString(2, ccResult.getApproach());
                    preparedStatement.setInt(3, ccResult.getInstance());
                    preparedStatement.setInt(4, ccResult.getUser());
                    preparedStatement.setInt(5, ccResult.getLocation());
                    preparedStatement.setInt(6, ccResult.getProvider());
                    preparedStatement.setInt(7, ccResult.getWsn());
                    preparedStatement.setLong(8, ccResult.getFindingTime());
                    preparedStatement.setDouble(9, ccResult.getScore());
                    preparedStatement.execute();
                } catch (SQLException ex) {
                    System.out.println("Problème d'insertion de données. Exception : " + ex.getMessage());
                }
            }
        }
    }
}
