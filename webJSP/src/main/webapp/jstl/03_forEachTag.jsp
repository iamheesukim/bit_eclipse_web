<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bitcamp.board.BoardVO"%>
<%@page import="java.util.List"%>
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
<h1>forEach : 반복문</h1>
<c:set var="dan" value="${8 }"/>

<c:forEach var="i" begin="2" end="9" step="1">
<!-- step 1이면 생략 가능 -->
	${dan } * ${i } = ${dan*i }<br/>
	<!-- dan이 8이므로 8단 출력 -->
</c:forEach>
<hr/>

<h1>배열 데이터를 반복시키기</h1>
<c:set var="arr" value="<%=new int[]{56,47,52,5,68,47,56,65} %>"/>
<ol>
<c:forEach var="data" items="${arr }">
	<li>${data }</li>
</c:forEach>
</ol>

<h1>컬렉션(List)를 이용한 반복문</h1>
<%
	List<BoardVO> list = new ArrayList<BoardVO>();
	list.add(new BoardVO(100,"jstl 반복문","goguma"));
	list.add(new BoardVO(200,"jstl 반복문2","goguma2"));
	list.add(new BoardVO(300,"jstl 반복문3","goguma3"));
	list.add(new BoardVO(400,"jstl 반복문4","goguma4"));
%>
<c:set var="board" value="<%=list %>"/>
<c:forEach var="v" items="${board }">
	[ ${v.no}, ${v.subject}, ${v.userid} ]<br/>
</c:forEach>

<h1>컬렉션(Map)을 이용한 반복문</h1>
<%
	HashMap<String, String> map = new HashMap<String, String>();
	map.put("홍길동","서울시 마포구");
	map.put("이순신","서울시 서대문구");
	map.put("세종대왕","서울시 중구");
%>
<c:set var="m" value="<%=map %>"/>
<c:forEach var="addr" items="${m }">
	[ key=${addr.key } / value=${addr.value } ]<br/>
</c:forEach>
</body>
</html>