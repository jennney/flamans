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
<h2>병원 관리자 페이지</h2>
<h3>병원이름  : ${sessionScope.cm_name }</h3>
<ul>
	<li><a href="#">고객 센터 내역 보기</a></li>
	<li><a href="#">병원 정보 등록 하기</a></li>
	<li><a href="#">소속 의사 리스트 보기</a></li>
</ul>
</body>
</html>