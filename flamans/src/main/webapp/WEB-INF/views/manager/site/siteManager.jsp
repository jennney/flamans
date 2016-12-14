<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="wrapper">
<%@ include file="/WEB-INF/views/myIndex.jsp"%>
	<div id="page-wrapper">
	<ul>
		<li><a href="memberList.do">회원 정보</a></li>
		<li><a href="#">이벤트 정보</a></li>
		<li><a href="hotelInfo.do">호텔 정보</a></li>
		<li><a href="hospitalInfo.do">병원 정보</a></li>
		<li><a href="#">고객 센터</a></li>
		<li><a href="#">1대1 상담</a></li>
	</ul>
	</div>
</div>
</body>
</html>