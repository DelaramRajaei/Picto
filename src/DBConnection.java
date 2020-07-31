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
            int num = 1;

            while (rs.next()) {
                System.out.print(num + ".");
                for (int i = 1; i <= numberOfColumns; i++) {
                    System.out.print(metadata.getColumnName(i) + ": " + rs.getString(i) + " , ");
                }
                num++;
                System.out.println();
            }
        } catch (
                Exception e) {
            System.out.println("Error :" + e);
        }
    }

    public void addData(String tableName) {
        Scanner scan = new Scanner(System.in);
        String sql = "INSERT INTO ".concat(tableName + " VALUES(");
        try {
            rs = st.executeQuery("select * from " + tableName);
            metadata = rs.getMetaData();
            int numberOfColumns = metadata.getColumnCount();


            for (int i = 1; i <= numberOfColumns; i++) {
                System.out.print("Plz enter " + metadata.getColumnName(i) + ":");
                sql = sql + "'" + scan.next() + "'";
                if (i != numberOfColumns) sql = sql + ",";

            }
            sql = sql + ")";
            st = con.createStatement();
            st.executeUpdate(sql);

        } catch (Exception e) {
            System.out.println("Error :" + e);
        }
    }

    public void updateData(String tableName) {
        Scanner scan = new Scanner(System.in);
        String sql = "UPDATE ".concat(tableName + " SET ");
        try {
            rs = st.executeQuery("select * from " + tableName);
            metadata = rs.getMetaData();
            int numberOfColumns = metadata.getColumnCount();
            int i, selectcol;
            String record;


            getData(tableName);

            System.out.println("New record,Column: ");
            for (i = 1; i <= numberOfColumns; i++) {
                System.out.println(i + "." + metadata.getColumnName(i));
            }
            System.out.println(i + "." + "None");
            selectcol = scan.nextInt();
            if (selectcol >= i || selectcol < 1)
                System.out.print("Change to: ");
            record = scan.next();

            sql = sql + metadata.getColumnName(selectcol) + "='" + record + "' WHERE ";

            System.out.println("Which records should change.Choose a number:");
            for (i = 1; i <= numberOfColumns; i++) {
                System.out.println(i + "." + metadata.getColumnName(i));
            }
            System.out.println(i + "." + "None");
            selectcol = scan.nextInt();
            if (selectcol >= i || selectcol < 1)
                System.out.println("Record:");
            record = scan.next();

            sql = sql + metadata.getColumnName(selectcol) + " ='" + record + "'";

            st = con.createStatement();
            st.executeUpdate(sql);

        } catch (Exception e) {
            System.out.println("Error :" + e);
        }
    }

    public void deleteData(String tableName) {

        Scanner scan = new Scanner(System.in);
        String sql = "DELETE FROM " + tableName + " WHERE ";
        try {
            rs = st.executeQuery("select * from " + tableName);
            metadata = rs.getMetaData();
            int numberOfColumns = metadata.getColumnCount();
            int i, selectcol;
            String record;

            getData(tableName);

            System.out.println("Which record should be deleted:");
            for (i = 1; i <= numberOfColumns; i++) {
                System.out.println(i + "." + metadata.getColumnName(i));
            }
            selectcol = scan.nextInt();
            System.out.print("=");
            record = scan.next();

            sql = sql + metadata.getColumnName(selectcol) + "='" + record + "'";
            st = con.createStatement();
            st.executeUpdate(sql);

        } catch (Exception e) {
            System.out.println("Error :" + e);
        }
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
