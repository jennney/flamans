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
		<h2>호텔 방 정보</h2>
		<c:forEach var="dto" items="${list }">
		호텔 이름 : ${sessionScope.cm_name } <br>
		방 이름 : ${dto.roomname }<br>
		최대 인원 : ${dto.people_num}<br>
		방 가격 : ${dto.roomprice }<br>
		방 개수 : ${dto.roomnum }<br>
		옵션 : ${options }<br>
		<c:url var="hotelRoomUpdateUrl" value="hotelRoomUpdate.do">
			<c:param name="room_idx">${dto.room_idx }</c:param>
		</c:url>
		<a href="${hotelRoomUpdateUrl }">수정 하기</a>
		<c:url var="hotelRoomDeleteUrl" value="hotelRoomDelete.do">
			<c:param name="room_idx">${dto.room_idx }</c:param>
		</c:url>
		<a href="${hotelRoomDeleteUrl }">삭제 하기</a>
		</c:forEach>
	</div>
</div>
</body>
</html>