package guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import guestbook.close.CloseClass;
import guestbook.dao.DAOClass;
import guestbook.dbcp.ConnectionProvider;
import guestbook.exception.GetMessageException;
import guestbook.vo.VOClass;

public class GetMessageService {
	private static GetMessageService instance = new GetMessageService();
	
	private GetMessageService() {}
	
	public static GetMessageService getInstance() {
		return instance;
	}
	
	public List<VOClass> getAllVoclass() throws SQLException{
		DAOClass dao = DAOClass.getInstance();
		List<VOClass> ls = new ArrayList<>();
		Connection conn = null;
		boolean success = false;
		try {
			conn = ConnectionProvider.getConnection();
			ls = dao.selectall(conn);
			if(!ls.isEmpty()) {
			success = true;
			}
			
		}catch(GetMessageException ex) {
			throw new GetMessageException("메세지 가져오는 중 에러 발생"+ex.getMessage(), ex);
		}finally{
			CloseClass.close(conn);
		}
		if(success) {
			return ls;
		}else {
			return Collections.emptyList();
		}
	}
	
	public VOClass getOneVoclass(int guestid) throws SQLException{
		DAOClass dao = DAOClass.getInstance();
		VOClass vo = null;
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			vo = dao.select(conn, guestid);
			if(!vo.equals(null)) {
				return vo;
			}else {
				return null;
			}
		}finally {
			CloseClass.close(conn);
		}
		
	}

}
