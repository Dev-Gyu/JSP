package mvc.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class deleteRecordHandler implements CommandHandler{
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		return "/insertPassword?guestid="+request.getParameter("guestid");
	}
}
