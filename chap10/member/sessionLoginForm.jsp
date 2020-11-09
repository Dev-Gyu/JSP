<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>로그인 정보 입력 화면</title>
</head>
<body>
<form name="form1" method=POST action="<%=request.getContextPath()%>/member/sessionLogin.jsp">
아이디 = <input type="text" name="id">
비밀번호 = <input type="text" name="password">
<input type="submit" value="제출">
<input type="reset" value="취소">
</form>
</body>
</html>