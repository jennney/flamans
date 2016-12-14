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
		<h2>의사 정보 수정</h2>
		<c:set var="dto" value="${dto }"/>
		<form name="doctorUpdate" action="doctorUpdate.do" method="post" enctype="multipart/form-data">
			<fieldset>
				<legend>의사 정보 수정</legend>
				<input type="hidden" name="hos_num" value="${dto.hos_num}">
				<input type="hidden" name="hos_img" value="${dto.doc_img }">
				<label>이름 : </label> ${dto.doc_name }<input type="hidden" name="doc_name" value=${dto.doc_name }><br>
				<label>이미지 : </label>${dto.doc_img } <input type="file" name="upload"><br>
				<label>학력 :</label> <input type="text" name="doc_level" value=${dto.doc_level }><br>
				<label>경력 </label><textarea rows="4" cols="300" name="doc_career">${dto.doc_career }</textarea><br>
				<label>기타사항 : </label><input type="text" name="doc_etc" value=${dto.doc_etc }><br>
				<label>진료 과목 : </label><input type="text" name="doc_kind" value=${dto.doc_kind }><br>
				<input type="submit" value="등록"> <input type="reset" value="다시작성">
			</fieldset>
		</form>
	</div>
</div>		
</body>
</html>