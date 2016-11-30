<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../../header.jsp" %>
<h2>호텔 관리자 페이지</h2>
<h3>호텔 이름  : ${sessionScope.cm_name }</h3>
<ul>
	<li><a href="hotelBbsList.do">고객 센터 내역 보기</a></li>
	<li><a href="#">호텔 정보 등록 하기</a></li>
</ul>
</body>
</html>