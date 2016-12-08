<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='http://fonts.googleapis.com/css?family=Raleway'rel='stylesheet' type='text/css'>
<style>
.container {
	width: 705px;
}

ul.tabs {
	margin: 0;
	padding: 0;
	float: left;
	list-style: none;
	height: 50px;
	border-bottom: 1px solid #999;
	border-left: 1px solid #999;
	width: 705px;
}

ul.tabs li {
	float: left;
	margin: 0;
	padding: 0;
	text-align: center;
	width:140px;
	height: 50px;
	line-height: 50px;
	border: 1px solid #999;
	border-left: none;
	margin-bottom: -1px;
	background: #F0F0F0;
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

ul.tabs li.active, ul.tabs li.active a:hover {
	background: #fff;
	border-bottom: 1px solid #fff;
}

.tab_container {
	border: 1px solid #999;
	border-top: none;
	clear: both;
	float: left;
	width: 705px;
	background: #fff;
	-moz-border-radius-bottomright: 5px;
	-khtml-border-radius-bottomright: 5px;
	-webkit-border-bottom-right-radius: 5px;
	-moz-border-radius-bottomleft: 5px;
	-khtml-border-radius-bottomleft: 5px;
	-webkit-border-bottom-left-radius: 5px;
}

.tab_content {
	font-size: 1.2em;
}

.accordion_sub {
	display: none;
}

.accordion_title {
	width: 700px;
}

.accordion_sub {
	width: 700px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$(".tab_content").hide();
		$("ul.tabs li:first").addClass("active").show();
		$(".tab_content:first").show();

		$("ul.tabs li").click(function() {
			$("ul.tabs li").removeClass("active");
			$(this).addClass("active");
			$(".tab_content").hide();
			var activeTab = $(this).find("a").attr("href");
			$(activeTab).fadeIn();
			return false;
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
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<form name="faq_List" action="faq_Find.do">
		<div>
			<label>FAQ</label> <input type="text" name="findValue"><input type="submit" value="검색">
		</div>
	</form>
	<div>
	<label>자주하는 질문 BEST 5</label>
	<div class="accordion_banner">
		<c:if test="${empty bestList}">
		등록된 글이 없습니다.
	</c:if>
		<c:forEach var="bestList" items="${bestList}">
			<div class="accordion_title">${bestList.faq_subject}</div>
			<div class="accordion_sub">${bestList.faq_content}</div>
		</c:forEach>
	</div>
	<c:if test="${sessionScope.permit eq 1}">
		<p><a href="faq_Write.do"><img alt="작성" src="img/write.png"></a></p>
	</c:if>
	</div>
	<div class="container">
		<ul class="tabs">
			<li><a href="#tab1">전 체</a></li>
			<li><a href="#tab2">병 원</a></li>
			<li><a href="#tab3">호 텔</a></li>
			<li><a href="#tab4">회 원</a></li>
			<li><a href="#tab5">기 타</a></li>
		</ul>
		<div class="tab_container">
			<div id="tab1" class="tab_content">
				<div class="accordion_banner">
					<c:if test="${empty list}">
						등록된 글이 없습니다.
					</c:if>
					<c:forEach var="list" items="${list}">
						<div class="accordion_title">
						${list.faq_subject}
							<c:if test="${sessionScope.permit eq 1}">
								<a href="faq_Delete.do?faq_idx=${list.faq_idx}"><img alt="삭제" src="img/trash-can.png"></a>
								<a href="faq_Update.do?faq_idx=${list.faq_idx}"><img alt="수정" src="img/cog.png"></a>
							</c:if>
						</div>
						<div class="accordion_sub">
							${list.faq_content}
						</div>
					</c:forEach>
				</div>
			</div>
			<div id="tab2" class="tab_content">
				<div class="accordion_banner">
					<c:if test="${empty list}">
						등록된 글이 없습니다.
					</c:if>
					<c:forEach var="list" items="${list}">
						<div class="accordion_title">
						${list.faq_subject}
							<c:if test="${sessionScope.permit eq 1}">
								<a href="faq_Delete.do?faq_idx=${list.faq_idx}"><img alt="삭제" src="img/trash-can.png"></a>
								<a href="faq_Update.do?faq_idx=${list.faq_idx}"><img alt="수정" src="img/cog.png"></a>
							</c:if>
						</div>
						<div class="accordion_sub">
							${list.faq_content}
						</div>
					</c:forEach>
				</div>
			</div>
			<div id="tab3" class="tab_content">
				<div class="accordion_banner">
					<c:if test="${empty list}">
						등록된 글이 없습니다.
					</c:if>
					<c:forEach var="list" items="${list}">
						<div class="accordion_title">
						${list.faq_subject}
							<c:if test="${sessionScope.permit eq 1}">
								<a href="faq_Delete.do?faq_idx=${list.faq_idx}"><img alt="삭제" src="img/trash-can.png"></a>
								<a href="faq_Update.do?faq_idx=${list.faq_idx}"><img alt="수정" src="img/cog.png"></a>
							</c:if>
						</div>
						<div class="accordion_sub">
							${list.faq_content}
						</div>
					</c:forEach>
				</div>
			</div>
			<div id="tab4" class="tab_content">
				<div class="accordion_banner">
					<c:if test="${empty list}">
						등록된 글이 없습니다.
					</c:if>
					<c:forEach var="list" items="${list}">
						<div class="accordion_title">
						${list.faq_subject}
							<c:if test="${sessionScope.permit eq 1}">
								<a href="faq_Delete.do?faq_idx=${list.faq_idx}"><img alt="삭제" src="img/trash-can.png"></a>
								<a href="faq_Update.do?faq_idx=${list.faq_idx}"><img alt="수정" src="img/cog.png"></a>
							</c:if>
						</div>
						<div class="accordion_sub">
							${list.faq_content}
						</div>
					</c:forEach>
				</div>
			</div>
			<div id="tab5" class="tab_content">
				<div class="accordion_banner">
					<c:if test="${empty list}">
						등록된 글이 없습니다.
					</c:if>
					<c:forEach var="list" items="${list}">
						<div class="accordion_title">
						${list.faq_subject}
							<c:if test="${sessionScope.permit eq 1}">
								<a href="faq_Delete.do?faq_idx=${list.faq_idx}"><img alt="삭제" src="img/trash-can.png"></a>
								<a href="faq_Update.do?faq_idx=${list.faq_idx}"><img alt="수정" src="img/cog.png"></a>
							</c:if>
						</div>
						<div class="accordion_sub">
							${list.faq_content}
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>