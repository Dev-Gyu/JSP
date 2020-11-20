package mvc.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import mvc.close.CloseClass;
import mvc.connection.ConnectionClass;
import mvc.dao.DAOClass;
import mvc.vo.VOClass;

public class updateRecordService {
	public static updateRecordService instance = new updateRecordService();
	
	public static updateRecordService getInstance() {
		return instance;
	}
	
	private updateRecordService() {}
	
	private DAOClass dao = DAOClass.getInstance();
	
	public int updateRecord(VOClass vo) throws SQLException, IOException{
		Connection conn = null;
		int isSuccess = 0;
		try {
			conn = ConnectionClass.getConnection();
			isSuccess = dao.updateRecordDAO(conn, vo);
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
