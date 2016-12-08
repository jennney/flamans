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
	<li><a href="hospitalBbsList.do">문의 내역 보기</a></li>
	<li><a href="hospitalContent.do">병원 상세 정보 보기</a></li>
	<li><a href="doctorList.do">의료진 목록 보기</a></li>
	<li><a href="event_co_list.do?e_name=${sessionScope.userBid}">병원 이벤트 리스트</a></li>
</ul>
</body>
</html>