import java.sql.*;
import java.util.Scanner;

public class DBConnection {

    private Connection con;
    private Statement st;
    private ResultSet rs;
    private ResultSetMetaData metadata;

    public DBConnection() {

        try {

            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
            st = con.createStatement();

        } catch (Exception e) {
            System.out.println("Error :" + e);
        }

    }

    public void getData(String tableName) {
        try {
            rs = st.executeQuery("select * from" + " " + tableName);
            metadata = rs.getMetaData();
            int numberOfColumns = metadata.getColumnCount();

            while (rs.next()) {

                for (int i = 1; i <= numberOfColumns; i++) {
                    System.out.print(metadata.getColumnName(i) + ": " + rs.getString(i) + " , ");
                }
                System.out.println();
            }
        } catch (
                Exception e) {
            System.out.println("Error :" + e);
        }
    }

    public void addData(String tableName) {
        Scanner scan = new Scanner(System.in);
        String sql ="INSERT INTO ".concat(tableName + " VALUES(") ;
        try {
            rs = st.executeQuery("select * from " + tableName);
            metadata = rs.getMetaData();
            int numberOfColumns = metadata.getColumnCount();


            for (int i = 1; i <= numberOfColumns; i++) {
                System.out.print("Plz enter " + metadata.getColumnName(i) + ":");
                sql =sql+"'"+ scan.next()+"'";
                if (i!=numberOfColumns)sql=sql+",";

            }
            sql = sql + ")";
            st=con.createStatement();
            st.executeUpdate(sql);

        } catch (Exception e) {
            System.out.println("Error :" + e);
        }
    }

    public void updateData(String tableName) {
    }

    public void deleteData(String tableName) {
    }

    public boolean checkTable(String tableName) {
        boolean exist = false;
        try {
            DatabaseMetaData meta = con.getMetaData();
            rs = meta.getTables(null, null, tableName, null);
            if (rs.next()) exist = true;
        } catch (Exception e) {
            System.out.println("Error :" + e);
        }
        return exist;
    }
}
