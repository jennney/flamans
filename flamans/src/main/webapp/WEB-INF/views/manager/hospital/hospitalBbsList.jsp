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
<h2> 해당 병원 문의 내역 보기</h2>
<table border="1" cellspacing="0" width="600">
	<thead>
		<tr>
			<th> 번호 </th>
			<th> 구분 </th>
			<th> 제목 </th>
			<th> 작성자 </th>
			<th> 작성 일자 </th>
			<th> 조회수 </th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<td colspan="6" align="center"> ${hosBbsPage } </td>
		</tr>
	</tfoot>
	<tbody>
		<c:if test="${empty list }">
			<tr>
				<td colspan="6" align="center"> 작성된 게시물이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${!empty list }">
			<c:forEach var="dto" items="${list }">
				<tr>
					<td>${dto.qna_idx }</td>
					<td>${dto.qna_item }</td>
					<c:url var="hospitalBbsContentUrl" value="hospitalBbsContent.do">
						<c:param name="qna_idx">${dto.qna_idx }</c:param>
					</c:url>
					<td><a href="${hospitalBbsContentUrl }">${dto.qna_subject }</a></td>
					<td>${dto.qna_writer }</td>
					<td>${dto.qna_writedate }</td>
					<td>${dto.readnum }</td>
				</tr>
			</c:forEach>
		</c:if>
	</tbody>
</table>
</body>
</html>