<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- top.jsp 조각 파일 include -->
	<%@ include file="top.jspf" %>
	<div style="height:500px; background-color:#eee">
		<%=num %>, <%=username %>
	</div>
	
	<%@ include file="foot.jspf" %>
</body>
</html>