<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/flamans/js/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
input[type=text],#sb{
	width: 75%;
}
#button_list{
	width: 75%;
	text-align: center;
}
</style>
</head>
<body>
<div id="wrapper">
<%@ include file="/WEB-INF/views/myIndex.jsp"%>
	<div id="page-wrapper">
		<h2>호텔 방 정보 등록</h2>
		<form name="hotelRoomAdd" action="hotelRoomAdd.do" method="post">
			<input type="hidden" name="hot_num" value="${sessionScope.cm_number }">
			방 이름 : <input type="text" name="roomname" class="form-control"><br>
			최대 인원 : 
			<select name="people_num" class="form-control" id="sb">
				<option value="1"> 1명 
				<option value="2"> 2명 
				<option value="4"> 4명 
				<option value="6"> 6명 
			</select>
			<br>
			방 가격 : <input type="text" name="roomprice" class="form-control"><br>
			현재 객실수 : <input type="text" name="roomnum" class="form-control"><br>
			전체 객실수 : <input type="text" name="maxroom" class="form-control"><br>
			방 옵션  :
			<input type="checkbox" name="room_option" value="breakfast"> 조식
			<input type="checkbox" name="room_option" value="minibar"> 미니바
			<input type="checkbox" name="room_option" value="safebox"> 안전금고
			<input type="checkbox" name="room_option" value="bath"> 욕조
			<input type="checkbox" name="room_option" value="morningcall"> 모닝콜 서비스
			<!-- 옵션 : 조식 여부, 미니바,안전금고, 욕조,모닝콜 서비스 
			 -->
			<br>
			<div id="button_list">
				<input type="submit" value="등록하기" class="btn btn-default">
				<input type="reset" value="다시작성" class="btn btn-default">
			</div>
		</form>
	</div>
</div>
</body>
</html>