package guestbook.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import guestbook.close.CloseClass;
import guestbook.vo.VOClass;

public class DAOClass {
	
	private static DAOClass instance = new DAOClass();
	
	private DAOClass() {};
	
	public static DAOClass getInstance() {
		return instance;
	}
	
	PreparedStatement pstmt = null;
	public void insert(Connection conn, VOClass vo) throws SQLException{
		String sql = "insert into guestbook (PASSWORD, GUEST_NAME, MESSAGE) VALUES (?, ?, ?)";
		try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, vo.getPassword());
		pstmt.setString(2, vo.getName());
		pstmt.setString(3, vo.getMessage());
		pstmt.executeUpdate();
		}finally {
			CloseClass.close(pstmt);
			CloseClass.close(conn);
			
		}
		
		
	}
	
	public VOClass select(Connection conn, int guestid) throws SQLException{
		String sql = "select * from guestbook where GUEST_ID = ?";
		ResultSet rs = null;
		try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, guestid);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			return extractResultSet(rs);
		}else {
			return null;
		}
		}finally {
			CloseClass.close(conn);
		}
		
	}
	
	public List<VOClass> selectall(Connection conn) throws SQLException{
		String sql = "select * from guestbook";
		List<VOClass> ls = new ArrayList<>();
		ResultSet rs = null;
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
	
	private VOClass extractResultSet(ResultSet rs) throws SQLException{
		VOClass voclass = new VOClass();
				voclass.setId(rs.getInt("guest_id"));
				voclass.setMessage(rs.getString("message"));
				voclass.setName(rs.getString("guest_name"));
				voclass.setPassword(rs.getString("password"));
		return voclass;
	}
	
	public void delete(Connection conn, int guestid) throws SQLException {
		String sql = "delete from guestbook where GUEST_ID = ?";
		int success = 0;
		try {
		conn.setAutoCommit(false);
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, guestid);
		success = pstmt.executeUpdate();
		if(success != 0) {
		conn.commit();
		}else {
			conn.rollback();
		}
		}finally {
			CloseClass.close(pstmt);
		}
	}
}
