<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	ul{overflow:auto;}
	ul,li{margin:0;padding:0;list-style-type:none;}
	li{float:left; width:10%; border-bottom:1px solid gray;}
	li:nth-child(6n+2){width:50%;}
	
</style>
<script>

   $(function(){
      $("#dataList img").click(function(){
         var num =$(this).parent().parent().prev().prev().prev().text();
         var url = "/webMVC/data/downCount.do"; 
         var params = "num="+num;// num=101&userid=goguma
         $.ajax({
            url:url,
            data:params,
            success:function(result){
               console.log(result);
            },error:function(){
               console.log("다운로드 조회수 수정 실패.....")
            }
         });
      });
   });
</script>

<h1>자료실 리스트</h1>
<a href="/webMVC/data/write.do">자료실글쓰기</a>


<ul id="dataList">
	<li>번호</li>
	<li>제목</li>
	<li>글쓴이</li>
	<li>다운로드</li>
	<li>조회수</li>
	<li>등록일</li>
	<!-- 				vo, vo, vo,... (데이터가 담겨있는 컬렉션) -->
	<c:forEach var="vo" items="${list}">
		<li>${vo.num}</li>
		<li><a href="/webMVC/data/view.do?num=${vo.num}">${vo.title}</a></li>
		<li>${vo.userid}</li>
		<li><a href="/webMVC/upload/${vo.filename}" download>
			<img src="/webMVC/img/disk.gif" title="${vo.filename}"/>
			</a></li>
		<li>${vo.hit}</li>
		<li>${vo.writedate}</li>
	</c:forEach>
</ul>
