<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${userid==null || userid==''}">
	<c:redirect url="/member/login.do">
	</c:redirect>
</c:if>
<script>
	$(()=> {
		CKEDITOR.replace('content');
	});
</script>
<h1>자료실 글쓰기 폼</h1>
<!-- 											파일이 첨부될 때 반드시 enctype 속성 필요 -->
<form method="post" action="/webMVC/data/writeOk.do" enctype="multipart/form-data">
<ul>
	<li>제목 : <input type="text" name="title" id="title" size="50"/></li>
	<li>글내용 : <textarea name="content" id="content"></textarea></li>
	<li>파일첨부 : <input type="file" name="filename" id="filename"/></li>
	<li><input type="submit" value="자료실 글 올리기"/></li>

</ul>
</form>