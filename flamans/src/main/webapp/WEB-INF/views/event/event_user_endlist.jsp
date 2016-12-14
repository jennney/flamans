<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<body>
<h2>종료된 이벤트</h2>
<table>
	<c:if test="${empty list}">
		<tr>
			<td colspan="4" align="center">
				등록된 게시글이 없습니다.
			</td>
		</tr>
	</c:if>
	<c:forEach var="dto" items="${list}">
	<c:url var="contentURL" value="event_user_Content.do">
	<c:param name="idx">${dto.e_idx}</c:param>
	</c:url>
		<tr>   		
			<td colspan="4">${dto.e_subject}</td>
		<tr>
			<td>이벤트 기간 : </td>
			<td>${dto.e_start} ~ ${dto.e_end}</td>
			<td>등록 날짜 : </td>
			<td>${dto.e_date}</td>
		</tr>
		<tr>
			<td colspan="4"><img src="#/${dto.e_img}"></td>
		</tr>
	</c:forEach>
	<tr>
		<td colspan="4" align="center">
		페이징		   		
		</td>
	</tr>
</table>	
</body>
</html>