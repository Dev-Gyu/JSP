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

import mvc.handler.CommandHandler;

public class ControllerClass extends HttpServlet{
	
	private Map<String, CommandHandler> CommandHandlerMap = new HashMap<>();
	@Override
	public void init() throws ServletException {
		String initProperties = getInitParameter("initProperties");
		Properties prop = new Properties();
		String initPropertiesPath = getServletContext().getRealPath(initProperties);
		try(FileInputStream fis =  new FileInputStream(initPropertiesPath)) {
			prop.load(fis);
		}catch(IOException e) {
			throw new ServletException(e);
		}
		Iterator iter = prop.keySet().iterator();
		while(iter.hasNext()) {
			String command = (String)iter.next();
			String commandClass = prop.getProperty(command);
			try {
				Class<?> instance = Class.forName(commandClass);
				CommandHandler handler = (CommandHandler) instance.newInstance();
				CommandHandlerMap.put(command, handler);
			}catch(ClassNotFoundException | InstantiationException | IllegalAccessException e) {
				throw new ServletException(e.getMessage(), e);
			}
		}
	}
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		process(request, response);
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		process(request, response);
	}
	
	public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String command = request.getParameter("cmd");
		if(command == null) {
			command = "select";
		}
		CommandHandler handler = CommandHandlerMap.get(command);
		String viewPagePath = null;
		System.out.println(command);
		try {
		viewPagePath = handler.process(request, response);
		}catch(Exception e) {
			throw new ServletException(e);
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPagePath);
		dispatcher.forward(request, response);
	}

}
