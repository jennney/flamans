<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="css/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/css/sb-admin.css" rel="stylesheet">
<!-- Morris Charts CSS -->
<link href="css/css/plugins/morris.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<!-- Brand and toggle get grouped for better mobile display -->
	<div class="navbar-header">
	    <a class="col-lg-12" href="index.do"><img src="img/logo.png" height="40px"></a>
	</div>
	<ul class="nav navbar-right top-nav">
	<li><div id="google_translate_element"></div></li>
	<script type="text/javascript">function googleTranslateElementInit() {
       new google.translate.TranslateElement({pageLanguage: 'ko',
    	   includedLanguages: 'en,ja,ko,zh-CN', layout: google.translate.TranslateElement.InlineLayout.SIMPLE}, 
    	   'google_translate_element');
		}
	</script>
	<script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
	</ul>
	<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
	<div class="collapse navbar-collapse navbar-ex1-collapse">
	    <ul class="nav navbar-nav side-nav">
	    <c:if test="${!empty sessionScope.username }">
	        <li>
	            <a href="member_dashBoard.do"><i class="fa fa-fw fa-dashboard"></i>  Dashboard</a>
	        </li>
	        <li>
	            <a href="member_page.do"><i class="fa fa-fw fa-user"></i>  MyPage</a>
	        </li>
	        <li>
	            <a href="booking.do"><i class="fa fa-fw fa-table"></i>  Booking</a>
	        </li>
	        <li>
	            <a href="wishlist_compare.do"><i class="fa fa-fw fa-desktop"></i>  WishList</a>
	        </li>
	        <li>
	            <a href="member_find.do">Find</a>
	        </li>
	        <li>
	            <a href="logout.do"><i class="fa fa-fw fa-power-off"></i>  Logout</a>
	        </li>
	     </c:if>
	     <c:if test="${sessionScope.permit eq 1 and sessionScope.cm_kind eq 'B'}">
   	        <li><a href="#">  Dashboard</a></li>
	        <li><a href="hospitalBbsList.do">  HospitalCommunity</a></li>
	        <li><a href="hospitalContent.do">  HospitalInfo</a></li>
	        <li><a href="doctorList.do">  DoctorInfo</a></li>
	        <li><a href="event_co_list.do?e_name=${sessionScope.savecoId}"> HospitalEvent</a></li>
	        <li><a href="logout.do">  Logout</a></li>
	     </c:if>
   	     <c:if test="${sessionScope.permit eq 1 and sessionScope.cm_kind eq 'H'}">
   	        <li><a href="#">  Dashboard</a></li>
	        <li><a href="hotelBbsList.do">  HotelCommunity</a></li>
	        <li><a href="hotelContent.do">  HotelInfo</a></li>
	        <li><a href="hotelRoomList.do">  HotelRoomInfo</a></li>
	        <li><a href="event_co_list.do?e_name=${sessionScope.savecoId}"> HotelEvent</a></li>
	        <li><a href="logout.do">  Logout</a></li>
	     </c:if>
   	     <c:if test="${sessionScope.savecoId eq 'admin'}">
	        <li><a href="#">  Dashboard</a></li>
	        <li><a href="memberList.do">  Member</a></li>
	        <li><a href="event_list.do">  Event</a></li>
	        <li><a href="hotelInfo.do">  Hotel</a></li>
	        <li><a href="hospitalInfo.do">  Hospital</a></li>
            <li>
                <a href="javascript:;" data-toggle="collapse" data-target="#demo"> Community <i class="fa fa-fw fa-caret-down"></i></a>
                <ul id="demo" class="collapse">
                    <li><a href="no_List_admin.do">Notice</a></li>
                    <li><a href="faq_List_admin.do">FAQ</a></li>
                    <li><a href="qna_List_admin.do?qna_kind=site">Q&amp;A</a></li>
                </ul>
            </li>
	        <li><a href="#">  1:1</a></li>
	        <li><a href="logout.do">  Logout</a></li>
	        
	     </c:if>
	     
	    </ul>
	    
	</div>
	
</nav>

<script src="js/js/jquery.js"></script>
<script src="js/js/bootstrap.min.js"></script>