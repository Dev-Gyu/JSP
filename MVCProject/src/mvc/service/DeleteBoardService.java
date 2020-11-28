package mvc.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import mvc.close.CloseClass;
import mvc.connection.ConnectionClass;
import mvc.dao.DAOClass;
import mvc.vo.BoardVO;

public class DeleteBoardService {
	public static DeleteBoardService getInstance() {
		return instance;
	}
	public static DeleteBoardService instance = new DeleteBoardService();
	
	private DeleteBoardService() {}
	
	private DAOClass dao = DAOClass.getInstance();
	public int deleteBoard(String nowBoardName) throws SQLException, IOException{
		int isSuccess = 0;
		Connection conn = null;
		try {
			conn = ConnectionClass.getConnection();
			isSuccess = dao.deleteBoardDAO(conn, nowBoardName);
			return isSuccess;
		}finally {
			CloseClass.close(conn);
		}
	}

}
