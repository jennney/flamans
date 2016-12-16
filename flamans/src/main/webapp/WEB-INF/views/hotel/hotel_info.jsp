<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery.tmpl.js"></script>
	<script type="text/javascript" src="/flamans/js/httpRequest.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		$('.slideControl').slideControl();
	});
	
	</script>
	<style>
		
		<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
		
	input[type=range] {
		-webkit-appearance: none;
		margin: 18px 0;
		width: 100%;
	}
	input[type=range]:focus {
	  outline: none;
	}
	input[type=range]::-webkit-slider-runnable-track {
	  width: 100%;
	  height: 8.4px;
	  cursor: pointer;
	  animate: 0.2s;
	  box-shadow: 1px 1px 1px #000000, 0px 0px 1px #0d0d0d;
	  background: #3071a9;
	  border-radius: 1.3px;
	  border: 0.2px solid #010101;
	}
	input[type=range]::-webkit-slider-thumb {
	  box-shadow: 1px 1px 1px #000000, 0px 0px 1px #0d0d0d;
	  border: 1px solid #000000;
	  height: 36px;
	  width: 16px;
	  border-radius: 3px;
	  background: #ffffff;
	  cursor: pointer;
	  -webkit-appearance: none;
	  margin-top: -14px;
	}
	input[type=range]:focus::-webkit-slider-runnable-track {
	  background: #367ebd;
	}
	input[type=range]::-moz-range-track {
	  width: 100%;
	  height: 8.4px;
	  cursor: pointer;
	  animate: 0.2s;
	  box-shadow: 1px 1px 1px #000000, 0px 0px 1px #0d0d0d;
	  background: #3071a9;
	  border-radius: 1.3px;
	  border: 0.2px solid #010101;
	}
	input[type=range]::-moz-range-thumb {
	  box-shadow: 1px 1px 1px #000000, 0px 0px 1px #0d0d0d;
	  border: 1px solid #000000;
	  height: 36px;
	  width: 16px;
	  border-radius: 3px;
	  background: #ffffff;
	  cursor: pointer;
	}
	input[type=range]::-ms-track {
	  width: 100%;
	  height: 8.4px;
	  cursor: pointer;
	  animate: 0.2s;
	  background: transparent;
	  border-color: transparent;
	  border-width: 16px 0;
	  color: transparent;
	}
	input[type=range]::-ms-fill-lower {
	  background: #2a6495;
	  border: 0.2px solid #010101;
	  border-radius: 2.6px;
	  box-shadow: 1px 1px 1px #000000, 0px 0px 1px #0d0d0d;
	}
	input[type=range]::-ms-fill-upper {
	  background: #3071a9;
	  border: 0.2px solid #010101;
	  border-radius: 2.6px;
	  box-shadow: 1px 1px 1px #000000, 0px 0px 1px #0d0d0d;
	}
	input[type=range]::-ms-thumb {
	  box-shadow: 1px 1px 1px #000000, 0px 0px 1px #0d0d0d;
	  border: 1px solid #000000;
	  height: 36px;
	  width: 16px;
	  border-radius: 3px;
	  background: #ffffff;
	  cursor: pointer;
	}
	input[type=range]:focus::-ms-fill-lower {
	  background: #3071a9;
	}
	input[type=range]:focus::-ms-fill-upper {
	  background: #367ebd;
	}
	<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
	#wrapper
	{
		width:800px;
		margin:0 auto;
		color:#333;
		font-family:Tahoma;
		line-height:1.5;
		font-size:14px;
	}
	.demo { margin:30px 0;}
	.date-picker-wrapper .month-wrapper table .day.lalala { background-color:orange; }
	.options { display:none; border-left:6px solid #8ae; padding:10px; font-size:12px; line-height:1.4; background-color:#eee; border-radius:4px;}
	.date-picker-wrapper.date-range-picker19 .day.first-date-selected { background-color: red !important; }
	.date-picker-wrapper.date-range-picker19 .day.last-date-selected { background-color: orange !important; }
	
	.grade{display: none;}
	</style>
		
	<meta charset="UTF-8">
	<title>[name] 호텔 상세페이지</title>
	
	<style>
	#container {
		overflow: hidden;
		height: 300px;
		position: relative;
	}
	
	#btnRoadview, #btnMap {
		position: absolute;
		top: 5px;
		left: 5px;
		padding: 7px 12px;
		font-size: 14px;
		border: 1px solid #dbdbdb;
		background-color: #fff;
		border-radius: 2px;
		box-shadow: 0 1px 1px rgba(0, 0, 0, .04);
		z-index: 1;
		cursor: pointer;
	}
	
	#btnRoadview:hover, #btnMap:hover {
		background-color: #fcfcfc;
		border: 1px solid #c1c1c1;
	}
	
	#container.view_map #mapWrapper {
		z-index: 10;
	}
	
	#container.view_map #btnMap {
		display: none;
	}
	
	#container.view_roadview #mapWrapper {
		z-index: 0;
	}
	
	#container.view_roadview #btnRoadview {
		display: none;
	}
	</style>

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=ebe809a3005bdc67543fbb052162f94d&libraries=services"></script>
<script>

