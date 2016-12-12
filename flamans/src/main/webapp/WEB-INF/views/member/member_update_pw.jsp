<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function pwdCheck(){
	var pwd = document.updatePwd.pwd.value;
	var m_pwd = document.updatePwd.m_pwd.value;
	
	if(pwd.length <6){
		var spanTag2=document.getElementById('pwdMsg');
		spanTag2.innerHTML='비밀번호는 6자 이상이어야 합니다.';
		document.updatePwd.m_pwd_check.value='';
	}
	if(pwd.length >5 && m_pwd.length >5){
		if(pwd==m_pwd){
			var spanTag2=document.getElementById('pwdMsg');
			spanTag2.innerHTML='';
			document.updatePwd.m_pwd_check.value='인증완료';
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
	   <form class="form-inline" name="updatePwd" action="member_update_pw.do" method="post" >
	  		<c:if test="${!empty sessionScope.username && empty m_id }">
				<input type="hidden" name="m_id" value="${dto.m_id}">
	  			<input type="hidden" name="m_email" value="${dto.m_email}">
			</c:if>
			<c:if test="${!empty m_id && empty sessionScope.username}">
				<input type="hidden" name="m_id" value="${m_id}">
	  			<input type="hidden" name="m_email" value="${m_email}">
			</c:if>
	      <label id="#label_pwd" for="password">Password:</label>
	      <input type="password" class="form-control" name="pwd" placeholder="Enter Password" onkeyup="pwdCheck()"><br>
	      <div aa="pwdMsg"><span id="pwdMsg"></span></div>
	      <label id="#label_pwd" for="password">password:</label>
	      <input type="password" class="form-control" name="m_pwd" placeholder="Enter Password"  onkeyup="pwdCheck()">
	      <br><br>
	      <input type="text" name="m_pwd_check" readonly class="form-control" style="background-color: white;">
	    <button type="submit" class="btn btn-default" style="float: right; ba">Submit</button><br><br>
		</form>
	  
</div>
</body>
</html>