package guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;

import guestbook.close.CloseClass;
import guestbook.dao.DAOClass;
import guestbook.dbcp.ConnectionProvider;
import guestbook.exception.WriteServiceException;
import guestbook.vo.VOClass;

public class WriteMessageService {
	private static WriteMessageService instance = new WriteMessageService();
	
	private WriteMessageService() {}
	
	public static WriteMessageService getInstance() {
		return instance;
	}
	
	DAOClass dao = DAOClass.getInstance();
	
	public void write(VOClass vo) throws SQLException {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			dao.insert(conn, vo);
		}catch(SQLException e) {
			throw new SQLException("SQL에러발생"+e.getMessage(), e);
		}
		catch(WriteServiceException e) {
			throw new WriteServiceException("메세지 입력중 에러발생"+e.getMessage(), e);
		}
		finally {
			CloseClass.close(conn);
		}
		
	}
}
