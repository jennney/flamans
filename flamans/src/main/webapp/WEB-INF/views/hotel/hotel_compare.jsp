<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>페이지관리</title>

<style rel="stylesheet">
body {
  background-color: #91ced4;
}
body * {
  box-sizing: border-box;
}

.header {
  background-color: #87003A;
  color: white;
  font-size: 1.5em;
  padding: 1rem;
  text-align: center;
  text-transform: uppercase;
}

.wishlistimg{
  border-radius: 50%;
  height: 170px;
  width: 170px;
}

.table-users {
  border: 1px solid #327a81;
  border-radius: 10px;
  box-shadow: 3px 3px 0 rgba(0, 0, 0, 0.1);
  max-width: calc(100% - 2em);
  margin: 1em auto;
  overflow: hidden;
  width: 1000px;
}

table {
  width: 100%;
}
table td, table th {
  color: #2b686e;
  padding: 10px;
}
table td {
  text-align: center;
  vertical-align: middle;
}
table td:last-child {
  font-size: 0.95em;
  line-height: 1.4;
  text-align: left;
}
table th {
  background-color: #daeff1;
  font-weight: 300;
}
table tr:nth-child(2n) {
  background-color: white;
}
table tr:nth-child(2n+1) {
  background-color: #edf7f8;
}

@media screen and (max-width: 700px) {
  table, tr, td {
    display: block;
  }

  td:first-child {
    position: absolute;
    top: 50%;
    -webkit-transform: translateY(-50%);
            transform: translateY(-50%);
    width: 100px;
  }
  td:not(:first-child) {
    clear: both;
    margin-left: 100px;
    padding: 4px 20px 4px 90px;
    position: relative;
    text-align: left;
  }
  td:not(:first-child):before {
    color: #91ced4;
    content: '';
    display: block;
    left: 0;
    position: absolute;
  }
  td:nth-child(2):before {
    content: 'Name:';
  }
  td:nth-child(3):before {
    content: 'Email:';
  }
  td:nth-child(4):before {
    content: 'Phone:';
  }
  td:nth-child(5):before {
    content: 'Comments:';
  }

  tr {
    padding: 10px 0;
    position: relative;
  }
  tr:first-child {
    display: none;
  }
}
@media screen and (max-width: 500px) {
  .header {
    background-color: transparent;
    color: white;
    font-size: 2em;
    font-weight: 700;
    padding: 0;
    text-shadow: 2px 2px 0 rgba(0, 0, 0, 0.1);
  }

  img {
    border: 3px solid;
    border-color: #daeff1;
    height: 100px;
    margin: 0.5rem 0;
    width: 100px;
  }

  td:first-child {
    background-color: #c8e7ea;
    border-bottom: 1px solid #91ced4;
    border-radius: 10px 10px 0 0;
    position: relative;
    top: 0;
    -webkit-transform: translateY(0);
            transform: translateY(0);
    width: 100%;
  }
  
  td:not(:first-child) {
    margin: 0;
    padding: 5px 1em;
    width: 100%;
  }
  
  td:not(:first-child):before {
    font-size: .8em;
    padding-top: 0.3em;
    position: relative;
  }
  
  td:last-child {
    padding-bottom: 1rem !important;
  }

  tr {
    background-color: white !important;
    border: 1px solid #6cbec6;
    border-radius: 10px;
    box-shadow: 2px 2px 0 rgba(0, 0, 0, 0.1);
    margin: 0.5rem 0;
    padding: 0;
  }

  .table-users {
    border: none;
    box-shadow: none;
    overflow: visible;
  }
}

</style>

<style type="text/css">

