<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지관리</title>
<style type="text/css">

.container {
	width: 1000px; margin: 10px auto;
}

ul.tabs {
	margin: 0;
   	padding: 0;
   	float: left;
   	list-style: none;
   	height: 32px;
   	border-bottom: 1px solid #999;
   	border-left: 1px solid #999;
   	width: 100%;
}

/*탭메뉴*/
ul.tabs li {
	float: left;
   	margin: 0;
   	padding: 0;
   	height: 31px;
   	line-height: 31px;
   	border: 1px solid #999;
   	border-left: none;
   	margin-bottom: -1px;
  	overflow: hidden;
   	position: relative;
}
ul.tabs li a {
   	text-decoration: none;
   	color: #000;
   	display: block;
   	font-size: 1.2em;
   	padding: 0 20px;
   	border: 1px solid #fff;
   	outline: none;
}
ul.tabs li a:hover {
   	background: #ccc;
}   
html ul.tabs li.active, html ul.tabs li.active a:hover  {
	background: #fff;
   	border-bottom: 1px solid #fff;
}

.tab_container {
	border: 1px solid #999;
   	border-top: none;
   	clear: both;
   	float: left; 
   	width: 100%;
   	background: #fff;
   	-moz-border-radius-bottomright: 5px;
   	-khtml-border-radius-bottomright: 5px;
   	-webkit-border-bottom-right-radius: 5px;
   	-moz-border-radius-bottomleft: 5px;
   	-khtml-border-radius-bottomleft: 5px;
   	-webkit-border-bottom-left-radius: 5px;
}

