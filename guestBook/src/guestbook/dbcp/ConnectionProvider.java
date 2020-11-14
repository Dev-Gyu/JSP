package guestbook.dbcp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {
	
	public static Connection getConnection() {
		try {
		return DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
		}catch(SQLException e) {
			throw new RuntimeException("ConnectionProvider.getConnection작업중 에러 발생" + e.getMessage(),e);
		}
	}
}
