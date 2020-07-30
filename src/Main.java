import java.util.Scanner;

public class Main {

    public static void main(String[] args) {

        DBConnection connection = new DBConnection();
        Scanner sc = new Scanner(System.in);
        boolean flag = true;
        boolean exist = false;
        String tableName=null;
        while (flag) {

            System.out.println("Plz choose an option:\n1.Show a table\n2.Add a record\n3.Update a record\n4.Delete a record\n5.Exit");
            int option = sc.nextInt();

            if (option!=5)System.out.println("Plz enter your table's name:");

            while (!exist) {
                tableName = sc.next();
                exist = connection.checkTable(tableName);
                if (!exist) System.out.println("This table doesn't exist plz enter another one:");
            }


            switch (option) {
                case 1:
                    connection.getData(tableName);
                    break;

                case 2:
                    connection.addData(tableName);
                    break;

                case 3:
                    connection.updateData(tableName);
                    break;

                case 4:
                    connection.deleteData(tableName);
                    break;

                case 5:
                    flag = false;
                    break;

            }
            exist=false;
        }

    }
}
