package mvc.extract;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import mvc.loginvo.LoginVO;
import mvc.vo.BoardVO;
import mvc.vo.VOClass;

public class ExtractResultSet {
	
	public BoardVO extractBoardVO(ResultSet rs) throws SQLException, IOException{
		BoardVO vo = new BoardVO();
		vo.setBoardName(rs.getString("tables_in_study"));
		vo.setNameType(null);
		return vo;
	}
	public VOClass extractVOClass(ResultSet rs) throws SQLException, IOException {
		VOClass vo = new VOClass();
		vo.setId(rs.getInt("guest_id"));
		vo.setPassword(rs.getString("password"));
		vo.setName(rs.getString("guest_name"));
		vo.setMessage(rs.getString("message"));
		return vo;
	}
	
	public LoginVO extractLoginVOClass(ResultSet rs) throws SQLException, IOException {
		LoginVO loginVO = new LoginVO();
		loginVO.setMemberId(rs.getString("member_id"));
		loginVO.setMemberPw(rs.getString("member_pw"));
		return loginVO;
	}
}