function number_check(num){
	var m_star = document.getElementById("m_star");
	if(!(num>0 && num<6)){
		alert('( 평점 ) 1~5사이의 숫자를 넣어주세요');
		document.comment_write.m_star.value='';
	}
}

function hotel_sub_search(param){
	sendRequest('hotel_sub_search.do', param, hotel_result_search, 'POST');
}

function hotel_result_search(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			
			var data = XHR.responseText;
			var hotel_list = '';
			
			grade = document.getElementsByName("grade");
			option = document.getElementsByName("option");
			star = document.getElementsByName("star");
			
			gradeimg1 = document.getElementById("gradeimg1");
			gradeimg2 = document.getElementById("gradeimg2");
			gradeimg3 = document.getElementById("gradeimg3");
			gradeimg4 = document.getElementById("gradeimg4");
			gradeimg5 = document.getElementById("gradeimg5");
			
			optionimg1 = document.getElementById("optionimg1");
			optionimg2 = document.getElementById("optionimg2");
			optionimg3 = document.getElementById("optionimg3");
			optionimg4 = document.getElementById("optionimg4");
			optionimg5 = document.getElementById("optionimg5");
			
			starimg1 = document.getElementById("starimg1");
			starimg2 = document.getElementById("starimg2");
			starimg3 = document.getElementById("starimg3");
			starimg4 = document.getElementById("starimg4");
			starimg5 = document.getElementById("starimg5");
			
			if(grade[0].checked){
				gradeimg1.innerHTML = '<img alt="등급1" src="img/select_grade1.jpg" width="50" height="50">';
			}else{
				gradeimg1.innerHTML = '<img alt="등급1" src="img/grade1.jpg" width="50" height="50">';
			}
			
			if(grade[1].checked){
				gradeimg2.innerHTML = '<img alt="등급1" src="img/select_grade2.jpg" width="50" height="50">';
			}else{
				gradeimg2.innerHTML = '<img alt="등급1" src="img/grade2.jpg" width="50" height="50">';
			}
			
			if(grade[2].checked){
				gradeimg3.innerHTML = '<img alt="등급1" src="img/select_grade3.jpg" width="50" height="50">';
			}else{
				gradeimg3.innerHTML = '<img alt="등급1" src="img/grade3.jpg" width="50" height="50">';
			}
			
			if(grade[3].checked){
				gradeimg4.innerHTML = '<img alt="등급1" src="img/select_grade4.jpg" width="50" height="50">';
			}else{
				gradeimg4.innerHTML = '<img alt="등급1" src="img/grade4.jpg" width="50" height="50">';
			}
			
			if(grade[4].checked){
				gradeimg5.innerHTML = '<img alt="등급1" src="img/select_grade5.jpg" width="50" height="50">';
			}else{
				gradeimg5.innerHTML = '<img alt="등급1" src="img/grade5.jpg" width="50" height="50">';
			}
			
			if(option[0].checked){
				optionimg1.innerHTML = '<img alt="등급1" src="img/select_alarm.jpg" width="50" height="50">';
			}else{
				optionimg1.innerHTML = '<img alt="등급1" src="img/alarm.jpg" width="50" height="50">';
			}
			
			if(option[1].checked){
				optionimg2.innerHTML = '<img alt="등급1" src="img/select_bath.jpg" width="50" height="50">';
			}else{
				optionimg2.innerHTML = '<img alt="등급1" src="img/bath.jpg" width="50" height="50">';
			}
			
			if(option[2].checked){
				optionimg3.innerHTML = '<img alt="등급1" src="img/select_breakfast.jpg" width="50" height="50">';
			}else{
				optionimg3.innerHTML = '<img alt="등급1" src="img/breakfast.jpg" width="50" height="50">';
			}
			
			if(option[3].checked){
				optionimg4.innerHTML = '<img alt="등급1" src="img/select_minibar.jpg" width="50" height="50">';
			}else{
				optionimg4.innerHTML = '<img alt="등급1" src="img/minibar.jpg" width="50" height="50">';
			}
			
			if(option[4].checked){
				optionimg5.innerHTML = '<img alt="등급1" src="img/select_safebox.jpg" width="50" height="50">';
			}else{
				optionimg5.innerHTML = '<img alt="등급1" src="img/safebox.jpg" width="50" height="50">';
			}
			
			
			
			
			if(star[0].checked){
				starimg1.innerHTML = '<img alt="등급1" src="img/select_star1.jpg" width="50" height="50">';
			}else{
				starimg1.innerHTML = '<img alt="등급1" src="img/star1.jpg" width="50" height="50">';
			}
			
			if(star[1].checked){
				starimg2.innerHTML = '<img alt="등급1" src="img/select_star2.jpg" width="50" height="50">';
			}else{
				starimg2.innerHTML = '<img alt="등급1" src="img/star2.jpg" width="50" height="50">';
			}
			
			if(star[2].checked){
				starimg3.innerHTML = '<img alt="등급1" src="img/select_star3.jpg" width="50" height="50">';
			}else{
				starimg3.innerHTML = '<img alt="등급1" src="img/star3.jpg" width="50" height="50">';
			}
			
			if(star[3].checked){
				starimg4.innerHTML = '<img alt="등급1" src="img/select_star4.jpg" width="50" height="50">';
			}else{
				starimg4.innerHTML = '<img alt="등급1" src="img/star4.jpg" width="50" height="50">';
			}
			
			if(star[4].checked){
				starimg5.innerHTML = '<img alt="등급1" src="img/select_star5.jpg" width="50" height="50">';
			}else{
				starimg5.innerHTML = '<img alt="등급1" src="img/star4.jpg" width="50" height="50">';
			}
			
			// http://localhost:9090/myweb/img/1.jpg;
			data = eval('('+data+')');
			
			pagedata = data.pageStr1;
			data = data.list;
			
			for(var i in data){
				hotel_list += '';
				hotel_list +='<a href="hotel_get_info.do?hot_num='+data[i].hot_num+'"><h2 align="left">'+data[i].hot_name+'</h2></a>';
				hotel_list +='<table class="table table-hover"><tr>';
				hotel_list +='<td width="200"><img alt="호텔사진영역" src="'+data[i].hot_img+'"width="200" height="200"></td>';
				hotel_list +='<td width="400">'+data[i].hot_content+'</td>';
				hotel_list +='<td width="100"><a href="hot_wishlist.do?hot_num='+data[i].hot_num+'&hotel_link=hotel_list.do"><input type="button" class="btn btn-default" value="♥"></a>';
				hotel_list +='<a href="booking_hot.do?hot_num='+data[i].hot_num+'"><input type="button" class="btn btn-default" value="예약"></a></td>';
				hotel_list +='</tr></table>';
				if(i == data.length-1){
					hotel_list +='<table><tr><td>'+pagedata+'</td></tr></table>';	
				}
			}
			if(data.length==0){
				hotel_list +='<table><tr><td>검색조건에 맞는 병원이 없습니다.</td></tr></table>';
			}
			
			var hotels = document.getElementById('hotellistarea');
			var hotelinfo = document.getElementById('hotelinfoarea');
			var hot_pagename = document.getElementById('hot_pagename');
			
			var hotel_list2 = '<div id="hotelinfoarea" style="border: 5px solid teal; width: 700px; float: right; margin-left: 0px auto;">';
			hotel_list2 += hotel_list;
			hotel_list2 += '</div>';
								
			hotelinfo.innerHTML='';
			hot_pagename.innerHTML = '<h2>검색된 호텔 리스트</h2>';
			hotels.innerHTML=hotel_list2;
			
		}
	}
}

