<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function emailCheckOk() {
		var number = document.getElementById("emailCheck");
		var verification = '${authNum}';
		window.alert(number.value + '  ' + verification + ' ㅎㅎ ');
		if (number.value == '') {
			window.alert('인증번호를 입력하세요');
			return;
		} else if (number.value != verification) {
			window.alert('틀린번호입니다. 인증번호를 다시 입력하세요');
			number.value = '';
		} else if (number.value == verification) {
			window.alert('인증완료');
			opener.document.email.result.value = '인증완료';
			window.self.close();
		}
	}
</script>
</head>
<body>
	<fieldset>
		<legend>인증번호</legend>
		<form name="emailCheck" action="emailCheck.do" method="post">
			<input type="hidden" name="email" value="${email }"> <input
				type="submit" value="인증번호 전송">
		</form>
		<input id="emailCheck" type="text" name="numberCheck"
			placeholder="인증번호 7자리입력"> <input type="button" value="인증확인"
			onclick="emailCheckOk()">

	</fieldset>
</body>
</html>
