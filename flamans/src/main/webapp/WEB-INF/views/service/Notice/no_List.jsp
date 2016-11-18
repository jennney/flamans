<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
<table>
	<tr>
		<th>제목</th>
		<th>작성날짜</th>
		<th>작성자</th>
	</tr>
	<c:if test="${empty noList}">
		<tr>
			<td colspan="3">등록된 공지사항이 없습니다.</td>
		</tr>
	</c:if>
	<c:forEach var="noList" items="${noList}">
		<tr>
			<td>${noList.subject}</td>
			<td>${noList.no_writedate}</td>
			<td>관리자</td>
		</tr>
	</c:forEach>
	<tr>
	</tr>
</table>
</body>
</html>