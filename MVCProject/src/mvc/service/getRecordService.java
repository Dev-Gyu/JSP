package mvc.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mvc.close.CloseClass;
import mvc.connection.ConnectionClass;
import mvc.dao.DAOClass;
import mvc.vo.VOClass;

public class getRecordService {
	
	public static getRecordService instance = new getRecordService();
	
	public static getRecordService getInstance() {
		return instance;
	}
	
	private getRecordService() {};
	
	Connection conn = null;
	private DAOClass dao = DAOClass.getInstance();
	
	public List<VOClass> getAllRecords() throws SQLException, IOException{
		try {
			conn = ConnectionClass.getConnection();
			return dao.getAllRecordsDAO(conn);
		}finally {
			CloseClass.close(conn);
		}
	}
	
	public VOClass getOneRecord(int guestid) throws SQLException, IOException{
		VOClass vo = new VOClass();
		try {
		conn = ConnectionClass.getConnection();
		vo = dao.getOneRecordDAO(conn, guestid);
		return vo;
		
		}finally {
			CloseClass.close(conn);
		}
	}

}
