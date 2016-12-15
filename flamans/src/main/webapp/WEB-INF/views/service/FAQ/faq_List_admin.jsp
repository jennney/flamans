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
		<form name="faq_List_admin" action="faq_Find_admin.do" >
		<div>
			<input type="text" class="form-control" style="width: 200px;"name="findValue">
			<span class="input-group-btn"><button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button></span>
		</div>
		</form>
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
		<c:if test="${sessionScope.permit eq 3}">
			<p><a href="faq_Write.do"><img alt="작성" src="img/write.png"></a></p>
		</c:if>
		<div class="seaTabs">
			<div class="seaTabs_switch">
				<div class="seaTabs_tab">전체</div>
				<div class="seaTabs_tab">병원</div>
				<div class="seaTabs_tab">호텔</div>
				<div class="seaTabs_tab">회원</div>
				<div class="seaTabs_tab">기타</div>
			</div>
		
			<div class="seaTabs_content">
				<div class="seaTabs_item seaTabs_content_active">
					<div class="accordion_banner">
						<c:if test="${empty list}">
							등록된 글이 없습니다.
						</c:if>
						<c:forEach var="list" items="${list}">
							<div class="accordion_title">${list.faq_subject}
								<a href="faq_Delete.do?faq_idx=${list.faq_idx}"><img alt="삭제" src="img/trash-can.png"></a>
								<a href="faq_Update.do?faq_idx=${list.faq_idx}"><img alt="수정" src="img/cog.png"></a>
							</div>
							<div class="accordion_sub">${list.faq_content}</div>
						</c:forEach>
					</div>
				</div>
		
				<div class="seaTabs_item">
					<div class="accordion_banner">
						<c:if test="${empty hosList}">
							등록된 글이 없습니다.
						</c:if>
						<c:forEach var="hosList" items="${hosList}">
							<div class="accordion_title">${hosList.faq_subject}
								<a href="faq_Delete.do?faq_idx=${hosList.faq_idx}"><img alt="삭제" src="img/trash-can.png"></a>
								<a href="faq_Update.do?faq_idx${hosList.faq_idx}"><img alt="수정" src="img/cog.png"></a>
							</div>
							<div class="accordion_sub">${hosList.faq_content}</div>
						</c:forEach>
					</div>
				</div>
		
				<div class="seaTabs_item">
					<div class="accordion_banner">
						<c:if test="${empty hotList}">
							등록된 글이 없습니다.
						</c:if>
						<c:forEach var="hotList" items="${hotList}">
							<div class="accordion_title">${hotList.faq_subject}
								<a href="faq_Delete.do?faq_idx=${hotList.faq_idx}"><img alt="삭제" src="img/trash-can.png"></a>
								<a href="faq_Update.do?faq_idx=${hotList.faq_idx}"><img alt="수정" src="img/cog.png"></a>
							</div>
							<div class="accordion_sub">${hotList.faq_content}</div>
						</c:forEach>
					</div>
				</div>
		
				<div class="seaTabs_item">
					<div class="accordion_banner">
						<c:if test="${empty memList}">
							등록된 글이 없습니다.
						</c:if>
						<c:forEach var="memList" items="${memList}">
							<div class="accordion_title">${memList.faq_subject}
								<a href="faq_Delete.do?faq_idx=${memList.faq_idx}"><img alt="삭제" src="img/trash-can.png"></a>
								<a href="faq_Update.do?faq_idx=${memList.faq_idx}"><img alt="수정" src="img/cog.png"></a>
							</div>
							<div class="accordion_sub">${memList.faq_content}</div>
						</c:forEach>
					</div>
				</div>
		
				<div class="seaTabs_item">
					<div class="accordion_banner">
						<c:if test="${empty etcList}">
							등록된 글이 없습니다.
						</c:if>
						<c:forEach var="etcList" items="${etcList}">
							<div class="accordion_title">${etcList.faq_subject}
								<a href="faq_Delete.do?faq_idx=${etcList.faq_idx}"><img alt="삭제" src="img/trash-can.png"></a>
								<a href="faq_Update.do?faq_idx=${etcList.faq_idx}"><img alt="수정" src="img/cog.png"></a>
							</div>
							<div class="accordion_sub">${etcList.faq_content}</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>