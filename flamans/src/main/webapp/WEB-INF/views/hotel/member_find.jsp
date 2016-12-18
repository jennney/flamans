<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지관리</title>
<style type="text/css">

.container {
	width: 900px; margin: 10px auto;
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
   	width: 900px;
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

function findlist(){
	sendRequest('member_find_list.do', null, findlistresult, 'GET');
}

function findlistresult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data = XHR.responseText;
			
			// eval : 서버로부터 넘어온문자열들을 실제 객체로 바꾸어주는 녀석.
			// 실제 소괄호 안에 있는것을 라벨로 인식해서 data를 번역한다..
			// yong=+data
			if('${not empty sessionScope.userid}'=='true'){
				
				data = eval('('+data+')');
				var findlist = data.list;
				
				if(findlist!=""){
					data = eval('('+findlist+')');
				}
				// 병원 최근 검색 목록
				if(data.hos!=null){
					
					var data_hos = '';
					
					for(var i=data.hos.length-1; i>=0; i--){
						data_hos+='<table class="table table-hover" border="1" width="900" height="200" cellspacing="0"><tr align="center">'
						+'<td width="200" rowspan="3"><img src="img/hospital/'+data.hos[i].hos_img+'" width="200" height="200"></td>'
						+'<td width="520" height="30">검색어 :'+data.hos[i].find_name+'</td>'
						+'<td width="100"><a href="member_find_list.do?write_date='+data.hos[i].write_date+'&kind=hos">휴지통</a></td>'
						+'<tr>'
						+'<td colspan="2" height="100"></td>'
						+'</tr>'
						+'<tr>'
						+'<td colspan="2" height="30">검색일 : '+data.hos[i].write_date+'</td>'
						+'</tr></table>';
					}
				}else{
					var data_hos = '검색한 병원이 없습니다.';
				}
						
				if(data.hot!=null){
				// 호텔 최근 검색 목록
					var data_hot = '';
					for(var i=data.hot.length-1; i>=0; i--){
						data_hot+='<table class="table table-hover" border="1" width="900" height="200" cellspacing="0"><tr align="left">'
						+'<td width="200" rowspan="3"><img src="img/hotel/'+data.hot[i].hot_img+'" width="200" height="200"></td>'
						+'<td width="520" height="30" onclick="findlist(\"write_date='+data.hot[i].write_date+'&kind=hot\")">검색어 : '+data.hot[i].find_name+'</td>'
						+'<td width="100"><a href="member_find_list.do?write_date='+data.hot[i].write_date+'&kind=hot">휴지통</a></td>'
						+'<tr>'
						+'<td colspan="2" height="100">체크인 : '+data.hot[i].checkin+'&nbsp;~&nbsp; 체크아웃 :'+data.hot[i].checkout+'<br>'
						+'방정보 : '+data.hot[i].room_info+'</td>'
						+'</tr>'
						+'<tr>'
						+'<td colspan="2" height="30">검색일 : '+data.hot[i].write_date+'</td>'
						+'</tr></table>';
					}
				}else{
					var data_hot = '검색한 호텔이 없습니다.';
				}
				
				var hot_find = '<h2 align="center">〔 호텔 최근검색 목록 〕</h2><hr>'+data_hot;
				var hos_find = '<h2 align="center">〔 병원 최근검색 목록 〕</h2><hr>'+data_hos;
				
			}else{
				var wishlist = data;
				
				var header_wishlist = document.getElementById('hot_find');
				header_wishlist.innerHTML = hot_find;
			}
			
			var header_wishlist = document.getElementById('hot_find');
			header_wishlist.innerHTML = hot_find;
			
			var header_wishlist = document.getElementById('hos_find');
			header_wishlist.innerHTML = hos_find;
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

<body onload="findlist()">
<div id="wrapper">
<%@ include file="/WEB-INF/views/myIndex.jsp"%>
<div id="page-wrapper">
	<div class="container-fluid">
	<section>
    <ul class="tabs">
        <li onclick="findlist()"><a href="#tab1">호텔최근검색</a></li>
        <li onclick="findlist()"><a href="#tab2">병원최근검색</a></li>
    </ul>
    
    <div class="tab_container">
        <div id="tab1" class="tab_content">
        	<form name="page1_Write" action="page1_Write.do" method="post" enctype="multipart/form-data">
        		
        			<p id="hot_find"></p>
        		
        	</form>
        </div>
        
        <div id="tab2" class="tab_content">
           	<form name="page2_Write" action="page2_Write.do" method="post" enctype="multipart/form-data">
           		
           			<p id="hos_find"></p>
           		
        	</form>
        </div>
    </div>
	</section>
	</div>
</div>
</div>	
</body>
</html>