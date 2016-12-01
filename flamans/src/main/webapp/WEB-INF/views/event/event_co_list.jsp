<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<body>
<table>
	<c:if test="${empty list}">
		<tr>
			<td colspan="4" align="center">
				등록된 게시글이 없습니다.
			</td>
		</tr>
	</c:if>
	<c:forEach var="dto" items="${list}">
	<c:url var="contentURL" value="event_hot_Content.do">
	<c:param name="e_idx">${dto.e_idx}</c:param>
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
			<td colspan="4"><a href="event_co_content.do?e_idx=${dto.e_idx}"><img src="img/${dto.e_img}"></a></td>
		</tr>
	</c:forEach>
	<tr>
		<td><input type="button" value="등록" onclick="location.href='event_add.do'"></td>
	</tr>
	<tr>
		<td colspan="4" align="center">
		${pageStr }	   		
		</td>
	</tr>
	
</table>	
</body>
</html>