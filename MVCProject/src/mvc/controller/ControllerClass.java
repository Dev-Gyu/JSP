package mvc.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.handler.HandlerInterface;

public class ControllerClass extends HttpServlet{
	
	private Map<String, HandlerInterface> commandHandlerMap = new HashMap<>();
	
	@Override
	public void init() throws ServletException{
		String commandProperties = getInitParameter("commandProperties");
		Properties prop = new Properties();
		String propertiesPath = getServletContext().getRealPath(commandProperties);
		try(FileInputStream fis = new FileInputStream(propertiesPath)){
			prop.load(fis);
		}catch(Exception e) {
			throw new ServletException(e.getMessage() + "init() method실행 중 에러발생", e);
		}
		Iterator iter = prop.keySet().iterator();
		while(iter.hasNext()) {
			String command = (String) iter.next();
			String path = (String)prop.get(command);
			try {
				Class<?> instance = Class.forName(path);
				HandlerInterface commandHandler = (HandlerInterface) instance.newInstance();
				commandHandlerMap.put(command, commandHandler);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) {
		process(request, response);
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) {
		process(request, response);
	}
	
	private void process(HttpServletRequest request, HttpServletResponse response) {
		String command = null;
		if(request.getParameter("cmd") == null) {
			command = "select";
		}else {
			command = request.getParameter("cmd");
		}
			HandlerInterface handler = commandHandlerMap.get(command);
			String viewPage = handler.process(request, response);
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			try {
				dispatcher.forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				throw new RuntimeException(e.getMessage(),e);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				throw new RuntimeException(e.getMessage(),e);
			}
	}

}
