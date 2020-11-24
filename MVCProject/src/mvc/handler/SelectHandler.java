package mvc.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SelectHandler implements HandlerInterface {
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String requestGuestid = request.getParameter("guestid");
		if(requestGuestid == null) {
			return "/view.jsp";
		}else {
			int guestid = Integer.parseInt(requestGuestid);
			return "/insertPassword.jsp?guestid=" + guestid;
		}
		
	}

}
