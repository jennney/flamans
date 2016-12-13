<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="wrapper">
<%@ include file="/WEB-INF/views/myIndex.jsp"%>
	<div id="page-wrapper">
		<h2>호텔 방 정보 수정</h2>
		<c:set var="dtos" value="${dto }"></c:set>
		<form name="hotelRoomUpdate" action="hotelRoomUpdate.do" method="post">
			<input type="hidden" name="hot_num" value="${sessionScope.cm_number }">
			<input type="hidden" name="room_idx" value="${dtos.room_idx }">
			방 이름 : <input type="text" name="roomname" value="${dtos.roomname }"><br>
			방 가격 : <input type="text" name="roomprice" value="${dtos.roomprice }"><br>
			방 개수 : <input type="text" name="roomnum" value="${dtos.roomnum }"><br>
			방 옵션 
			${options }
			<br>
			<input type="submit" value="수정하기">
			<input type="reset" value="다시작성">
		</form>
	</div>
</div>
</body>
</html>