<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
a:link {
	color: #666;
	font-weight: bold;
	text-decoration: none;
}

a:visited {
	color: #666;
	font-weight: bold;
	text-decoration: none;
}

a:active, a:hover {
	color: #bd5a35;
	text-decoration: underline;
}

table a:link {
	color: #666;
	font-weight: bold;
	text-decoration: none;
}

table a:visited {
	color: #999999;
	font-weight: bold;
	text-decoration: none;
}

table a:active, table a:hover {
	color: #bd5a35;
	text-decoration: underline;
}

table {
	font-family: Arial, Helvetica, sans-serif;
	color: #666;
	font-size: 12px;
	text-shadow: 1px 1px 0px #fff;
	background: #eaebec;
	margin: 20px;
	border: #ccc 1px solid;
	-moz-border-radius: 3px;
	-webkit-border-radius: 3px;
	border-radius: 3px;
	-moz-box-shadow: 0 1px 2px #d1d1d1;
	-webkit-box-shadow: 0 1px 2px #d1d1d1;
	box-shadow: 0 1px 2px #d1d1d1;
}

table th {
	padding: 15px;
	border-top: 1px solid #fafafa;
	border-bottom: 1px solid #e0e0e0;
	background: #ededed;
	background: -webkit-gradient(linear, left top, left bottom, from(#ededed),
		to(#ebebeb));
	background: -moz-linear-gradient(top, #ededed, #ebebeb);
}

table th:first-child {
	text-align: left;
	padding-left: 20px;
}

table tr:first-child th:first-child {
	-moz-border-radius-topleft: 3px;
	-webkit-border-top-left-radius: 3px;
	border-top-left-radius: 3px;
}

table tr:first-child th:last-child {
	-moz-border-radius-topright: 3px;
	-webkit-border-top-right-radius: 3px;
	border-top-right-radius: 3px;
}

table tr {
	text-align: center;
	padding-left: 20px;
}

table tr td:first-child {
	text-align: left;
	padding-left: 20px;
	border-left: 0;
}

table tr td {
	padding: 12px;
	border-top: 1px solid #ffffff;
	border-bottom: 1px solid #e0e0e0;
	border-left: 1px solid #e0e0e0;
	background: #fafafa;
	background: -webkit-gradient(linear, left top, left bottom, from(#fbfbfb),
		to(#fafafa));
	background: -moz-linear-gradient(top, #fbfbfb, #fafafa);
}

table tr.even td {
	background: #f6f6f6;
	background: -webkit-gradient(linear, left top, left bottom, from(#f8f8f8),
		to(#f6f6f6));
	background: -moz-linear-gradient(top, #f8f8f8, #f6f6f6);
}

table tr:last-child td {
	border-bottom: 0;
}

table tr:last-child td:first-child {
	-moz-border-radius-bottomleft: 3px;
	-webkit-border-bottom-left-radius: 3px;
	border-bottom-left-radius: 3px;
}

table tr:last-child td:last-child {
	-moz-border-radius-bottomright: 3px;
	-webkit-border-bottom-right-radius: 3px;
	border-bottom-right-radius: 3px;
}

table tr:hover td {
	background: #f2f2f2;
	background: -webkit-gradient(linear, left top, left bottom, from(#f2f2f2),
		to(#f0f0f0));
	background: -moz-linear-gradient(top, #f2f2f2, #f0f0f0);
}

.panel {
	background-color: #444;
	height: 34px;
	padding: 10px;
}

.panel a#booking_pop {
	border: 2px solid #aaa;
	color: #fff;
	display: block;
	float: left;
	margin-left: 10px;
	padding: 5px 10px;
	text-decoration: none;
	text-shadow: 1px 1px #000;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	-ms-border-radius: 10px;
	-o-border-radius: 10px;
	border-radius: 10px;
	font-family: 'dotum';
}

a#booking_pop:hover {
	border-color: #eee;
}

.overlay {
	background-color: rgba(0, 0, 0, 0.6);
	bottom: 0;
	cursor: default;
	left: 0;
	opacity: 0;
	position: fixed;
	right: 0;
	top: 0;
	visibility: hidden;
	z-index: 1;
	-webkit-transition: opacity .5s;
	-moz-transition: opacity .5s;
	-ms-transition: opacity .5s;
	-o-transition: opacity .5s;
	transition: opacity .5s;
}

.overlay:target {
	visibility: visible;
	opacity: 1;
}

.popup {
	background-color: #fff;
	border: 3px solid #fff;
	display: inline-block;
	left: 50%;
	opacity: 0;
	padding: 15px;
	position: fixed;
	text-align: justify;
	top: 40%;
	visibility: hidden;
	z-index: 10;
	-webkit-transform: translate(-50%, -50%);
	-moz-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	-o-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	-ms-border-radius: 10px;
	-o-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 1px 1px 2px rgba(0, 0, 0, 0.4) inset;
	-moz-box-shadow: 0 1px 1px 2px rgba(0, 0, 0, 0.4) inset;
	-ms-box-shadow: 0 1px 1px 2px rgba(0, 0, 0, 0.4) inset;
	-o-box-shadow: 0 1px 1px 2px rgba(0, 0, 0, 0.4) inset;
	box-shadow: 0 1px 1px 2px rgba(0, 0, 0, 0.4) inset;
	-webkit-transition: opacity .5s, top .5s;
	-moz-transition: opacity .5s, top .5s;
	-ms-transition: opacity .5s, top .5s;
	-o-transition: opacity .5s, top .5s;
	transition: opacity .5s, top .5s;
}

.overlay:target+.popup {
	top: 50%;
	opacity: 1;
	visibility: visible;
}

.close {
	background-color: rgba(0, 0, 0, 0.8);
	height: 30px;
	line-height: 30px;
	position: absolute;
	right: 0;
	text-align: center;
	text-decoration: none;
	top: -15px;
	width: 30px;
	-webkit-border-radius: 15px;
	-moz-border-radius: 15px;
	-ms-border-radius: 15px;
	-o-border-radius: 15px;
	border-radius: 15px;
}

.close:before {
	color: rgba(255, 255, 255, 0.9);
	content: "X";
	font-size: 24px;
	text-shadow: 0 -1px rgba(0, 0, 0, 0.9);
}

.close:hover {
	background-color: rgba(64, 128, 128, 0.8);
}

.popup p, .popup div {
	margin-bottom: 10px;
}

.popup label {
	display: inline-block;
	text-align: left;
	width: 120px;
}
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="js/jquery-3.1.1.min.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script>
	$(document).ready(function() {
		$.datepicker.regional['ko'] = {
			closeText : '닫기',
			prevText : '이전달',
			nextText : '다음달',
			currentText : '오늘',
			monthNames : [ '1월(JAN)', '2월(FEB)', '3월(MAR)', '4월(APR)',
					'5월(MAY)', '6월(JUN)', '7월(JUL)', '8월(AUG)',
					'9월(SEP)', '10월(OCT)', '11월(NOV)', '12월(DEC)' ],
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
					'7월', '8월', '9월', '10월', '11월', '12월' ],
			dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
			weekHeader : 'Wk',
			dateFormat : 'yy-mm-dd',
			firstDay : 0,
			isRTL : false,
			showMonthAfterYear : true,
			yearSuffix : '',
			showOn : 'both',
			buttonText : "달력",
			changeMonth : true,
			changeYear : true,
			showButtonPanel : true,
			yearRange : 'c-99:c+99',
		};
		$.datepicker.setDefaults($.datepicker.regional['ko']);
	
		$('#datepicker').datepicker();
		$('#datepicker').datepicker("option", "maxDate",
				$("#datepicker1").val());
		$('#datepicker').datepicker("option","onClose",function(selectedDate) {
					$("#datepicker").datepicker("option", "maxDate",selectedDate);
		});
	
		$('#datepicker').datepicker();
		$('#datepicker').datepicker("option", "minDate",
				$("#datepicker1").val());
		$('#datepicker').datepicker("option","onClose",function(selectedDate) {
					$("#datepicker").datepicker("option", "minDate",selectedDate);
				});
		$('#datepicker1').datepicker();
		$('#datepicker1').datepicker("option", "maxDate",$("#datepicker1").val());
		$('#datepicker1').datepicker("option","onClose",function(selectedDate) {
					$("#datepicker1").datepicker("option", "maxDate",selectedDate);
				});
	
		$('#datepicker1').datepicker();
		$('#datepicker1').datepicker("option", "minDate",$("#datepicker1").val());
		$('#datepicker1').datepicker("option","onClose",function(selectedDate) {
					$("#datepicker1").datepicker("option", "minDate",selectedDate);
	
				});
		$("#datepicker").change(function() {
			$("#txt").text($(this).val());
			var checkin = $(this).val();
			$("#checkin").val(checkin);
		});
		$("#datepicker1").change(function() {
			$("#txt1").text($(this).val());
			var checkout = $(this).val();
			$("#checkout").val(checkout);
		});
		$("#adult").change(function() {
			$("#txt8").text($(this).val());
		});
		$("#child").change(function() {
			$("#txt9").text($(this).val());
		});
		$("#roomnum1").change(function() {
			var roomnum = $(this).val();
			$("#roomnum").val(roomnum);
		});		
		$("#booking_pop").click(function(){
			var child = $("#txt9").text();
			var adult = $("#txt8").text();
			var people ='어른 : '+adult+'/어린이 : '+child;
			$("#people").val(people);
		});

	});

	function change(idx,name){
		var target = document.getElementById(idx);
		var room = target.options[target.selectedIndex].text;
		var txt = name+" "+room+"객실";
		document.getElementById("spantxt").innerHTML = txt;
		document.getElementById("roomselect").value = room;
		document.getElementById("room_idx").value = idx;
	}
</script>
</head>
<body>
	<table cellspacing='0' border="0">
		<tr>
			<th colspan="2">체크인</th>
			<td><input type="text" id="datepicker" name="checkin" class="btn btn-default" placeholder="체크인"></td>
			<th colspan="2">체크아웃</th>
			<td><input type="text" id="datepicker1" name="checkout" class="btn btn-default" placeholder="체크아웃"></td>
		</tr>
		<tr>
			<th>객실 </th>
			<td>
			<select name="room" id="roomnum1">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
			</select>
			</td>
			<th>성인</th>
			<td>
			<select name="adult" id="adult">
					<option value="0">0</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
			</select>
			</td>
			<th>어린이</th>
			<td>
			<select name="child" id="child">
					<option value="0">0</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
			</select>
			</td>
		</tr>

		<tr>
			<th>객실유형</th>
			<th>정 원</th>
			<th>객실요금</th>
			<th>조 건</th>
			<th>객실 선택</th>
			<th rowspan="7">선택한 객실<br> <a href="#booking_form" id="booking_pop"><input type="button" value="예약하기"></a></th>
		</tr>
		<c:forEach var="dto" items="${hotelroom}">	
		<tr>
			<td id="roomname"> ${dto.roomname}</td>
			<td>2명</td>
			<td>${dto.roomprice }</td>
			<td>${dto.room_option }</td>
			<td>
				<select name="room" onchange="javascript:change('${dto.room_idx}','${dto.roomname}')" id="${dto.room_idx }">
				<c:forEach begin="0" end="${dto.roomnum}" step="1" var="i">
					<option value="${i}">${i}</option>
				</c:forEach>
				</select>
			</td>
			<th></th>
		</tr>
	 </c:forEach>
	</table>
	<a href="#x" class="overlay" id="booking_form"></a>
	<div class="popup">
		<div>
			<label for="checkin">체크인:</label>
			<span id="txt"></span>
		</div>
		<div>
			<label for="checkout">체크아웃:</label>
			<span id="txt1"></span>
		</div>
		<div>
			<label for="adult">성인:</label>
			<span id="txt8"></span>
		</div>
		<div>
			<label for="child">어린이:</label>
			<span id="txt9"></span>
		</div>
		<div>
			<label for="roomtype">객실 타입:</label>
			<span id="spantxt"></span>
		</div>
	    <hr>
	  	[예약자 정보 입력]
	  	<div></div>
	  	<form name="booking_hot" action="booking_hot.do" method="post">
	  	<input type="hidden" name="hot_num" value="${hot_num}">
	  	<input type="hidden" name="name" value="${mdto.m_name}">
	  	<input type="hidden" name="sex" value="${mdto.m_sex}">
		<input type="hidden" name="nationality" value="${mdto.m_nationality}">
		<input type="hidden" name="checkin" id="checkin">  	
		<input type="hidden" name="checkout" id="checkout">  	 		
		<input type="hidden" name="people" id="people">  	
		<input type="hidden" name="roomselect" id="roomselect">	
		<input type="hidden" name="permit" value="0">
		<input type="hidden" name="room_idx" id="room_idx">
		<div>
		예약자명: ${mdto.m_name}
		</div>
		<div>
		성 별: ${mdto.m_sex }
		</div>
		<div>
		국적:${mdto.m_nationality}
		</div>
		<div>카드 번호: 
			<select name="cardco">
				<option value="Lotte">롯데</option>
				<option value="BC">비씨</option>
				<option value="Master">마스터</option>
				</select>&nbsp;
				<input type="text" name="cardnum">
		</div>
	<div>
		<label><input type="submit" value="예약"></label>
	</div>
	</form>
		<a class="close" href="#close"></a>	
</div>
</body>
</html>