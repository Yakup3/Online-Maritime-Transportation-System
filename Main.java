import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class Main {
	private static Connection connect = null;
	private static Statement statement = null;
	private static ResultSet resultSet = null;
	
	final private static String host = "jdbc:postgresql://10.98.98.61:5432/group38";
	final private static String user = "group38";
	final private static String password = "?9@v&R#XTPGM!u7Y";
	
	public static void main(String[] args) {
		try {
			connect = DriverManager.getConnection(host, user, password);
			
			statement = connect.createStatement();
			
			System.out.println("#############################################################");
			System.out.println("1-List the datas");
			System.out.println("2-Delete a Has Data");
			System.out.println("3-Insert a Ship");
			System.out.println("4-Update data in Cruise");
			System.out.println("0-To exit from while loop");
			System.out.println("#############################################################");
			Scanner scan = new Scanner(System.in);
			String choice = scan.next();
			
			
			while(!choice.equals("0")) {
				if(choice.equals("1")) {
					System.out.println("1-List the Has Data");
					System.out.println("2-List the Cruise");
					System.out.println("3-List the Ship");
					
					int listChoice = scan.nextInt();
					
					if(listChoice == 1) {
						resultSet = statement.executeQuery("select * from has");
					}else if(listChoice == 2) {
						resultSet = statement.executeQuery("select * from cruise");
					}else if(listChoice == 3) {
						resultSet = statement.executeQuery("select * from ship");
					}

					writeResultSet(resultSet);
				}
				
				else if(choice.equals("2")) {
					System.out.println("Enter the Company_Shipping ID");
					int id = scan.nextInt();
					statement.executeUpdate("delete from has where shipping_id = '" + id + "'");
				}
				
				else if(choice.equals("3")) {
	                System.out.println("1-Enter the New Ship ID");
	                String id = scan.next();
	                System.out.println("2-Enter the Ship Name");
	                String name = scan.next();
	                System.out.println("3-Enter the Code of the Ship");
	                String code = scan.next();
	                System.out.println("4-Enter the Capacity of the Ship");
	                int capacity = scan.nextInt();
	                
	                try {
	                	statement.executeUpdate("insert into Ship " + "(ID, Name, Code, Capacity)" + "values( " + id + ", "
		                        + "'" + name + "'" + ", " + "'" + code + "'" + ", " + capacity + ") ");
	                }catch(Exception e) {
	                	String s = e.toString();
	                	System.out.println(s.substring(s.lastIndexOf(':') + 2) + "\nTry again!!!");
	                }
				}
				
				else if(choice.equals("4")) {
					System.out.println("Enter id of cruise");
					int id = scan.nextInt();
					scan.nextLine();
					System.out.println("Enter the new Departure_Date for cruise");
					String departure_date = scan.nextLine();
					statement.executeUpdate("update cruise set departure_date = '" + departure_date + "'where id = '" + id + "'");
				}
				
				System.out.println();
				System.out.println("#############################################################");
				System.out.println("1-List the datas");
				System.out.println("2-Delete a Has Data");
				System.out.println("3-Insert a Ship");
				System.out.println("4-Update data in Cruise");
				System.out.println("0-To exit from while loop");
				System.out.println("#############################################################");
				
				choice = scan.next();
				
			}
			scan.close();
		}catch(SQLException e) {
			System.out.println("Connection failure.");
			e.printStackTrace();
		}finally {
			close();
		}
	}
	
	private static void writeResultSet(ResultSet resultSet) throws SQLException{
		ResultSetMetaData rsmd = resultSet.getMetaData();
		int columnsNumber = rsmd.getColumnCount();
		while(resultSet.next()) {
			for(int i = 1; i <= columnsNumber; i++) 
				System.out.print(resultSet.getString(i) + " ");
			System.out.println();
		}
	}
	
	private static void close() {
		try {
			if(resultSet != null) {
				resultSet.close();
			}
			if(statement != null) {
				statement.close();
			}
			if(connect != null) {
				connect.close();
			}
		}catch(Exception e) {
			
		}
	}
	
}
