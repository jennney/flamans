<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#no_up{
	width: 700px;
	margin: 0px auto;
	border-spacing: 0px;
}
#no_upth1,#no_uptd1{
	border-top: 3px solid #BDBDBD;
	border-bottom: 3px solid #BDBDBD;
	height: 30px;
}
#no_wrup1{
	width: 200px;
}
#no_wrup1{
	width: 500px;
}
#no_uptx{
	height: 500px;
	border-bottom: 2px solid #BDBDBD;
}
.ckeditor{
	width: 700px;
	height: 500px;
	resize: none;
}
#no_uptd2{
	border-top: 2px solid #BDBDBD;
	height: 30px;
}
#no_uptd3{
	border-bottom: 2px solid #BDBDBD;
	height: 30px;
}
#no_uptd4{
	height: 30px;
	text-align: right;
}
#no_uptd5{
	height: 30px;
	text-align: left;
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
		}else if(no_content=""){
			window.alert('내용을 입력하세요');
			return false;
		}
	}
</script>
</head>
<body>
<h2>공지사항</h2>
<form name="no_Update" action="no_Update.do" method="post">
	<table id="no_up">
		<tr>
			<td id="no_upth1">SUBJECT</td>
			<td id="no_uptd1"><input type="text" name="no_subject" value="${ndto.no_subject}"></td>
		</tr>
		<tr>
			<td colspan="2"><textarea name="no_content" id="no_content">${ndto.no_content}</textarea></td>
		</tr>
		<tr>	
			<td id="no_uptd2">첨부파일1</td>
			<td id="no_uptd2"><input type="file" name="upload"  value="${ndto.no_file1}"></td>
		</tr>
		<tr>	
			<td id="no_uptd3">첨부파일2</td>
			<td id="no_uptd3"><input type="file" name="upload" value="${ndto.no_file2}"></td>
		</tr>
		<tr>
			<tr>
				<td id="no_uptd5"><input type="button" value="목록으로" onclick="location.href='no_List.do'"></td>
				<td id="no_uptd4"><input type="hidden" name="no_idx" value="${ndto.no_idx}"><input type="submit" value="수정하기"></td>
			<tr>
		</tr>
	</table>
</form>
</body>
</html>