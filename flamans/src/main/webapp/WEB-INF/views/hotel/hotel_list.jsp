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
			

			.hotel_main_search ul li { list-style-type: none; text-align: center;}

            .hotel_list {width: 700px; border:2px solid black; margin: 0px auto;}
            .hotel_list ul {clear: left; margin: 0px; padding: 0px; list-style-type: none;}
            .hotel_list li {list-style-type: none;}
            /* list-style-type 블릿표시 padding: 0; 들여쓰기*/
            
            .hotel_list .subject {font-weight: bold;text-align: center;}
            .hotel_list ul li {text-align: center; float: left; margin: 0px; padding: 2px, 1px; list-style-type: none;}
            .hotel_info1{ width: 500px; }
            .wishlist{ width: 50px; }
            
            .hotel_list ul .col {width: 99px;} /* 표 라인 맞추기기 위해*/
            .grade{display: none;}
</style>

<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="js/jquery.tmpl.js"></script>
<script type="text/javascript" src="/myweb/js/httpRequest.js"></script>

<script>
	
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
					gradeimg1.innerHTML = '<img alt="등급1" src="img/1.jpg" width="50" height="50">';
				}
				
				if(grade[1].checked){
					gradeimg2.innerHTML = '<img alt="등급1" src="img/select_grade2.jpg" width="50" height="50">';
				}else{
					gradeimg2.innerHTML = '<img alt="등급1" src="img/2.jpg" width="50" height="50">';
				}
				
				if(grade[2].checked){
					gradeimg3.innerHTML = '<img alt="등급1" src="img/select_grade3.jpg" width="50" height="50">';
				}else{
					gradeimg3.innerHTML = '<img alt="등급1" src="img/3.jpg" width="50" height="50">';
				}
				
				if(grade[3].checked){
					gradeimg4.innerHTML = '<img alt="등급1" src="img/select_grade4.jpg" width="50" height="50">';
				}else{
					gradeimg4.innerHTML = '<img alt="등급1" src="img/4.jpg" width="50" height="50">';
				}
				
				if(grade[4].checked){
					gradeimg5.innerHTML = '<img alt="등급1" src="img/select_grade5.jpg" width="50" height="50">';
				}else{
					gradeimg5.innerHTML = '<img alt="등급1" src="img/5.jpg" width="50" height="50">';
				}
				
				if(option[0].checked){
					optionimg1.innerHTML = '<img alt="등급1" src="img/select_grade1.jpg" width="50" height="50">';
				}else{
					optionimg1.innerHTML = '<img alt="등급1" src="img/1.jpg" width="50" height="50">';
				}
				
				if(option[1].checked){
					optionimg2.innerHTML = '<img alt="등급1" src="img/select_grade2.jpg" width="50" height="50">';
				}else{
					optionimg2.innerHTML = '<img alt="등급1" src="img/2.jpg" width="50" height="50">';
				}
				
				if(option[2].checked){
					optionimg3.innerHTML = '<img alt="등급1" src="img/select_grade3.jpg" width="50" height="50">';
				}else{
					optionimg3.innerHTML = '<img alt="등급1" src="img/3.jpg" width="50" height="50">';
				}
				
				if(option[3].checked){
					optionimg4.innerHTML = '<img alt="등급1" src="img/select_grade4.jpg" width="50" height="50">';
				}else{
					optionimg4.innerHTML = '<img alt="등급1" src="img/4.jpg" width="50" height="50">';
				}
				
				if(option[4].checked){
					optionimg5.innerHTML = '<img alt="등급1" src="img/select_grade5.jpg" width="50" height="50">';
				}else{
					optionimg5.innerHTML = '<img alt="등급1" src="img/5.jpg" width="50" height="50">';
				}
				
				
				
				
				if(star[0].checked){
					starimg1.innerHTML = '<img alt="등급1" src="img/select_grade1.jpg" width="50" height="50">';
				}else{
					starimg1.innerHTML = '<img alt="등급1" src="img/1.jpg" width="50" height="50">';
				}
				
				if(star[1].checked){
					starimg2.innerHTML = '<img alt="등급1" src="img/select_grade2.jpg" width="50" height="50">';
				}else{
					starimg2.innerHTML = '<img alt="등급1" src="img/2.jpg" width="50" height="50">';
				}
				
				if(star[2].checked){
					starimg3.innerHTML = '<img alt="등급1" src="img/select_grade3.jpg" width="50" height="50">';
				}else{
					starimg3.innerHTML = '<img alt="등급1" src="img/3.jpg" width="50" height="50">';
				}
				
				if(star[3].checked){
					starimg4.innerHTML = '<img alt="등급1" src="img/select_grade4.jpg" width="50" height="50">';
				}else{
					starimg4.innerHTML = '<img alt="등급1" src="img/4.jpg" width="50" height="50">';
				}
				
				if(star[4].checked){
					starimg5.innerHTML = '<img alt="등급1" src="img/select_grade5.jpg" width="50" height="50">';
				}else{
					starimg5.innerHTML = '<img alt="등급1" src="img/5.jpg" width="50" height="50">';
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
				}
				hotel_list +='<table><tr><td>'+pagedata+'</td></tr></table>';
				var hotels = document.getElementById('hotellistarea');
				hotels.innerHTML=hotel_list;
				
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
		
		if(roomprice>=10000 && roomprice<=100000){
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
</script>

<meta charset="UTF-8">
<title>[name] 호텔 리스트</title>
</head>
<body onload="hot_grade_search();">
<%@ include file="../header.jsp" %>
	<div align="center" style="border: 7px solid maroon; height: 2100px;">

		
		
		<table style="margin: 0px auto;">
			<tr>
				<td align="center"><h2>검색된 호텔 리스트</h2></td>
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
								<div id=gradeimg1><img alt="등급1" src="img/1.jpg" width="50" height="50"></div>
								<input type="checkbox" name="grade" class="grade" value="1">
							</td>
							
							<td onclick="hot_grade_search('grade2')">
								<div id=gradeimg2><img alt="등급2" src="img/2.jpg" width="50" height="50"></div>
								<input type="checkbox" name="grade" class="grade" value="2">
							</td>
							
							<td onclick="hot_grade_search('grade3')">
								<div id=gradeimg3><img alt="등급3" src="img/3.jpg" width="50" height="50"></div>
								<input type="checkbox" name="grade" class="grade" value="3">
							</td>
							
							<td onclick="hot_grade_search('grade4')">
								<div id=gradeimg4><img alt="등급4" src="img/4.jpg" width="50" height="50"></div>
								<input type="checkbox" name="grade" class="grade" value="4">
							</td>
							
							<td onclick="hot_grade_search('grade5')">
								<div id=gradeimg5><img alt="등급4" src="img/5.jpg" width="50" height="50"></div>
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
								<div id=starimg1><img alt="평점1" src="img/1.jpg" width="50" height="50"></div>
								<input type="checkbox" name="star" class="grade" value="1">
							</td>
							
							<td onclick="hot_grade_search('star2')">
								<div id=starimg2><img alt="평점2" src="img/2.jpg" width="50" height="50"></div>
								<input type="checkbox" name="star" class="grade" value="2">
							</td>
							
							<td onclick="hot_grade_search('star3')">
								<div id=starimg3><img alt="평점3" src="img/3.jpg" width="50" height="50"></div>
								<input type="checkbox" name="star" class="grade" value="3">
							</td>
							
							<td onclick="hot_grade_search('star4')">
								<div id=starimg4><img alt="평점4" src="img/4.jpg" width="50" height="50"></div>
								<input type="checkbox" name="star" class="grade" value="4">
							</td>
							
							<td onclick="hot_grade_search('star5')">
								<div id=starimg5><img alt="평점5" src="img/5.jpg" width="50" height="50"></div>
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
						
							<td onclick="hot_grade_search('wifi')">
								<div id=optionimg1><img alt="옵션1" src="img/1.jpg" width="50" height="50"></div>
								<input type="checkbox" name="option" class="grade" value="1">
							</td>
							
							<td onclick="hot_grade_search('swim')">
								<div id=optionimg2><img alt="옵션2" src="img/2.jpg" width="50" height="50"></div>
								<input type="checkbox" name="option" class="grade" value="2">
							</td>
							
							<td onclick="hot_grade_search('fit')">
								<div id=optionimg3><img alt="옵션3" src="img/3.jpg" width="50" height="50"></div>
								<input type="checkbox" name="option" class="grade" value="3">
							</td>
							
							<td onclick="hot_grade_search('brunch')">
								<div id=optionimg4><img alt="옵션4" src="img/4.jpg" width="50" height="50"></div>
								<input type="checkbox" name="option" class="grade" value="4">
							</td>
							
							<td onclick="hot_grade_search('tub')">
								<div id=optionimg5><img alt="옵션5" src="img/5.jpg" width="50" height="50"></div>
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
							<td colspan="5" align="center">[10000원]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[100000원]</td>
						</tr>
						
						<tr>
							<td colspan="5" align="center">
							<input type="range" name="price_hotel" min="10000" max="100000" step="10000" onchange="hot_grade_search(this.value)"></td>
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
			
			<div style="border: 5px solid teal;  width: 700px; float: right; margin-left: 0px auto;">
				<p id="hotellistarea">
				
				
				<!--<c:if test="${empty hotel_info }">
					<li> ---- 검색된 호텔이 없습니다 ---- </li>
				</c:if>

				<c:forEach var="hotel_info" items="${hotel_info }">
				
					<c:url var="hotelinfoUrl" value="hotel_get_info.do">
 								<c:param name="hot_num">${hotel_info.hot_num }</c:param>
					</c:url>
					
					<c:url var="wishlistUrl" value="hot_wishlist.do">
 								<c:param name="hot_num">${hotel_info.hot_num }</c:param>
 								<c:param name="hotel_link">hotel_list.do</c:param>
					</c:url>
		
					
						<h2 align="left"><a href=" ${hotelinfoUrl} ">${hotel_info.hot_name}</a></h2>
							
							<table>
								<tr>
									<td width="200"><img alt="호텔사진영역" src="${hotel_info.hot_img}" width="200" height="200"></td>
									<td width="400">${hotel_info.hot_content}</td>
									<td width="100"><a href="${ wishlistUrl}"><input type="button" value="♥"></a>
									<input type="button" value="예약" onclick=""></td>
								</tr>		
							</table>
							
						<br/>
						
				</c:forEach>-->
				</p>
				
				<table>
					<tr>
						<td colspan="4" align="center">
							${pageStr1 }	   		
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>