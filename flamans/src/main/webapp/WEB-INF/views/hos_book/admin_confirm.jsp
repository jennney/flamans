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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<Script>
$(document).ready(function kkkkk(){
	var id='kCalendar';
	kCalendar(id);
});
function kCalendar(id,date) {
	
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
	
	var dateString = new Array('sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat');
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
	calendar += '			<span><a href="#" class="button left" onclick="kCalendar(\'' +  id + '\', \'' + prevDate + '\');cm_calendar()"> < </a></span>';
	calendar += '			<span id="date">' + currentYear + '년 ' + currentMonth + '월</span>';
	calendar += '			<span><a href="#" class="button right" onclick="kCalendar(\'' + id + '\', \'' + nextDate + '\');cm_calendar()"> > </a></span>';
	calendar += '		</div>';
	calendar += '		<table border="0" cellspacing="0" cellpadding="0" id="calen">';
	calendar += '			<caption>' + currentYear + '년 ' + currentMonth + '월 달력</caption>';
	calendar += '			<thead>';
	calendar += '				<tr>';
	calendar += '				  <th class="sun" scope="row" id="cc">Sun</th>';
	calendar += '				  <th class="mon" scope="row" id="cc">Mon</th>';
	calendar += '				  <th class="tue" scope="row" id="cc">Tue</th>';
	calendar += '				  <th class="wed" scope="row" id="cc">Wed</th>';
	calendar += '				  <th class="thu" scope="row" id="cc">Thu</th>';
	calendar += '				  <th class="fri" scope="row" id="cc">Fri</th>';
	calendar += '				  <th class="sat" scope="row" id="cc">Sat</th>';
	calendar += '				</tr>';
	calendar += '			</thead>';
	calendar += '			<tbody>';
	
	var dateNum = 1 - currentDay;

	for(var i = 0; i < week; i++) {
		calendar += '			<tr>';
		for(var j = 0; j < 7; j++, dateNum++) {
			if( dateNum < 1 || dateNum > currentLastDate ) {
				calendar += '				<td class="' + dateString[j] + 'id="cc"> </td>';
				continue;
			}
			if(currentMonth<10){
				currentMonth=parseInt(currentMonth);
				currentMonth='0'+currentMonth;
			}
			if(dateNum<10){
				dateNum=parseInt(dateNum);
				dateNum='0'+dateNum;
			}
			calendar += '				<td class="' + dateString[j] + '" id="cc"><a href="#" onclick="bookDate('+currentYear+","+currentMonth+","+dateNum+');">' +dateNum + '</a>';
			calendar += '<div id="'+currentYear+'-'+currentMonth+'-'+dateNum+'" style="float:right;width:20px;height:20px;"></td>';
		}																							
		calendar += '			</tr>';
	}
	
	calendar += '			</tbody>';
	calendar += '		</table>';
	
	kCalendar.innerHTML = calendar;
	
	//cm_calendar();
}
		
