<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%!
   public Connection getConn(){
      Connection conn = null;
      
      try{
         Class.forName("oracle.jdbc.driver.OracleDriver");
         String url = "jdbc:oracle:thin:@localhost:1521:xe";
         String dbId = "c##scott";
         String dbPwd = "tiger";
         conn = DriverManager.getConnection(url, dbId, dbPwd);
      }catch(Exception e){
         e.printStackTrace();
      }
      return conn;
   }

%>

<!-- 로그인 -->
<%
   String userid = request.getParameter("userid");
   String userpwd = request.getParameter("userpwd");
   
   // 1. 드라이브로딩
   
   // 2. DB연결
   Connection conn = getConn();
   
   // 3. Statement 만들기
   
   String sql = "select userid, username from register where userid=? and userpwd=?";
   PreparedStatement pstmt = conn.prepareStatement(sql);
   pstmt.setString(1, userid);
   pstmt.setString(2, userpwd);
   
   ResultSet rs = pstmt.executeQuery();
   
	// 4. 실행
	/*
   if(rs.next()){ // 로그인 성공
      //session에 로그인한 아이디, 이름을 저장하기 (기록)
      session.setAttribute("logId", rs.getString(1)); //변수, 값 // 그냥 userid 넣어도 될 듯?
      session.setAttribute("logName", rs.getString(2));
      
      // response 객체 이용하여 홈페이지로 이동      /webJSP/index.jsp
      //response.sendRedirect(request.getContextPath()+"/");   //      /webJSP/
      response.sendRedirect(request.getContextPath()+"/index.jsp");//      /webJSP/index.jsp
      
   } else{ // 로그인 실패
      response.sendRedirect(request.getContextPath()+"/login/loginform.html");
   }
	*/
	%>
	
	<%
	   if(rs.next()){//로그인성공
	      session.setAttribute("logId", rs.getString(1));
	      session.setAttribute("logName",rs.getString(2));
	      %>
	      <script>
	         alert("로그인 성공하였습니다. 홈페이지로 이동합니다.");
	         location.href='<%=request.getContextPath()%>/index.jsp';
	      </script>
	      <%
	   }else{//로그인실패
	      %>
	      <script>
	         alert("로그인 실패하였습니다. 다시 로그인 하세요");
	         history.go(-1);;// history.back();
	      </script>
	      <%
	   }


	%>












