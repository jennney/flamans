<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/flamans/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="/flamans/js/httpRequest.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css">
<script>

$(document).ready(function Bbook2(){ 

	var line="";
	line=WriteYearOptions();;
	$('#B_time').html(line);
	
	function WriteYearOptions()//disable
	{//dao로 예약일자 시간 받아서 컨트롤러에서 돌려서 disable넣어주고 데려오는 방법
	  for (i=9; i<=20; i++){
		  
		if(i>=9 && i<12){
		    line += "<OPTION value=AM"+i+":00> AM ";
		    line += i+" : 00</OPTION>";
	 	 }else if(i==12){
			  line += "<OPTION value=PM"+i+":00> PM ";
			  line += i+" : 00</OPTION>";
	 	 }else{
			  line += "<OPTION value=PM"+(i-12)+":00> PM 0";
			  line += i-12+" : 00</OPTION>";
	 	 }  
	  }
	  return line;
	}

	var age='${Ddto.m_birthday}'.substring(0, 4);
	age=parseInt(age);
	Now = new Date();
	NowYear = Now.getFullYear();
	NowYear=parseInt(NowYear);
	age=NowYear-age;
	
	
	document.bBook.name.value='${Ddto.m_name}';
	document.bBook.sex.value='${Ddto.m_sex}';
	document.bBook.age.value=age;
	document.bBook.nationality.value='${Ddto.m_nationality}';
	
});

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
	
	var bookdate=document.getElementById("bookdate");
	var now=new Date();
	var sysdate=new Date(now.getFullYear(), now.getMonth(), now.getDate()+1); 
	var bodate=new Date(currentYear, currentMonth-1, dateNum);
	if(bodate<sysdate){
		alert(now.getFullYear()+'년'+(now.getMonth()+1)+'월'+(now.getDate()+1)+'일'+' 이후의 일자만 예약 가능합니다');
		return false;
	}else if(bodate>=sysdate){
		var YeY = currentYear+"-"+currentMonth+"-"+dateNum;
		bookdate.value=YeY;
		var params='date='+YeY+'&hos_num='+'${Ddto.hos_num}';
		sendRequest('companyCal.do', params, BooktimeCheckResult, 'POST');
	}

}

function BooktimeCheckResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			data=eval('('+data+')');
			var BtimeList=data.cal;
			var btimetable=document.getElementById("B_time");

			for(var i=0; i<btimetable.length; i++){
				 btimetable.options[i].disabled = false;
				 	for(var j=0;j<BtimeList.length;j++){	
				 		var doc_num=BtimeList[j].doc_num;
						var timetemp=BtimeList[j].bookingdate.split('/');
						var time=timetemp[1]; //		disable 
						if(time==btimetable.options[i].value){	
							var doc_time=document.bBook.doc_num.value;
							if(doc_time==doc_num){
								btimetable.options[i].disabled = true;
				          		}
							   
							 /*   $('#B_time').options[i].attr('onclick', 'already()');
							 	btimetable.options[i].disabled = true;
							 */
							    
						 }
				 	}
				}
			}
		}
	}
/* function already(){
	alert('선택한 시간은 이미 예약된 시간입니다.');
} */
function Btime1(){
	
	var B_time=document.bBook.B_time.value;
	
	var Btime=document.getElementById("Btime");
	Btime.value=B_time;
	
}
function docInfo(doc_num){
	var doc_num=doc_num;
	var addr='docInfo.do?doc_num='+doc_num+"&hos_num="+'${Ddto.hos_num}'+'&what=Bbook';
	window.open(addr, 'docInfo', 'width=500px, height=600px, left=100, top=100');
}

</script>
<%@ include file="/WEB-INF/views/header.jsp"%>    
<style>
#cc:LINK{
	color:black;
	text-decoration:none;
	font-size: 15px;
}

#cc:VISITED{
	color:black;
	text-decoration:none;
	font-size: 15px;
}
#cc:hover{
	color: black;
   	text-decoration: none;
   	font-size: 15px;
}
#B_time{
	width:260px;
	height:100px;
	text-align: center;
	font:15px/1.0 맑은 고딕;
}

#kCalendar{
   
   width:260px;
   height:260px;
   border : 1px solid #EAEAEA; 
   font:15px/1.0 맑은 고딕;
   
}
#a{
	float: left;
	width:480px;
	height:600px;
	 border : 1px solid pink;
}
#b{
   width:800px;
   height:650px;
   margin-top: 30px;
   border : 1px solid green;
   margin: auto;
   
}
#d{
	float: right;  
   	width:260px;
   	height:600px;
}

