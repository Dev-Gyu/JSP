package mvc.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import mvc.close.CloseClass;
import mvc.connection.ConnectionClass;
import mvc.vo.VOClass;

public class ConnectionTest {
	
	public static ConnectionTest instance = new ConnectionTest();
	
	public static ConnectionTest getInstance() {
		return instance;
	}
	
	private ConnectionTest() {};
	
	public VOClass getOneRecord(int guestid) throws SQLException, IOException{
		String sql = "SELECT * FROM guestbook WHERE GUEST_ID = ?";
		VOClass vo = new VOClass();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
		conn = ConnectionClass.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, guestid);
		rs = pstmt.executeQuery();
		if(rs.next()) {
		vo = extractResultSet(rs);
		}else {
			vo.setNull();
		}
		return vo;
		
		}finally {
			CloseClass.close(rs);
			CloseClass.close(pstmt);
			CloseClass.close(conn);
		}
	}
	
	private VOClass extractResultSet(ResultSet rs) throws SQLException, IOException {
		VOClass vo = new VOClass();
		vo.setId(rs.getInt("guest_id"));
		vo.setPassword(rs.getString("password"));
		vo.setName(rs.getString("guest_name"));
		vo.setMessage(rs.getString("message"));
		return vo;
		
	}

}
