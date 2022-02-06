<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %> <!-- 에러가 발생하면 나타나는 페이지, true일 때 아래 exception 활성화됨 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
에러메세지:
<%
out.println(exception.getMessage());


%>

<hr/>
<img src="<%=request.getContextPath()%>/img/errorImg.png"/>
</body>
</html>