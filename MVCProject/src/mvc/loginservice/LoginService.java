package mvc.loginservice;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;

import mvc.close.CloseClass;
import mvc.connection.ConnectionClass;
import mvc.dao.DAOClass;
import mvc.loginvo.LoginVO;

public class LoginService {
	public static LoginService instance = new LoginService();
	public static LoginService getInstance() {
		return instance;
	}
	private LoginService() {}
	
	public LoginVO getMemberInfo(String memberid) throws IOException, SQLException{
		LoginVO loginVO = new LoginVO();
		DAOClass dao = DAOClass.getInstance();
		Connection conn = null;
		try {
		conn = ConnectionClass.getConnection();
		loginVO = dao.getMemberInfoDAO(conn, memberid);
		return loginVO;
		}finally {
			CloseClass.close(conn);
		}
	}

}
