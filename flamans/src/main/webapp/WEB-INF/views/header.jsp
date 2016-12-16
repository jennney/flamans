<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" src="/myweb/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="/myweb/js/httpRequest.js"></script>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/jquery.isotope.min.js"></script>
<script src="js/main.js"></script>
<script src="js/wow.min.js"></script>


<script>

function wishlist(){
	sendRequest('wishlist_view.do', null, wishlistresult, 'GET');
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
				
				var data_hos = '';
				var data_hot = '';
				
				for( var i in data.hos){
					data_hos += '<a href="hospital_get_info.do?hos_num='+data.hos[i].hos_num+'">'
					+'<img src="img/'+data.hos[i].hos_img+'" width=50 height=50>&nbsp;&nbsp;'+data.hos[i].hos_name+'</a><br>';
				}
				
				for (var i in data.hot){
					data_hot += '<a href="hotel_get_info.do?hot_num='+data.hot[i].hot_num+'">'
					+'<img src="img/'+data.hot[i].hot_img+'" width=50 height=50>&nbsp;&nbsp;'+data.hot[i].hot_name+'</a><br>';
				}
				
				var wishlist = '<h6 align="center">〔 위시 리스트 〕</h6><hr> <h6 align="center">[ 병원 리스트 ]</h6> '+data_hos+' <hr> <h6 align="center">[ 호텔 리스트 ]</h6>'+data_hot;
				
			}else{
				var wishlist = data;
				
				var header_wishlist = document.getElementById('header_wishlist');
				header_wishlist.innerHTML = wishlist;
			}
			var header_wishlist = document.getElementById('header_wishlist');
			header_wishlist.innerHTML = wishlist;
		}
	}
}

function hos_get_wishlist(hos_data){
	var data = ''+hos_data;
	var res = data.split(",");
	var params = new Array();
	
	for( var i in res){
		params[i] = 'hos_num='+res[i];
	}
	
	for( var i=0; i<params.length; i++){
		sendRequest('hos_dto_wishlist.do', params[i], hoswishresult, 'GET');
	}
}

function hot_get_wishlist(hot_data){
}

function hoswishresult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data = XHR.responseText;
		}
	}
}

</script>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/prettyPhoto.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<link rel="shortcut icon" href="img/title.png">
<link href="css/css/bootstrap.min.css" rel="stylesheet">
<link href="css/css/sb-admin.css" rel="stylesheet">
<header id="header">
<div class="top-bar">
   <div class="container">
		<ul class="nav navbar-right top-nav">
		    <li class="dropdown">
		        <a href="#" class="dropdown-toggle" data-toggle="dropdown" ><i class="fa fa-heart" onmouseover="wishlist()"></i> <b class="caret"></b></a>
		        <ul class="dropdown-menu message-dropdown" style="width: 220px;">
					<li><p id=header_wishlist></p></li>
		        </ul>
		    </li>
		    <li class="dropdown">
		        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> MyPage <b class="caret"></b></a>
		        <ul class="dropdown-menu">
					<c:if test="${empty sessionScope.username}">
                       <c:if test="${empty sessionScope.cm_name}">
                          <li><a href="member_login.do">Login</a></li>
                          <li><a href="joinMain.do">Join</a></li>
                       </c:if>
                    </c:if>
                    <c:if test="${!empty sessionScope.username }">
                       <li><a href="member_dashBoard.do">Profile</a></li>
                       <li><a href="logout.do">Logout</a><li>
                    </c:if>
                    <c:if test="${!empty sessionScope.cm_name }">
                       <li><a href="manager.do">AdminPage</a></li>
                       <li><a href="logout.do">Logout</a></li>
                    </c:if>
		        </ul>
		    </li>
		</ul>
	</div>
</div>
<nav class="navbar navbar-inverse" role="banner">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="index.do"><img src="img/logo.png" alt="logo"></a>
        </div>
        <div class="collapse navbar-collapse navbar-right">
            <ul class="nav navbar-nav">
                <li><a href="index.do">HOME</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">HOSPITAL<i class="fa fa-angle-down"></i></a>
                    <ul class="dropdown-menu">
                        <li><a href="hospital_list.do">Hospital</a></li>
                        <li><a href="#">Simulation</a></li>
                    </ul>
                </li>
                <li><a href="hotel_list.do">HOTEL</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">EVENT<i class="fa fa-angle-down"></i></a>
                    <ul class="dropdown-menu">
                        <li><a href="event_user_list.do?e_item=1">On Going Event</a></li>
                        <li><a href="event_user_list.do?e_item=2">Finished Event</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">COMMUNITY<i class="fa fa-angle-down"></i></a>
                    <ul class="dropdown-menu">
                        <li><a href="no_List.do">Notice</a></li>
                        <li><a href="faq_List.do">FAQ</a></li>
                        <li><a href="qna_List.do?qna_kind=site">사이트Q&amp;A</a></li>
                        <li><a href="qna_List.do?qna_kind=hospital">병원Q&amp;A</a></li>
                        <li><a href="qna_List.do?qna_kind=hotel">호텔Q&amp;A</a></li>
                        <li><a href="page_List.do?pm_item=page1">의료사고대처요령</a></li>
                        <li><a href="page_List.do?pm_item=page2">출입국절차</a></li>
                    </ul>
                </li>

            </ul>
        </div>
    </div><!--/.container-->
</nav><!--/nav-->
</header><!--/header-->
