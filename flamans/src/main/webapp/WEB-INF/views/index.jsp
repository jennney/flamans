<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
	width: 100%;
	margin: 0px auto;
}
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<h2>flamans final시작</h2>
	<a href="company_join.do">업체 회원가입</a>
	<br>
	<a href="member_join.do">회원가입</a>
	<br>
	<a href="qna_List.do?qna_kind=site">Q&A사이트</a>
	<br>
	<a href="qna_List.do?qna_kind=hospital">Q&A병원</a>
	<br>
	<a href="qna_List.do?qna_kind=hotel">Q&A호텔</a>
	<br>
	<a href="no_List.do">공지사항</a>

<%@ include file="footer.jsp" %>
</body>
</html>