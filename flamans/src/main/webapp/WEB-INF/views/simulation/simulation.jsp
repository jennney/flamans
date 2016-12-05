<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>
	function fileUpload(fileValue) {
		var file = fileValue.files;
		var fileName = document.getElementById('simul').value;
		var reader = new FileReader();

		var fileExtSub = fileName.substring(fileName.lastIndexOf(".") + 1);

		var check = false;
		var fileExt = [ 'jpg', 'png', 'gif', 'JPG', 'PNG', 'GIF', 'JPEG' ];
		for (var i = 0; i < fileExt.length; i++) {
			if (fileExtSub == fileExt[i]) {
				check = true;
			}
		}
		if (!check) {
			window.alert('이미지 파일만 첨부 가능합니다.');
			document.getElementById('simul').value = '';
		}

		reader.onload = function(rst) {
			$('#simulImg').attr('src', rst.target.result);
		}
		reader.readAsDataURL(file[0]);
	}
	
</script>
</head>
<body>
	<input type="file" name="upload" id="simul" onchange="fileUpload(this)">
	<div>
		<img src="" id="simulImg" width="500" height="500" alt="시물레이션사진" usemap="#simul_map">
		<map id="simul_map" name="simul_map">
			<area alt="왼쪽눈" coords="135,97,235,166" shape="rect" href="no_List.do">
			<area alt="오른쪽눈" coords="298,102,406,170" shape="rect" href="company_join.do">
			<area alt="코" coords="194,180,346,287" shape="rect"  href="#">
			<area alt="입" coords="166,300,358,391" shape="rect" href="#">
		</map>
	</div>
</body>
</html>