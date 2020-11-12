<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
	String memberID = request.getParameter("memberID");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	String jdbcDriver = "jdbc:mysql://localhost:3306/chap14?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
	String dbID = "jspexam";
	String dbpw = "jsppw";
	
	String sql = "INSERT INTO MEMBER (MEMBERID, PASSWORD, NAME, EMAIL) VALUES (?, ?, ?, ?)";
	Connection conn = null;
	PreparedStatement pstmt = null;
%>
<html>
<head>
<meta charset="UTF-8">
<title>입력 결과 페이지</title>
</head>
<body>
<H2>입력 값</H2>
MEMBERID: <%= memberID %><br>
PASSWORD: <%= password %><br>
NAME: <%=name %><br>
EMAIL: <%=email %><br>
<hr>
<%
	int insertCount = 0;
	try{
		conn = DriverManager.getConnection(jdbcDriver, dbID, dbpw);
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memberID);
		pstmt.setString(2, password);
		pstmt.setString(3, name);
		pstmt.setString(4, email);
		insertCount = pstmt.executeUpdate();
	}catch(SQLException e){
		e.getMessage();
	}finally{
		if(pstmt != null)try{pstmt.close();}catch(SQLException e){}
		if(conn != null)try{pstmt.close();}catch(SQLException e){}
	}
	if(insertCount == 1){
%>
	<h2>정보 입력에 성공하였습니다.	</h2>
	<%}else{ %>
	<h2>정보 입력에 실패하였습니다.</h2>
	<%} %><p>
	<button type="button" onclick="location.href='/chap14/viewMemberList.jsp'">목록 페이지로 이동</button>

</body>
</html>