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
	<div align="center" style="border: 7px solid maroon; height: 2100px;">
		<%@ include file="../header.jsp" %>
		
		<table style="margin: 0px auto;">
			<tr>
				<td align="center"><h2>호텔의 상세정보 페이지</h2></td>
			</tr>
			
			<tr>
				<td><%@ include file="hotel_main_search.jsp" %></td>
			</tr>
		</table>
		
		<div style="width: 1000px;">
		
			<div style="border: 5px solid pink; width: 270px; float: left; white-space:nowrap; margin:0px center;">
				<%@ include file="hotel_sub_search.jsp" %>
			</div>
		
			<div style="border: 5px solid pink;  width: 700px; float: right; margin-left: 0px auto;">
			
				<c:if test="${empty hotel_info }">
					<li> ---- 호텔이 없습니다. 오류오류 ---- </li>
				</c:if>
				
				<c:forEach var="hotel_info" items="${hotel_info }">
					
					<c:url var="wishlistUrl" value="hot_wishlist.do">
						<c:param name="hot_num">${hotel_info.hot_num }</c:param>
						<c:param name="hotel_link">hotel_get_info.do</c:param>
					</c:url>
					
					<table>
						<tr>
							<td colspan="4"><h1>[ ${hotel_info.hot_name } ] 정보</h1></td>
						</tr>
						<tr>
							<td><img alt="호텔사진영역" src="${hotel_info.hot_img }" width="150" height="150"></td>
							<td width="500">■호텔 상세정보 입력란(1)■ ${hotel_info.hot_content }</td>
							<td><a href="${ wishlistUrl}"><input type="button" value="♥"></a></td>
							<td><input type="button" value="예약"></td>
						</tr>
						
						<tr>
							<td><input type="hidden" name="hot_addr" value="${hotel_info.hot_addr}" id="hot_addr">
								<div id="container" class="view_map">
								    <div id="mapWrapper" style="width:400px;height:300px;position:relative;">
								        <div id="map" style="width:400px;height:100%"></div>
								        <input type="button" id="btnRoadview" onclick="toggleMap(false)" title="로드뷰 보기" value="로드뷰">
								    </div>
								    <div id="rvWrapper" style="width:400px;height:300px;position:absolute;top:0;left:0;">
								        <div id="roadview" style="height:100%"></div>
								        <input type="button" id="btnMap" onclick="toggleMap(true)" title="지도 보기" value="지도">
								    </div>
								</div>
							</td>
							<td>■호텔 상세정보 입력란(2)■ ${hotel_info.hot_content }</td>
						</tr>
					</table>
				</c:forEach>
			
				<hr>
				
				
				<h4>[ 평점/후기 작성 ]</h4>
				
				<c:set var="hotel_info" value="${hotel_info}"/>
				<form name="comment_write" action="hotel_input_comment_grade.do">
					
					<table class="table table-hover">
						<tr>
							<td><textarea rows="4" cols="90" name="c_comment" placeholder="로그인 후 체크아웃시 작성 가능합니다."></textarea></td>
						</tr>
					</table>
					<table class="table table-hover">
						<tr>
							<td>평점테스트:<input type="text" name="c_grade"></td>
						</tr>
						<tr>
							<td>작성자테스트:<input type="text" name="c_writer">
							<input type="submit" value="작성"></td>
						</tr>
					</table>
					
					<hr>
					<input type="hidden" name="c_number" value="1">
					<br>
				</form>
				
				<h2>평점/후기</h2>
				<c:if test="${empty hotel_comment }">
					<li> ---- 덧글이 없습니다. 남겨주세요! ---- </li>
				</c:if>
				
				<c:forEach var="hotel_comment" items="${hotel_comment }">
					<div class="container" style="width: 700px;">
						<table class="table table-hover"  style="float: left;">
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
</body>
</html>