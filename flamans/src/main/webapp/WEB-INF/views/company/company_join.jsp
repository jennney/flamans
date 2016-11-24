<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script>
 function id_check(){
	 var cm_id=document.company_join.cm_id.value;
	 var params='cm_id='+cm_id;
	 sendRequest('company_id_check.do',params,idCheckResult,'POST');
 }
 
 function idCheckResult(){
	 if(XHR.readyState==4){
		 if(XHR.status==200){
			 var data=XHR.responseText;
			 var spanTag=document.getElementById('companyMsg');
			 spanTag.innerHTML=data;
		 }
	 }
 }
 
 function email3(userinput) {
	 var email3 = userinput.selEmail.value;
	 if(email3 =="0"){
		userinput.email2.value = '';
		userinput.email2.readOnly = false;
	 }else{
		 userinput.email2.value = email3;
		 userinput.email2.readOnly= true;
	 }
 }
	 function pwdCheck(){
		   var m_pwd = document.company_join.cm_pwd.value;
		   if(m_pwd.length <6 ){
		      var spanTag2=document.getElementById('pwdMsg');
		      spanTag2.innerHTML='비밀번호는 6자 이상이어야 합니다';
		   }
		   if(m_pwd.length >5){
		      var spanTag2=document.getElementById('pwdMsg');
		      spanTag2.innerHTML='';
		   }
		}
	
 
</script>

</head>
<body>
<h2>업체 회원가입</h2>
<form name="company_join" action="company_join.do" method="post">
<table>
	<tr>
		<th>업체명</th>
		<td><input type="text" name="cm_name"></td>
	</tr>
	<tr>
		<th>업종</th>
		<td><select name="kind">
		<option value="병원">병원</option>
		<option value="호텔">호텔</option>
		</select>
		</td>
	</tr>
	<tr>
		<th>사업자 번호</th>
		<td><input type="text" name="number1">-<input type="text" name="number2">-<input type="text" name="number3"></td>
	</tr>
	<tr>
		<th>ID</th>
		<td>
			<input type="hidden" name="joinCheck" value="N">
			<input type="text" name="cm_id" onkeyup="id_check()">
			<span id="companyMsg"></span>
		</td>
	</tr>
	<tr>
		<th>Password</th>
	    <td><input type="password" name="cm_pwd" onkeyup="pwdCheck()">
     	 <span id="pwdMsg"></span>
     	 </td>
	</tr>
	<tr>
		<th>E-Mail</th>
		<td>
			<input type="text" name="email1">@<input type="text" name="email2">
			<select name="selEmail" onchange="email3(this.form)" >
			<option value="선택">선택</option>
			<option value="직접입력">직접입력</option>
			<option value="naver.com">naver.com</option>
			<option value="hanmail.net">hanmail.net</option>
			<option value="hotmail.com">hotmail.com</option>
			<option value="hanmail.com">hanmail.com</option>
			<option value="google.com">google.com</option>
			</select>
		</td>
		
	</tr>
	<tr>
		<th>전화번호</th>
		<td><input type="text" name="cm_tel"></td>
	</tr>
	</table>
	<p><input type="reset" value="다시 작성"> <input type="submit" value="가입"></p>
</form>
</body>
</html>