.tab_content {
   	padding: 20px;
   	font-size: 1.2em;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" src="/flamans/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="/flamans/js/httpRequest.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">

function wishlist(){
	sendRequest('member_wish_hlist.do', null, wishlistresult, 'GET');
}

function wishlistresult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data = XHR.responseText;
			
			// eval : 서버로부터 넘어온문자열들을 실제 객체로 바꾸어주는 녀석.
			// 실제 소괄호 안에 있는것을 라벨로 인식해서 data를 번역한다..
			// yong=+data
			
			if('${not empty sessionScope.userid}'=='true'){
				data = eval('('+data+')');
				var data_hos = '<table class="table table-hover" border="1" height="70" cellspacing="0"><tr align="center"><td width="150"><h3>병원이름</h3></td>';
				var data_hot = '<table class="table table-hover" border="1" height="70" cellspacing="0"><tr align="center"><td width="150"><h3>호텔이름</h3></td>';

				var wishlist = data.list;
				data = eval('('+wishlist+')');
				
				// 병원 비교 추가
				for( var i in data.hos ){
					if(i==5)break;
					data_hos += '<td width="200" align="center"><a href="hosel_get_info.do?hos_num='+data.hos[i].hos_num+'">'+data.hos[i].hos_name+'</a></td>';
				}data_hos += '</tr></table>';
				
				data_hos+= '<table class="table table-hover" border="1" height="150" cellspacing="0"><tr align="center"><td width="160"><h3>호텔사진</h3></td>';
				for( var i in data.hos ){
					if(i==5)break;
					data_hos += '<td width="200" align="center"><a href="hosel_get_info.do?hos_num='+data.hos[i].hos_num+'">'+'<img src="'+data.hos[i].hos_img+'" width=120 height=140></a></td>';
				}data_hos += '</tr></table>';
				
				data_hos+= '<table class="table table-hover" border="1" height="150" cellspacing="0"><tr align="center"><td width="150"><h3>호텔정보</h3></td>';
				for( var i in data.hos ){
					if(i==5)break;
					data_hos += '<td width="200" align="center"><a href="hosel_get_info.do?hos_num='+data.hos[i].hos_num+'">'+data.hos[i].hos_content+'</a></td>';
				}data_hos += '</tr></table>';
				
				data_hos+= '<table class="table table-hover" border="1" height="150" cellspacing="0"><tr align="center"><td width="150"><h3>호텔방정보</h3></td>';
				for( var i in data.hos ){
					if(i==5)break;
					data_hos += '<td width="200" align="center"><a href="hosel_get_info.do?hos_num='+data.hos[i].hos_num+'">'+data.hos[i].hos_roominfo+'</a></td>';
				}data_hos += '</tr></table>';
				
				data_hos+= '<table class="table table-hover" border="1" height="150" cellspacing="0"><tr align="center"><td width="150"><h3>호텔방옵션</h3></td>';
				for( var i in data.hos ){
					if(i==5)break;
					data_hos += '<td width="200" height="150" align="center"><a href="hosel_get_info.do?hos_num='+data.hos[i].hos_num+'">'+data.hos[i].hos_option+'</a></td>';
				}data_hos += '</tr></table>';
				
				data_hos+= '<table class="table table-hover" border="1" height="150" cellspacing="0"><tr align="center"><td width="150"><h3>기타정보</h3></td>';
				for( var i in data.hos ){
					if(i==5)break;
					data_hos += '<td width="200" align="center"><a href="hosel_get_info.do?hos_num='+data.hos[i].hos_num+'">'+data.hos[i].hos_etc+'</a></td>';
				}data_hos += '</tr></table>';
				
				data_hos+= '<table class="table table-hover" border="1" height="150" cellspacing="0"><tr align="center"><td width="150"><h3>호텔오시는길</h3></td>';
				for( var i in data.hos ){
					if(i==5)break;
					data_hos += '<td width="200" align="center"><a href="hosel_get_info.do?hos_num='+data.hos[i].hos_num+'">'+data.hos[i].hos_mapinfo+'</a></td>';
				}data_hos += '</tr></table>';
				
				// 호텔 비교
				for( var i in data.hot ){
					if(i==5)break;
					data_hot += '<td width="200" align="center"><a href="hotel_get_info.do?hot_num='+data.hot[i].hot_num+'">'+data.hot[i].hot_name+'</a></td>';
				}data_hot += '</tr></table>';
				
				data_hot+= '<table class="table table-hover" border="1" height="150" cellspacing="0"><tr align="center"><td width="160"><h3>호텔사진</h3></td>';
				for( var i in data.hot ){
					if(i==5)break;
					data_hot += '<td width="200" align="center"><a href="hotel_get_info.do?hot_num='+data.hot[i].hot_num+'">'+'<img src="'+data.hot[i].hot_img+'" width=120 height=140></a></td>';
				}data_hot += '</tr></table>';
				
				data_hot+= '<table class="table table-hover" border="1" height="150" cellspacing="0"><tr align="center"><td width="150"><h3>호텔정보</h3></td>';
				for( var i in data.hot ){
					if(i==5)break;
					data_hot += '<td width="200" align="center"><a href="hotel_get_info.do?hot_num='+data.hot[i].hot_num+'">'+data.hot[i].hot_content+'</a></td>';
				}data_hot += '</tr></table>';
				
				data_hot+= '<table class="table table-hover" border="1" height="150" cellspacing="0"><tr align="center"><td width="150"><h3>호텔방정보</h3></td>';
				for( var i in data.hot ){
					if(i==5)break;
					data_hot += '<td width="200" align="center"><a href="hotel_get_info.do?hot_num='+data.hot[i].hot_num+'">'+data.hot[i].hot_roominfo+'</a></td>';
				}data_hot += '</tr></table>';
				
				data_hot+= '<table class="table table-hover" border="1" height="150" cellspacing="0"><tr align="center"><td width="150"><h3>호텔방옵션</h3></td>';
				for( var i in data.hot ){
					if(i==5)break;
					data_hot += '<td width="200" height="150" align="center"><a href="hotel_get_info.do?hot_num='+data.hot[i].hot_num+'">'+data.hot[i].hot_option+'</a></td>';
				}data_hot += '</tr></table>';
				
				data_hot+= '<table class="table table-hover" border="1" height="150" cellspacing="0"><tr align="center"><td width="150"><h3>기타정보</h3></td>';
				for( var i in data.hot ){
					if(i==5)break;
					data_hot += '<td width="200" align="center"><a href="hotel_get_info.do?hot_num='+data.hot[i].hot_num+'">'+data.hot[i].hot_etc+'</a></td>';
				}data_hot += '</tr></table>';
				
				data_hot+= '<table class="table table-hover" border="1" height="150" cellspacing="0"><tr align="center"><td width="150"><h3>호텔오시는길</h3></td>';
				for( var i in data.hot ){
					if(i==5)break;
					data_hot += '<td width="200" align="center"><a href="hotel_get_info.do?hot_num='+data.hot[i].hot_num+'">'+data.hot[i].hot_mapinfo+'</a></td>';
				}data_hot += '</tr></table>';
				
				var hot_wishlist = '<h2 align="center">〔 호텔비교 〕</h2><hr>'+data_hot;
				var hos_wishlist = '<h2 align="center">〔 병원비교 〕</h2><hr>'+data_hos;
				
			}else{
				var wishlist = data;
				
				var header_wishlist = document.getElementById('hot_wishlist');
				header_wishlist.innerHTML = hot_wishlist;
			}
		
			var header_wishlist = document.getElementById('hot_wishlist');
			header_wishlist.innerHTML = hot_wishlist;
			
			var header_wishlist = document.getElementById('hos_wishlist');
			header_wishlist.innerHTML = hos_wishlist;
		}
	}
}

$(document).ready(function() {

   //Default Action
   	$(".tab_content").hide(); //Hide all content
   	$("ul.tabs li:first").addClass("active").show(); //Activate first tab
   	$(".tab_content:first").show(); //Show first tab content
   
   //On Click Event
	$("ul.tabs li").click(function() {
		$("ul.tabs li").removeClass("active"); //Remove any "active" class
     	$(this).addClass("active"); //Add "active" class to selected tab
      	$(".tab_content").hide(); //Hide all tab content
      	var activeTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
      	$(activeTab).fadeIn(); //Fade in the active content
      	return false;
	});
});



</script>
</head>

<body onload = "wishlist()">
<div class="container">
    <ul class="tabs">
        <li onclick="wishlist()"><a href="#tab1">호텔비교</a></li>
        <li onclick="wishlist()"><a href="#tab2">병원비교</a></li>
    </ul>
    
    <div class="tab_container">
        <div id="tab1" class="tab_content">
        	<form name="page1_Write" action="page1_Write.do" method="post" enctype="multipart/form-data">
        		
        			<p id="hot_wishlist"></p>
        		
        	</form>
        </div>
        
        <div id="tab2" class="tab_content">
           	<form name="page2_Write" action="page2_Write.do" method="post" enctype="multipart/form-data">
           		
           			<p id="hos_wishlist"></p>
           		
        	</form>
        </div>
    </div>
</div>
</body>
</html>