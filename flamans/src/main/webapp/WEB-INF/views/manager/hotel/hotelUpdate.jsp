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
<h2>호텔 정보 수정</h2>
<c:set var="dto" value="${dto }"/>
<form name="hotelUpdate" action="hotelUpdate.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="hot_num" value="${dto.hot_num }">
	 이름 : <input type="text" name="hot_name" value="${dto.hot_name }"><br>
	 주소 : <input type="text" name="hot_addr" value="${dto.hot_addr }"><br>
	 이미지 : <input type="file" name="upload"><br>
	 상세내용 : <textarea rows="4" cols="200" name="hot_content">${dto.hot_content }</textarea><br>
	 찾아오는길 : <textarea rows="2" cols="200" name="hot_mapinfo">${dto.hot_mapinfo }</textarea><br>
	 등급 : ${option } <br>
	 방정보 : <input type="text" name="hot_roominfo" value="${dto.hot_roominfo }"><br>
	 옵션 :	<input type="text" name="hot_option" value="${dto.hot_etc }"><br>
	 부대시설 <textarea rows="4" cols="200" name="hot_etc"></textarea><br>
	<input type="submit" value="등록하기"> <input type="reset" value="초기화">
</form>
</body>
</html>