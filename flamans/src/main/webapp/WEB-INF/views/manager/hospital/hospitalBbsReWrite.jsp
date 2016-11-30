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
<c:set var="dto" value="${qdto }"/>
<form name="hospitalBbsReWrite" action="hospitalBbsReWrite.do" method="post">
	<input type="hidden" name="qna_writer" value="${sessionScope.cm_name } 관리자">
	<input type="hidden" name="qna_findname" value="${sessionScope.cm_number }">
	제목 : <input type="text" name="qna_subject" value="Re :${dto.qna_subject }"><br>
	내용 : <textarea rows="4" cols="200" name="qna_content"></textarea><br>
	
	<input type="submit" value="등록하기">&nbsp;&nbsp; <input type="reset" value="새로작성">
</form>
</body>
</html>