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
	border-right: 3px solid #BDBDBD;
}
#no_wrtd1{
	width: 500px;
}
#no_wrtx{
	border-bottom: 2px solid #BDBDBD;
}
.ckeditor{
	width: 700px;
	resize: none;
}
#no_wrtd2,#no_wrth2{
	border-top: 2px solid #BDBDBD;
	border-bottom: 2px solid #BDBDBD;
	height: 30px;
}
#no_wrth2,#no_wrth3{
	border-right: 2px solid #BDBDBD;
}
#no_wrtd3,#no_wrth3{
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
<script type="text/javascript" src="js/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script>
	window.onload=function(){
	    CKEDITOR.replace('no_content', {
	   		filebrowserUploadUrl : "notice_Uplaod.do",
	   		height: "400"
	    });
	    
	    CKEDITOR.on('dialogDefinition', function (ev) {
	           var dialogName = ev.data.name;
	           var dialog = ev.data.definition.dialog;
	           var dialogDefinition = ev.data.definition;
	           if (dialogName == 'image') {
	
	               dialogDefinition.removeContents('advanced');
	               dialogDefinition.removeContents('Link');
	           }
	       });
	 }
	function check(){
		
		var no_subject = $(':input[name=no_subject]').val();
		var no_content = $(':input[name=no_content]').val();
		
		if(no_subject==""){
			window.alert('제목을 입력하세요');
			return false;
		}
		if(no_content=="" || no_content==null){
			window.alert('내용을 입력하세요');
			return false;
		}
	}
</script>
</head>
<body>
<form name="no_Write" action="no_Write.do" method="post" enctype="multipart/form-data" onsubmit="return check()">
<h2> 공지사항 </h2>
	<table id="no_wr">
		<tr>
			<th id="no_wrth1">SUBJECT</th>
			<td id="no_wrtd1"><input type="text" name="no_subject" size="50"></td>
		</tr>
		<tr>
			<td colspan="2" id="no_wrtx"><textarea name="no_content" id="no_content"></textarea></td>
		</tr>
		<tr>	
			<th id="no_wrth2">첨부파일1</th>
			<td id="no_wrtd2"><input type="file" name="upload"></td>
		</tr>
		<tr>	
			<th id="no_wrth3">첨부파일2</th>
			<td id="no_wrtd3"><input type="file" name="upload"></td>
		</tr>
		<tr>
			<td><input type="button" value="목록으로" onclick="location.href='no_List.do'"></td>
			<td id="no_wrtd4" colspan="1"><input type="submit" value="작성"><input type="reset" value="다시작성"></td>
		</tr>
	</table>
</form>
</body>
</html>