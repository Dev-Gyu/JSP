package guestbook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import guestbook.model.Message;
import jdbc.JdbcUtil;

public class MessageDao {
	
	private static MessageDao messageDao = new MessageDao();
	
	public static MessageDao getInstance() {
		return messageDao;
	}
	
	private MessageDao() {}
	
	public int insert(Connection conn, Message message) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO guestbook_message (GUEST_NAME, PASSWORD, MESSAGE) VALUES (?, ?, ?)";
		try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, message.getGuestName());
		pstmt.setString(2, message.getPassword());
		pstmt.setString(3, message.getMessage());
		return pstmt.executeUpdate();
		}finally {
			JdbcUtil.close(pstmt);
		}
	}
	
	public Message select(Connection conn, int messageid) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from guestbook_message where message_id = ?");
			pstmt.setInt(1, messageid);
			rs = pstmt.executeQuery();
			if(rs.next()){
				return makeMessageFromResultSet(rs);
			}else {
				return null;
			}
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	public Message makeMessageFromResultSet(ResultSet rs) throws SQLException{
		Message message = new Message();
		message.setId(rs.getInt("message_id"));
		message.setGuestName(rs.getString("guest_name"));
		message.setPassword(rs.getString("password"));
		message.setMessage(rs.getString("message"));
		return message;
	}
	
	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from guestbook_message where message_id");
			rs.next();
			return rs.getInt(1);
			
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}
	
	public List<Message> selectList(Connection conn, int firstRow, int endRow) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from guestbook_message order by message_id desc limit ?, ?");
			pstmt.setInt(1, firstRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				List<Message> ls = new ArrayList<Message>();
			do{
				ls.add(makeMessageFromResultSet(rs));
				
			}while(rs.next());
			return ls;
		}else
			return Collections.emptyList();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	public int delete(Connection conn, int messageid) throws SQLException{
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("delete from guestbook_message where MESSAGE_ID=?");
			pstmt.setInt(1, messageid);
			return pstmt.executeUpdate();
		}finally {
			JdbcUtil.close(pstmt);
		}
		
	}

}
