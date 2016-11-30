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
	<c:url var="hospitalBbsListUrl" value="hospitalBbsList.do">
		<c:param name="cm_number">${sessionScope.cm_number }</c:param>
	</c:url>
	<li><a href="${hospitalBbsListUrl }">문의 내역 보기</a></li>
	<li><a href="hospitalContent.do">병원 상세 정보 보기</a></li>
	<li><a href="doctorList.do">의료진 목록 보기</a></li>
</ul>
</body>
</html>