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
		<h2>회원 리스트</h2>
		<table border="1" cellspacing="0" width="600">
			<thead>
				<tr>
					<th>국적</th>
					<th>이름</th>
					<th>성별</th>
					<th>...</th>
					<th>기타</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td colspan="5" align="center">${memberPage }</td>
				</tr>
			</tfoot>
			<tbody>
			<c:if test="${empty list }">
				<tr>
					<td colspan="5" align="center">등록된 회원이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${!empty list }">
				<c:forEach var="dto" items="${list }">
				<tr>
					<td>${dto.m_nationality }</td>
					<td>${dto.m_name }</td>
					<td>${dto.m_sex }</td>
					<td>${dto.m_birthday }</td>
					<c:url var="memberKickUrl" value="memberKick.do">
						<c:param name="m_id">${dto.m_id }</c:param>
					</c:url>
					<td><a href="${memberKickUrl }">추방</a></td>
				</tr>
				</c:forEach>
			</c:if>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>