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
		<h2>호텔 룸 리스트 보기</h2>
		<table border="1" cellspacing="0" width="600">
			<thead>
				<tr>
					<th>번호</th>
					<th>방 이름</th>
					<th>최대 인원</th>
					<th>방 가격</th>
					<th>방 개수</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td colspan="4" align="center">${hotelRoomPage }</td>
					<td align="center"><a href="hotelRoomAdd.do">방등록하기</a></td>
				</tr>
			</tfoot>
			<tbody>
			<c:if test="${empty list }">
				<tr>
					<td colspan="5" align="center">등록된 방이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${!empty list }">
				<c:forEach var="dto" items="${list }">
				<tr>
					<td>${dto.room_idx }</td>
					<c:url var="hotelRoomContentUrl" value="hotelRoomContent.do">
						<c:param name="room_idx">${dto.room_idx }</c:param>
					</c:url>
					<td><a href=${hotelRoomContentUrl }>${dto.roomname }</a></td>
					<td>${dto.people_num }</td>
					<td>${dto.roomprice }</td>
					<td>${dto.roomnum }</td>
				</tr>
				</c:forEach>
			</c:if>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>