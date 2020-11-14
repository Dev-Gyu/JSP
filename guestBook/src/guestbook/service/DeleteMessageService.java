package guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;

import guestbook.close.CloseClass;
import guestbook.dao.DAOClass;
import guestbook.dbcp.ConnectionProvider;

public class DeleteMessageService {
	//싱글톤 적용
	private static DeleteMessageService deleteService = new DeleteMessageService();
	public static DeleteMessageService getDeleteService() {
		return deleteService;
	}
	private DeleteMessageService() {}
	
	public void messageDelete(int guestid) {
		Connection conn = null;
		DAOClass dao = DAOClass.getInstance();
		try {
			conn = ConnectionProvider.getConnection();
			dao.delete(conn, guestid);
		}catch(SQLException e) {
			throw new RuntimeException("DeleteMessageService클래스 동작중 에러 발생" + e.getMessage(), e);
		}finally {
			CloseClass.close(conn);
		}
	}

}
