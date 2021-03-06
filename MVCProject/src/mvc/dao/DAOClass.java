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
import mvc.extract.ExtractResultSet;
import mvc.loginvo.LoginVO;
import mvc.vo.BoardVO;
import mvc.vo.VOClass;

public class DAOClass {
	
	public static DAOClass getInstance() {
		return instance;
	}
	
	public static DAOClass instance = new DAOClass();
	
	private DAOClass() {};
	
	private ExtractResultSet extract = new ExtractResultSet();
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public int deleteBoardDAO(Connection conn, String BoardName) throws SQLException, IOException{
		String sql = "DROP TABLE " + BoardName;
		int isSuccess = 0;
		try {
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			isSuccess = pstmt.executeUpdate();
			if(isSuccess != 0) {
				conn.commit();
			}else {
				conn.rollback();
			}
			return isSuccess;
		}finally {
			CloseClass.close(pstmt);
		}
	}
	
	public List<BoardVO> getAllBoardNameDAO(Connection conn) throws SQLException, IOException{
		List<BoardVO> ls = new ArrayList<>();
		String sql1 = "USE study";
		String sql2 = "show tables";
		try {
			pstmt = conn.prepareStatement(sql1);
			pstmt.executeUpdate();
			pstmt = conn.prepareStatement(sql2);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				do {
					ls.add(extract.extractBoardVO(rs));
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
	
	public int createBoardDAO(Connection conn, BoardVO vo) throws SQLException, IOException{
		int isSuccess = 0;
		String sql = "CREATE TABLE " + vo.getBoardName() + "("
				+ "GUEST_ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL, "
				+ "PASSWORD VARCHAR(20) NOT NULL, "
						+ "GUEST_NAME " + vo.getNameType() + " NOT NULL, "
								+ "MESSAGE TEXT NOT NULL)engine innoDB default character set utf8";
		
		try {
			pstmt = conn.prepareStatement(sql);
			isSuccess = pstmt.executeUpdate();
			return isSuccess;
		}finally {
			CloseClass.close(pstmt);
		}
	}
	
	public LoginVO getMemberInfoDAO(Connection conn, String memberid) throws SQLException, IOException{
		String sql = "SELECT * FROM member WHERE MEMBER_ID = ?";
		LoginVO loginVo = new LoginVO();
		try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memberid);
		rs = pstmt.executeQuery();
		if(rs.next()) {
		loginVo = extract.extractLoginVOClass(rs);
		}else {
			loginVo.setNull();
		}
		return loginVo;
		
		}finally {
			CloseClass.close(rs);
			CloseClass.close(pstmt);
		}
	}
	
	public void primaryKeyReset(Connection conn, String nowBoardName) throws SQLException, IOException{
		int issuccess = 0;
		String sql1 = "ALTER TABLE "+ nowBoardName +" AUTO_INCREMENT=1";
		String sql2 = "SET @COUNT = 0";
		String sql3 = "UPDATE "+ nowBoardName +" SET GUEST_ID = @COUNT:=@COUNT+1";
		try {
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql1);
			issuccess = pstmt.executeUpdate();
			pstmt = conn.prepareStatement(sql2);
			issuccess = pstmt.executeUpdate();
			pstmt = conn.prepareStatement(sql3);
			issuccess = pstmt.executeUpdate();
			if(issuccess!=0) {
				conn.commit();
			}else {
				conn.rollback();
			}
		}finally {
			CloseClass.close(pstmt);
		}
	}
	
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
	
	public int deleteRecordDAO(Connection conn, int guestid, String boardName) throws SQLException, IOException{
		String sql = "DELETE FROM "+ boardName +" WHERE GUEST_ID = ?";
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
	
	public int insertRecordDAO(Connection conn, VOClass vo, String boardName) throws SQLException, IOException{
		String sql = "INSERT INTO "+ boardName +" (PASSWORD, GUEST_NAME, MESSAGE) VALUES (?, ?, ?)";
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
	
	public List<VOClass> getAllRecordsDAO(Connection conn, String nowBoardName) throws SQLException, IOException {
		String sql = "SELECT * FROM " + nowBoardName;
		List<VOClass> ls = new ArrayList<VOClass>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				do {
				ls.add(extract.extractVOClass(rs));
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
	
	public VOClass getOneRecordDAO(Connection conn, int guestid, String nowBoardName) throws SQLException, IOException{
		String sql = "SELECT * FROM " + nowBoardName + " WHERE GUEST_ID = ?";
		VOClass vo = new VOClass();
		try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, guestid);
		rs = pstmt.executeQuery();
		if(rs.next()) {
		vo = extract.extractVOClass(rs);
		}else {
			vo.setNull();
		}
		return vo;
		
		}finally {
			CloseClass.close(rs);
			CloseClass.close(pstmt);
		}
	}

}
