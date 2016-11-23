<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔리스트</title>
</head>
	<body>
		<table border="0" cellspacing="30">
			<thead>
				<tr>
					<th width="100">호텔사진 위치</th>
					<th>상세정보</th>
					<th>평점</th>
					<th>가격</th>
				</tr>
				
				<tr>
					<th width="100">썸네일 위치</th>
				</tr>
			</thead>
			
			<tbody>
			
				<c:if test="${empty list }">
					<tr>
						<td colspan="4">검색조건을 만족하는 호텔이 없습니다.</td>
					</tr>
				</c:if>
				
				<c:forEach var="list" items="${list }">
				
					<tr>
						<td>${list.idx }</td>
						<td><a href="content.do?idx=" +${list.idx }>${list.subject }</a></td>
						<td>${list.writer }</td>
						<td>${list.readnum }</td>
					</tr>
					
				</c:forEach>
			</tbody>
			
		</table>
	</body>
</html>