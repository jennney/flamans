<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {margin: 0;}
html, body {
	height: 100%;  /*바디 영역 높이값을 100%로 설정*/
}
.wrapper {
	min-height: 100%;
	height: auto !important;
	height: 100%;
	background:url(/data/201010/IJ12878312905648/footer_bg.gif) repeat-x bottom;
	margin: 0 auto -120px; /*하단 이미지 세로값만 마이너스 처리 */
}
.push {
	height: 120px; /* 하단 이미지 높이 영역 */
	text-align:center;
} 
body {
	font-family: Arial, Helvetica, sans-serif;
	margin: 0 auto;
}

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

</head>
<body>
	<form name="booking_hot_info" action="booking_info_msg.do">
	
	<div class="wrapper">
	<c:set var="dto" value="${list }"/>
	<div style="width:300px;margin:0px auto;padding:20px;border:8px #e0e0e0 solid;">
	<h2 style="font-family:georgia;font-size:20px;border-bottom:1px #e0e0e0 solid;margin-bottom:20px;">예약자 정보 입력</h2>
	
	<input type="hidden" name="checkin" value="${dto.checkin }">
	<input type="hidden" name="checkout" value="${dto.checkout }">
	<input type="hidden" name="people" value="${dto.adult }">
	<input type="hidden" name="people" value="${dto.child }">
	<input type="hidden" name="roomselect" value="${dto.roomselect }">
	
	<div>예약자명: 
	${dto.m_name}</div>
	<div>성 별: 
	${dto.m_sex }</div>
	<div>국적:
	${dto.m_nationality}</div>
	<div>카드 번호: 
		<select name="카드회사">
			<option value="Lotte">롯데</option>
			<option value="BC">비씨</option>
			<option value="Master">마스터</option>
			</select><input type="text" name="card"></div>
	<div>
			<label><a href="#booking_form"
					id="booking_pop"><input type="button" value="예약하기"></a></label>
	</div>
	<div class="push"></div>
</div>
</form>
	<a href="#x" class="overlay" id="booking_form"></a>
	<div class="popup">

		<div>
			<label for="name">예약자명:${dto.m_name}</label>
			
		</div>
		<div>
			<label for="checkout">호텔 명:${dto.name }</label>
	
		</div>
		<div>
			<label for="adult">룸 타입:${dto.roomselect }</label>
			
		</div>
		<div>
			<label for="child">예약 시간:${dto.bookingdate }</label>
			
		</div>
		<div>
			<label for="roomtype">체크인 / 체크아웃:${dto.checkin }~${dto.checkout }</label>
		
			
		</div>
		<div>
			<label for="roomtype">카드 정보:${dto.card }</label>
			
			
		</div>
					예약되었습니다. 감사합니다.
		<div>
			<label><input type="submit" value="예약" name="예약"></label>
		</div>
		<a class="close" href="#close"></a>
		
	</div>
</body>
</html>