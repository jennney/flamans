<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="/flamans/js/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
function addrFind(){
	window.open('hotAddrFind.do', '주소검색', 'width="600",height="500",top="200",left="200"');
}
</script>
<style>
body{
	margin-left: 50px;
}
.form-control{
	width: 50%;
}
</style>
</head>
<body>
<h2>호텔 정보 등록 하기</h2>
<form name="hotelInfo" action="hotelAdd.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="hot_num" value="${sessionScope.cm_number }">
	 이름 : <input type="text" name="hot_name" class="form-control"><br>
	 주소 : <input type="text" name="hot_addr" class="form-control" readonly><input type="button" value="검색" class="btn btn-default" onclick="addrFind();"><br>
	 이미지 : <input type="file" name="upload" class="form-control"><br>
	 상세내용 : <textarea rows="4" cols="200" name="hot_content" class="form-control"></textarea><br>
	 찾아오는길 : <textarea rows="2" cols="200" name="hot_mapinfo" class="form-control"></textarea><br>
	 등급 : <select name="hot_grade">
	 				<option value="1">1성</option>
	 				<option value="2">2성</option>
	 				<option value="3">3성</option>
	 				<option value="4">4성</option>
	 				<option value="5">5성</option>
	 		</select><br>
	 부대시설 
	 <input type="checkbox" name="hot_etc" value="wifi"> 무료 와이파이
	 <input type="checkbox" name="hot_etc" value="parking"> 무료 주차장
	 <input type="checkbox" name="hot_etc" value="restaurant"> 레스토랑
	 <input type="checkbox" name="hot_etc" value="pool"> 실내 수영장
	 <input type="checkbox" name="hot_etc" value="fitness"> 피트니스
	 <input type="checkbox" name="hot_etc" value="laundry"> 세탁 서비스
	 <br>
	<!--  
	 부대시설 : 무료 와이파이, 무료 주차장, 레스토랑 , 실내수영장, 피트니스 , 세탁
	 --> 
	<input type="submit" value="등록하기" class="btn btn-default"> <input type="reset" value="초기화" class="btn btn-default">
</form>
</body>
</html>