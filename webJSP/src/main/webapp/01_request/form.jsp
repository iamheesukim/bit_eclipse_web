<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 0831/0901 formOk.jsp의 정보 입력 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method='post' action='formOk.jsp'>
	<ul>
		<li>아이디 : <input type='text' name='userid'/></li>
		<li>이름 : <input type='text' name='username'/></li>
		<li>성별 : <input type='radio' name='gender' value='M'/>남
				  <input type='radio' name='gender' value='F'/>여</li>
				<!-- name 무조건 같아야함 그래야 radio그룹이 같이 묶임 -->
		<li>관심분야 : <input type="checkbox" name="inter" value="운동" checked/>운동
					 <input type="checkbox" name="inter" value="쇼핑"/>쇼핑
					 <input type="checkbox" name="inter" value="맛집"/>맛집
					 <input type="checkbox" name="inter" value="웹툰" checked/>웹툰
					 <input type="checkbox" name="inter" value="게임"/>게임
					 <input type="checkbox" name="inter" value="IT"/>IT</li>
		
		<li>지역 :
			<select name="local" multiple>
				<option value="서울">서울</option>
				<option value="경기" selected>경기</option>
				<option value="충청">충청</option>
				<option value="경상">경상</option>
				<option value="전라">전라</option>
				<option value="강원">강원</option>
				<option value="제주">제주</option>
			</select>
		<li><textarea name="content">안내글</textarea>
		<li><input type="submit" value="확인"/></li>
	</ul>
</form>
</body>
</html>