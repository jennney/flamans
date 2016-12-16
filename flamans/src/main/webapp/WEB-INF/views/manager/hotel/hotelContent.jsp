<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/flamans/js/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
#imgtag{
	text-align: center;
}
#imgtag img{
	width:400px;
	height: 300px;
}
#button_list{
	text-align: center;
}
fieldset{
	width: 75%;
}

</style>
</head>
<body>
<div id="wrapper">
<%@ include file="/WEB-INF/views/myIndex.jsp"%>
	<div id="page-wrapper">
		<h2>호텔 정보 보기</h2>
		<c:if test="${empty list }">
			<h4>등록된 정보가 없습니다.</h4>
			<a class="btn btn-default" href="hotelAdd.do">호텔 정보 등록 하러 가기</a>
		</c:if>
		<c:if test="${!empty list }">
		<c:forEach var="dto" items="${list }">
		<fieldset>
			<div id="imgtag">
				<h3 style="text-align: center;">${dto.hot_name }</h3>
				<img src="img/hotel/${dto.hot_img }"><br>
			</div>
		</fieldset><br>
		<fieldset>
			<legend>주소</legend> ${dto.hot_addr }
		</fieldset><br>
		<fieldset>
			<legend>등급</legend> ${dto.hot_grade } 등급
		</fieldset><br>
		<fieldset>
			<legend>부대시설</legend> ${etcs }
		</fieldset><br>
		<fieldset>
			<legend>상세내용</legend> ${dto.hot_content }
		</fieldset><br>
		<fieldset>
			<legend>오시는길</legend> ${dto.hot_mapinfo }
		</fieldset><br>
		
		
		<%-- 	<img src="img/hotel/${sessionScope.cm_number }/${dto.hot_img }" width="150" height="150"><br>
			이름 : ${dto.hot_name } <br>
			주소 : ${dto.hot_addr } <br>
			등급 : ${dto.hot_grade } <br>
			부대시설 : ${etcs} <br>
			상세내용 : ${dto.hot_content } <br>
			오시는길 : ${dto.hot_mapinfo } <br> --%>
		<div id="button_list">
			<c:url var="hotelUpdateUrl" value="hotelUpdate.do">
				<c:param name="hot_num">${dto.hot_num }</c:param>
			</c:url>
			<c:url var="hotelDeleteUrl" value="hotelDelete.do">
				<c:param name="hot_num">${dto.hot_num }</c:param>
			</c:url>
			<a class="btn btn-default" href="${hotelUpdateUrl }">수정하기</a>
			<a class="btn btn-default" href="${hotelDeleteUrl }">삭제하기</a>
		</div>
		</c:forEach>
		</c:if>
	</div>
</div>
</body>
</html>