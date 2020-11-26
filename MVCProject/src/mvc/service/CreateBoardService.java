package mvc.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import mvc.close.CloseClass;
import mvc.connection.ConnectionClass;
import mvc.dao.DAOClass;
import mvc.vo.BoardVO;

public class CreateBoardService {
	
	public static CreateBoardService instance = new CreateBoardService();
	
	public static CreateBoardService getInstance() {
		return instance;
	}
	
	private CreateBoardService() {}
	
	private DAOClass dao = DAOClass.getInstance();
	
	public int createBoard(BoardVO vo) throws SQLException, IOException{
		int isSuccess = 0;
		Connection conn = null;
		try {
		conn = ConnectionClass.getConnection();
		isSuccess = dao.createBoardDAO(conn, vo);
		return isSuccess;
		}finally {
			CloseClass.close(conn);
		}
	}
}
