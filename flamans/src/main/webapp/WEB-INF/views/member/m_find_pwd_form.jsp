<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/flamans/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="/flamans/js/httpRequest.js"></script>
<script>
function openEmail() {

	var email = document.pwd.m_email.value;
	
	if(email==null||email==''){
		window.alert('이메일을 작성해주세요');
		return false;
	}
		
	var params='email='+email;
	sendRequest('m_emailCheck.do', params, emailCheckResult, 'GET');
}
var data_global=null;
function emailCheckResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			data=data.trim();
			/* document.member_join.m_email.value=data;
			window.alert(data); */
			data_global=data;
			window.alert('이메일을 발송하였습니다.');		
		}
	}
}
function emailCheckOk() {
	var number = document.getElementById("emailCheck");
	var  verification = data_global;
	
	if(number.value==''){
		window.alert('인증번호를 입력하세요');
		return;
	}
	else if(number.value!=verification){
		window.alert('틀린번호입니다. 인증번호를 다시 입력하세요.');
		number.value='';
	}
	else if(number.value==verification){
		window.alert('인증완료');
		document.pwd.email_check.value='인증완료';
		window.self.close();
	}
}
</script>
<style>
label{
	float: left;
	width: 80px;
}
#kk{
 	width:500px;
  	height:350px;
   	border-color: green;
   	margin: 80px auto;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp"%>
<div id="kk">
	<h3>Password 찾기</h3><br><br>
	  <form class="form-inline" name="pwd" action="member_find_pwd.do" method="post">
	      <label for="id">id:</label>
	      <input type="text" class="form-control" name="m_id" placeholder="Enter ID"><br>
	      <label for="pwd">Email:</label>
	      <input type="text" class="form-control" name="m_email" placeholder="Enter Email">
	      <input type="button" onclick="openEmail()" value="인증메일 보내기" class="btn btn-default" ><br>
	      <input id="emailCheck" type="text" name="numberCheck" placeholder="인증번호 7자리입력" class="form-control">
	      <label for="pwd"></label><input type="hidden" name="email_check">
		  <input type="button" value="인증확인" onclick="emailCheckOk()" class="btn btn-default" ><br>
	    <button type="submit" class="btn btn-default" style="float: right;">Submit</button><br><br>

	    
	</form>
</div>
<%@ include file="/WEB-INF/views/footer.jsp"%> 
</body>
</html>