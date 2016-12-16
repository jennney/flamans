<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/flamans/js/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
#button_list{
	text-align: center;
}
fieldset{
	width: 75%;
}
</style>
</head>
<body>
<div id="wrapper">
<%@ include file="/WEB-INF/views/myIndex.jsp"%>
	<div id="page-wrapper">
		<c:forEach var="dto" items="${list }">
		<fieldset>
			<legend>호텔 이름</legend> ${sessionScope.cm_name }
		</fieldset><br>
		<fieldset>
			<legend>방 이름</legend> ${dto.roomname }
		</fieldset><br>
		<fieldset>
			<legend>최대 수용 인원 </legend> ${dto.people_num } 명
		</fieldset><br>
		<fieldset>
			<legend>가격</legend> ${dto.roomprice } 원
		</fieldset><br>
		<fieldset>
			<legend>잔여 객실수</legend> ${dto.roomnum } 실
		</fieldset><br>
		<fieldset>
			<legend>전체 객실수</legend> ${dto.maxroom } 실
		</fieldset><br>
		<fieldset>
			<legend>옵션</legend> ${options }
		</fieldset><br>
		
		<%-- 호텔 이름 : ${sessionScope.cm_name } <br>
		방 이름 : ${dto.roomname }<br>
		최대 인원 : ${dto.people_num}<br>
		방 가격 : ${dto.roomprice }<br>
		현재 객실수 : ${dto.roomnum }<br>
		총 객실수 : ${dto.maxroom }<br>
		옵션 : ${options }<br> --%>
		<div id="button_list">
			<c:url var="hotelRoomUpdateUrl" value="hotelRoomUpdate.do">
				<c:param name="room_idx">${dto.room_idx }</c:param>
			</c:url>
			<a class="btn btn-default" href="${hotelRoomUpdateUrl }">수정 하기</a>
			<c:url var="hotelRoomDeleteUrl" value="hotelRoomDelete.do">
				<c:param name="room_idx">${dto.room_idx }</c:param>
			</c:url>
			<a class="btn btn-default" href="${hotelRoomDeleteUrl }">삭제 하기</a>
			<a class="btn btn-default" href="hotelRoomList.do">목록보기</a>
		</div>
		</c:forEach>
	</div>
</div>
</body>
</html>