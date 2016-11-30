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
<h2>고객센터 본문보기</h2>
<c:forEach var="dto" items="${list }">
	<table border="1" cellspacing="0" width="600">
		<tr>
			<th>SUBJECT</th>
			<td>${dto.qna_subject}</td>
		</tr> 
		<tr>
			<th>WRITER</th>
			<td>${dto.qna_writer}</td>
		</tr>
		<tr>
			<td colspan="2" align="right" height="30"> DATE ${dto.qna_writedate} HIT  ${dto.readnum}</td>
		</tr>
		<tr>
			<td colspan="2" align="center">${dto.qna_content}</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<a href="hotelBbsList.do">목록으로</a>
				<c:url var="hotelBbsDeleteUrl" value="hotelBbsDelete.do">
					<c:param name="qna_idx">${dto.qna_idx }</c:param>
				</c:url>
				<a href="${hotelBbsDeleteUrl }">삭제하기</a>
				<c:url var="hotelBbsReWriteUrl" value="hotelBbsReWrite.do">
					<c:param name="qna_idx">${dto.qna_idx }</c:param>
				</c:url>
				<a href="${hotelBbsReWriteUrl }">답변달기</a>				
			</td>
		</tr>
	</table>
</c:forEach>
</body>
</html>