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
				msg+='<tr><td colspan="7" id="hhh"><br> 요청날짜에 예약이 없습니다. </td></tr>';	
			}else{
				for(var i=0;i<HbookList.length;i++){						
					var Hbook=HbookList[i];
					var checkin=Hbook.checkin.split(' ');
					var checkout=Hbook.checkout.split(' ');
					if(Hbook.permit=='0'){	
						
						msg+='<tr><td id="hhh"><span>'+checkin[0]+'</span></td>';
						msg+='<td id="hhh"><span><a href="#" onclick="HbookCheckout('+Hbook.room_idx+')">'+checkout[0]+'</a></span></td>';
						msg+='<td id="hhh"><span><a href="#" onclick="HbookContent('+Hbook.bookingnum+')">'+Hbook.name+'</a></span></td>';
						msg+='<td id="hhh"><span>'+Hbook.roomname+'</span></td>';
						msg+='<td id="hhh"><span>'+Hbook.card+'</span></td>';
						msg+='<td id="hhh"><span>'+Hbook.people+'</span></td>';
						msg+='<td id="hhh"><span id="call">예약대기</span></td>';
						msg+='<td><button type="button" class="btn btn-default" onclick="Hbookpermit('+Hbook.bookingnum+')">확정</button><button type="button" class="btn btn-default" onclick="Hbookdel('+Hbook.bookingnum+','+Hbook.room_idx+')">삭제</button></td></tr>';
					}else{
						msg+='<tr id="hhh"><td id="hhh"><span>'+checkin[0]+'</span></td>';
						msg+='<td id="hhh"><span><a href="#" onclick="HbookCheckout('+Hbook.room_idx+')">'+checkout[0]+'</a></span></td>';
						msg+='<td id="hhh"><span><a href="#" onclick="HbookContent('+Hbook.bookingnum+')">'+Hbook.name+'</a></span></td>';
						msg+='<td id="hhh"><span>'+Hbook.roomname+'</span></td>';
						msg+='<td id="hhh"><span>'+Hbook.card+'</span></td>';
						msg+='<td id="hhh"><span>'+Hbook.people+'</span></td>';
						msg+='<td id="hhh"><span id="accept">예약완료</span></td>';
						msg+='<td><button type="button" class="btn btn-default" onclick="Hbookdel('+Hbook.bookingnum+','+Hbook.room_idx+')">삭제</button></td></tr>';
					}
				}
				msg+='';
					
			}			
			var table=document.getElementById("hotBooktbody");
			table.innerHTML=msg;
		}
	}
}
 function Hbookdel(bookingnum, room_idx){
	var result=window.confirm('정말 삭제하시겠습니까?');
	if(result){
		var params='bookingnum='+bookingnum+'&room_idx='+room_idx;
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

function HbookCheckout(room_idx){
	var result=window.confirm('체크아웃 하시겠습니까?');
	if(result){
		var params='room_idx='+room_idx;
		sendRequest('hCheckout.do', params, HbookdelResult, 'POST');
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
	var bookingnum=bookingnum;
	var addr='Hbookcontent.do?bookingnum='+bookingnum;
	window.open(addr, 'Hcontent', 'width:480px;, height:450px;, left=100, top=30');
}	


</script>
<style>
#kCalendar{  width:1050px;  height:650px;   font:15px/1.0 맑은 고딕; /* border : 1px solid #EAEAEA;  overflow-y:scroll; white-space:nowrap; */}
/* #Bookdate{text-align: center;font:20px/1.0 맑은 고딕;} */
#call{	padding-right:10px;	color: blue;}
#accept{	padding-right:5px;	color: red;}
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
* {font-family: 15px/1.0 맑은 고딕;}
#kCalendar #header {height: 80px; line-height: 50px; text-align: center; font-size: 25px; font-weight: bold; }
#calen{ margin: 0px auto;    border-spacing: 0px; width: 1035px; height: 540px; }
#a1{width:90px; }
#a2{width:90px; }
#a3{width:100px;}
#a4{width:130px;}
#a5{width:170px; }
#a6{width:120px; }
#a7{width:80px; }
#a8{width:110px; }
#a1,#a2,#a3,#a4,#a5,#a6,#a7,#a8{
	border-top: 3px solid #BDBDBD;
	border-bottom: 3px solid #BDBDBD;
	height: 50px;
	text-align: center;
}
#hhh{border-bottom: 1px solid #BDBDBD;
	height: 40px;
	text-align: center;
	padding-top: 13px;	}
</Style>
</head>
<body>
<div id="wrapper">
<%@ include file="/WEB-INF/views/myIndex.jsp"%>
	<div id="page-wrapper">
<section>
	<div id="header">
		<div id="kCalendar" class="form-control">
		<div id="header"><input type="month" id="Hdate" onchange="HbookDate()"></div>
			<table id="calen" >
				<thead>
					<tr>
						<th id="a1">체크인</th>
						<th id="a2">체크아웃</th>
						<th id="a3">예약자명</th>
						<th id="a4">객실유형</th>
						<th id="a5">카드번호</th>
						<th id="a6">인원</th>
						<th id="a7">진행상태</th>
						<th id="a8">예약 관리</th>
					</tr>
				</thead>
				<tbody id="hotBooktbody" style="vertical-align: top;">
				</tbody>
			</table>
		</div>
	</div>
</section>
</div>
</div>
</body>
</html>