<!-- 지시부 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!//선언부
	
	//메소드 정의
	public int sum(int a, int b) {
		return a+b;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	img{width:200px; height:200px;}
</style>
<script>
	document.write('자바스크립트!!!');
</script>
</head>
<body>
<%@ include file="04_include/top.jspf" %>
<br/>
<%=session.getId() %>
<hr/>
   <!-- 로그인 확인
   로그인 상태 : 고구마 로그아웃
   로그인안된경우 : 로그인
 -->
   <%
   // logId, logName   session : 임시보관소
   if (session.getAttribute("logId") != null && !session.getAttribute("logId").equals("")) { // 로그인 상태
	   %>
	   <%=session.getAttribute("logName")%>님,
	   <a href="<%=request.getContextPath()%>/login/logout.jsp">로그아웃</a>
	   <%			
	} else { // 로그인 안 한 상태
	   %>
	   <a href="<%=request.getContextPath()%>/login/loginform.html">로그인</a>
	   <%   
   } %>

<%=session.getId() %>

<h1>jsp 첫번째 페이지</h1>
<%	//스크립트릿

	//일반 자바처럼 작성하면 됨.
	int a=100;
	String name = "홍길동";
	
	a=a*2;

	out.println("a="+a);
	out.println("<img src='img/com.jpg'/>");
	
	System.out.println("sum(56,43)="+sum(56,43));
	//system출력은 콘솔 출력.
	
	out.println("sum(123,457)="+sum(123,457));
	//ln으로 출력해도 web화면에선 <br/>없으면 다음줄로 안 넘어감
	
	for(int i=1; i<10; i++) {
		out.println(i);
	}
%>
<hr/>
<h1>변수, 간단한 수식, 메소드 호출하여 결과를 처리할 때</h1>
<!-- 
a=< %
out.println(a);
%>
하나를 출력하기 위해 너무 길어...
그래서 간단하게 아래처럼! 단 ;은 쓰지 않음
< %= 여기에 출력할 값 % >
 -->
 a=<%=a%> <br/>
 a=<%=a+10 %><br/>
 sum=<%=sum(5,124) %>
</body>
</html>