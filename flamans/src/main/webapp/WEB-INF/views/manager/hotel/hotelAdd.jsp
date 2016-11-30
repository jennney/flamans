<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>호텔 정보 등록 하기</h2>
<form name="hotelAdd" action="hotelAdd.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="hot_num" value="${sessionScope.cm_number }">
	 이름 : <input type="text" name="hot_name"><br>
	 주소 : <input type="text" name="hot_addr"><br>
	 이미지 : <input type="file" name="upload"><br>
	 상세내용 : <textarea rows="4" cols="200" name="hot_content"></textarea><br>
	 찾아오는길 : <textarea rows="2" cols="200" name="hot_mapinfo"></textarea><br>
	 등급 : <select name="hot_grade">
	 				<option value="1">1성</option>
	 				<option value="2">2성</option>
	 				<option value="3">3성</option>
	 				<option value="4">4성</option>
	 				<option value="5">5성</option>
	 		</select><br>
	 방정보 : <input type="text" name="hot_roominfo"><br>
	 옵션 :	<input type="text" name="hot_option"><br>
	 부대시설 <textarea rows="4" cols="200" name="hot_etc"></textarea><br>
	<input type="submit" value="등록하기"> <input type="reset" value="초기화">
</form>
</body>
</html>