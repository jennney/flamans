<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#list_table {
	width: 700px;
	margin: 0px auto;
	border-spacing: 0px;
}
#list_th1, #list_th2, #list_th3{
	border-top: 3px solid #BDBDBD;
	border-bottom: 3px solid #BDBDBD;
	height: 50px;
	text-align: center;
}

#list_th1 {
	width: 250px;
}

#list_th2 {
	width: 200px;
}

#list_th3 {
	width: 250px;
}
#list_td {
	border-bottom: 1px solid #BDBDBD;
	height: 40px;
	text-align: center;
}
#list_page{
	height: 50px;
	text-align: center;
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
		<h2>회원 리스트</h2>
		<table id="list_table">
			<thead>
				<tr>
					<th id="list_th1">ID</th>
					<th id="list_th1">이름</th>
					<th id="list_th1">국적</th>
					<th id="list_th1">성별</th>
					<th id="list_th1">관리</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td colspan="5" id="list_page">${memberPage }</td>
				</tr>
			</tfoot>
			<tbody>
			<c:if test="${empty list }">
				<tr>
					<td colspan="5" id="list_td">등록된 회원이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${!empty list }">
				<c:forEach var="dto" items="${list }">
				<tr>
					<td id="list_td">${dto.m_id }</td>
					<td id="list_td">${dto.m_name }</td>
					<td id="list_td">${dto.m_nationality }</td>
					<td id="list_td">${dto.m_sex }</td>
					<c:url var="memberKickUrl" value="memberKick.do">
						<c:param name="m_id">${dto.m_id }</c:param>
					</c:url>
					<td id="list_td"><a href="${memberKickUrl }">추방</a></td>
				</tr>
				</c:forEach>
			</c:if>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>