#td{
	text-align:center;
	width: 80px;
	height: 30px;
}
textarea{
	resize:none;
}
#bBook{
	padding:10px;
	border-spacing: 10px;
}
#doc{
	width:260px;
	height:50px;
	border: 1px solid green;
	font:15px/1.0 맑은 고딕;
}
#docimg{ 
   float:left;   
   width:60px;
   height:50px;
   border: 1px solid red;
}
#docname{
   	width:50px;
   	height:50px;
   	float: left;
   	margin-left:15px;
   	margin-right:15px;
   	border: 1px solid yellow;
}
#do{
	 float:left;   
  	 width:80px;
  	 height:50px;
  	 border: 1px solid pink;
  	 }

</style>

</head>	
<body>
<div class="page-header">
    <div class="overlay">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>Hospital</h1>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container" style="margin-bottom: 50px;">
	<div id="b" class="well well-lg">
	<form class="form-inline" name="bBook" action="bBook.do" method="post">
	<div id="a">
		<table id="bBook">
			<tr>
			<td colspan="2" id="td"><h4>${Ddto.cm_name}</h4>
			<input type="hidden" name="hos_num" value="${Ddto.hos_num}">
			<input type="hidden" name="doc_num" value="${Ddto.doc_num }">
			</td>
			</tr>
			<tr style="padding-left: 8px;">
				<td><img src="img/hospital/doctor/${Ddto.doc_img }" width="100" height="100" ></td>
				<td><div id="doc"><label style="width:100px;">${Ddto.doc_name }</label>
				</div><br>
				'${Ddto.doc_career }'
				</td>
			</tr>
			<tr>
				<td colspan="2" ><br></td>
			</tr>
			<tr>
				<td style="padding-top: 10px; padding-top: 5px;" id="td">이 름</td>
				<td><input type="text" name="name" class="form-control"></td>
			</tr>
			<tr>
				<td id="td">성 별</td>
				<td><label class="radio-inline"><input type="radio" name="sex" value="남" checked>남</label>
					<label class="radio-inline"><input type="radio" name="sex" value="여">여</label></td>
			</tr>
			<tr>
				<td id="td">나이</td>
				<td><input type="text" class="form-control" name="age"></tr>
			<tr>
			<tr>
				<td id="td">국 적</td>
				<td><select name="nationality" class="form-control">
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
				<td id="td">예약일자</td>
				<td><input type="text" name="bookingdate" id="bookdate" class="form-control" readonly >
				<input type="text" name="Btime" id="Btime" class="form-control" readonly >
				</td>
			</tr>
			<tr>
				<td colspan="2" ><br>원하는 시술/수술<br>
				<textarea class="form-control" rows="2" cols="60" id="comment" name="surgery"></textarea></td>
			</tr>
	
			<tr>
			<tr>
				<td colspan="2" >특이사항<br>
				<textarea class="form-control" rows="2" cols="60" id="comment" name="etc"></textarea><br><br></td>
			</tr>
			<!-- <tr>
				<td><select name="m_card" class="form-control">
				 <option value="카드회사">카드회사</option>
		         <option value="씨티">씨티</option>
		         <option value="신한">신한</option>
		         <option value="NH">NH</option>
				 <option value="KB">KB</option>
				 <option value="현대">현대</option>
				 <option value="삼성">삼성</option>
				 <option value="롯데">롯데</option>
				
				</select></td>
				<td>&nbsp;&nbsp;&nbsp;<input type="text" class="form-control" size="4" name="card1">-
				<input type="text" class="form-control" size="4" name="card2">-
				<input type="text" class="form-control" size="4" name="card3">-
				<input type="text" class="form-control" size="4" name="card4">
			</tr> -->
			<tr>
				<td colspan="2" id="td"><br>
				<button type="button" class="btn btn-default">다시 작성</button>
				<button type="submit" class="btn btn-default">예약</button>
			</tr>
			
		</table>	
	</div>

		<div class="container" id="d" class="well well-lg">
			<div id="kCalendar" class="form-control"></div>
			<select multiple class="form-control" id="B_time" name="B_time" onchange="Btime1()">
			    	
		    </select>	
		    <div id="doc">
		    <br><br>
		    <fieldset>
		    <legend></legend>
				<c:forEach var="doctor" items="${doc}">
					<div id="doc">
						<div id="docImg" ><img src="img/hospital/doctor/${doctor.doc_img }" style="width:50px; height:50px;"></div>
						<div id="docname">${doctor.doc_name }</div>
						<div id="do"><button type="button" class="btn btn-default" onclick="docInfo('${doctor.doc_num}')">상세보기</button></div>			
					</div>		
				</c:forEach>
			</fieldset>		
			</div>
		</div>	  
		</form>	
    
	</div>
</div>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>