<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	document.cookie = "food=apple;path=/;expires=2022";
	document.cookie = 'notice=news';
</script>
<%
	// jsp에서 쿠기 생성하기
	Cookie c = new Cookie("username", "김연경"); // 변수, 값
	c.setMaxAge(60*60); // 쿠키의 생명주기 (초 단위) 60*60 = 1시간
	
	response.addCookie(c);	// client 컴퓨터에 쿠키를 저장한다.
	
%>
</head>
<body>
<input type="button" value="쿠키 확인하기" onclick="location.href='<%=request.getContextPath()%>/02_cookie/cookieView.jsp'"/>
</body>
</html>