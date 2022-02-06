<%@page import="com.bitcamp.board.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bitcamp.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#boardList li{
		float:left; width:10%; height:40px; line-height:40px; border-bottom:1px solid gray;
	}
	#boardList li:nth-child(5n+2){width:60%; }
</style>
</head>
<body>
<%@ include file="../04_include/top.jspf" %>
<div class="container">
	<h1>게시판 목록</h1>
	<% //System.out.println(session.getAttribute("logId")); //확인용%>
	
	<%
		if(session.getAttribute("logId")!=null && !session.getAttribute("logId").equals("")) {
			%>
			<a href="boardWrite.jsp">글쓰기</a>
			<%
		}
	
	//DB조회
	BoardDAO dao = new BoardDAO();
	List<BoardVO> list = dao.boardAllRecord();
	
	%>
	
	<ul id="boardList">
		<li>번호</li>
		<li>제목</li>
		<li>작성자</li>
		<li>등록일</li>
		<li>조회수</li>
		
		<%
			for(int i=0;i<list.size();i++) {
				BoardVO vo=list.get(i);
				
		%>
			<li><%=vo.getNo() %></li>
			<li><a href="<%=request.getContextPath()%>/board/boardView.jsp?no=<%=vo.getNo() %>"><%=vo.getSubject() %></a></li>
			<li><%=vo.getUserid() %></li>
			<li><%=vo.getWritedate() %></li>
			<li><%=vo.getHit() %></li>
		<% } %>
		
	</ul>
	
</div>
</body>
</html>