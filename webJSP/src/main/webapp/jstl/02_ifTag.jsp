<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>
<h1>if Tag : 조건문</h1>
<c:set var="n1" value="${100}"/>
<c:set var="n2" value="${50}"/>
<!-- else문은 없음 -->
<c:if test="${n1>n2 }">
	n1은 n2보다 크다.<br/>
	n1=${n1 }<br/>
</c:if>
<!-- else문은 없음 -->

<c:if test="${true }">
	무조건 실행됨<br/>
</c:if>
<hr/>
<h1>jstl에서 request하기</h1>
name = ${param.name }<br/>
age = ${param.age+10 }<br/>
userid = ${param.userid }<br/>
</body>
</html>