<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%
	String idValue = request.getParameter("id");

	String jdbcDriver = "jdbc:mysql://localhost:3306/chap14?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
	String dbID = "jspexam";
	String dbpw = "jsppw";
	
	String item = "insert into ITEM (ITEM_ID, NAME) VALUES (?, ?)";
	String itemDetail = "insert into ITEM_DETAIL (ITEM_ID, DETAIL) VALUES (?, ?)";
	Connection conn = null;
	PreparedStatement pstmtItem = null;
	PreparedStatement pstmtItemDetail = null;
	
	Throwable occuredException = null;
	
	try{
		int id = Integer.parseInt(idValue);
		
		conn = DriverManager.getConnection(jdbcDriver, dbID, dbpw);
		conn.setAutoCommit(false);
		pstmtItem = conn.prepareStatement(item);
		pstmtItem.setInt(1, id);
		pstmtItem.setString(2, "상품이름 " + id);
		pstmtItem.executeUpdate();
		
		pstmtItemDetail = conn.prepareStatement(itemDetail);
		pstmtItemDetail.setInt(1, id);
		pstmtItemDetail.setString(2, "상품 설명 " + id);
		pstmtItemDetail.executeUpdate();
		
		if(request.getParameter("error") != null){
			throw new Exception("의도적 익셉션 발생");
		}
		
		conn.commit();
	}catch(Throwable e){
		if(conn != null){
			try{
			conn.rollback();
			}catch(SQLException ex){}
		}
		occuredException = e;
	}finally{
		if(pstmtItemDetail != null)
			try{pstmtItemDetail.close();}catch(SQLException e){}
		if(pstmtItem != null)
			try{pstmtItem.close();}catch(SQLException e){}
		if(conn != null)
			try{conn.close();}catch(SQLException e){}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ITEM 값 입력</title>
</head>
<body>
<% if(occuredException != null){%>
<h2>에러가 발생하였음 <%= occuredException.getMessage() %></h2>
<% }else{ %>
<h2>아이템 값 입력 완료</h2>
<%} %>

</body>
</html>