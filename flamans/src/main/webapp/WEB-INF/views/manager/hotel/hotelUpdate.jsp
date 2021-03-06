<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	window.open('hotAddrFind.do', '주소검색', 'width=400,height=400,top=100,left=200');
}
function fileCheck(){
	   var fileext = document.getElementById('file').value; //input type="file" id="file"
	   fileext = fileext.slice(fileext.indexOf(".")+1).toLowerCase(); // 파일 확장자를 잘라내고 비교를 위해 소문자로 만듦
	   
	   if(fileext != "jpg" && fileext !="png" && fileext != "gif" && fileext != "bmp"){
	      alert('이미지 파일만 등록이 가능합니다.');
	      document.getElementById('file').value=null;
	      return false;
	   }
	   
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
<div id="wrapper">
<%@ include file="/WEB-INF/views/myIndex.jsp"%>
	<div id="page-wrapper">
		<h2>호텔 정보 수정</h2>
		<c:set var="dto" value="${dto }"/>
		<form name="hotelInfo" action="hotelUpdate.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="hot_num" value="${dto.hot_num }">
			<label>이름</label> <input type="text" class="form-control" name="hot_name" value="${dto.hot_name }" readonly><br>
			<label>주소</label> <input type="text" class="form-control" name="hot_addr" value="${dto.hot_addr }" readonly><input type="button" value="검색" class="btn btn-default" onclick="addrFind();"><br>
			<label>이미지</label> 
			<input type="hidden" name="hot_img" value="${dto.hot_img }">
			<input type="file" class="btn btn-default" name="upload" id="file" onchange="fileCheck()"><br>
			<label>상세정보</label> <textarea rows="4" class="form-control" cols="200" name="hot_content">${dto.hot_content }</textarea><br>
			<label>찾아오는길</label> <textarea rows="2" class="form-control" cols="200" name="hot_mapinfo">${dto.hot_mapinfo }</textarea><br>
			<label>등급</label> ${grade } <br>
			<label>부대시설</label> ${etcs }<br>
			<input type="submit" class="btn btn-default" value="등록하기"> <input type="reset" class="btn btn-default" value="초기화">
		</form>
	</div>
</div>
</body>
</html>