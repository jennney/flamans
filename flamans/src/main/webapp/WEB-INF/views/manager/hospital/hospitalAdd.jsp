<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>병원 정보 등록 하기</h2>
<form name="hospitalAdd" action="hospitalAdd.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="hos_num" value="${sessionScope.cm_number }">
	 이름 : <input type="text" name="hos_name"><br>
	 주소 : <input type="text" name="hos_addr"><br>
	 이미지 : <input type="file" name="upload"><br>
	 상세내용 : <textarea rows="4" cols="200" name="hos_content"></textarea><br>
	 찾아오는길 : <textarea rows="2" cols="200" name="hos_mapinfo"></textarea><br>
	<input type="submit" value="등록하기"> <input type="reset" value="초기화">
</form>
</body>
</html>