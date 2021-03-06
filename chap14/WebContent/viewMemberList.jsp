<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
</head>
<body>
MEMBER 테이블의 내용
<table width="100%" border="1">
<tr>
	<td>아이디</td>
	<td>비밀번호</td>
	<td>이름</td>
	<td>이메일</td>
</tr>
<%
	//1. JDBC드라이버 로딩
	Class.forName("com.mysql.cj.jdbc.Driver");

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try{
		String jdbcDriver = "jdbc:mysql://localhost:3306/chap14?serverTimezone=UTC&" + "useUnicode=true&characterEncoding=utf8";
		String dbUser = "jspexam";
		String dbPass = "jsppw";
		
		String query = "select * from MEMBER order by MEMBERID";
		//2. 데이터베이스 커넥션 생성
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		//3. Statement 생성
		stmt = conn.createStatement();
		
		//4. Query 실행
		rs = stmt.executeQuery(query);
		
		//5. 쿼리 실행 결과 출력
		while(rs.next()){
			%>
<tr>
	<td><%=rs.getString("MEMBERID") %></td>
	<td><%=rs.getString("PASSWORD") %></td>
	<td><%=rs.getString("NAME") %></td>
	<td><%=rs.getString("EMAIL") %></td>
</tr>
<%
		}
		}catch(SQLException e){
			out.println(e.getMessage());
	}finally{
		//6. 사용한 Statement종료
		if(rs != null) try{rs.close();}catch(SQLException e){}
		if(stmt != null) try{stmt.close();}catch(SQLException e){}
		
		//7. 커넥션 종료
		if(conn != null) try{conn.close();}catch(SQLException e){}
	}
%>
</table>
<p>
<button type="button" onclick="location.href='update/updateForm.jsp'">수정 페이지로 이동</button>
<button type="button" onclick="location.href='/chap14/insert/insertForm.jsp'">정보 입력 페이지로 이동</button>
</body>
</html>