<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/flamans/js/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
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
#ta_ca{
	width: 75%;
}
input[type=text]{
	width: 75%;
}
#button_list{
	width: 75%;
	text-align: center;
}
</style>
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
				<label>이미지 : </label> <input type="file" name="upload" id="file" onchange="fileCheck()" class="btn btn-default"><br>
				<label>학력 :</label> <input type="text" name="doc_level" value=${dto.doc_level } class="form-control"><br>
				<label>경력 </label><textarea rows="4" cols="300" name="doc_career" class="form-control" id="ta_ca">${dto.doc_career }</textarea><br>
				<label>기타사항 : </label><input type="text" name="doc_etc" value="${dto.doc_etc }" class="form-control"><br>
				<label>진료 과목 : </label><input type="text" name="doc_kind" value="${dto.doc_kind }" class="form-control"><br>
				<div id="button_list">
					<input type="submit" value="등록" class="btn btn-default">
					<input type="reset" value="다시작성" class="btn btn-default">
				</div>
			</fieldset>
		</form>
	</div>
</div>		
</body>
</html>