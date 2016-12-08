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
<script src="js/script.js"></script>
<Script>
function bookDate(currentYear, currentMonth, dateNum){
	
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
			
			var msg='<table border="0" cellspacing="0" width="300"><tr><th> 예약시간 </th><th> 이름 </th><th> 상태 </th>';
			
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
				calId.innerHTML='예약';			
			}
		}
	}
}
</Script>
<style>
#b{ width:800px; height:400px;  margin-top: 30px;   border-color: green;}
#c{ float:left; width:400px;  height:400px;  margin:0px center;}
#d{	width:360px;height:400px;float: left;margin-left:15px;margin-right:15px;overflow-y:scroll; white-space:nowrap;}
#kCalendar{  width:400px;  height:400px;  border : 1px solid #EAEAEA;  font:15px/1.0 맑은 고딕;}
#Bookdate{text-align: center;font:20px/1.0 맑은 고딕;}
th{	text-align: center;}
#call{	padding-right:10px;	color: blue;}
#accept{	padding-right:5px;	color: red;}
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
* {font-family: 15px/1.0 맑은 고딕;}
#kCalendar {width: 400px; height: 400px; /* border: 1px solid black; */}
#kCalendar #header {height: 80px; line-height: 80px; text-align: center; font-size: 25px; font-weight: bold}
#kCalendar .button {color: #000; text-decoration: none;}
#kCalendar table {width: 380px; height: 300px; padding-left: 18px; }
#kCalendar caption {display: none;}
#kCalendar .sun {text-align: center; color: deeppink;}
#kCalendar .mon {text-align: center;}
#kCalendar .tue {text-align: center;}
#kCalendar .wed {text-align: center;}
#kCalendar .thu {text-align: center;}
#kCalendar .fri {text-align: center;}
#kCalendar .sat {text-align: center; color: deepskyblue;}
</Style>
</head>
<body onload="kCalendar('kCalendar');cm_calendar()">
<c:set var="cal" value='${cal}'/>
	<div id="b" >
	<div id="c">
		<div id="kCalendar" class="form-control"></div>
	</div>
	<div id="d" class="well well-lg">
	  <div id="Bookdate"></div><br>
	  <div id="table"></div>
	</div>
	</div> 
</body>
</html>