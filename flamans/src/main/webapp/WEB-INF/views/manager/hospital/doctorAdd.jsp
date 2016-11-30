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

<h2>의사 등록 !! </h2>
<form name="doctorAdd" action="doctorAdd.do" method="post" enctype="multipart/form-data">
	<fieldset>
		<legend>의사 등록</legend>
		<input type="hidden" name="hos_num" value="${sessionScope.cm_number }">
		<label>이름 : </label> <input type="text" name="doc_name"><br>
		<label>이미지 : </label> <input type="file" name="upload"><br>
		<label>학력 :</label> <input type="text" name="doc_level"><br>
		<label>경력 </label><textarea rows="4" cols="300" name="doc_career"></textarea><br>
		<label>기타사항 : </label><input type="text" name="doc_etc"><br>
		<label>진료 과목 : </label><input type="text" name="doc_kind"><br>
		<input type="submit" value="등록"> <input type="reset" value="다시작성">
	</fieldset>
</form>
</body>
</html>