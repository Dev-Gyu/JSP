package mvc.filter;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvc.loginservice.LoginService;
import mvc.loginvo.LoginVO;

public class FilterClass implements Filter {
	private String isLoginOkay = null;
	
	@Override
	public void init(FilterConfig Config) throws ServletException{
	
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException{
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		String isLoginOkay = (String)session.getAttribute("isLoginOkay");
		System.out.println(isLoginOkay);
		System.out.println(session.getAttribute("cmd"));
		System.out.println(session.getAttribute("guestid"));
		
		if(isLoginOkay == null) {
			res.sendRedirect("loginform.jsp");
			return;
		}
		
		LoginService loginService = LoginService.getInstance();
		try {
			LoginVO loginVO = loginService.getMemberInfo((String)session.getAttribute("memberid"));
			String memberid = loginVO.getMemberId();
			String memberpw = loginVO.getMemberPw();
			String inputid = request.getParameter("inputid");
			String inputpw = request.getParameter("inputpw");
			if(memberpw.equals(inputpw) && memberid.equals(inputid)) {
				isLoginOkay = "yes";
			}else {
				isLoginOkay = "no";
			}
			session.setAttribute("isLoginOkay", isLoginOkay);
			
		} catch (IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		chain.doFilter(request, response);
		
	}
	
	@Override
	public void destroy() {}

}
