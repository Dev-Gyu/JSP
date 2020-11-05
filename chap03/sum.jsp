<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>1부터10까지의 합</title>
</head>
<body>
<%!
	public int sum(int a, int b) {
		int sum = a + b;
		return sum;
	}
%>

10 + 25의 값은 = <%= sum(10, 25) %> 입니다.
</body>
</html>