function hot_grade_search(search_option){
	grade = document.getElementsByName("grade");
 	option = document.getElementsByName("option");
	star = document.getElementsByName("star");
 	price_hotel = document.getElementsByName("price_hotel");
 	show_price = document.getElementById("show_price");
 		
 	var findname = document.hotel_main_search.findname.value;
 	var checkin  = document.hotel_main_search.checkin.value;
 	var checkout = document.hotel_main_search.checkout.value;
 	var roomprice = document.hot_option_select.price_hotel.value;
 	
 	/////////////////////////■ 등급 ■ ////////////////////////
 	
	if(search_option == 'grade1'){
		if(grade[0].checked){
			grade[0].checked = false;
		}else{
			grade[0].checked = true;
		}
	}else if(search_option == 'grade2'){
		if(grade[1].checked){
			grade[1].checked = false;
		}else{
			grade[1].checked = true;
		}
	}else if(search_option == 'grade3'){
		if(grade[2].checked){
			grade[2].checked = false;
		}else{
			grade[2].checked = true;
		}
	}else if(search_option == 'grade4'){
		if(grade[3].checked){
			grade[3].checked = false;
		}else{
			grade[3].checked = true;
		}
	}else if(search_option == 'grade5'){
		if(grade[4].checked){
			grade[4].checked = false;
		}else{
			grade[4].checked = true;
		}
	}
 	
 	
	//////////////////■top옵션 ■/////////////////
	if(search_option == 'wifi'){
		if(option[0].checked){
			option[0].checked = false;
		}else{
			option[0].checked = true;
		}
	}else if(search_option == 'swim'){
		if(option[1].checked){
			option[1].checked = false;
		}else{
			option[1].checked = true;
		}
	}else if(search_option == 'fit'){
		if(option[2].checked){
			option[2].checked = false;
		}else{
			option[2].checked = true;
		}
	}else if(search_option == 'brunch'){
		if(option[3].checked){
			option[3].checked = false;
		}else{
			option[3].checked = true;
		}
	}else if(search_option == 'tub'){
		if(option[4].checked){
			option[4].checked = false;
		}else{
			option[4].checked = true;
		}
	}
	
	if(search_option == 'star1'){
		if(star[0].checked){
			star[0].checked = false;
		}else{
			star[0].checked = true;
		}
	}else if(search_option == 'star2'){
		if(star[1].checked){
			star[1].checked = false;
		}else{
			star[1].checked = true;
		}
	}else if(search_option == 'star3'){
		if(star[2].checked){
			star[2].checked = false;
		}else{
			star[2].checked = true;
		}
	}else if(search_option == 'star4'){
		if(star[3].checked){
			star[3].checked = false;
		}else{
			star[3].checked = true;
		}
	}else if(search_option == 'star5'){
		if(star[4].checked){
			star[4].checked = false;
		}else{
			star[4].checked = true;
		}
	}
 	
	var params='';
	
	var z=0;
	for(var i=1; i<6; i++){	
		if(grade[i-1].checked){
			if(z==1){
				params+='&';
			}
			params += 'grade'+i+'='+i;
			z=1;
		}
	}
	
	for(var i=1; i<6; i++){	
		if(option[i-1].checked){
			if(z==1){
				params+='&';
			}
			
			if(i==1){
				params += 'option'+i+'=wifi';
			}else if (i==2){
				params += 'option'+i+'=swim';
			}else if (i==3){
				params += 'option'+i+'=fit';
			}else if (i==4){
				params += 'option'+i+'=brunch';
			}else if (i==4){
				params += 'option'+i+'=tub';
			}
			z=1;
		}
	}
	
	for(var i=1; i<6; i++){	
		if(star[i-1].checked){
			if(z==1){
				params+='&';
			}
			params += 'star'+i+'='+i;
			z=1;
		}
	}
	
	if(roomprice>=10000 && roomprice<=200000){
		i=0;
 		if(z==1){
 			params+='&';
 		}
 		params += 'price='+roomprice;
 		z=1;
 		
 		show_price.innerHTML = '['+roomprice+'원]';
 	}
	
	if(findname!='' && findname!=null){
		if(z==1){
			params+='&';
		}
		params += 'findname='+findname;
		z=1;
	}
	
	if(checkin!='' && checkin!=null){
		if(z==1){
			params+='&';
		}
		params += 'checkin='+checkin;
		z=1;
	}
	
	if(checkout!='' && checkout!=null){
		if(z==1){
			params+='&';
		}
		params += 'checkout='+checkout;
		z=1;
	}
	
	hotel_sub_search(params);
}

