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
<h2>회원 리스트</h2>
<table border="1" cellspacing="0" width="600">
	<thead>
		<tr>
			<th>국적</th>
			<th>이름</th>
			<th>성별</th>
			<th>...</th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<td colspan="4">${memberPage }</td>
		</tr>
	</tfoot>
	<tbody>
	<c:if test="${empty list }"></c:if>
	</tbody>
</table>
</body>
</html>