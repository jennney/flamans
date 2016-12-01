<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=OUGW3V7HgY7vOawcMKdm"></script>
<script>
window.onload = function(){
	var map = new naver.maps.Map('map', {
	    center: new naver.maps.LatLng(37.50269,127.0864276),
	    zoom: 10
	});

	var marker = new naver.maps.Marker({
	    position: new naver.maps.LatLng(37.50269,127.0864276),
	    map: map
	});	
}
	
</script>
</head>
<body>
<ul class="tab" id="tab">
	<li>A</li>
	<li>B</li>
	<li>c</li>
</ul>
</body>
</html>
