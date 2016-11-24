<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/flamans/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="/flamans/js/httpRequest.js"></script>
<script>

function pwdCheck(){
	var m_pwd = document.member_join.m_pwd.value;
	if(m_pwd.length <6 ){
		var spanTag2=document.getElementById('pwdMsg');
		spanTag2.innerHTML='비밀번호는 6자 이상이어야 합니다.';
		document.member_join.m_pwd_check.value='';
	}
	if(m_pwd.length >5){
		var spanTag2=document.getElementById('pwdMsg');
		spanTag2.innerHTML='';
		document.member_join.m_pwd_check.value='인증완료';
	}
}

function idCheck(){
	var m_id=document.member_join.m_id.value;
	var params='m_id='+m_id;
	sendRequest('member_id_check.do', params, idCheckResult, 'GET');
}

function idCheckResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			var spanTag1=document.getElementById('idMsg');
			spanTag1.innerHTML=data;
			data=data.trim();
			if(data=='사용 가능한 ID입니다.'){
				document.member_join.m_id_check.value='인증완료';
			}
			
		}
	}
}

 
function email3(userinput){
    var selval = userinput.selEmail.value;
    if(selval==""){
     //직접선택이면 메일란을 보인다.
     userinput.email2.style.display = 'inline';
     userinput.email2.value="";
     userinput.email2.focus();
    } else {
     //콤보에서 선택하는 경우에는 메일주소 입력란을 안보이게 하고 메일주소란에 선택 메일주소를 넣어준다.
     userinput.email2.style.display = 'none'; 
     userinput.email2.value=selval;
    }
   }    

 
function openEmail() {

	var email = document.member_join.email1.value;
	email+='@';
	email+=document.member_join.email2.value;
	document.member_join.m_email.value=email;
	
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
		document.member_join.email_check.value='인증완료';
		window.self.close();
	}
}

Now = new Date();
NowDay = Now.getDate();
NowMonth = Now.getMonth();
NowYear = Now.getYear();
if (NowYear < 2000) NowYear += 1900; 
function DaysInMonth(WhichMonth, WhichYear)
{
  var DaysInMonth = 31;
  if (WhichMonth == "Apr" || WhichMonth == "Jun" || WhichMonth == "Sep" || WhichMonth == "Nov") DaysInMonth = 30;
  if (WhichMonth == "Feb" && (WhichYear/4) != Math.floor(WhichYear/4))        DaysInMonth = 28;
  if (WhichMonth == "Feb" && (WhichYear/4) == Math.floor(WhichYear/4))        DaysInMonth = 29;
  return DaysInMonth;
}

function ChangeOptionDays(Which)
{
  DaysObject = eval("document.member_join." + Which + "Day");
  MonthObject = eval("document.member_join." + Which + "Month");
  YearObject = eval("document.member_join." + Which + "Year");

  Month = MonthObject[MonthObject.selectedIndex].text;
  Year = YearObject[YearObject.selectedIndex].text;
  /**/
  alert(Year);
  /**/
  
  DaysForThisSelection = DaysInMonth(Month, Year);
  CurrentDaysInSelection = DaysObject.length;
  if (CurrentDaysInSelection > DaysForThisSelection)
  {
    for (i=0; i<(CurrentDaysInSelection-DaysForThisSelection); i++)
    {
      DaysObject.options[DaysObject.options.length - 1] = null
    }
  }
  if (DaysForThisSelection > CurrentDaysInSelection)
  {
    for (i=0; i<(DaysForThisSelection-CurrentDaysInSelection); i++)
    {
      NewOption = new Option(DaysObject.options.length + 1);
      DaysObject.add(NewOption);
    }
  }
    if (DaysObject.selectedIndex < 0) DaysObject.selectedIndex == 0;
    
}

function SetToToday(Which)
{
  DaysObject = eval("document.member_join." + Which + "Day");
  MonthObject = eval("document.member_join." + Which + "Month");
  YearObject = eval("document.member_join." + Which + "Year");

  YearObject[0].selected = true;
  MonthObject[NowMonth].selected = true;

  ChangeOptionDays(Which);

  DaysObject[NowDay-1].selected = true;
}

