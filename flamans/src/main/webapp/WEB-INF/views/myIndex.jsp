<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- BOOTSTRAP STYLES-->
<link href="mypage/assets/css/bootstrap.css" rel="stylesheet" />
 <!-- FONTAWESOME STYLES-->
<link href="mypage/assets/css/font-awesome.css" rel="stylesheet" />
 <!-- MORRIS CHART STYLES-->
<link href="mypage/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- CUSTOM STYLES-->
<link href="mypage/assets/css/custom.css" rel="stylesheet" />
 <!-- GOOGLE FONTS-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
<!--                                                                                                  -->

<nav class="navbar navbar-default navbar-cls-top " role="navigation"
	style="margin-bottom: 0">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="index.do">Flamans</a>
	</div>
	<div style="color: white; padding: 15px 50px 5px 50px; float: right; font-size: 16px;">
		<a href="logout.do" class="btn btn-danger square-btn-adjust">Logout</a>
	</div>
</nav>

<nav class="navbar-default navbar-side" role="navigation">
	<div class="sidebar-collapse">
		<ul class="nav" id="main-menu">
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
           <li><a href="hospitalBbsList.do">  HospitalCommunity</a></li>
           <li><a href="hospitalContent.do">  HospitalInfo</a></li>
           <li><a href="doctorList.do">  DoctorInfo</a></li>
           <li><a href="bBbook_list.do">  HospitalReservation</a></li>
           <li><a href="event_co_list.do?e_name=${sessionScope.savecoId}"> HospitalEvent</a></li>
           <li><a href="logout.do">  Logout</a></li>
        </c:if>
           <c:if test="${sessionScope.permit eq 1 and sessionScope.cm_kind eq 'H'}">
           <li><a href="hotelBbsList.do">  HotelCommunity</a></li>
           <li><a href="hotelContent.do">  HotelInfo</a></li>
           <li><a href="hotelRoomList.do">  HotelRoomInfo</a></li>
           <li><a href="Hbook_list.do">  HotelReservation</a></li>
        </c:if>
        
        <c:if test="${sessionScope.savecoId eq 'admin'}">
	        <li><a href="memberList.do">  Member</a></li>
	        <li><a href="event_list.do">  Event</a></li>
	        <li><a href="hotelInfo.do">  Hotel</a></li>
	        <li><a href="hospitalInfo.do">  Hospital</a></li>
            <li>
                <a href="javascript:;" data-toggle="collapse" data-target="#demo"> Community <i class="fa fa-fw fa-caret-down"></i></a>
                <ul class="nav nav-second-level">
                  <li><a href="no_List_admin.do">Notice</a></li>
                    <li><a href="faq_List_admin.do">FAQ</a></li>
                    <li><a href="qna_List_admin.do?qna_kind=site">Q&amp;A</a></li>
                    <li><a href="page_Write.do">PageManager</a></li>
           		</ul>
            </li>
	        <li><a href="logout.do">  Logout</a></li>
	     </c:if>
		</ul>
	</div>
</nav>
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="mypage/assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="mypage/assets/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="mypage/assets/js/jquery.metisMenu.js"></script>
     <!-- MORRIS CHART SCRIPTS -->
     <script src="mypage/assets/js/morris/raphael-2.1.0.min.js"></script>
    <script src="mypage/assets/js/morris/morris.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="mypage/assets/js/custom.js"></script>