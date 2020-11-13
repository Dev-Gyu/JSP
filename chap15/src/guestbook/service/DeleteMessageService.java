package guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;

import guestbook.dao.MessageDao;
import guestbook.model.Message;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class DeleteMessageService {
	private static DeleteMessageService deleteMessageService = new DeleteMessageService();
	
	public static DeleteMessageService getDeleteMessageService() {
		return deleteMessageService;
	}
	
	private DeleteMessageService() {}
	
	public void delete(int messageid, String password) {
		MessageDao messageDao = MessageDao.getInstance();
		Connection conn = null;
		Message message = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			message = messageDao.select(conn, messageid);
			if(message.equals(null)) {
				throw new ServiceException("해당 messageid에 메시지가 존재하지 않습니다. messageid = " + messageid);
			}else {
				if(!message.matchPassword(password)) {
					throw new ServiceException("비밀번호가 일치하지 않습니다");
				}
				messageDao.delete(conn, messageid);
				conn.commit();
			}
			
		}catch(SQLException e) {
			JdbcUtil.rollback(conn);
			throw new ServiceException("게시글 삭제에 에러가 발생하였습니다"+e.getMessage(), e);
		}catch(ServiceException e) {
			JdbcUtil.rollback(conn);
			throw e;
		}finally {
			JdbcUtil.close(conn);
		}
	}

}
