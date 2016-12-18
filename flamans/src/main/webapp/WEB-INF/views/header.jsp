<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="asset/bootstrap/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="asset/font-awesome/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="asset/css/owl.carousel.css" type="text/css">
<link rel="stylesheet" href="asset/css/owl.theme.css" type="text/css">
<link rel="stylesheet" href="asset/css/owl.transitions.css" type="text/css">
<link rel="stylesheet" type="text/css" href="asset/css/animate.css">
<link rel="stylesheet" type="text/css" href="asset/css/lightbox.css">
<link rel="stylesheet" type="text/css" href="asset/css/style.css">
<link rel="stylesheet" type="text/css" href="asset/css/responsive.css">
<script src="asset/js/modernizrr.js"></script>
<script type="text/javascript" src="/flamans/js/httpRequest.js"></script>
<script type="text/javascript" src="/flamans/js/jquery-3.1.1.min.js"></script>
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
<header class="clearfix">
	<div class="container">
	    <div class="row">
	        <div class="col-md-12">
	            <div class="top-bar">
	                <div class="row">     
	                    <div class="col-md-6"></div>
	                    <div class="col-md-6">
							<ul class="nav navbar-nav navbar-right">
								<li>
								    <a href="#" class="dropdown-toggle" data-toggle="dropdown" ><i class="fa fa-heart" onmouseover="wishlist()"></i> <b class="caret"></b></a>
									<ul class="dropdown-menu style="width: 220px;">
									     <li><p id=header_wishlist></p></li>
									</ul>
								</li>
								<li class="dropdown">
								    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i><b class="caret"></b></a>
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
					</div>
	        	</div>                        
		</div>
	</div>
	<div class="navbar navbar-default navbar-top">
	    <div class="container">
	        <div class="navbar-header">
	            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><i class="fa fa-bars"></i></button>
	            <a class="navbar-brand" href="index.do">Flamans</a>
	        </div>
	        <div class="navbar-collapse collapse">
	            <ul class="nav navbar-nav navbar-right">
	                <li><a href="index.do">Home</a></li>
	                <li>
	                   	<a href="#">Hospital</a>
	                    <ul class="dropdown">
	                        <li><a href="hospital_list.do">Hospital</a></li>
							<li><a href="#">Simmulation</a></li>	                        
	                    </ul>
	                </li>
	                <li><a href="hotel_list.do">Hotel</a></li>
	                <li>
	                	<a href="#">Event</a>
	                    <ul class="dropdown">
	                        <li><a href="event_user_list.do?e_item=1">On going Event</a></li>
	                        <li><a href="event_user_list.do?e_item=2">Finished Event</a></li>
	                    </ul>
	                </li>
	                <li>
	                    <a href="#">Community</a>
	                    <ul class="dropdown">
	                        <li><a href="no_List.do">Notice</a></li>
	                        <li><a href="faq_List.do">FAQ</a></li>
	                        <li><a href="qna_List.do?qna_kind=site">Q&amp;A</a></li>
	                    </ul>
	                </li>
	            </ul>
	        </div>
	    </div>
	</div>
</header>