window.onload=function(){	
	var hot_addr = document.getElementById('hot_addr').value;
	var geocoder = new daum.maps.services.Geocoder();
	geocoder.addr2coord(hot_addr, function(status, result) {
	     if (status === daum.maps.services.Status.OK) {
    		var container = document.getElementById('container'),
    	    	mapWrapper = document.getElementById('mapWrapper'),
    	   		btnRoadview = document.getElementById('btnRoadview'),
    	    	btnMap = document.getElementById('btnMap'),
    	    	rvContainer = document.getElementById('roadview'), 
    	    	mapContainer = document.getElementById('map')
	        var placePosition = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
	    	var mapOption = {
	    			center: placePosition,
	    		    level: 3
	    	};
	    	var map = new daum.maps.Map(mapContainer, mapOption);
	    	var roadview = new daum.maps.Roadview(rvContainer);
	    	var mapMarker = new daum.maps.Marker({
	    	    position: placePosition,
	    	    map: map
	    	});
	    	daum.maps.event.addListener(roadview, 'init', function() {
	    	    var rvMarker = new daum.maps.Marker({
	    	        position: placePosition,
	    	        map: roadview
	    	    });
	    	});
			roadview.setViewpoint({
	    	    pan: 321,
	    	    tilt: 0,
	    	    zoom: 0
	    	});
			var roadviewClient = new daum.maps.RoadviewClient(); 
			roadviewClient.getNearestPanoId(placePosition,50, function(panoId) {
			    roadview.setPanoId(panoId,placePosition); 
			});
       		map.setCenter(placePosition);
	    } 
	}); 
}
function toggleMap(active) {
    if (active) {
        container.className = "view_map";
    } else {
        container.className = "view_roadview";
    }
}
</script>
</head>
<body>
	<div align="center" style="height: 2100px;">
		<%@ include file="../header.jsp" %>
		
		<table style="margin: 0px auto;">
			<tr>
				<td align="center"><div id="hot_pagename"><h2>호텔의 상세정보</h2></div></td>
			</tr>
			
			<tr>
				<td><form name="hotel_main_search" action="hotel_search_name.do">
		
					<table>
							
							<tr>
								<td align="center" colspan="2">
								<input type="text" class="form-control" id="findname" size="84" onkeypress="if(event.keyCode==13) {hot_grade_search(); return false;}">
								</td><td><input type="button" class="btn btn-default" style="width: 120px;" value="검색" onclick="hot_grade_search()">
								
								</td>
							</tr>
							
							<tr>
								<br>
								<td>CheckIn &nbsp;<input type="date" class="form-control" id="checkin" value="2016-12-23"></td>
								<td>CheckOut &nbsp;<input type="date" class="form-control" id="checkout" value="2016-12-24"></td>
								<td>방 정보 &nbsp;<select name="room_info" class="form-control">
										<option value="싱글룸">싱글룸</option>
										<option value="더블룸">더블룸</option>
										<option value="패밀리룸">패밀리룸</option>
										<option value="다인실">다인실</option>
								</select></td>
							</tr>
							
					</table>
	
				</form>
				
				<br>
			</td>
		</tr>
		</table>
		
		<div style="width: 1000px;">
		
				<div style="border: 5px solid teal; width: 270px; float: left; white-space:nowrap; margin:0px center;">
				<form name="hot_option_select">
	
					<table border="0" class="hotel_grade_search" cellspacing="0" width="150">
					
						<tr>
							<th colspan="5">호텔등급</th>
						</tr>
						
						<tr>
							<td onclick="hot_grade_search('grade1')">
								<div id=gradeimg1><img alt="등급1" src="img/grade1.jpg" width="50" height="50"></div>
								<input type="checkbox" name="grade" class="grade" value="1">
							</td>
							
							<td onclick="hot_grade_search('grade2')">
								<div id=gradeimg2><img alt="등급2" src="img/grade2.jpg" width="50" height="50"></div>
								<input type="checkbox" name="grade" class="grade" value="2">
							</td>
							
							<td onclick="hot_grade_search('grade3')">
								<div id=gradeimg3><img alt="등급3" src="img/grade3.jpg" width="50" height="50"></div>
								<input type="checkbox" name="grade" class="grade" value="3">
							</td>
							
							<td onclick="hot_grade_search('grade4')">
								<div id=gradeimg4><img alt="등급4" src="img/grade4.jpg" width="50" height="50"></div>
								<input type="checkbox" name="grade" class="grade" value="4">
							</td>
							
							<td onclick="hot_grade_search('grade5')">
								<div id=gradeimg5><img alt="등급4" src="img/grade5.jpg" width="50" height="50"></div>
								<input type="checkbox" name="grade" class="grade" value="5">
							</td>
							
						</tr>
						
						<tr>
							<td colspan="5"><hr></td>
						</tr>
						
						<tr>
							<th colspan="5">호텔평점</th>
						</tr>
						
						<tr>
							<td onclick="hot_grade_search('star1')">
								<div id=starimg1><img alt="평점1" src="img/star1.jpg" width="50" height="50"></div>
								<input type="checkbox" name="star" class="grade" value="1">
							</td>
							
							<td onclick="hot_grade_search('star2')">
								<div id=starimg2><img alt="평점2" src="img/star2.jpg" width="50" height="50"></div>
								<input type="checkbox" name="star" class="grade" value="2">
							</td>
							
							<td onclick="hot_grade_search('star3')">
								<div id=starimg3><img alt="평점3" src="img/star3.jpg" width="50" height="50"></div>
								<input type="checkbox" name="star" class="grade" value="3">
							</td>
							
							<td onclick="hot_grade_search('star4')">
								<div id=starimg4><img alt="평점4" src="img/star4.jpg" width="50" height="50"></div>
								<input type="checkbox" name="star" class="grade" value="4">
							</td>
							
							<td onclick="hot_grade_search('star5')">
								<div id=starimg5><img alt="평점5" src="img/star4.jpg" width="50" height="50"></div>
								<input type="checkbox" name="star" class="grade" value="5">
							</td>
							
						</tr>
					
					</table>
					
					<table border="0" class="hotel_grade_search" cellspacing="0" width="150">
					
						<tr>
							<td colspan="5"><hr></td>
						</tr>
						
						<tr>
							<th colspan="5" align="center">TOP 옵션</th>
						</tr>
						
						<tr>
						
							<td onclick="hot_grade_search('alarm')">
								<div id=optionimg1><img alt="옵션1" src="img/alarm.jpg" width="50" height="50"></div>
								<input type="checkbox" name="option" class="grade" value="1">
							</td>
							
							<td onclick="hot_grade_search('bath')">
								<div id=optionimg2><img alt="옵션2" src="img/bath.jpg" width="50" height="50"></div>
								<input type="checkbox" name="option" class="grade" value="2">
							</td>
							
							<td onclick="hot_grade_search('breakfast')">
								<div id=optionimg3><img alt="옵션3" src="img/breakfast.jpg" width="50" height="50"></div>
								<input type="checkbox" name="option" class="grade" value="3">
							</td>
							
							<td onclick="hot_grade_search('minibar')">
								<div id=optionimg4><img alt="옵션4" src="img/minibar.jpg" width="50" height="50"></div>
								<input type="checkbox" name="option" class="grade" value="4">
							</td>
							
							<td onclick="hot_grade_search('safebox')">
								<div id=optionimg5><img alt="옵션5" src="img/safebox.jpg" width="50" height="50"></div>
								<input type="checkbox" name="option" class="grade" value="5">
							</td>
							
						</tr>
						
						<tr>
							<th colspan="5" align="center"><hr></th>
						</tr>
	
						<!--
						
						<tr>
							<td colspan="5"><hr></td>
						</tr>
						
						<tr>
							<th colspan="5">호텔평점</th>
						</tr>
						
						<tr>
							<td><img alt="평점1" src="img/1.jpg" width="50" height="50">
							<input type="checkbox" name="rank" class="grade" value="5"></td>
							<td><img alt="평점2" src="img/2.jpg" width="50" height="50">
							<input type="checkbox" name="rank" class="grade" value="5"></td>
							<td><img alt="평점3" src="img/3.jpg" width="50" height="50">
							<input type="checkbox" name="rank" class="grade" value="5"></td>
							<td><img alt="평점4" src="img/4.jpg" width="50" height="50">
							<input type="checkbox" name="rank" class="grade" value="5"></td>
							<td><img alt="평점5" src="img/5.jpg" width="50" height="50">
							<input type="checkbox" name="rank" class="grade" value="5"></td>
						</tr>
						
						<tr>
							<td colspan="5"><hr></td>
						</tr>
						
						<tr>
							<th colspan="5">요금</th>
						</tr>
						-->
				
						<tr>
							<td colspan="5" align="center"><p id="show_price">현재요금 표시</p></td>
						</tr>
						
						<tr>
							<td colspan="5" align="center">[10000원]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[200000원]</td>
						</tr>
						
						<tr>
							<td colspan="5" align="center">
							<input type="range" name="price_hotel" min="10000" max="200000" step="10000" value="200000" onchange="hot_grade_search(this.value)"></td>
						</tr>
						
						<tr>
						
							<td colspan="5"><hr></td>
						</tr>
						
						<!--
						
						<tr>
							<td colspan="5"><hr></td>
						</tr>
						
						<tr>
							<td colspan="5" align="center"><input type="checkbox" name="available_hotel">예약가능 호텔만</td>
						</tr>
						
						<tr>
							<td colspan="5" align="center"><input type="checkbox" name="event_hotel">특가상품보기</td>
						</tr>
						
						<tr>
							<td colspan="5"><hr></td>
						</tr>
						
						<tr>
							<th colspan="5" align="center">거리</th>
						</tr>
						
						<tr>
							<td colspan="5" align="center">현재거리 표시</td>
						</tr>
						
						<tr>
							<td colspan="5" align="center">[최저거리] [최고거리]</td>
						</tr>
						
						<tr>
							<td colspan="5" align="center"><input type="range" name="distance_hotel" min="1" max="50"></td>
						</tr>
						
						<tr>
							<td colspan="5"><hr></td>
						</tr>
						
						-->
						
						<tr>
							<td colspan="5" align="center"><input type="button" class="btn btn-default" value="모든 검색 초기화"></td>
						</tr>
						
						<tr>
							<th colspan="5" align="center"><hr></th>
						</tr>
					
					</table>
					
			</form>
			</div>
			
			<p id="hotellistarea">
			
			</p>
			
			<div id="hotelinfoarea">
			<div style="border: 5px solid teal; width: 700px; float: right; margin-left: 0px auto;">
				
				
				<c:if test="${empty hotel_info }">
					<li> ---- 호텔이 없습니다. ---- </li>
				</c:if>
				
				<c:forEach var="hotel_info" items="${hotel_info }">
					
					<c:url var="wishlistUrl" value="hot_wishlist.do">
						<c:param name="hot_num">${hotel_info.hot_num }</c:param>
						<c:param name="hotel_link">hotel_get_info.do</c:param>
					</c:url>
					
					<table class="table">
						<tr>
							<td colspan="4" width="600" style="padding-top: 30px;"><h1 style="color:black; font: bold; ">[ ${hotel_info.hot_name } ]</h1></td>
							<td width="100" style="vertical-align: middle;">
								<a href="${ wishlistUrl}"><input type="button" class="btn btn-default" value="♥"></a>
								<a href="booking_hot.do?hot_num=${hotel_info.hot_num}"><input type="button" class="btn btn-default" value="예약"></a>
							</td>
						</tr>
					</table>
					
					<table class="table">
						<tr style="border-bottom: none;">
							<td><img alt="호텔사진영역" src="img/${hotel_info.hot_img }" width="300" height="300"></td>
							<td width="400" rowspan="2">${hotel_info.hot_content }</td>
						</tr>
						
						<tr>
							<td><input type="hidden" name="hot_addr" value="${hotel_info.hot_addr}" id="hot_addr">
								<div id="container" class="view_map">
								    <div id="mapWrapper" style="width:300px;height:300px;position:relative;">
								        <div id="map" style="width:300px;height:100%"></div>
								        <input type="button" id="btnRoadview" onclick="toggleMap(false)" title="로드뷰 보기" value="로드뷰">
								    </div>
								    <div id="rvWrapper" style="width:300px;height:300px;position:absolute;top:0;left:0;">
								        <div id="roadview" style="height:100%"></div>
								        <input type="button" id="btnMap" onclick="toggleMap(true)" title="지도 보기" value="지도">
								    </div>
								</div>
							</td>
						</tr>
					</table>
				</c:forEach>
			
				<hr>
				
				
				<h4>[ 평점/후기 작성 ]</h4>
				
				<form name="comment_write" action="hotel_input_comment_grade.do">
					
					<table class="table">
						<tr>
							<td><textarea style="resize:none;" class="form-control" rows="4" cols="85" name="c_comment" placeholder="로그인 후 작성 가능합니다."></textarea></td>
						</tr>
					</table>
					
					<table class="table">
					
						<tr>
							<td width="50">평점:</td>
							<td width="200"><input type="text" size="50" id="m_star" class="form-control" name="c_grade" onkeyup="number_check(this.value)"></td>
							<td><input type="submit" class="btn btn-default" value="작성"></td>
						</tr>
					
					</table>
					
					<hr>
						<c:forEach var="hotel_info" items="${hotel_info }">
							<input type="hidden" name="c_number" value="${hotel_info.hot_num }">
						</c:forEach>
					<br>
					
				</form>
				<h2>평점/후기</h2>
				<c:if test="${empty hotel_comment }">
					<li> ---- 덧글이 없습니다. 남겨주세요! ---- </li>
				</c:if>
				
				<c:forEach var="hotel_comment" items="${hotel_comment }">
					<div class="container" style="width: 700px;">
						<table class="table"  style="float: left;">
							<thead>
								<tr>
									<th width="100">[작성자]</th>
									<th width="100">[평점]</th>
									<th width="400">[내용]</th>
									<th width="100">[작성일]</th>
									<th><input type="button" name="" value=""></th>
								</tr>
							</thead>
							
							<tbody>
								<tr>
									<td>${hotel_comment.c_writer }</td>
									<td>${hotel_comment.c_grade } </td>
									<td>${hotel_comment.c_comment }</td>
									<td>${hotel_comment.c_date }</td>
								</tr>
							</tbody>
						</table>
					</div>
					<br/>
				</c:forEach>
			</div>
			</div>
		</div>
	</div>
	<%@ include file="../footer.jsp" %>
</body>
</html>