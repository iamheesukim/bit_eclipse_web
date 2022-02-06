<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- WriteOkCommand에서 cnt라는 변수명으로 result값을 받아옴 -->
<c:if test="${cnt>0}"> <!-- 게시글 등록 성공 -->
	<script>
		location.href="/webMVC/data/list.do"
	</script>
</c:if>

<c:if test="${cnt<=0}"> <!-- 게시글 등록 실패 -->
	<script>
		alert("자료실 업로드 실패");
		history.back();
	</script>
</c:if>