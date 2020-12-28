package dbpack;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Hishan
 */
public class db_connection {

    static Connection con;
    static Statement s;
    static ResultSet rs;
    
    static void getConnection() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dlibrary_ebooks", "root", "");

    }

    public static void updater(String para) throws Exception {
        if (con == null) {
            getConnection();
        }
        if (s == null) {
            Statement s = con.createStatement();
            s.executeUpdate(para);
            
        } else {
            s.executeUpdate(para);
        }
    }

    public static ResultSet search(String searchable) throws Exception {
        if (con == null) {
            getConnection();
            if (s == null) {
                Statement s = con.createStatement();
                rs=s.executeQuery(searchable);
            }else{
            rs=s.executeQuery(searchable);
            }
        }else{
        if (s == null) {
                Statement s = con.createStatement();
                rs=s.executeQuery(searchable);
            }else{
            rs=s.executeQuery(searchable);
            }
        }
        return rs;
    }

   
}