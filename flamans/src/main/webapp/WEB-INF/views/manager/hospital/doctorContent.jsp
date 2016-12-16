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
</head>
<body>
<div id="wrapper">
<%@ include file="/WEB-INF/views/myIndex.jsp"%>
	<div id="page-wrapper">
		<h2>의사정보</h2>
		<c:set var="lists" value="${list }"/>
		<c:forEach var="dto" items="${lists }">
			<fieldset>
				<legend>의사 정ㅋ보ㅋ</legend>
				<label>이름 : </label> ${dto.doc_name }<br>
				<label>이미지 : </label> <img src="img/hospital/${sessionScope.cm_number }/doctor/${dto.doc_img }" width="150" height="150"> <br> 
				<label>학력 :</label> ${dto.doc_level }<br>
				<label>경력 </label> ${dto.doc_career }<br>
				<label>기타사항 : </label> ${dto.doc_etc }<br>
				<label>진료 과목 : </label> ${dto.doc_kind }<br>
			</fieldset>
			<c:url var="doctorUpdateUrl" value="doctorUpdate.do">
				<c:param name="doc_num">${dto.doc_num }</c:param>
			</c:url>
			<a class="btn btn-default" href="${doctorUpdateUrl }">수정하기</a>
			<c:url var="doctorDeleteUrl" value="doctorDelete.do">
				<c:param name="doc_num">${dto.doc_num }</c:param>
			</c:url>
			<a class="btn btn-default" href="${doctorDeleteUrl }">삭제하기</a>
			<a class="btn btn-default" href="doctorList.do">목록보기</a>
		</c:forEach>
	</div>
</div>		
</body>
</html>