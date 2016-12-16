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
<div id="wrapper">
<%@ include file="/WEB-INF/views/myIndex.jsp"%>
	<div id="page-wrapper">	
		<c:if test="${empty list }">
			<h4>등록된 병원 정보가 없습니다</h4>
			<a href="hospitalAdd.do">병원 정보 등록하기</a>
		</c:if>
		<c:if test="${!empty list }">
			<c:forEach var="dto" items="${list }">
				<img src="img/hospital/${sessionScope.cm_number }/${dto.hos_img }" width="150" height="150"><br>
				이름 : ${dto.hos_name } <br>
				전문부위 : ${sp } <br>
				주소 : ${dto.hos_addr } <br>
				상세내용 : ${dto.hos_content } <br>
				오시는길 : ${dto.hos_mapinfo } <br>
				<c:url var="hospitalUpdateUrl" value="hospitalUpdate.do">
					<c:param name="hos_num">${dto.hos_num }</c:param>
				</c:url>
				<c:url var="hospitalDeleteUrl" value="hospitalDelete.do">
					<c:param name="hos_num">${dto.hos_num }</c:param>
				</c:url>
				<a class="btn btn-default" href="${hospitalUpdateUrl }">수정하기</a>&nbsp;<a class="btn btn-default" href="${hospitalDeleteUrl }">삭제하기</a>
			</c:forEach>
		</c:if>
	</div>
</div>		
</body>
</html>