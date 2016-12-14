<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset=UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/flamans/js/httpRequest.js"></script>
<style>
.grade{display: none;}

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
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=ebe809a3005bdc67543fbb052162f94d&libraries=services"></script>
<script>
	window.onload = function() {
		var hos_addr = document.getElementById('hos_addr').value;
		var geocoder = new daum.maps.services.Geocoder();
		geocoder.addr2coord(hos_addr, function(status, result) {
			if (status === daum.maps.services.Status.OK) {
				var container = document.getElementById('container'),
					mapWrapper = document.getElementById('mapWrapper'),
					btnRoadview = document.getElementById('btnRoadview'),
					btnMap = document.getElementById('btnMap'),
					rvContainer = document.getElementById('roadview'),
					mapContainer = document.getElementById('map')
				var placePosition = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
				var mapOption = {
					center : placePosition,
					level : 3
				};
				var map = new daum.maps.Map(mapContainer, mapOption);
				var roadview = new daum.maps.Roadview(rvContainer);
				var mapMarker = new daum.maps.Marker({
					position : placePosition,
					map : map
				});
				daum.maps.event.addListener(roadview, 'init', function() {
					var rvMarker = new daum.maps.Marker({
						position : placePosition,
						map : roadview
					});
				});
				roadview.setViewpoint({
					pan : 321,
					tilt : 0,
					zoom : 0
				});
				var roadviewClient = new daum.maps.RoadviewClient();
				roadviewClient.getNearestPanoId(placePosition, 50, function(panoId) {
					roadview.setPanoId(panoId, placePosition);
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

<script>
	
	function hospital_sub_search(param){
		sendRequest('hospital_sub_search.do', param, hospital_result_search, 'POST');
	}

	function hospital_result_search(){
		if(XHR.readyState==4){
			if(XHR.status==200){
				
				var data = XHR.responseText;
				var hospital_list = '';
				
				option = document.getElementsByName("option");
				
				optionimg1 = document.getElementById("optionimg1");
				optionimg2 = document.getElementById("optionimg2");
				optionimg3 = document.getElementById("optionimg3");
				optionimg4 = document.getElementById("optionimg4");
				optionimg5 = document.getElementById("optionimg5");
				
			
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

				// http://localhost:9090/myweb/img/1.jpg;
				data = eval('('+data+')');
				
				pagedata = data.pageStr1;
				data = data.list;
				for(var i in data){
					hospital_list += '';
					hospital_list +='<a href="hospital_get_info.do?hos_num='+data[i].hos_num+'"><h2 align="left">'+data[i].hos_name+'</h2></a>';
					hospital_list +='<table class="table table-hover"><tr>';
					hospital_list +='<td width="200"><img alt="병원사진영역" src="'+data[i].hos_img+'"width="200" height="200"></td>';
					hospital_list +='<td width="400">'+data[i].hos_content+'</td>';
					hospital_list +='<td width="100"><a href="hos_wishlist.do?hos_num='+data[i].hos_num+'&hospital_link=hospital_list.do"><input type="button" class="btn btn-default" value="♥"></a>';
					//<a href="booking_hos.do?hos_num='+data[i].hos_num+'"><input type="button" value="예약"></a>
					hospital_list +='</td>';
					hospital_list +='</tr></table>';
					if(i == data.length-1){
						hospital_list +='<table><tr><td>'+pagedata+'</td></tr></table>';	
					}
				}
				if(data.length==0){
					hospital_list +='<table><tr><td>검색조건에 맞는 병원이 없습니다.</td></tr></table>';
				}
				var hospitals = document.getElementById('hospitallistarea');
				var hos_infoarea = document.getElementById('hospitalinfoarea');
				var hos_pagename = document.getElementById('hos_pagename');
				
				var hospital_list2  = '<div style="border: 5px solid teal; width: 700px; float: right; margin-left: 0px auto;">';
					hospital_list2 += hospital_list;
					hospital_list2 += '</div>';
					
				hos_infoarea.innerHTML='';
				hos_pagename.innerHTML = '<h2>검색된 병원 리스트</h2>';
				hospitals.innerHTML=hospital_list2;
				
			}
		}
	}

	function hos_grade_search(search_option){
	 	option = document.getElementsByName("option");
	 	
	 	var findname = document.hospital_main_search.findname.value;

		//////////////////■top옵션 ■/////////////////
		if(search_option == 'option1'){
			if(option[0].checked){
				option[0].checked = false;
			}else{
				option[0].checked = true;
			}
		}else if(search_option == 'option2'){
			if(option[1].checked){
				option[1].checked = false;
			}else{
				option[1].checked = true;
			}
		}else if(search_option == 'option3'){
			if(option[2].checked){
				option[2].checked = false;
			}else{
				option[2].checked = true;
			}
		}else if(search_option == 'option4'){
			if(option[3].checked){
				option[3].checked = false;
			}else{
				option[3].checked = true;
			}
		}else if(search_option == 'option5'){
			if(option[4].checked){
				option[4].checked = false;
			}else{
				option[4].checked = true;
			}
		}
	 	
		var params='';
		
		var z=0;
		
		for(var i=1; i<6; i++){	
			if(option[i-1].checked){
				if(z==1){
					params+='&';
				}
				params += 'option'+i+'='+i;
				z=1;
			}
		}
		
		if(findname!='' && findname!=null){
			if(z==1){
				params+='&';
			}
			params += 'findname='+findname;
			z=1;
		}
		hospital_sub_search(params);
	}
	
</script>

</head>

<body>

	<div align="center">

		<%@ include file="../header.jsp"%>
		<table style="margin: 0px auto;">

			<tr>
				<td align="center"><div id="hos_pagename"><h2>병원의 상세정보</h2></div></td>
			</tr>

			<tr>
				<td>

					<form name="hospital_main_search">
					
		
						<table>
								<tr>
									<td align="center">
										<input type="text" id="findname" size="84" onkeypress="if(event.keyCode==13) {hos_grade_search(); return false;}">
										<input type="button" value="검색" class="btn btn-default" onclick="hos_grade_search()">
									</td>
								</tr>
						</table>
						<br/>
					</form>
	
				</td>
			</tr>

		</table>

		<div style="width: 1000px;">

			<div style="border: 5px solid teal; width: 270px; float: left; white-space: nowrap; margin: 0px center;">
				<form name="hos_option_select" action="hotel_sub_search.do">

					<table border="0" class="hospital_sub_search" cellspacing="0" width="150">
						
						<tr>
							<th colspan="5" align="center">TOP 옵션</th>
						</tr>
						
						<tr>
							<td onclick="hos_grade_search('option1')">
								<div id=optionimg1><img alt="옵션1" src="img/1.jpg" width="50" height="50"></div>
								<input type="checkbox" name="option" class="grade" value="1">
							</td>
							
							<td onclick="hos_grade_search('option2')">
								<div id=optionimg2><img alt="옵션2" src="img/2.jpg" width="50" height="50"></div>
								<input type="checkbox" name="option" class="grade" value="2">
							</td>
							
							<td onclick="hos_grade_search('option3')">
								<div id=optionimg3><img alt="옵션3" src="img/3.jpg" width="50" height="50"></div>
								<input type="checkbox" name="option" class="grade" value="3">
							</td>
							
							<td onclick="hos_grade_search('option4')">
								<div id=optionimg4><img alt="옵션4" src="img/4.jpg" width="50" height="50"></div>
								<input type="checkbox" name="option" class="grade" value="4">
							</td>
							
							<td onclick="hos_grade_search('option5')">
								<div id=optionimg5><img alt="옵션5" src="img/5.jpg" width="50" height="50"></div>
								<input type="checkbox" name="option" class="grade" value="5">
							</td>
						</tr>
						
						<tr>
							<th colspan="5" align="center"><hr></th>
						</tr>
						
						<tr>
							<td colspan="5" align="center"><input type="button" class="btn btn-default" value="모든 검색 초기화"></td>
						</tr>
						
						<tr>
							<th colspan="5" align="center"><hr></th>
						</tr>
						
						
					</table>
				
				</form>
			</div>

			<div id="hospitallistarea">
			</div>
			
			<div id="hospitalinfoarea">
			<div style="border: 5px solid teal; width: 700px; float: right; margin-left: 0px auto;">

				<c:if test="${empty hospital_info }">
					<li>---- 병원이 없습니다. ----</li>
				</c:if>

				<c:forEach var="hospital_info" items="${hospital_info }">

					<c:url var="wishlistUrl" value="hos_wishlist.do">
						<c:param name="hos_num">${hospital_info.hos_num }</c:param>
						<c:param name="hospital_link">hospital_get_info.do</c:param>
					</c:url>
				<form name="doctors" action="bBook.do">
					
					<input type="hidden" name="hos_num" value="${hospital_info.hos_num}" }>
					<c:set var="hospital_info" value="${hospital_info }"/>
						
					<table border="0" width="700" class="table">

						<tr>
							<td width="600" style="padding-top: 30px;"><h1 style="color:black; font: bold; ">【 ${hospital_info.hos_name } 】</h1><br></td>
							<td width="100" style="vertical-align: middle;">
							<a href="${wishlistUrl}"><input type="button" class="btn btn-default" value=" ♥ "></a>
								<input type="submit" class="btn btn-default" value="예약"></td>
						</tr>
					</table>

					<table border="0" width="700" class="table">
						<tr>
							<td width="200"><img alt="병원사진영역" src="${hospital_info.hos_img }" width="200" height="200"></td>
							<td width="500" valign="top" rowspan="2">■병원 상세정보 입력란■ ${hospital_info.hos_content }</td>
						</tr>

						<tr>
							<td width="200">
							<input type="hidden" name="hos_addr" value="${hospital_info.hos_addr}" id="hos_addr">
								<div id="container" class="view_map">
									<div id="mapWrapper"
										style="width: 200px; height: 200px; position: relative;">
										<div id="map" style="width: 200px; height: 100%"></div>
										<input type="button" id="btnRoadview"
											onclick="toggleMap(false)" title="로드뷰 보기" value="로드뷰">
									</div>
									<div id="rvWrapper"
										style="width: 200px; height: 200px; position: absolute; top: 0; left: 0;">
										<div id="roadview" style="height: 100%"></div>
										<input type="button" id="btnMap" onclick="toggleMap(true)"
											title="지도 보기" value="지도">
									</div>
								</div>
							</td>
						</tr>

					</table>

						<br/>
						<hr>
						<h3>의료진 정보</h3>
						<c:forEach var="hospital_doclist" items="${hospital_doclist }">

							<table border="1" class="table table-hover">

								<tr>
									<td width="100"><img alt="의사사진"
										src="img/${hospital_doclist.doc_img }" width="100"
										height="100"></td>
									<td width="500">이름: ${hospital_doclist.doc_name }<br />
										학력: ${hospital_doclist.doc_level }<br /> 경력:
										${hospital_doclist.doc_career }<br /> 기타:
										${hospital_doclist.doc_etc }<br />
									</td>
									<td><input type="radio" checked="checked" name="doc_num" value="${hospital_doclist.doc_num}"></td>								
									</tr>

							</table>

						</c:forEach>
					</form>
				</c:forEach>

				<hr>

				<h4>[ 평점/후기 작성 ]</h4>

				<c:set var="hospital_info" value="${hospital_info}" />

				<form name="comment_write" action="hospital_input_comment_grade.do">
					<table class="table">

						<tr>
							<td><textarea class="form-control" cols="85" rows="4" cols="90" name="c_comment"
									placeholder="로그인 후 체크아웃시 작성 가능합니다."></textarea></td>
						</tr>

					</table>

					<table class="table">
							<tr>
								<td width="110">평점</td>
								<td width="200"><input type="text" class="form-control" name="c_grade"></td>
								<td></td>
							</tr>
							
							<tr>
								<td width="110">작성자</td><td>
								<input type="text" class="form-control" name="c_writer"></td>
								<td><input type="submit" class="btn btn-default" value="작성"></td>
							</tr>
							
					</table>

					<hr>
					<c:forEach var="hospital_info" items="${hospital_info }">

						<input type="hidden" name="c_number" value="${ hospital_info.hos_num}">
						
					</c:forEach>
				</form>

				<h2>평점/후기</h2>
				<c:if test="${empty hospital_comment }">
					<li>---- 덧글이 없습니다. 남겨주세요! ----</li>
				</c:if>

				<c:forEach var="hospital_comment" items="${hospital_comment }">
					<div class="container" style="width: 700px;">
						<table class="table table-hover" style="float: left;">
							<thead>
								<tr>
									<th width="100">[작성자]</th>
									<th width="100">[평점]</th>
									<th width="400">[내용]</th>
									<th width="100">[작성일]</th>
								</tr>
							</thead>

							<tbody>
								<tr>
									<td>${hospital_comment.c_writer }</td>
									<td>${hospital_comment.c_grade }</td>
									<td>${hospital_comment.c_comment }</td>
									<td>${hospital_comment.c_date }</td>
								</tr>
							</tbody>
						</table>
					</div>
					<br />
				</c:forEach>

				</div>
			</div>
		</div>
	</div>

</body>
</html>