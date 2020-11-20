package mvc.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import mvc.close.CloseClass;
import mvc.connection.ConnectionClass;
import mvc.dao.DAOClass;

public class deleteRecordService {
	
	public static deleteRecordService getInstance() {
		return instance;
	}
	
	public static deleteRecordService instance = new deleteRecordService();
	
	private deleteRecordService() {}
	
	private DAOClass dao = DAOClass.getInstance();
	
	public int deleteRecord(int guestid) throws SQLException, IOException{
		Connection conn = null;
		int isSuccess = 0;
		try {
			conn = ConnectionClass.getConnection();
			isSuccess = dao.deleteRecordDAO(conn, guestid);
			System.out.println(isSuccess);
			if(isSuccess != 0) {
				return isSuccess;
			}else {
				return 0;
			}
		}finally {
			CloseClass.close(conn);
		}
	}

}
