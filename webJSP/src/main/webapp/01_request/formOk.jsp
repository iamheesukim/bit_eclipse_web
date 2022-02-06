<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 0831/0901 form.jsp에서 입력하면 여기로 넘어옴 -->

<%@ page import="java.util.Arrays, java.util.Enumeration" %>
<!-- 이런식으로 import를 하면되는데, 자리가 부족하면 선언부를 하나 더 만들어줌 -->
<%
	// post 방식의 전송시, 한글 인코딩 설정한다. (설정 안하면 깨짐)
	request.setCharacterEncoding("UTF-8");

	String userid=request.getParameter("userid");
	String username=request.getParameter("username");
	String gender = request.getParameter("gender"); //name
	
	//관심분야
	String[] inter = request.getParameterValues("inter");
	
	String[] local = request.getParameterValues("local");

	String content = request.getParameter("content");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
아이디:<%=userid %><br/>
이름:<%=username %><br/>
성별:<%=gender %><br/>
관심분야 : <%=Arrays.toString(inter) %><br/>
지역 : <%=Arrays.toString(local) %>
<%=content %>
<hr/>
<h1>request 객체의 메소드</h1>
<ol>
	<li>
	<%
		//폼의 변수 목록을 얻어오기
		Enumeration<String> names = request.getParameterNames();
		while(names.hasMoreElements()) {
			//out.println(names.nextElement()+"<br/>");
			%>
				<%=names.nextElement()+", " %>
			<%
		}
	%>
	</li>
	<li>접속자의 ip정보 : <%=request.getRemoteAddr() %> </li> <!-- ip주소로 들어가기  -->
	<li>인코딩 코드값 : <%=request.getCharacterEncoding() %></li>
	<li>contentType : <%=request.getContentType() %></li>
	<li>전송방식 : <%=request.getMethod() %></li>
	<li>프로토콜 : <%=request.getProtocol() %></li>
	<li>URI : <%=request.getRequestURI() %></li>
	<li>contextPath : <%=request.getContextPath() %>
	<li>서버이름 : <%=request.getServerName() %>
	<li>포트이름 : <%=request.getServerPort() %>
	<li>절대주소 : <%=request.getServletContext().getRealPath("/") %>
	
</ol>

	<img src="<%=request.getContextPath()%>/img/com.jpg"/>

</body>
</html>