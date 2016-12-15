<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="/flamans/js/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
function HbookreWrite(bookingnum, name){
	var addr='HBook_reWrite.do?bookingnum='+bookingnum+'&name='+name;
	window.open(addr, 'HbookreWrite', 'width=820px, height=450px, left=100, top=30');
	window.self.close();
}
function closeCon(){
	window.self.close();
}
$(document).ready(function dddate(){
	var ddate=document.getElementById("ddate");
	var checkin='${Hdto.checkin }';
	var checkout='${Hdto.checkout }';
	checkin=checkin.split(' ');
	checkout=checkout.split(' ');
	ddate.innerHTML=checkin[0]+'~'+checkout[0];
});
</script>
<style>
#ttt{width:180px;}
#tt{text-align: center;/* float: right; width:220px;  */}
</style>
</head>
<body>
<section>
	<fieldset>
	<br>
	<c:set var="Hdto" value='${Hdto}'/>
			<table class="table">
				<tr>
					<th id="ttt">호텔 명</th>
					<td>${Hdto.cm_name }</td>
				</tr>
				<tr>
					<th id="ttt">체크인 / 체크아웃</th>
					<td><span id="ddate"></span></td>
				</tr>
				<tr>
					<th id="ttt">예약자명</th>
					<td>${Hdto.name}</td>
				</tr>
				<tr>
					<th id="ttt">국적</th>
					<td>${Hdto.nationality}</td>
				</tr>			
				<tr>
					<th id="ttt">룸 타입</th>
					<td>${Hdto.roomname }</td>
				</tr>
				<tr>
					<th id="ttt">인원</th>
					<td>${Hdto.people }</td>
				</tr>
				<tr>
					<th id="ttt">카드 정보</th>
					<td>${Hdto.card }</td>
				</tr>
				<tr>
					<th id="ttt">예약 시간</th>
					<td>${Hdto.bookingdate }</td>	
				</tr>
				<tr>
					<td colspan="2" id="tt">
					<br>
						<button type="button" class="btn btn-default" onclick="closeCon()">확인</button>
						<c:if test="${!empty sessionScope.cm_name }">
		              		<button type="button" class="btn btn-default" onclick="HbookreWrite('${Hdto.bookingnum}','${Hdto.name}')">수정</button>
		            	</c:if><label id="tt"></label>
					</td>
				</tr>
			</table>	
		</fieldset>	
	</section>
</body>
</html>