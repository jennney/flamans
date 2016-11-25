<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<br>
	<c:if test="${empty sessionScope.username }">
		<p><a href="member_login.do">로그인</a></p>
	</c:if>
	<c:if test="${!empty sessionScope.username }">
		<p>${sessionScope.username }님 환영합니다 |<a href="logout.do">로그아웃</a></p>
	</c:if>

<%@ include file="footer.jsp" %>
</body>
</html>