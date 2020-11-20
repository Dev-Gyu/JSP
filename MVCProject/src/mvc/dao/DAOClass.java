package mvc.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import mvc.close.CloseClass;
import mvc.vo.VOClass;

public class DAOClass {
	
	public static DAOClass getInstance() {
		return instance;
	}
	
	public static DAOClass instance = new DAOClass();
	
	private DAOClass() {};
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public int updateRecordDAO(Connection conn, VOClass vo) throws SQLException, IOException{
		String sql = "UPDATE guestbook SET MESSAGE=? WHERE GUEST_ID = ?";
		int isSuccess = 0;
		try {
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMessage());
			pstmt.setInt(2, vo.getId());
			isSuccess = pstmt.executeUpdate();
			if(isSuccess != 0) {
				conn.commit();
				return isSuccess;
			}else {
				conn.rollback();
				return 0;
			}
		}finally {
			CloseClass.close(pstmt);
		}
	}
	
	public int deleteRecordDAO(Connection conn, int guestid) throws SQLException, IOException{
		String sql = "DELETE FROM guestbook WHERE GUEST_ID = ?";
		int isSuccess = 0;
		try {
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, guestid);
			isSuccess = pstmt.executeUpdate();
			if(isSuccess != 0) {
				conn.commit();
				return isSuccess;
			}else {
				conn.rollback();
				return 0;
				}
			}finally {
				CloseClass.close(pstmt);
			}
	}
	
	public int insertRecordDAO(Connection conn, VOClass vo) throws SQLException, IOException{
		String sql = "INSERT INTO guestbook (PASSWORD, GUEST_NAME, MESSAGE) VALUES (?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPassword());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getMessage());
			return pstmt.executeUpdate();
		}finally {
			CloseClass.close(pstmt);
		}
	}
	
	public List<VOClass> getAllRecordsDAO(Connection conn) throws SQLException, IOException {
		String sql = "SELECT * FROM guestbook";
		List<VOClass> ls = new ArrayList<VOClass>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				do {
				ls.add(extractResultSet(rs));
				}while(rs.next());
				return ls;
			}else {
				return Collections.emptyList();
			}
			
		}finally {
			CloseClass.close(rs);
			CloseClass.close(pstmt);
		}	
	}
	
	public VOClass getOneRecordDAO(Connection conn, int guestid) throws SQLException, IOException{
		String sql = "SELECT * FROM guestbook WHERE GUEST_ID = ?";
		VOClass vo = new VOClass();
		try {
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
