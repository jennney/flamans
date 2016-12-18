<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/httpRequest.js"></script>
<link rel = "stylesheet" type = "text/css" href="css/mainLayout.css">
<script>
function id_check() {
	var cm_id = document.company_join.cm_id.value;
	var params = 'cm_id=' + cm_id;
	sendRequest('company_id_check.do', params, idCheckResult, 'POST');
}

function idCheckResult() {
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var data = XHR.responseText;
			var spanTag = document.getElementById('companyMsg');
			spanTag.innerHTML = data;
		}
	}
}

function pwdCheck() {
	var m_pwd = document.company_join.cm_pwd.value;
	if (m_pwd.length < 6) {
		var spanTag2 = document.getElementById('pwdMsg');
		spanTag2.innerHTML = '비밀번호는 6자 이상이어야 합니다.';
		document.company_join.cm_pwd_check.value = '';
	}
	if (m_pwd.length > 5) {
		var spanTag2 = document.getElementById('pwdMsg');
		spanTag2.innerHTML = '';
		document.company_join.cm_pwd_check.value = '인증완료';
	}
}

function email3(userinput) {
	var selval = userinput.selEmail.value;
	if (selval == "") {
		//직접선택이면 메일란을 보인다.
		userinput.email2.style.display = 'inline';
		userinput.email2.value = "";
		userinput.email2.focus();
	} else {
		//콤보에서 선택하는 경우에는 메일주소 입력란을 안보이게 하고 메일주소란에 선택 메일주소를 넣어준다.
		userinput.email2.style.display = 'none';
		userinput.email2.value = selval;
	}
}

function openEmail() {

	var email = document.company_join.email1.value;
	email += '@';
	email += document.company_join.email2.value;
	document.company_join.cm_email.value = email;

	var params = 'email=' + email;
	sendRequest('m_emailCheck.do', params, emailCheckResult, 'GET');
}

var data_cglobal = null;

function emailCheckResult() {
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var data = XHR.responseText;
			data = data.trim();
			/* document.member_join.m_email.value=data;
			window.alert(data); */
			data_cglobal = data;
			window.alert('이메일을 발송하였습니다.');
		}
	}
}

function emailCheckOk() {
	var number = document.getElementById("emailCheck");
	var verification = data_cglobal;

	if (number.value == '') {
		window.alert('인증번호를 입력하세요');
		return;
	} else if (number.value != verification) {
		window.alert('틀린번호입니다. 인증번호를 다시 입력하세요.');
		number.value = '';
	} else if (number.value == verification) {
		window.alert('인증완료');
		document.company_join.email_check.value = '인증완료';
		window.self.close();
	}
}
</script>
<style >
table {
   margin: 0px auto;
   border-spacing: 10px;
}
h2{
   text-align: center;
}
.all{
	border-bottom: 1.5px solid black;
	border-top : 0px;
	border-left : 0px;
	border-right: 0px;
}
.star{
	color: #FF0000;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp"%>
<section>
<div class="container">
	<div class="center">
	   <h2>회원가입</h2>
	</div>

	<form name="company_join" action="company_join.do" method="post">
		<table>
			<tr>
				<th>업체명 <span class="star">*</span></th>
				<td style="padding-left: 50px;"><input type="text" name="cm_name" class="all"></td>
			</tr>
			<tr>			    
				<th style="padding-top: 20px;">업종 <span class="star">*</span></th>
				<td style="padding-left: 50px; padding-top: 20px;"><select name="kind">
						<option value="병원">병원</option>
						<option value="호텔">호텔</option>
				</select></td>				
			</tr>		
			<tr>			    
				<th style="padding-top: 20px;">사업자 번호 <span class="star">*</span></th>
				<td style="padding-left: 50px; padding-top: 20px;"><input type="text" name="number1" class="all">-<input
					type="text" name="number2" class="all">-<input type="text"
					name="number3" class="all"></td>			    
			</tr>
			<tr>
				<th style="padding-top: 20px;">ID <span class="star">*</span></th>
				<td style="padding-left: 50px; padding-top: 20px;"><input type="hidden" name="joinCheck" value="N"> <input
					type="text" name="cm_id" onkeyup="id_check()" class="all"> <span
					id="companyMsg"></span></td>
			</tr>
			<tr>
				<th style="padding-top: 20px;">Password <span class="star">*</span></th>
				<td style="padding-left: 50px; padding-top: 20px;"><input type="password" name="cm_pwd" onkeyup="pwdCheck()" class="all">
					<span id="pwdMsg"></span> <input type="hidden" name="cm_pwd_check" class="all">
				</td>
			</tr>
			<tr>
				<th style="padding-top: 20px;">E-Mail <span class="star">*</span></th>
				<td style="padding-left: 50px; padding-top: 20px;"><input type="text" name="email1" onclick="yearmonth()" class="all">@<input
					type="text" name="email2" class="all"> <select name="selEmail"
					onchange="email3(this.form)">
						<option value="선택">선택</option>
						<option value="직접입력">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="hanmail.com">hanmail.com</option>
						<option value="google.com">google.com</option>
				</select> <input type="hidden" name="cm_email"> 
				<button class="btn btn-default" value="인증메일 보내기" onclick="openEmail()">인증메일 보내기</button></td>
			</tr>
			<tr >
				<td style="padding-left: 149px; padding-top: 20px;" colspan="4">
				<input id="emailCheck" type="text" name="numberCheck" placeholder="인증번호 7자리입력" class="all">
					<input type="hidden" name="email_check" > 
				<button class="btn btn-default" value="인증확인" onclick="emailCheckOk()" >인증확인</button>
			</tr>
			<tr>
				<th style="padding-top: 20px;">전화번호 <span class="star">*</span></th>
				<td style="padding-top: 20px; padding-left: 50px;"><input type="text" name="cm_tel" class="all"></td>
			</tr>
		</table>
		<p align="center" style="padding-top: 20px;">
		<button class="btn btn-default" type="reset" value="다시 작성">다시 작성</button>
		<button class="btn btn-default" type="submit" value="회원 가입">회원 가입</button>
		</p>
	</form>
	</div>
</section>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>