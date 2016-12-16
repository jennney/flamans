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
#list_table {
	width: 700px;
	margin: 0px auto;
	border-spacing: 0px;
}
#list_th1, #list_th2, #list_th3,#list_th4, #list_th5, #list_th6 {
	border-top: 3px solid #BDBDBD;
	border-bottom: 3px solid #BDBDBD;
	height: 50px;
	text-align: center;
}

#list_th1 {
	width: 50px;
}

#list_th2 {
	width: 200px;
}

#list_th3 {
	width: 100px;
}
#list_th4 {
	width: 100px;
}
#list_th5 {
	width: 75px;
}
#list_th6 {
	width: 75px;
}

#list_td {
	border-bottom: 1px solid #BDBDBD;
	height: 40px;
	text-align: center;
}
#list_page{
	height: 50px;
}
h2 {
	text-align: center;
}
</style>
</head>
<body>
<div id="wrapper">
<%@ include file="/WEB-INF/views/myIndex.jsp"%>
	<div id="page-wrapper">
		<h2>호텔 룸 리스트 보기</h2>
		<table id="list_table">
			<thead>
				<tr>
					<th id="list_th1">번호</th>
					<th id="list_th2">방 이름</th>
					<th id="list_th3">최대 인원</th>
					<th id="list_th4">방 가격</th>
					<th id="list_th5">현재 객실수</th>
					<th id="list_th6">전체 객실수</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td colspan="5" align="center" id="list_page">${hotelRoomPage }</td>
					<td><a class="btn btn-default" href="hotelRoomAdd.do">방등록하기</a></td>
				</tr>
			</tfoot>
			<tbody>
			<c:if test="${empty list }">
				<tr>
					<td colspan="6" id="list_td">등록된 방이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${!empty list }">
				<c:forEach var="dto" items="${list }">
				<tr>
					<td id="list_td">${dto.room_idx }</td>
					<c:url var="hotelRoomContentUrl" value="hotelRoomContent.do">
						<c:param name="room_idx">${dto.room_idx }</c:param>
					</c:url>
					<td id="list_td"><a href=${hotelRoomContentUrl }>${dto.roomname }</a></td>
					<td id="list_td">${dto.people_num }</td>
					<td id="list_td">${dto.roomprice }</td>
					<td id="list_td">${dto.roomnum }</td>
					<td id="list_td">${dto.maxroom }</td>
				</tr>
				</c:forEach>
			</c:if>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>