<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<ol>
<%
	Cookie[] cookie = request.getCookies();
	for(Cookie c : cookie){
		%>
		<li><%=c.getName() %>--><%=c.getValue() %></li>
		<%
	}
%>
</ol>
</body>
</html>