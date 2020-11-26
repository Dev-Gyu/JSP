package mvc.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CreateBoardHandler implements HandlerInterface {
	
	public String process(HttpServletRequest request, HttpServletResponse response) {
		return "/createboardform.jsp";
	}
	

}