function bookDate(currentYear, currentMonth, dateNum){
	
/* 	if(currentMonth<10){
		currentMonth=parseInt(currentMonth);
		currentMonth='0'+currentMonth;
	}
	if(dateNum<10){
		dateNum=parseInt(dateNum);
		dateNum='0'+dateNum;
	} */
	var BCallDate = currentYear+"-"+currentMonth+"-"+dateNum;
	$('#Bookdate').html(BCallDate);
	var params='bookingdate='+BCallDate;
	sendRequest('bBbook_list.do', params, BookCheckResult, 'POST');
}
function BookCheckResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			data=eval('('+data+')');
			
			var BbookList=data.list;
			
			var msg='<table border="0" cellspacing="0" width="300" id="dudu"><tr><th id="no_listth1"> 예약시간 </th><th id="no_listth2"> 이름 </th><th id="no_listth3"> 상태 </th><th id="no_listth4"> 관리 </th>';
			
			if(BbookList.length==0){
				msg+='<tr><td colspan="3" align="center"><br> 요청날짜에 예약이 없습니다. </td></tr></table>';	
			}else{
				for(var i=0;i<BbookList.length;i++){						
					var Bbook=BbookList[i];
					var result=Bbook.bookingdate.split('/');
					var time=result[1];
					if(Bbook.permit=='0'){	
						msg+='<tr><td padding-right:12px;>'+time+'</td><td padding-right:12px;><a href="#" onclick="BbookContent('+Bbook.bookingnum+')">'+Bbook.name+'</a></td><td><span id="call">예약대기</span></td><td><button type="button" class="btn btn-default" onclick="Bbookpermit('+Bbook.bookingnum+')">확정</button><button type="button" class="btn btn-default" onclick="Bbookdel('+Bbook.bookingnum+')">삭제</button></td></tr>';	
					}else{
						msg+='<tr><td padding-right:12px;>'+time+'</td><td padding-right:12px;><a href="#" onclick="BbookContent('+Bbook.bookingnum+')">'+Bbook.name+'</a></td><td><span id="accept">예약완료</span></td><td><button type="button" class="btn btn-default" onclick="Bbookdel('+Bbook.bookingnum+')">삭제</button></td></tr>';
					}
				}
				msg+='</table>';
					
			}			
			var table=document.getElementById("table");
			table.innerHTML=msg;
		}
	}
}
function Bbookdel(bookingnum){
	var result=window.confirm('정말 삭제하시겠습니까?');
	if(result){
		var params='bookingnum='+bookingnum;
		sendRequest('bBbook_refuse.do', params, BbookdelResult, 'POST');
	}
}
function BbookdelResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			data=eval('('+data+')');
			var msg=data.msg;
			alert(msg);
			var temp = document.getElementById("Bookdate").innerHTML;
			var temp1 = temp.split('-');
			bookDate(temp1[0], temp1[1], temp1[2]);
		}
	}
}
function Bbookpermit(bookingnum){
	var params='bookingnum='+bookingnum;
	sendRequest('bBook_permit.do', params, BbookpermitResult, 'POST');
}
function BbookpermitResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			data=eval('('+data+')');
			var msg=data.msg;
			alert(msg);
			var temp = document.getElementById("Bookdate").innerHTML;
			var temp1 = temp.split('-');
			bookDate(temp1[0], temp1[1], temp1[2]);
		}
	}
}
function BbookContent(bookingnum){
	
	var bookingnum=bookingnum;
	var addr='bBook_content.do?bookingnum='+bookingnum;
	window.open(addr, 'docInfo', 'width=820px, height=650px, left=100, top=30');
	
}
$(document).ready(function cm_calendar(){
	var tem=document.getElementById("date");
	var tem2=tem.innerHTML;
	var yyear=tem2.substring(0,4);
	tem2=tem.innerHTML.split(' ');
	var mmonth=tem2[1].substring(0,2);
	var ttem=yyear+'-'+mmonth;  
	var params='date='+ttem;
	sendRequest('companyCal.do', params, cm_calendarResult, 'POST');
});
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
</Script>
<style>
#b{ width:850px; height:620px;  margin-top: 30px;   border-color: green; margin: 30px auto;}
#c{ float:left; width:450px;  height:450px;  margin:0px center;}
#d{	width:360px;height:450px;float: left;margin-left:15px;margin-right:15px;overflow-y:scroll; white-space:nowrap; background-color: white;}
#kCalendar{  width:450px;  height:450px;  border : 1px solid #EAEAEA;  font:15px/1.0 맑은 고딕;}
#Bookdate{text-align: center;font:20px/1.0 맑은 고딕; padding-top: 8px;}
th{	text-align: center;}
#call{	padding-right:10px;	color: blue;}
#accept{	padding-right:5px;	color: red;}
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
* {font-family: 15px/1.0 맑은 고딕;}
#kCalendar {width: 450px; height: 450px; /* border: 1px solid black; */}
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
#dudu{margin: 0px auto;}
#no_listth1, #no_listth2, #no_listth3, #no_listth4{
	border-top: 3px solid #BDBDBD;
	border-bottom: 3px solid #BDBDBD;
	height: 45px;
	text-align: center;
}
</Style>
</head>
<body>
<div id="wrapper">
<%@ include file="/WEB-INF/views/myIndex.jsp"%>
	<div id="page-wrapper">
	<c:set var="cal" value='${cal}'/>
		<div id="b" >
			<div id="c">
				<div id="kCalendar" class="form-control"></div>
			</div>
			<div id="d">
			  <div id="Bookdate"></div><br>
			  <div id="table"></div>
			</div>
		</div> 
	</div>
</div>
</body>
</html>