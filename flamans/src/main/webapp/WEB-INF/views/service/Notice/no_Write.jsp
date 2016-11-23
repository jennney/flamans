<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글쓰기</title>
<style>
#no_wr{
	width: 700px;
	margin: 0px auto;
	border-spacing: 0px;
}
#no_wrth1,#no_wrtd1{
	border-top: 3px solid #BDBDBD;
	border-bottom: 3px solid #BDBDBD;
	height: 30px;
}
#no_wrth1{
	width: 200px;
}
#no_wrtd1{
	width: 500px;
}
#no_wrtx{
	height: 500px;
	border-bottom: 2px solid #BDBDBD;
}
.ckeditor{
	width: 700px;
	height: 500px;
	resize: none;
}
#no_wrtd2{
	border-top: 2px solid #BDBDBD;
	height: 30px;
}
#no_wrtd3{
	border-bottom: 2px solid #BDBDBD;
	height: 30px;
}
#no_wrtd4{
	height: 30px;
	text-align: right;
}
h2{
	text-align: center;
}
</style>
</head>
<body>
<form name="no_Write" action="no_Write.do" method="post" enctype="multipart/form-data">
<h2> 공지사항 </h2>
	<table id="no_wr">
		<tr>
			<th id="no_wrth1">SUBJECT</th>
			<td id="no_wrtd1"><input type="text" name="no_subject"></td>
		</tr>
		<tr>
			<td colspan="2" id="no_wrtx"><textarea name="no_content" class="ckeditor"></textarea></td>
		</tr>
		<tr>	
			<td id="no_wrtd2">첨부파일1</td>
			<td id="no_wrtd2"><input type="file" name="upload"></td>
		</tr>
		<tr>	
			<td id="no_wrtd3">첨부파일2</td>
			<td id="no_wrtd3"><input type="file" name="upload"></td>
		</tr>
		<tr>
			<td id="no_wrtd4" colspan="2"><input type="submit" value="작성"> <input type="reset" value="다시작성"></td>
		</tr>
	</table>
</form>
</body>
</html>