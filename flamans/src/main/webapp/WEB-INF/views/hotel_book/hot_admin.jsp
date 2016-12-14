<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/flamans/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="/flamans/js/httpRequest.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
function kCalendar(id, date) {
	
	var kCalendar = document.getElementById(id);
	
	if( typeof( date ) !== 'undefined' ) {
		date = date.split('-');
		date[1] = date[1] - 1;
		date = new Date(date[0], date[1], date[2]);
	} else {
		var date = new Date();
	}
	var currentYear = date.getFullYear();
	//년도를 구함
	
	var currentMonth = date.getMonth() + 1;
	//연을 구함. 월은 0부터 시작하므로 +1, 12월은 11을 출력
	
	var currentDate = date.getDate();
	//오늘 일자.
	
	date.setDate(1);
	var currentDay = date.getDay();
	//이번달 1일의 요일은 출력. 0은 일요일 6은 토요일
	
	//var dateString = new Array('sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat');
	var lastDate = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
	if( (currentYear % 4 === 0 && currentYear % 100 !== 0) || currentYear % 400 === 0 )
		lastDate[1] = 29;
	//각 달의 마지막 일을 계산, 윤년의 경우 년도가 4의 배수이고 100의 배수가 아닐 때 혹은 400의 배수일 때 2월달이 29일 임.
	
	var currentLastDate = lastDate[currentMonth-1];
	var week = Math.ceil( ( currentDay + currentLastDate ) / 7 );
	//총 몇 주인지 구함.
	
	if(currentMonth != 1)
		var prevDate = currentYear + '-' + ( currentMonth - 1 ) + '-' + currentDate;
	else
		var prevDate = ( currentYear - 1 ) + '-' + 12 + '-' + currentDate;
	//만약 이번달이 1월이라면 1년 전 12월로 출력.
	
	if(currentMonth != 12) 
		var nextDate = currentYear + '-' + ( currentMonth + 1 ) + '-' + currentDate;
	else
		var nextDate = ( currentYear + 1 ) + '-' + 1 + '-' + currentDate;
	//만약 이번달이 12월이라면 1년 후 1월로 출력.

	
	if( currentMonth < 10 )
		var currentMonth = '0' + currentMonth;
	//10월 이하라면 앞에 0을 붙여준다.
	
	var calendar = '';
	
	calendar += '<div id="header">';
	calendar += '			<span><a href="#" class="button left" onclick="kCalendar(\'' +  id + '\', \'' + prevDate + '\')"> < </a></span>';
	calendar += '			<span id="date">' + currentYear + '년 ' + currentMonth + '월</span>';
	calendar += '			<span><a href="#" class="button right" onclick="kCalendar(\'' + id + '\', \'' + nextDate + '\')"> > </a></span>';
	calendar += '		</div>';
	calendar += '		<table border="0" cellspacing="0" cellpadding="0" id="calen">';
	calendar += '			<caption>' + currentYear + '년 ' + currentMonth + '월 달력</caption>';
	calendar += '			<thead>';
	calendar += '				<tr>';
	calendar += '				  <th>체크인</th>';
	calendar += '				  <th>체크아웃</th>';
	calendar += '				  <th>예약자명</th>';
	calendar += '				  <th>객실유형</th>';
	calendar += '				  <th>인원</th>';
	calendar += '				  <th>진행상태</th>';
	calendar += '				  <th></th>';
	calendar += '				</tr>';
	calendar += '			</thead>';
	calendar += '			<tbody id="hotBooktbody">';
	calendar += '			</tbody>';
	calendar += '		</table>';
	
	kCalendar.innerHTML = calendar;
	
	
}
function cm_calendar(){
	var tem=document.getElementById("date");
	var tem2=tem.innerHTML;
	var yyear=tem2.substring(0,4);
	tem2=tem.innerHTML.split(' ');
	var mmonth=tem2[1].substring(0,2);
	var ttem=yyear+'-'+mmonth;  
	var params='date='+ttem;
	sendRequest('companyCal.do', params, cm_calendarResult, 'POST');
}
var count=0;
function cm_calendarResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			data=eval('('+data+')');		
			var cal=data.cal;
			for(i=0; i<cal.length; i++){
				var caltemp=cal[i].bookingdate.split('/');
				var calId=document.getElementById(caltemp[0]);
				calId.innerHTML='<img src="img/bBook1.JPG" width="20px" heigth="20px">';			
			}
		}
	}
}
</script>
<style>
/* #b{ width:850px; height:450px;  margin-top: 30px;   border-color: green;}
#c{ float:left; width:450px;  height:450px;  margin:0px center;}
#d{	width:360px;height:450px;float: left;margin-left:15px;margin-right:15px;overflow-y:scroll; white-space:nowrap;} */
#kCalendar{  width:850px;  height:550px;  border : 1px solid #EAEAEA;  font:15px/1.0 맑은 고딕;}
#Bookdate{text-align: center;font:20px/1.0 맑은 고딕;}
th{	text-align: center;}
#call{	padding-right:10px;	color: blue;}
#accept{	padding-right:5px;	color: red;}
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
* {font-family: 15px/1.0 맑은 고딕;}
#kCalendar {width: 850px; height: 550px; /* border: 1px solid black; */}
#kCalendar #header {height: 80px; line-height: 80px; text-align: center; font-size: 25px; font-weight: bold}
#kCalendar .button {color: #000; text-decoration: none;}
#kCalendar table {width: 430px; height: 340px; padding-left: 5px; }
#kCalendar caption {display: none;}
#kCalendar .sun {text-align: center; color: deeppink;}
#kCalendar .mon {text-align: center;}
#kCalendar .tue {text-align: center;}
#kCalendar .wed {text-align: center;}
#kCalendar .thu {text-align: center;}
#kCalendar .fri {text-align: center;}
#kCalendar .sat {text-align: center; color: deepskyblue;}
#cc{width:45px;  height:35px;} 
</Style>
</head>
<body onload="kCalendar('kCalendar')">
	<div id="kCalendar" class="form-control"></div>
</body>
</html>