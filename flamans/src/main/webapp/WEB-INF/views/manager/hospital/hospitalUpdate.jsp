<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function addrFind(){
	window.open('addrFind.do', '주소찾기', 'width="400",height="400"');
}
</script>
</head>
<body>
<h2>병원 업데이트 페이지</h2>
<c:set var="dto" value="${dto }"/>
<form name="hospitalInfo" action="hospitalUpdate.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="hos_num" value="${sessionScope.cm_number }">
	 이름 : <input type="text" name="hos_name" value="${dto.hos_name }"><br>
	 주소 : <input type="text" name="hos_addr" value="${dto.hos_addr }"> <input type="button" value="검색" onclick="addrFind();"><br>
	 이미지 : <input type="file" name="upload">
	 	<input type="hidden" name="hos_img" value="${dto.hos_img }">
	 <br>
	 상세내용 : <textarea rows="4" cols="200" name="hos_content">${dto.hos_content }</textarea><br>
	 찾아오는길 : <textarea rows="2" cols="200" name="hos_mapinfo">${dto.hos_mapinfo }</textarea><br>
	<input type="submit" value="수정하기"> <input type="reset" value="초기화">
</form>
</body>
</html>