<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${userid ==null || userid==''}">
   <c:redirect url="/member/login.do"></c:redirect> 
</c:if> <!-- 로그인 안 됐으면 이 아래가 실행되지 않음 -->
<style>
.del{
   cursor:pointer;
}
</style>
<script>
   $(function(){
      CKEDITOR.replace("content");
      
      // 첨부파일이 삭제된 경우
      $('.del').click(function(){
         $(this).parent().css('display', 'none');
         // 새로운 파일 첨부할 input를 표시
         $('#filename').attr('type', 'file');
         // 삭제된 파일명을 정의한다.
         $('#delfile').attr('name', 'delfile');
      });
      
      $(document).on('submit', '#frm', function(){
         if($('#title').val()==''){
            alert('제목을 입력하세요');
            return false;
         }
         if(CKEDITOR.instances.content.getData()==''){
            alert('글내용을 입력하세요.');
            return false;
         }
         if($('#delfile').attr('name')=='delfile' && $('#filename').val()==''){
            alert('파일을 첨부해주세요.');
            return false;
         }
         return true;
      });
   });
</script>
   <h1>글 수정</h1>
   <form id="frm" method="post" action="/webMVC/data/dataEditOk.do" enctype="multipart/form-data">
      <ul>
         <li>제목 : <input type="text" name="title" id="title" size="60" value="${vo.title }"/></li>
         <li>글내용 : <textarea name="content" id="content">${vo.content }</textarea></li>
         <li>첨부파일
            <div>${vo.filename } &nbsp;&nbsp;&nbsp;<b class='del'>X</b></div>
            <input type="hidden" name="filename" id="filename"/>
            <input type="hidden" name="" id="delfile" value="${vo.filename }"/> <!-- X를 누를 때만 name을 줘서 값을 전달하기 -->
         </li>
         <li>
            <input type="submit" value="자료실수정"/>
            <input type="reset" value="다시쓰기"/>
            <input type="hidden" name="num" value="${vo.num }"/>
         </li>
      </ul>
   
   </form>