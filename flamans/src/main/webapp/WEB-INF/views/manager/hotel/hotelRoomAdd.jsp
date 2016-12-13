<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>호텔 방 정보 등록</h2>
<form name="hotelRoomAdd" action="hotelRoomAdd.do" method="post">
	<input type="hidden" name="hot_num" value="${sessionScope.cm_number }">
	방 이름 : <input type="text" name="roomname"><br>
	방 가격 : <input type="text" name="roomprice"><br>
	방 개수 : <input type="text" name="roomnum"><br>
	방 옵션 
	<input type="checkbox" name="room_option" value="breakfast"> 조식
	<input type="checkbox" name="room_option" value="minibar"> 미니바
	<input type="checkbox" name="room_option" value="safebox"> 안전금고
	<input type="checkbox" name="room_option" value="bath"> 욕조
	<input type="checkbox" name="room_option" value="morningcall"> 모닝콜 서비스
	<!-- 옵션 : 조식 여부, 미니바,안전금고, 욕조,모닝콜 서비스 
	 -->
	<br>
	<input type="submit" value="등록하기">
	<input type="reset" value="다시작성">
</form>
</body>
</html>