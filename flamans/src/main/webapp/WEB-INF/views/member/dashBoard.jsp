<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>flamans Dashboard</title>
<script type="text/javascript" src="/flamans/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="/flamans/js/httpRequest.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
$(document).ready(function() {
	   //Default Action
	      $(".tab_content").hide(); //Hide all content
	      $("ul.tabs li:first").addClass("active").show(); //Activate first tab
	      $(".tab_content:first").show(); //Show first tab content
	      
	   //On Click Event
	   $("ul.tabs li").click(function() {
	      $("ul.tabs li").removeClass("active"); //Remove any "active" class
	        $(this).addClass("active"); //Add "active" class to selected tab
	         $(".tab_content").hide(); //Hide all tab content
	         var activeTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
	         $(activeTab).fadeIn(); //Fade in the active content
	         return false;
	   });
	});
$(document).ready(function kkkkk(){
	var id='kCalendar';
	kCalendar(id);
    wishlist();
});
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
			calendar += '<div id="'+currentYear+'-'+currentMonth+'-'+dateNum+'H" style="float:right;width:20px;height:20px;"></div>';
			calendar += '<div id="'+currentYear+'-'+currentMonth+'-'+dateNum+'B" style="float:right;width:20px;height:20px;"></td>';
		}																							
		calendar += '			</tr>';
	}
	
	calendar += '			</tbody>';
	calendar += '		</table>';
	
	kCalendar.innerHTML = calendar;
	
	//cm_calendar();
}

	
function cm_calendar(){
	var tem=document.getElementById("date");
	var tem2=tem.innerHTML;
	var yyear=tem2.substring(0,4);
	tem2=tem.innerHTML.split(' ');
	var mmonth=tem2[1].substring(0,2);
	var ttem=yyear+'-'+mmonth;  
	var params='date='+ttem;
	sendRequest('memberCal.do', params, cm_calendarResult, 'POST');
}
function cm_calendarResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			data=eval('('+data+')');		
			var cal=data.cal;
			var calH=data.calH;
			if(calH!=null){
				for(j=0; j<calH.length; j++){
					HH=document.getElementById(calH[j]);
					if(calH[j].checkin!=null){
						var checkin=calH[j].checkin.split(' ');
						var HH=document.getElementById(checkin[0]+'H');
						HH.innerHTML='in';
					}
					if(calH[j].checkout!=null){ 
						var checkout=calH[j].checkout.split(' ');
						var HH=document.getElementById(checkout[0]+'H');
						HH.innerHTML='out';
					}
					for(i=0; i<cal.length; i++){
						var caltemp=cal[i].bookingdate.split('/');
						var calId=document.getElementById(caltemp[0]+'B');
						calHtemp=calId.innerHTML;
						calHtemp='<img src="img/bBook1.JPG" width="20px" heigth="20px">';
						calId.innerHTML=calHtemp;
					}
				} 
			}else if(calH==null && cal !=null){
				for(i=0; i<cal.length; i++){
					var caltemp=cal[i].bookingdate.split('/');
					var calId=document.getElementById(caltemp[0]+'B');
					calHtemp=calId.innerHTML;
					calHtemp='<img src="img/bBook1.JPG" width="20px" heigth="20px">';
					calId.innerHTML=calHtemp;
				}
			}
		
		}
	}
}
function bookDate(currentYear, currentMonth, dateNum){
	window.location.href='booking.do';
}

$(document).ready(function wishlist(){
	sendRequest('member_wish_hlist.do', null, wishlistresult, 'GET');
});

function wishlistresult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data = XHR.responseText;
			// eval : 서버로부터 넘어온문자열들을 실제 객체로 바꾸어주는 녀석. 
			// 실제 소괄호 안에 있는것을 라벨로 인식해서 data를 번역한다..
			// yong=+data
			
			if('${not empty sessionScope.userid}'=='true'){
				data = eval('('+data+')');
				data = data.list;
				var data_hos = '';
				var data_hot = '';
				data = eval('('+data+')');
				// 병원 비교 추가
				
				for( var i=data.hos.length-1; i>=0; i-- ){
					data_hos += '<table style="border: 3px solid #4C4C4C; border-radius: 10px;" width="300" height="110" cellspacing="0"><tr align="center">';
					data_hos += '<td width="100" align="center"><a href="hospital_get_info.do?hos_num='+data.hos[i].hos_num+'">'+'<img src="img/hospital/'+data.hos[i].hos_img+'" width=100 height=90></a></td>';
					data_hos += '<td><a href="hospital_get_info.do?hos_num='+data.hos[i].hos_num+'">'+data.hos[i].hos_name+'<br><br><br>'+data.hos[i].hos_wishdate+'</a></td></tr>';
					data_hos += '</table>';
				}
				
				// 호텔 비교 추가
				for( var i=data.hot.length-1; i>=0; i-- ){
					data_hot += '<table style="border: 3px solid #4C4C4C; border-radius: 10px;" width="300" height="110" cellspacing="0"><tr align="center">';
					data_hot += '<td width="100" align="center"><a href="hotel_get_info.do?hot_num='+data.hot[i].hot_num+'">'+'<img src="img/hotel/'+data.hot[i].hot_img+'" width=100 height=90></a></td>';
					data_hot += '<td><a href="hotel_get_info.do?hot_num='+data.hot[i].hot_num+'">'+data.hot[i].hot_name+'<br><br><br>'+data.hot[i].hot_wishdate+'</a></td></tr>';
					data_hot += '</table>';
				}
				
				var hot_wishlist = data_hot;
				var hos_wishlist = data_hos;
				
			}else{
				var wishlist = data;
				
				var header_wishlist = document.getElementById('hos_wishlist');
				header_wishlist.innerHTML = wishlist;
			}
			
			var hos_wishlist_area = document.getElementById('hos_wishlist');
			hos_wishlist_area.innerHTML = hos_wishlist;
			
			var hot_wishlist_area = document.getElementById('hot_wishlist');
			hot_wishlist_area.innerHTML = hot_wishlist;
			
		}
		
		cm_calendar();
	}
}

