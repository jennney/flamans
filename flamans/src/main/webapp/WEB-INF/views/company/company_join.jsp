<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/httpRequest.js"></script>
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
	var data_global = null;
	function emailCheckResult() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var data = XHR.responseText;
				data = data.trim();
				/* document.member_join.m_email.value=data;
				window.alert(data); */
				data_global = data;
				window.alert('이메일을 발송하였습니다.');
			}
		}
	}

	function emailCheckOk() {
		var number = document.getElementById("emailCheck");
		var verification = data_global;

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
		function yearmonth() {

			Month = document.getElementById("Month");
			Year = document.getElementById("Year");
			Day = document.getElementById("Day");

			var cm_birthday = Year.value + Month.value + Day.value;

			document.company_join.cm_birthday.value = cm_birthday;

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
				</select></td>
			</tr>
			<tr>
				<th>사업자 번호</th>
				<td><input type="text" name="number1">-<input
					type="text" name="number2">-<input type="text"
					name="number3"></td>
			</tr>
			<tr>
				<th>ID</th>
				<td><input type="hidden" name="joinCheck" value="N"> <input
					type="text" name="cm_id" onkeyup="id_check()"> <span
					id="companyMsg"></span></td>
			</tr>
			<tr>
				<th>Password</th>
				<td><input type="password" name="cm_pwd" onkeyup="pwdCheck()">
					<span id="pwdMsg"></span> <input type="hidden" name="cm_pwd_check">
				</td>
			</tr>
			<tr>
				<th>E-Mail</th>
				<td><input type="text" name="email1" onclick="yearmonth()">@<input
					type="text" name="email2"> <select name="selEmail"
					onchange="email3(this.form)">
						<option value="선택">선택</option>
						<option value="직접입력">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="hanmail.com">hanmail.com</option>
						<option value="google.com">google.com</option>
				</select> <input type="hidden" name="cm_email"> <input type="button"
					onclick="openEmail()" value="인증메일 보내기"></td>
			</tr>
			<tr>
				<td><input id="emailCheck" type="text" name="numberCheck"
					placeholder="인증번호 7자리입력"> <input type="hidden"
					name="email_check"> <input type="button" value="인증확인"
					onclick="emailCheckOk()"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="cm_tel"></td>
			</tr>
		</table>
		<p>
			<input type="reset" value="다시 작성"> <input type="submit"
				value="가입">
		</p>
	</form>
</body>
</html>