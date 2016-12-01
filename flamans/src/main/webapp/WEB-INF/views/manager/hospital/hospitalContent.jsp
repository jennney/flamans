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

<c:if test="${empty list }">
	<h4>등록된 병원 정보가 없습니다</h4>
	<a href="hospitalAdd.do">병원 정보 등록하기</a>
</c:if>
<c:if test="${!empty list }">
	<c:forEach var="dto" items="${list }">
		<img src="img/${dto.hos_img }"><br>
		이름 : ${dto.hos_name } <br>
		주소 : ${dto.hos_addr } <br>
		상세내용 : ${dto.hos_content } <br>
		오시는길 : ${dto.hos_mapinfo } <br>
		<c:url var="hospitalUpdateUrl" value="hospitalUpdate.do">
			<c:param name="hos_num">${dto.hos_num }</c:param>
		</c:url>
		<c:url var="hospitalDeleteUrl" value="hospitalDelete.do">
			<c:param name="hos_num">${dto.hos_num }</c:param>
		</c:url>
		<a href="${hospitalUpdateUrl }">수정하기</a>&nbsp;<a href="${hospitalDeleteUrl }">삭제하기</a>
	</c:forEach>
</c:if>
</body>
</html>