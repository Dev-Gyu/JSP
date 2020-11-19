package mvc.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionClass {
	
	public static Connection getConnection() throws SQLException {
		String uri = "jdbc:apache:commons:dbcp:study";
		Connection conn = DriverManager.getConnection(uri);
		return conn;
	}

}
