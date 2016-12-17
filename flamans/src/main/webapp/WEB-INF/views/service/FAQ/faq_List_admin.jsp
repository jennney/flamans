<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='http://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
<style>
.seaTabs * {
	box-sizing: border-box;
}

.seaTabs_switch {
	overflow: hidden;
}

.seaTabs_tab {
	float: left;
	cursor: pointer;
}

.seaTabs_switch_active {
	cursor: default;
}

.seaTabs_item {
	display: none;
}

.seaTabs_content_active {
	display: block;
}

.seaTabs_switch {
	
}
.seaTabs_tab {
	padding: 10px 20px;
	border-width: 1px 1px 1px 0;
	border-style: solid;
	border-color: #ccc;
	background: #eaeaea;
}

.seaTabs_tab:first-child {
	border-left: 1px solid #ccc;
	border-top-left-radius: 5px;
}

.seaTabs_tab:last-child {
	border-top-right-radius: 5px;
}

.seaTabs_content {
	margin-top: -1px;
	width: 700px;
}

.seaTabs_item {
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 0 0 5px 5px;
}

.seaTabs_switch_active {
	border-bottom: 1px solid #fff;
	background: #fff;
}

.accordion_sub {
	display: none;
}

.accordion_title {
	border-bottom: 1px solid;
	width: 500px;
}

.accordion_sub {
	width: 500px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$('.seaTabs_tab').each(
			function(item) {
				$(this).click(
					function() {
						$(this).addClass('seaTabs_switch_active')
							.siblings().removeClass(
							'seaTabs_switch_active');
						$($('.seaTabs_item')[item]).addClass(
							'seaTabs_content_active').siblings()
							.removeClass('seaTabs_content_active');
					});
			});
		$(".accordion_banner .accordion_title").click(function() {
			if ($(this).next("div").is(":visible")) {
				$(this).next("div").slideUp("fast");
			} else {
				$(".accordion_banner .accordion_sub").slideUp("fast");
				$(this).next("div").slideToggle("fast");
			}
		});

	});
</script>
</head>
<body>
<div id="wrapper">
<%@ include file="/WEB-INF/views/myIndex.jsp"%>
	<div id="page-wrapper">
<div class="panel panel-default">
       <div class="panel-heading">
           Collapsible Accordion Panel Group
       </div>
       <div class="panel-body">
           <div class="panel-group" id="accordion">
               <div class="panel panel-default">
                   <div class="panel-heading">
                       <h4 class="panel-title">
                           <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" class="collapsed">리스트</a>
                       </h4>
                   </div>
                   <div id="collapseOne" class="panel-collapse collapse" style="height: 0px;">
                       <div class="panel-body">
                       </div>
                   </div>
               </div>
               <div class="panel panel-default">
                   <div class="panel-heading">
                       <h4 class="panel-title">
                           <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" class="collapsed">리스트</a>
                       </h4>
                   </div>
                   <div id="collapseOne" class="panel-collapse collapse" style="height: 0px;">
                       <div class="panel-body">
                       </div>
                   </div>
               </div>
           </div>
       </div>
   </div>
	</div>
</div>
</body>
</html>