package mvc.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteBoardHandler implements HandlerInterface {
	public String process(HttpServletRequest request, HttpServletResponse response) {
		return "/DeleteBoard.jsp";
	}

}
