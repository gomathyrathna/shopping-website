package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySqlConnect {
	static Connection connect;
	public static Connection getConnection() {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		String url = "jdbc:mysql://localhost:3306/onlineshopping";
		String username = "root";
		String password = "@Smija117";
		try {
			connect = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
		
		return connect;
	
}

}
