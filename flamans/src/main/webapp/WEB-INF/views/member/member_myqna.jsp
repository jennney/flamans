<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
	<c:url var="contentURL" value="#">
	<c:param name="e_idx">${dto.e_idx}</c:param>
	</c:url>
		<tr>   		
			<td colspan="4">${dto.e_subject}</td>
		<tr>
			<td>이벤트 기간 : </td>
			<td>${dto.qna_subject}</td>
			<td>답변여부 </td>
			<td></td>
		</tr>
		
	   
	</c:forEach>
	
	
</table>	

</body>
</html>