function WriteYearOptions()
{
  line = "";
  for (i=NowYear; i>1960; i--)
  {
    line += "<OPTION value="+i+">";
    line += i+"</OPTION>";
  }
  return line;
}

function fn_press_han(obj)
{
    //좌우 방향키, 백스페이스, 딜리트, 탭키에 대한 예외
    if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39) return;
    //obj.value = obj.value.replace(/[\a-zㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
    obj.value = obj.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
}

/* 숫자만 입력받기 */
function fn_press(event, type) {
    if(type == "numbers") {
        if(event.keyCode < 48 || event.keyCode > 57) return false;
        //onKeyDown일 경우 좌, 우, tab, backspace, delete키 허용 정의 필요
    }
}
function yearmonth(){
	
	  Month = document.getElementById("Month");
	  Year = document.getElementById("Year");
	  Day = document.getElementById("Day");
	  
	  var m_birthday=Year.value+Month.value+Day.value;
	
	  document.member_join.m_birthday.value=m_birthday;
	
}

</script>
</head>
<body onLoad="SetToToday('FirstSelect');">

<h2>회원가입</h2>
<form name="member_join" action="member_join.do" method="post">
<table>
	<tr>
		<td>ID</td>
		<td><input type="text" name="m_id" onkeyup="idCheck()" onkeydown="fn_press_han(this);">
		<span id="idMsg"></span>
		<input type="text" name="m_id_check">
		</td>
	</tr>
	<tr>
		<td>Password</td>
		<td><input type="password" name="m_pwd" onkeyup="pwdCheck()">
		<span id="pwdMsg"></span>
		<input type="text" name="m_pwd_check">
		</td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="m_name"></td>
	</tr>
	<tr>
		<td>성별</td>
		<td><input type="radio" name="m_sex" value="남" checked>남
			<input type="radio" name="m_sex" value="여">여</td>
	</tr>
	<tr>
		<td>생년 월 일</td>
		<td><SELECT name="Year" onchange="ChangeOptionDays('FirstSelect')" id="Year">
	        <script>
	                document.write(WriteYearOptions());
	      	</script>
		</SELECT>
		<SELECT name="Month" onchange="ChangeOptionDays('FirstSelect')" id="Month">
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
		<SELECT name="Day" id="Day">
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
		<td><select name="m_nationality">
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
		<td><input type="text" name="email1" onclick="yearmonth()">@<input type="text" name="email2">
         <select name="selEmail" onchange="email3(this.form)" >
         <option value="" selected>직접입력</option>
         <option value="naver.com">naver.com</option>
         <option value="nate.com">nate.com</option>
         <option value="hotmail.com">hotmail.com</option>
         <option value="hanmail.com">hanmail.com</option>
         <option value="google.com">google.com</option>
         </select>
         <input type="hidden" name="m_email">
         <input type="button" onclick="openEmail()" value="인증메일 보내기">
		</td>
	</tr>	
	<tr>
		<td></td>
		<td><input id="emailCheck" type="text" name="numberCheck" placeholder="인증번호 7자리입력">
		<input type="text" name="email_check">
		<input type="button" value="인증확인" onclick="emailCheckOk()">
		</td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td><select name="kind">
         <option value="010">010</option>
         <option value="011">011</option>
         <option value="018">018</option>
         <option value="019">019</option>
         </select>-
         <input type="text" name="number1" size="4" required onkeypress="return fn_press(event, 'numbers');" onkeydown="fn_press_han(this);" style="ime-mode:disabled;" >-
         <input type="text" name="number2" size="4" required onkeypress="return fn_press(event, 'numbers');" onkeydown="fn_press_han(this);" style="ime-mode:disabled;" >
         </td>
	</tr>
	<tr>
		<td colspan="2">
		<input type="reset" value="다시작성">
		<input type="submit" value="회원가입"></td>
	</tr>
</table>
</form>
</body>
</html>