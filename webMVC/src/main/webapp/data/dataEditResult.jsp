<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${result>0}">
	<script>
		alert("자료실 정보가 수정되었습니다.");
		location.href="/webMVC/data/view.do?num=${num}";
	</script>
</c:if>

<c:if test="${result<=0}">
	<script>
		alert("자료실 정보 수정에 실패했습니다.\n수정페이지로 다시 이동합니다.");
		history.back();
	</script>
</c:if>