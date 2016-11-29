<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#red{
	color: red;
}
</style>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script>
function check(){
	
	var savepwd = $(':input[name=qna_savepwd]').val();
	var userpwd = $(':input[name=qna_pwd]').val();
	
	if(userpwd==""){
		window.alert('비밀번호를 입력하세요');
		return false;
		
	}
	
	if(userpwd != savepwd){
		window.alert('비밀번호가 맞지않습니다.');
		return false;
	}
}
</script>
</head>
<body>
<form name="qna_Pwd" action="qna_PwdContent.do" method="post" onsubmit="return check()">
	<input type="hidden" name="qna_idx" value="${qna_idx}">
	<input type="hidden" name="qna_kind" value="${qna_kind}">
	<input type="hidden" name="qna_savepwd" value="${dbpwd}">
	<div>
		이 글은  비밀글 입니다. <span id="red">비밀번호를 입력해 주세요</span>
	</div>
		비밀번호
	<input type="password" name="qna_pwd">
	<input type="button" value="목록으로" onclick="location.href='qna_List.do?qna_kind=${qna_kind}'">
	<input type="submit" value="확인">
</form>
</body>
</html>