<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>병원 고객센터 문의 상세 보기</h2>
<c:set var='dto' value="${list }"/>
<table border="1" cellspacing="0" width="600">
	<tr>
		<th>번호</th>
		<td>${dto.qna_idx }</td>
		<th>작성일</th>
		<td>${dto.qna_writedate }</td>
		<th>조회수</th>
		<td>${dto.readnum }</td>
	</tr>
	<tr>
		<th>제목</th>
		<td colspan="3">${dto.qna_subject }</td>
		<th>작성자</th>
		<td>${dto.qna_writer }</td>
	</tr>
	<tr>
		<td colspan="6">
			<textarea rows="10" cols="300">${dto.qna_content }</textarea>
		</td>
	</tr>
	<tr>
		<td colspan="6" align="center">
		<c:url var="hospitalBbsReWriteUrl" value="hospitalBbsReWrite.do">
			<c:param name="qna_idx">${dto.qna_idx }</c:param>
			<c:param name="qna_findname">${sessionScope.cm_number }</c:param>
		</c:url>
		<c:url var="hospitalBbsDeleteUrl" value="hospitalBbsDelete.do">
			<c:param name="qna_idx">${dto.qna_idx }</c:param>
		</c:url>
			<a href="${hospitalBbsReWriteUrl }">답변하기</a>&nbsp;&nbsp;<a href="hospitalBbsList.do">목록보기</a>
			&nbsp;&nbsp;<a href="${hospitalBbsDeleteUrl }">삭제하기</a>
		</td>
	</tr>
</table>
</body>
</html>