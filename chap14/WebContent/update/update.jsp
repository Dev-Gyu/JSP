<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
	String memberID = request.getParameter("memberID");
	String name = request.getParameter("name");
	
	int updateCount = 0;

	Class.forName("com.mysql.cj.jdbc.Driver");
	String jdbcDriver = "jdbc:mysql://localhost:3306/chap14?serverTimezone=UTC&unicode=true&characterEncoding=utf8";
	String dbID = "jspexam";
	String dbPW = "jsppw";
	
	Connection conn = null;
	Statement stmt = null;
	
	try{
	String sql = "UPDATE MEMBER SET NAME='" + name +"' WHERE MEMBERID='" + memberID +"'";
	conn = DriverManager.getConnection(jdbcDriver, dbID, dbPW);
	stmt = conn.createStatement();
	updateCount = stmt.executeUpdate(sql);
	}catch(SQLException e){
		out.println(e.getMessage());
	}finally{
		if(stmt != null) try {stmt.close();}catch(SQLException e){}
		if(conn != null) try {conn.close();}catch(SQLException e){}
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>수정 결과</title>
</head>
<body>
<% if(updateCount >0){ %>
<%= memberID %>의 이름을 <%= name %>으로 변경<p>
<button type="button" onclick="location.href='/chap14/viewMemberList.jsp'">멤버 리스트로 이동</button>
<% }else{ %>
<%= memberID %> ID가 존재하지 않음
<%} %>
</body>
</html>