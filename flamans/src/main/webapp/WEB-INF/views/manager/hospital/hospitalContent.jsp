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
		<c:if test="${empty list }">
			<h4>등록된 병원 정보가 없습니다</h4>
			<a class="btn btn-default" href="hospitalAdd.do">병원 정보 등록하기</a>
		</c:if>
		<c:if test="${!empty list }">
			<c:forEach var="dto" items="${list }">
			<fieldset>
				<div id="imgtag">
					<h3 style="text-align: center;">${dto.hos_name }</h3>
					<img src="img/hospital/${dto.hos_img }"><br>
				</div>
			</fieldset>
			<br>
			<fieldset>
				<legend>전문분야</legend>${sp }
			</fieldset><br>
			<fieldset>
				<legend>주소</legend>${dto.hos_addr }
			</fieldset><br>
			<fieldset>
				<legend>상세내용</legend>${dto.hos_content }
			</fieldset><br>
			<fieldset>
				<legend>오시는길</legend>${dto.hos_mapinfo }
			</fieldset><br>
			<div id="button_list">
				<c:url var="hospitalUpdateUrl" value="hospitalUpdate.do">
					<c:param name="hos_num">${dto.hos_num }</c:param>
				</c:url>
				<c:url var="hospitalDeleteUrl" value="hospitalDelete.do">
					<c:param name="hos_num">${dto.hos_num }</c:param>
				</c:url>
				<a class="btn btn-default" href="${hospitalUpdateUrl }">수정하기</a>
				<a class="btn btn-default" href="${hospitalDeleteUrl }">삭제하기</a>
			</div>	
			</c:forEach>
		</c:if>
	</div>
</div>		
</body>
</html>