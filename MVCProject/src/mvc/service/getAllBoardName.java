package mvc.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import mvc.close.CloseClass;
import mvc.connection.ConnectionClass;
import mvc.dao.DAOClass;
import mvc.vo.BoardVO;

public class getAllBoardName {
	
	public static getAllBoardName instance = new getAllBoardName();
	public static getAllBoardName getInstance() {
		return instance;
	}
	
	private getAllBoardName() {}
	DAOClass dao = DAOClass.getInstance();
	
	public List<BoardVO> getAllBoardName() throws SQLException, IOException{
		Connection conn = null;
		try {
			 conn = ConnectionClass.getConnection();
			 return dao.getAllBoardNameDAO(conn);
			 
		}finally {
			CloseClass.close(conn);
		}
	}

}
