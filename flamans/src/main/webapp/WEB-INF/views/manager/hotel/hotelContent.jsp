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

<h2>호텔 정보 보기</h2>
<c:if test="${empty list }">
	<h4>등록된 정보가 없습니다.</h4>
	<a href="hotelAdd.do">호텔 정보 등록 하러 가기</a>
</c:if>
<c:if test="${!empty list }">
<c:forEach var="dto" items="${list }">

	<img src="img/${dto.hot_img }"><br>
	이름 : ${dto.hot_name } <br>
	주소 : ${dto.hot_addr } <br>
	등급 : ${dto.hot_grade } <br>
	옵션 : ${dto.hot_option } <br>
	부대시설 : ${dto.hot_etc } <br>
	상세내용 : ${dto.hot_content } <br>
	오시는길 : ${dto.hot_mapinfo } <br>
	<c:url var="hotelUpdateUrl" value="hotelUpdate.do">
		<c:param name="hot_num">${dto.hot_num }</c:param>
	</c:url>
	<c:url var="hotelDeleteUrl" value="hotelDelete.do">
		<c:param name="hot_num">${dto.hot_num }</c:param>
	</c:url>
	<a href="${hotelUpdateUrl }">수정하기</a>&nbsp;<a href="${hotelDeleteUrl }">삭제하기</a>
	</c:forEach>
</c:if>
</body>
</html>