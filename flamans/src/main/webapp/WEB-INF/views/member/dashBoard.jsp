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
<script src="js/script.js"></script>
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
			for(j=0; j<calH.length; j++){
				HH=document.getElementById(calH[j]);
				if(calH[j].checkin!=null){
					var checkin=calH[j].checkin.split(' ');
					var HH=document.getElementById(checkin[0]);
					HH.innerHTML='in';
				}
				if(calH[j].checkout!=null){ 
					var checkout=calH[j].checkout.split(' ');
					var HH=document.getElementById(checkout[0]);
					HH.innerHTML='out';
				}
				for(i=0; i<cal.length; i++){
					var caltemp=cal[i].bookingdate.split('/');
					var calId=document.getElementById(caltemp[0]);
					calHtemp=calId.innerHTML;
					calHtemp+='<img src="img/bBook1.JPG" width="20px" heigth="20px">';
					calId.innerHTML=calHtemp;
				}
			} 
			
		
		}
	}
}
function bookDate(currentYear, currentMonth, dateNum){
	window.location.href='booking.do';
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
<body onload="kCalendar('kCalendar');cm_calendar()">
<div id="wrapper">
<%@ include file="/WEB-INF/views/myIndex.jsp"%>
<div id="page-wrapper">
	<div class="container-fluid">
		<h4>내 대시보드</h4>
		<div id="dash_img"><img src="/myweb/img/dashboard.JPG" id="dashimg"><div style="height: 20px;"></div><span id="white">반갑습니다! </span><br><br><br><br>
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
			              
			                 <p id="hot_wishlist">여기 내용</p>
			              
			           </form>
			        </div>
			        
			        <div id="tab2" class="tab_content" style="height:370px;">
			              <form name="page2_Write" action="page2_Write.do" method="post" enctype="multipart/form-data">
			                 
			                    <p id="hos_wishlist">여기 병원 내용</p>
			                 
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