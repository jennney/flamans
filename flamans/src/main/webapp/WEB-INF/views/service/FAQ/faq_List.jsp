<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주하는질문</title>
<style type="text/css">
.container {
	width: 700px; margin: 10px auto;
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

.accordion {
	list-style:none;
	padding:0;	
  	max-width: 700px;
 	margin: 50px auto 100px auto;
 	border-top: 1px solid #d9e5e8;
}
.accordion li {
  	list-style:none;
  	border-bottom: 1px solid #d9e5e8;
  	position: relative;
}
.accordion li p {
  	display: none;
  	padding: 10px 25px 30px;
}
.accordion a {
 	width: 100%;
  	display: block;
  	cursor: pointer;
  	font-weight: 600;
  	line-height: 3;
  	font-size: 14px;
  	font-size: 0.875rem;
  	text-indent: 15px;
  	user-select: none;
}
.accordion a:after {
  	width: 8px;
  	height: 8px;
  	border-right: 1px solid #4a6e78;
  	border-bottom: 1px solid #4a6e78;
  	position: absolute;
  	right: 10px;
  	content: " ";
  	top: 17px;
  	transform: rotate(-45deg);
  	-webkit-transition: all 0.2s ease-in-out;
  	-moz-transition: all 0.2s ease-in-out;
  	transition: all 0.2s ease-in-out;
}
.accordion p {
  	font-size: 13px;
  	font-size: 0.8125rem;
  	line-height: 2;
  	padding: 10px;
}

a.active:after {
  	transform: rotate(45deg);
  	-webkit-transition: all 0.2s ease-in-out;
  	-moz-transition: all 0.2s ease-in-out;
  	transition: all 0.2s ease-in-out;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
<script type="text/javascript">
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
      var activeTab = $(this).find("a").attr("id"); //Find the rel attribute value to identify the active tab + content
      $(activeTab).fadeIn(); //Fade in the active content
      return false;
   });
   
   $('.accordion > li:eq(0) a').addClass('active').next().slideDown();

   $('.accordion a').click(function(j) {
       var dropDown = $(this).closest('li').find('p');

       $(this).closest('.accordion').find('p').not(dropDown).slideUp();

       if ($(this).hasClass('active')) {
           $(this).removeClass('active');
       } else {
           $(this).closest('.accordion').find('a.active').removeClass('active');
           $(this).addClass('active');
       }

       dropDown.stop(false, true).slideToggle();

       j.preventDefault();
   });

});
</script>
</head>

<body>
<form name="faq_Find" action="faq_Find">
	<p class="searchP">FAQ <input type="text" name="search"> <input type="submit" value="검색"></p>
</form>
<div class="container">
    <ul class="tabs">
        <li><a id="#tab1">전체</a></li>
        <li><a id="#tab2">병원</a></li>
        <li><a id="#tab3">호텔</a></li>
        <li><a id="#tab4">회원서비스</a></li>
        <li><a id="#tab5">기타</a></li>
    </ul>
    <div class="tab_container">
        <div id="tab1" class="tab_content">
            <ul class="accordion">
            <c:if test="${empty list}">
            	<li>등록된 글이 없습니다.</li>
            </c:if>
            <c:forEach var="list" items="${list}">
            	<li>
            		<a>${list.faq_subject}</a>
            		<p>${list.faq_content}</p>
            	</li>
            </c:forEach>
			</ul>
        </div>
        
        <div id="tab2" class="tab_content">
			<ul class="accordion">
            <c:if test="${empty list}">
            	<li>등록된 글이 없습니다.</li>
            </c:if>
            <c:forEach var="list" items="${hoslist}">
            	<li>
            		<a>${list.faq_subject}</a>
            		<p>${list.faq_content}</p>
            	</li>
            </c:forEach>
			</ul>
        </div>
        
        <div id="tab3" class="tab_content">
        	<ul class="accordion">
            <c:if test="${empty list}">
            	<li>등록된 글이 없습니다.</li>
            </c:if>
            <c:forEach var="list" items="${hotlist}">
            	<li>
            		<a>${list.faq_subject}</a>
            		<p>${list.faq_content}</p>
            	</li>
            </c:forEach>
			</ul>
        </div>
        
        <div id="tab4" class="tab_content">
        	<ul class="accordion">
            <c:if test="${empty list}">
            	<li>등록된 글이 없습니다.</li>
            </c:if>
            <c:forEach var="list" items="${memlist}">
            	<li>
            		<a>${list.faq_subject}</a>
            		<p>${list.faq_content}</p>
            	</li>
            </c:forEach>
			</ul>
        </div>
        
        <div id="tab5" class="tab_content">
        	<ul class="accordion">
        	            <c:if test="${empty list}">
            	<li>등록된 글이 없습니다.</li>
            </c:if>
            <c:forEach var="list" items="${etclist}">
            	<li>
            		<a>${list.faq_subject}</a>
            		<p>${list.faq_content}</p>
            	</li>
            </c:forEach>
			</ul>
        </div>
    </div>
</div>
</body>
</html>