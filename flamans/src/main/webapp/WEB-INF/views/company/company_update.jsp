<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>flamans 회원 계정</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
#label_update{
	float: left;
	width: 100px;
}
</style>
</head>
<body onload="updateSet('${dto}')">
<form name="company_update" action="company_update.do" method="post" class="form-inline">
<table>
<c:set var="update" value="${dto}"/>
	<tr>
		<td>이름</td>
		<td><input type="text" name="cm_name" value="${dto.cm_name}" class="form-control"></td>
	</tr>
	
	<tr>
		<td>E-mail</td>
		<td><input type="text" name="email1" onclick="yearmonth()" class="form-control">@
		<input type="text" name="email2" class="form-control">
         <select name="selEmail" onchange="email3(this.form)" class="form-control">
         <option value="" selected>직접입력</option>
         <option value="naver.com">naver.com</option>
         <option value="nate.com">nate.com</option>
         <option value="hotmail.com">hotmail.com</option>
         <option value="hanmail.com">hanmail.com</option>
         <option value="google.com">google.com</option>
         </select>
         <input type="hidden" name="m_email">       
		</td>
	</tr>
	<tr>
		<td></td>
		<td><button type="reset" onclick="openEmail()" class="btn btn-default">인증메일 보내기</button></td>
	</tr>	
	<tr>
		<td></td>
		<td><input id="emailCheck" type="text" name="numberCheck" placeholder="인증번호 7자리입력" onclick="yearmonth()" class="form-control">
		<input type="hidden" name="email_check" id="email_check">
		<button type="reset" onclick="emailCheckOk()" class="btn btn-default">인증확인</button>
		</td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td><select name="kind" class="form-control">
         <option value="010">010</option>
         <option value="011">011</option>
         <option value="018">018</option>
         <option value="019">019</option>
         </select>-
         <input type="text" class="form-control" name="number1" size="4" required onkeypress="return fn_press(event, 'numbers');" onkeydown="fn_press_han(this);" style="ime-mode:disabled;" >-
         <input type="text" class="form-control" name="number2" size="4" required onkeypress="return fn_press(event, 'numbers');" onkeydown="fn_press_han(this);" style="ime-mode:disabled;" >
         </td>
      </tr>   
	
	<tr>
		<td colspan="2" align="center">
		<button type="reset" class="btn btn-default">다시작성</button>
		<button type="submit" class="btn btn-default">회원정보 수정</button></td>
	</tr>
</table>
</form>
</body>
</html>

