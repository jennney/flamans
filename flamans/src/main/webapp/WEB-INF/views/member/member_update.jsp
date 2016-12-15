<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>flamans 회원 계정</title>
</head>
<body>
<form name="member_update" action="member_update.do" method="post" class="form-inline">
<table>
<c:set var="update" value="${dto}"/>
	<tr>
		<td>이름</td>
		<td><input type="text" name="m_name" value="${dto.m_name}" class="form-control"></td>
	</tr>
	<tr>
		<td>성별</td>
		<td><input type="radio" name="m_sex" value="남" class="radio">남
			<input type="radio" name="m_sex" value="여" class="radio">여</td>
	</tr>
	<tr>
		<td width="100px">생년 월 일</td>
		<td><SELECT name="Year" onchange="ChangeOptionDays('FirstSelect')" id="Year" class="form-control">
			 
		</SELECT>
		<SELECT name="Month" onchange="ChangeOptionDays('FirstSelect')" id="Month" class="form-control">
		        <OPTION value="01">Jan</OPTION>
		        <OPTION value="02">Feb</OPTION>
		        <OPTION value="03">Mar</OPTION>
		        <OPTION value="04">Apr</OPTION>
		        <OPTION value="05">May</OPTION>
		        <OPTION value="06">Jun</OPTION>
		        <OPTION value="07">Jul</OPTION>
		        <OPTION value="08">Aug</OPTION>
		        <OPTION value="09">Sep</OPTION>
		        <OPTION value="10">Oct</OPTION>
		        <OPTION value="11">Nov</OPTION>
		        <OPTION value="12">Dec</OPTION>
		</SELECT>
		<SELECT name="Day" id="Day" class="form-control">
		        <OPTION value="01">1</OPTION>
		        <OPTION value="02">2</OPTION>
		        <OPTION value="03">3</OPTION>
		        <OPTION value="04">4</OPTION>
		        <OPTION value="05">5</OPTION>
		        <OPTION value="06">6</OPTION>
		        <OPTION value="07">7</OPTION>
		        <OPTION value="08">8</OPTION>
		        <OPTION value="09">9</OPTION>
		        <OPTION value="10">10</OPTION>
		        <OPTION value="11">11</OPTION>
		        <OPTION value="12">12</OPTION>
		        <OPTION value="13">13</OPTION>
		        <OPTION value="14">14</OPTION>
		        <OPTION value="15">15</OPTION>
		        <OPTION value="16">16</OPTION>
		        <OPTION value="17">17</OPTION>
		        <OPTION value="18">18</OPTION>
		        <OPTION value="19">19</OPTION>
		        <OPTION value="20">20</OPTION>
		        <OPTION value="21">21</OPTION>
		        <OPTION value="22">22</OPTION>
		        <OPTION value="23">23</OPTION>
		        <OPTION value="24">24</OPTION>
		        <OPTION value="25">25</OPTION>
		        <OPTION value="26">26</OPTION>
		        <OPTION value="27">27</OPTION>
		        <OPTION value="28">28</OPTION>
		        <OPTION value="29">29</OPTION>
		        <OPTION value="30">30</OPTION>
		        <OPTION value="31">31</OPTION>
		</SELECT>
		<input type="hidden" name="m_birthday">
		</td>
	</tr>
	<tr>
		<td>국적</td>
		<td><select name="m_nationality" class="form-control">
		 <option value="한국">한국</option>
         <option value="미국">미국</option>
         <option value="호주">호주</option>
         <option value="영국">영국</option>
         <option value="독일">독일</option>
         <option value="터키">터키</option>
         <option value="일본">일본</option>
         <option value="중국">중국</option>
         <option value="말레이시아">말레이시아</option>
         <option value="태국">태국</option>
         <option value="기타">기타</option>
         </select></td>
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