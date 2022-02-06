<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- tag library를 사용하기 위해서 지시부를 정의해야한다. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

</head>
<body>
<h1>jstl(Jsp Standard Tag Library)</h1>
<p style="background-color:#ddd">
	https://tomcat.apache.org/taglibs/standard 에서 라이브러리 다운로드<br/>
	
	1. 압축 푼 다음 jstl.jar와 standard.jar를 이클립스의 /WEB-INF/lib 폴더에 복사<br/>
	2. 지시부에 태그를 추가한다.
</p>
<ol>
	<li><a href="01_setTag.jsp">set Tag : 변수 선언 및 삭제</a></li>
	<li><a href="02_ifTag.jsp?name=이순신&age=32&userid=goguma">if Tag : 조건문</a></li>
	<li><a href="03_forEachTag.jsp">forEach Tag : 반복문</a></li>
</ol>
</body>
</html>