</script>
<style>
#dash_img{width:860px;height:150px; }
#dashimg { position:absolute; z-index:1; width:860px; height:150px; }
#b{ width:880px; height:480px;  margin-top: 30px;   border-color: green; }
#d{ float:left; width:450px;  height:450px;  margin:0px center;}
#c{	width:360px;height:450px; float: left; margin-left:15px; margin-right:15px; }
#kCalendar{  width:450px;  height:450px;  font:15px/1.0 맑은 고딕;}
#Bookdate{text-align: center;font:20px/1.0 맑은 고딕;}
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
#la2{float:left; width:400px;}
#white{font:15px/1.0 맑은 고딕; color: white; padding-left:10px; position:absolute; z-index:2;}
#name{position:absolute; z-index:2;padding-top: 15px; padding-left:10px;}
#dashtab {  margin: 0; padding: 0; float: left; list-style: none; height: 32px; border-bottom: 1px solid #EAEAEA;
      border-left: 1px solid #EAEAEA;; width: 100%; }
/*탭메뉴*/
#dashli1, #dashli2 { float: left; margin: 0; padding: 0; height: 31px; line-height: 31px; border: 1px solid #EAEAEA;
      border-left: none; margin-bottom: -1px; overflow: hidden; position: relative; }
#dashli1 a, #dashli2 a { text-decoration: none; color: #000;  display: block; font-size: 1.0em;
      padding: 0 10px; border: 1px solid #EAEAEA;  outline: none;}
#dashli1 a:hover, #dashli2 a:hover { background: #ccc; }   
#dashli1.active, #dashli1.active a:hover, #dashli2.active, #dashli2.active a:hover  {  background: #fff; border-bottom: 1px solid #fff; }
.tab_container { border: 1px solid #EAEAEA; border-top: none; clear: both; float: left; width: 100%;
      background: #fff; -moz-border-radius-bottomright: 5px; -khtml-border-radius-bottomright: 5px;
      -webkit-border-bottom-right-radius: 5px;  -moz-border-radius-bottomleft: 5px;
      -khtml-border-radius-bottomleft: 5px;  -webkit-border-bottom-left-radius: 5px; }
.tab_content {  padding: 5px; font-size: 1.0em; }
</style>
</head>
<body>
<div id="wrapper">
<%@ include file="/WEB-INF/views/myIndex.jsp"%>
<div id="page-wrapper">
	<div class="container-fluid">
		<h4>내 대시보드</h4>
		<div id="dash_img"><img src="/flamans/img/dashboard.JPG" id="dashimg"><div style="height: 20px;"></div><span id="white">반갑습니다! </span><br><br><br><br>
		<c:if test="${!empty sessionScope.username }">
			<div id="name">${sessionScope.username}님 계정입니다.</div>
		</c:if>
		</div>
			
		<div id="b">
		<div style="border : 1px solid #EAEAEA;"><label id="la2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;즐겨찾는 목록</label>&nbsp;&nbsp;&nbsp;<label>예약 현황</label></div>
			<div id="c" class="well well-lg">
			    <ul class="tabs" id="dashtab">
			        <li onclick="wishlist()" id="dashli1"><a href="#tab1">호텔 </a></li>
			        <li onclick="wishlist()" id="dashli2"><a href="#tab2">병원 </a></li>
			    </ul>		    
			    <div class="tab_container" style="height:370px;">
			        <div id="tab1" class="tab_content">
			           <form name="page1_Write" action="page1_Write.do" method="post" enctype="multipart/form-data">
			              
			                 <p id="hot_wishlist"></p>
			              
			           </form>
			        </div>
			        
			        <div id="tab2" class="tab_content" style="height:370px;">
			              <form name="page2_Write" action="page2_Write.do" method="post" enctype="multipart/form-data">
			                 
			                    <p id="hos_wishlist"></p>
			                 
			           </form>
			        </div>
			    </div>
			</div>
			<div id="d" >
			 <div id="kCalendar" class="form-control"></div>
			</div>
		</div>
	</div>
</div>
</div>
</body>
</html>  