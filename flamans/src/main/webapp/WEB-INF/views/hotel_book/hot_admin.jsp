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
function HbookDate(){
	var table=document.getElementById("Hdate");
	var ttdate=table.value;
	if(ttdate==null){
		var now=new Date();
		ttdate=now.getFullYear()+'-'+now.getMonth();	
	}
	var params='checkin='+ttdate;
	sendRequest('Hbook_list.do', params, HBookCheckResult, 'POST');
}
function HBookCheckResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			data=eval('('+data+')');
			
			var HbookList=data.Hlist;
			
			var msg='';
			
			if(HbookList.length==0){
				msg+='<tr><td colspan="7" align="center"><br> 요청날짜에 예약이 없습니다. </td></tr>';	
			}else{
				for(var i=0;i<HbookList.length;i++){						
					var Hbook=HbookList[i];
					var checkin=Hbook.checkin.split(' ');
					var checkout=Hbook.checkin.split(' ');
					if(Hbook.permit=='0'){	
						
						msg+='<tr><td><span>'+checkin[0]+'</span></td>';
						msg+='<td><span>'+checkout[0]+'</span></td>';
						msg+='<td><span><a href="#" click="HbookContent('+Hbook.bookingnum+')">'+Hbook.name+'</a></span></td>';
						msg+='<td><span>'+Hbook.roomname+'</span></td>';
						msg+='<td><span>'+Hbook.card+'</span></td>';
						msg+='<td><span>'+Hbook.people+'</span></td>';
						msg+='<td><span id="call">예약대기</span></td>';
						msg+='<td><button type="button" class="btn btn-default" onclick="Hbookpermit('+Hbook.bookingnum+')">확정</button><button type="button" class="btn btn-default" onclick="Hbookdel('+Hbook.bookingnum+')">삭제</button></td></tr>';
					}else{
						msg+='<tr><td><span>'+checkin[0]+'</span></td>';
						msg+='<td><span>'+checkout[0]+'</span></td>';
						msg+='<td><span><a href="#" click="HbookContent('+Hbook.bookingnum+')">'+Hbook.name+'</a></span></td>';
						msg+='<td><span>'+Hbook.roomname+'</span></td>';
						msg+='<td><span>'+Hbook.card+'</span></td>';
						msg+='<td><span>'+Hbook.people+'</span></td>';
						msg+='<td><span id="accept">예약완료</span></td>';
						msg+='<td><button type="button" class="btn btn-default" onclick="Hbookdel('+Hbook.bookingnum+')">삭제</button></td></tr>';
					}
				}
				msg+='';
					
			}			
			var table=document.getElementById("hotBooktbody");
			table.innerHTML=msg;
		}
	}
}
 function Hbookdel(bookingnum){
	var result=window.confirm('정말 삭제하시겠습니까?');
	if(result){
		var params='bookingnum='+bookingnum;
		sendRequest('HBbook_refuse.do', params, HbookdelResult, 'POST');
	}
}
function HbookdelResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			data=eval('('+data+')');
			var msg=data.msg;
			alert(msg);
			HbookDate();
		}
	}
}
function Hbookpermit(bookingnum){
	var params='bookingnum='+bookingnum;
	sendRequest('HBook_permit.do', params, HbookpermitResult, 'POST');
}
function HbookpermitResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			data=eval('('+data+')');
			var msg=data.msg;
			alert(msg);
			HbookDate();
		}
	}
} 
function HbookContent(bookingnum){
	
}

</script>
<style>
/* #b{ width:850px; height:450px;  margin-top: 30px;   border-color: green;}
#c{ float:left; width:450px;  height:450px;  margin:0px center;}
#d{	width:360px;height:450px;float: left;margin-left:15px;margin-right:15px;overflow-y:scroll; white-space:nowrap;} */
#hotBooktbody{}
#kCalendar{  width:950px;  height:650px;  border : 1px solid #EAEAEA;  font:15px/1.0 맑은 고딕; overflow-y:scroll; white-space:nowrap;}
#Bookdate{text-align: center;font:20px/1.0 맑은 고딕;}
th{	text-align: center;}
#call{	padding-right:10px;	color: blue;}
#accept{	padding-right:5px;	color: red;}
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
* {font-family: 15px/1.0 맑은 고딕;}
#kCalendar #header {height: 80px; line-height: 50px; text-align: center; font-size: 25px; font-weight: bold; }
#kCalendar .button {color: #000; text-decoration: none;}
#kCalendar table {width: 900px; height: 540px; padding-left: 5px; }
#kCalendar table td{text-align: center;}
#call{	padding-right:10px;	color: blue;}
#accept{	padding-right:5px;	color: red;}
#a1{width:90px; text-align: center;}
#a2{width:90px; text-align: center;}
#a3{width:100px; text-align: center;}
#a4{width:130px; text-align: center;}
#a5{width:150px; text-align: center;}
#a6{width:50px; text-align: center;}
#a7{width:50px; text-align: center;}
#a8{width:90px; text-align: center;}
</Style>
</head>
<body>
<section>
	<div id="header">
		<div id="kCalendar" class="form-control">
		<div id="header"><input type="month" id="Hdate" onchange="HbookDate()"></div>
			<table id="calen" >
				<thead>
					<tr>
						<th><label id="a1">체크인</label></th>
						<th><label id="a2">체크아웃</label></th>
						<th><label id="a3">예약자명</label></th>
						<th><label id="a4">객실유형</label></th>
						<th><label id="a5">카드번호</label></th>
						<th><label id="a6">인원</label></th>
						<th><label id="a7">진행상태</label></th>
						<th><label id="a8">예약 관리</label></th>
					</tr>
				</thead>
				<tbody id="hotBooktbody">
				</tbody>
			</table>
		</div>
	</div>
</section>
</body>
</html>