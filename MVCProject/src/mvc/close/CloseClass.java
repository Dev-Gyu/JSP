package mvc.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CloseClass {
	
	public static void close(Connection conn) {
		if(conn != null) {
			try {
				conn.close();
			}catch(SQLException e) {}
		}
	}
	
	public static void close(PreparedStatement pstmt) {
		if(pstmt != null) {
			try {
				pstmt.close();
			}catch(SQLException e) {}
		}
	}
	
	public static void close(ResultSet rs) {
		if(rs != null) {
			try {
				rs.close();
			}catch(SQLException e) {}
		}
	}

}