.container {
	width: 1300px; margin: 10px auto;
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

				var wishlist = data.list;
				data = eval('('+wishlist+')');
				
				var data_hos = '<table class="table" border="1" height="70" cellspacing="0"><tr align="center"><td width="150" class="column1"><h3>등록일</h3></td>';
				var data_hot = '<table class="table" border="1" height="70" cellspacing="0"><tr align="center"><td width="150" class="column1"><h3>등록일</h3></td>';
				
				// 병원 비교 추가
				
				for( var i=data.hos.length-1; i>=0; i-- ){
					data_hos += '<td width="200" align="center" scope="col" abbr="Home"><a href="hospital_get_info.do?hos_num='+data.hos[i].hos_num+'">'+data.hos[i].hos_wishdate+'</a></td>';
				}data_hos += '</tr></table>';
				
				data_hos+= '<table class="table" border="1" height="150" cellspacing="0"><tr align="center"><td width="150"><h3>병원이름</h3></td>';
				for( var i=data.hos.length-1; i>=0; i-- ){
					data_hos += '<td width="200" align="center"><a href="hospital_get_info.do?hos_num='+data.hos[i].hos_num+'">'+data.hos[i].hos_name+'</a></td>';
				}data_hos += '</tr></table>';
				
				data_hos+= '<table class="table" border="1" height="150" cellspacing="0"><tr align="center"><td width="150"><h3>병원사진</h3></td>';
				for( var i=data.hos.length-1; i>=0; i-- ){
					data_hos += '<td width="200" align="center"><a href="hospital_get_info.do?hos_num='+data.hos[i].hos_num+'">'+'<img src="img/hospital/'+data.hos[i].hos_img+'" class="wishlistimg" width=200 height=200></a></td>';
				}data_hos += '</tr></table>';
				
				data_hos+= '<table class="table" border="1" height="150" cellspacing="0"><tr align="center"><td width="150"><h3>병원정보</h3></td>';
				for( var i=data.hos.length-1; i>=0; i-- ){
					data_hos += '<td width="200" align="center"><a href="hospital_get_info.do?hos_num='+data.hos[i].hos_num+'">'+data.hos[i].hos_content+'</a></td>';
				}data_hos += '</tr></table>';
				
				data_hos+= '<table class="table" border="1" height="150" cellspacing="0"><tr align="center"><td width="150"><h3>병원옵션</h3></td>';
				for( var i=data.hos.length-1; i>=0; i-- ){
					data_hos += '<td width="200" height="150" align="center"><a href="hospital_get_info.do?hos_num='+data.hos[i].hos_num+'">'+data.hos[i].hos_special+'</a></td>';
				}data_hos += '</tr></table>';
				
				data_hos+= '<table class="table" border="1" height="150" cellspacing="0"><tr align="center"><td width="150"><h3>병원주소</h3></td>';
				for( var i=data.hos.length-1; i>=0; i-- ){
					data_hos += '<td width="200" align="center"><a href="hospital_get_info.do?hos_num='+data.hos[i].hos_num+'">'+data.hos[i].hos_addr+'</a></td>';
				}data_hos += '</tr></table>';
				
				data_hos+= '<table class="table" border="1" height="150" cellspacing="0"><tr align="center"><td width="150"><h3>병원오시는길</h3></td>';
				for( var i=data.hos.length-1; i>=0; i-- ){
					data_hos += '<td width="200" align="center"><a href="hospital_get_info.do?hos_num='+data.hos[i].hos_num+'">'+data.hos[i].hos_map_info+'</a></td>';
				}data_hos += '</tr></table>';
				
				// 호텔 비교 추가
				for( var i=data.hot.length-1; i>=0; i-- ){
					data_hot += '<td width="200" align="center"><a href="hotel_get_info.do?hot_num='+data.hot[i].hot_num+'">'+data.hot[i].hot_wishdate+'</a></td>';
				}data_hot += '</tr></table>';
				
				data_hot+= '<table class="table" border="1" height="150" cellspacing="0"><tr align="center"><td width="150"><h3>호텔이름</h3></td>';
				for( var i=data.hot.length-1; i>=0; i-- ){
					data_hot += '<td width="200" align="center"><a href="hotel_get_info.do?hot_num='+data.hot[i].hot_num+'">'+data.hot[i].hot_name+'</a></td>';
				}data_hot += '</tr></table>';
				
				data_hot+= '<table class="table" border="1" height="150" cellspacing="0"><tr align="center"><td width="150"><h3>호텔사진</h3></td>';
				for( var i=data.hot.length-1; i>=0; i-- ){
					data_hot += '<td width="200" align="center"><a href="hotel_get_info.do?hot_num='+data.hot[i].hot_num+'">'+'<img src="img/hotel/'+data.hot[i].hot_img+'" class="wishlistimg" width=120 height=140></a></td>';
				}data_hot += '</tr></table>';
				
				data_hot+= '<table class="table" border="1" height="150" cellspacing="0"><tr align="center"><td width="150"><h3>호텔정보</h3></td>';
				for( var i=data.hot.length-1; i>=0; i-- ){
					data_hot += '<td width="200" align="center"><a href="hotel_get_info.do?hot_num='+data.hot[i].hot_num+'">'+data.hot[i].hot_content+'</a></td>';
				}data_hot += '</tr></table>';
				
				data_hot+= '<table class="table" border="1" height="150" cellspacing="0"><tr align="center"><td width="150"><h3>호텔오시는길</h3></td>';
				for( var i=data.hot.length-1; i>=0; i-- ){
					data_hot += '<td width="200" align="center"><a href="hotel_get_info.do?hot_num='+data.hot[i].hot_num+'">'+data.hot[i].hot_map_info+'</a></td>';
				}data_hot += '</tr></table>';
				
				var hot_wishlist = '<h2 align="center" class="header">〔 호텔비교 〕</h2><hr>'+data_hot;
				var hos_wishlist = '<h2 align="center" class="header">〔 병원비교 〕</h2><hr>'+data_hos;
				
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
<div id="wrapper">
<%@ include file="/WEB-INF/views/myIndex.jsp"%>
<div id="page-wrapper" class="table-users">
	<div class="container">
	    <ul class="tabs">
	        <li onclick="wishlist()"><a href="#tab1">호텔비교</a></li>
	        <li onclick="wishlist()"><a href="#tab2">병원비교</a></li>
	    </ul>
	    
	    <div class="tab_container" class="">
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
</div>
</div>
</body>
</html>