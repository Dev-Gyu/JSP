<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
	String memberID = request.getParameter("memberID");
%>
<html>
<head>
<meta charset="UTF-8">
<title>멤버 조회 페이지</title>
</head>
<body>
<%
	
	Class.forName("com.mysql.cj.jdbc.Driver");

	String jdbcDriver = "jdbc:mysql://localhost:3306/chap14?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
	String dbID = "jspexam";
	String dbpw = "jsppw";
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String sql = "select * from MEMBER where MEMBERID = '" + memberID +"'";
	try{
		conn = DriverManager.getConnection(jdbcDriver, dbID, dbpw);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		if(rs.next()){
			%>
<table border="1">
	<tr><td>memberID</td><td><%=rs.getString("MEMBERID") %></td></tr>
	<tr><td>password</td><td><%=rs.getString("PASSWORD") %></td></tr>
	<tr><td>name</td><td><%=rs.getString("NAME") %></td></tr>
	<tr><td>email</td><td><%=rs.getString("EMAIL") %></td></tr>
</table>
<%
	}else{	%> 
	<h2>해당 멤버아이디가 DB에 없습니다.</h2><%
	}
	}catch(SQLException e){	%>
		예외발생! = <%= e.getMessage() %>
<% 
	}finally{
		if(rs != null) try{rs.close();}catch(SQLException e){}
		if(stmt != null) try{stmt.close();}catch(SQLException e){}
		if(conn != null) try{conn.close();}catch(SQLException e){}
	}
%>
	<h3>출력 완료</h3><p>

</body>
</html>