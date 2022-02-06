<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h1>로그인폼</h1>
<form method="post" action="<%=request.getContextPath()%>/member/loginOk.do">
	아이디 : <input type="text" name="userid" id="userid"/> <br/>
	비밀번호 : <input type="password" name="userpwd" id="userpwd"/><br/>
	<input type="submit" value="로그인"/>
</form>
