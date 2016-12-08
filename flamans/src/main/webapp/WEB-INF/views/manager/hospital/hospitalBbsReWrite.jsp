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

<h2>병원 고객센터 답변 달기 폼</h2>
<c:set var="dto" value="${dto }"/>
<form name="hospitalBbsReWrite" action="hospitalBbsReWrite.do" method="post">
	<table border="1" cellspacing="0" width="600">
		<tr>
			<th>SUBJECT</th>
				<td><input type="text" name="qna_subject" size="50" value="Re:${dto.qna_subject }"></td>
			</tr>
			<tr>
				<th>WRITER</th>
				<td>${sessionScope.cm_name} 관리자
				<input type="hidden" name="qna_writer" value="${sessionScope.userBid}"></td>
			</tr>
			<tr>
				<th>ITEM</th>
				<td>${dto.qna_item }</td>
			</tr>
			<tr>
				<td colspan="2"><textarea name="qna_content"></textarea></td>
			</tr>
	</table>
	<input type="hidden" name="qna_item" value="${dto.qna_item }">
	<input type="hidden" name="qna_pwd" value="${dto.qna_pwd }">
	<input type="hidden" name="qna_secret" value="${dto.qna_secret }">
	<input type="hidden" name="qna_kind" value="${dto.qna_kind }">
	<input type="hidden" name="qna_findname" value="${sessionScope.cm_number }">
	<input type="hidden" name="ref" value="${dto.ref }">
	<input type="submit" value="등록">
	<input type="reset" value="다시 작성">
</form>
</body>
</html>