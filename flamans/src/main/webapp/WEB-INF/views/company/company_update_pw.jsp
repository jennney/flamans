<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/myweb/js/httpRequest.js"></script>
<script>
function pwdCheck(){
	var pwd = document.updatePwd.pwd.value;
	var cm_pwd = document.updatePwd.cm_pwd.value;
	
	if(pwd.length <6){
		var spanTag2=document.getElementById('pwdMsg');
		spanTag2.innerHTML='비밀번호는 6자 이상이어야 합니다.';
		document.updatePwd.cm_pwd_check.value='';
	}
	if(pwd.length >5 && cm_pwd.length >5){
		if(pwd==cm_pwd){
			var spanTag2=document.getElementById('pwdMsg');
			spanTag2.innerHTML='';
			document.updatePwd.cm_pwd_check.value='인증완료';
		}else{
			window.alert('비밀번호가 다릅니다.')
		}
		
	}
} 
</script>
<style>
#label_pwd{
	float: left;
	width: 80px;
}
.container{
 	width:500px;
  	height:300px;
  	margin-top: 30px;
}
#aa{
	width:500px;
}
</style>
</head>
<body>
<div class="container" >
	  <h3>비밀번호 변경</h3><br><br>
	   <form class="form-inline" name="updatePwd" action="company_update_pw.do" method="post" >
	  		<c:if test="${!empty sessionScope.username && empty cm_id }">
				<input type="hidden" name="cm_id" value="${dto.cm_id}">
	  			<input type="hidden" name="cm_email" value="${dto.cm_email}">
			</c:if>
			<c:if test="${!emptyc m_id && empty sessionScope.username}">
				<input type="hidden" name="cm_id" value="${cm_id}">
	  			<input type="hidden" name="cm_email" value="${cm_email}">
			</c:if>
	      <label id="#label_pwd" for="password">Password:</label>
	      <input type="password" class="form-control" name="pwd" placeholder="Enter Password" onkeyup="pwdCheck()"><br>
	      <div aa="pwdMsg"><span id="pwdMsg"></span></div>
	      <label id="#label_pwd" for="password">password:</label>
	      <input type="password" class="form-control" name="cm_pwd" placeholder="Enter Password"  onkeyup="pwdCheck()">
	      <br><br>
	      <input type="text" name="cm_pwd_check" readonly class="form-control" style="background-color: white;">
	    <button type="submit" class="btn btn-default" style="float: right; ba">Submit</button><br><br>
		</form>
	  
</div>
</body>
</html>