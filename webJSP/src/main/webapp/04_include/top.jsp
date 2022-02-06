<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#top{height:100px; background-color:pink;}
</style>
</head>
<body>
<div id="top">
	<%
		int n=100;
		String name = "홍길동";
	%>
	<%=n %>, <%=name %>
</div>
</body>
</html>