package mvc.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface HandlerInterface{
	public String process(HttpServletRequest request, HttpServletResponse response);

}
