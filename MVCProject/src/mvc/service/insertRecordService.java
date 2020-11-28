package mvc.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import mvc.close.CloseClass;
import mvc.connection.ConnectionClass;
import mvc.dao.DAOClass;
import mvc.vo.VOClass;

public class insertRecordService {
	
	public static insertRecordService instance = new insertRecordService();
	
	public static insertRecordService getInstance() {
		return instance;
	}
	
	private insertRecordService() {}
	
	private DAOClass dao = DAOClass.getInstance();
	
	public int insertRecord(VOClass vo, int isSuccess, String boardName) throws SQLException, IOException{
		Connection conn = null;
		try {
			conn = ConnectionClass.getConnection();
			isSuccess = dao.insertRecordDAO(conn, vo, boardName);
			return isSuccess;
			}finally {
				CloseClass.close(conn);
			}
		
	}

}
