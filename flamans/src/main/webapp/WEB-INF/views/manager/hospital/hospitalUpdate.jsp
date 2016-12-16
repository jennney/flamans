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
	window.open('addrFind.do', '주소찾기', 'width=400,height=400,top=100,left=200');
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
</head>
<body>
<div id="wrapper">
<%@ include file="/WEB-INF/views/myIndex.jsp"%>
	<div id="page-wrapper">		
		<h2>병원 업데이트 페이지</h2>
		<c:set var="dto" value="${dto }"/>
		<form name="hospitalInfo" action="hospitalUpdate.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="hos_num" value="${sessionScope.cm_number }">
			 이름 : <input type="text" name="hos_name" value="${dto.hos_name }" class="form-control" readonly><br>
			 전문기술 : ${sp } <br>
			 주소 : <input type="text" name="hos_addr" value="${dto.hos_addr }" class="form-control" readonly> <input type="button" value="검색" onclick="addrFind();" class="btn btn-default"><br>
			 이미지 : <input type="file" name="upload" id="file" class="form-control" onchange="fileCheck()">
			 	<input type="hidden" name="hos_img" value="${dto.hos_img }">
			 <br>
			 상세내용 : <textarea rows="4" cols="200" name="hos_content" class="form-control">${dto.hos_content }</textarea><br>
			 찾아오는길 : <textarea rows="2" cols="200" name="hos_mapinfo" class="form-control">${dto.hos_mapinfo }</textarea><br>
			<input type="submit" value="수정하기" class="btn btn-default"> <input type="reset" value="초기화" class="btn btn-default">
		</form>
	</div>
</div>		
</body>
</html>