<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//client 측에서 보낸 데이터를 서버로 가져오기
	
	//양 방향의 username 변수는 다른거임.
	String username = request.getParameter("username");
	String tel=request.getParameter("tel");
	String addr = request.getParameter("addr");
	//숫자를 넘겨도 String으로 받음
	
	System.out.println("username="+username);
%>

이름: <%= username%><br/>
연락처 : <%=tel%><br/>
주소: <%=addr%>
