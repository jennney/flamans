<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	function openEmail() {
		var email = document.email.email.value;
		window.open('emailCheck.do?email='+email,'emailCheckForm','width=300,height=250,left=200,top=100');
	}

</script>
<body>
<form name="email">
	<input type="text" name="email" placeholder="이메일">
	<input type="button" value="인증하기" onclick="openEmail()">
</form>
</body>
</html>
