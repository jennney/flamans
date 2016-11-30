<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>의사정보</h2>
<c:set var="lists" value="${list }"/>
<c:forEach var="dto" items="${lists }">
	<fieldset>
		<legend>의사 정ㅋ보ㅋ</legend>
		<label>이름 : </label> ${dto.doc_name }<br>
		<label>이미지 : </label> ${dto.doc_img }<br>
		<label>학력 :</label> ${dto.doc_level }<br>
		<label>경력 </label> ${dto.doc_career }<br>
		<label>기타사항 : </label> ${dto.doc_etc }<br>
		<label>진료 과목 : </label> ${dto.doc_kind }<br>
	</fieldset>
	<c:url var="doctorUpdateUrl" value="doctorUpdate.do">
		<c:param name="hos_num">${dto.hos_num }</c:param>
		<c:param name="doc_name">${dto.doc_name }</c:param>
	</c:url>
	<a href="${doctorUpdateUrl }">수정하기</a>
	<c:url var="doctorDeleteUrl" value="doctorDelete.do">
		<c:param name="hos_num">${dto.hos_num }</c:param>
		<c:param name="doc_name">${dto.doc_name }</c:param>
	</c:url>
	<a href="${doctorDeleteUrl }">삭제하기</a>
</c:forEach>
</body>
</html>