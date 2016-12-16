<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/flamans/js/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
#docimg{
	float: left;
	width:200px;
	height: 200px;
	padding-right: 10px;
}
#button_list{
	text-align: center;
}
h2{
	text-align: center;
}
</style>
</head>
<body>
<div id="wrapper">
<%@ include file="/WEB-INF/views/myIndex.jsp"%>
	<div id="page-wrapper">
		<h2>의사정보</h2>
		<c:set var="lists" value="${list }"/>
		<c:forEach var="dto" items="${lists }">
		
		<fieldset>
			<div><h3 style="text-align: center;">${dto.doc_name }</h3><br>
				<img src="img/hospital/doctor/${dto.doc_img }" id="docimg"><br>
				<span id="level">${dto.doc_level }</span>
			</div>
		</fieldset><br>
		<fieldset>
			<legend>의사 경력</legend>${dto.doc_career }
		</fieldset><br>
		<fieldset>
			<legend>메모</legend>${dto.doc_etc }
		</fieldset>	
		<%-- 	<fieldset>
				<legend>의사 정보</legend>
				<label>이름 : </label> ${dto.doc_name }<br>
				<label>이미지 : </label> <img src="img/hospital/${sessionScope.cm_number }/doctor/${dto.doc_img }" width="150" height="150"> <br> 
				<label>학력 :</label> ${dto.doc_level }<br>
				<label>경력 </label> ${dto.doc_career }<br>
				<label>기타사항 : </label> ${dto.doc_etc }<br>
				<label>진료 과목 : </label> ${dto.doc_kind }<br>
			</fieldset> --%>
		<div id="button_list">
			<c:url var="doctorUpdateUrl" value="doctorUpdate.do">
				<c:param name="doc_num">${dto.doc_num }</c:param>
			</c:url>
			<a class="btn btn-default" href="${doctorUpdateUrl }">수정하기</a>
			<c:url var="doctorDeleteUrl" value="doctorDelete.do">
				<c:param name="doc_num">${dto.doc_num }</c:param>
			</c:url>
			<a class="btn btn-default" href="${doctorDeleteUrl }">삭제하기</a>
			<a class="btn btn-default" href="doctorList.do">목록보기</a>
		</div>
		</c:forEach>
	</div>
</div>		
</body>
</html>