<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/prettyPhoto.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<link rel="shortcut icon" href="img/title.png">
<header id="header">
<div class="top-bar">
	<div class="container">
	   <div class="row">
	       <div class="col-sm-6 col-xs-4"></div>
		       	<div class="col-sm-6 col-xs-8">
			       	 <nav class="navbar navbar-inverse" role="banner">
					   <div class="collapse navbar-collapse navbar-right">
					   <ul class="nav navbar-nav">
							<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">MY PAGE<i class="fa fa-angle-down"></i></a>
								<ul class="dropdown-menu">
									<c:if test="${empty sessionScope.username}">
										<c:if test="${empty sessionScope.cm_name}">
											<li><a href="member_login.do">Login</a></li>
											<li><a href="member_join.do">Join</a></li>
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
					</nav>
				</div>
	        </div>
	    </div>
	</div><!--/.container-->


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
                        <li><a href="#">On Going Event</a></li>
                        <li><a href="#">Finished Evnet</a></li>
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
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/jquery.isotope.min.js"></script>
<script src="js/main.js"></script>
<script src="js/wow.min.js"></script>