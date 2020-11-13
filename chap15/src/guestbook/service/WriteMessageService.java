package guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;

import guestbook.dao.MessageDao;
import guestbook.model.Message;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class WriteMessageService {
	private static WriteMessageService writeMessageService = new WriteMessageService();
	
	public static WriteMessageService getInstance() {
		return writeMessageService;
	}
	
	private WriteMessageService() {}
	
	public void write(Message message) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			MessageDao messageDao = MessageDao.getInstance();
			messageDao.insert(conn, message);
		}catch(SQLException e) {
			throw new ServiceException("입력에 실패 하였습니다" + e.getMessage(), e);
		}finally {
			JdbcUtil.close(conn);
		}
	}

}
