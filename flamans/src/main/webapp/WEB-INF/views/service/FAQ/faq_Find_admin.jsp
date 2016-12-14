<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
		${findValue}에 대해 총 ${count}건의 FAQ가 검색되었습니다.
		<div class="accordion_banner">
		<c:forEach var="list" items="${list}">
			<div class="accordion_title">${list.faq_subject}
				<c:if test="${sessionScope.permit eq 1}">
					<a href="faq_Delete.do?faq_idx=${list.faq_idx}"><img alt="삭제" src="img/trash-can.png"></a>
					<a href="faq_Update.do?faq_idx=${list.faq_idx}"><img alt="수정" src="img/cog.png"></a>
				</c:if>
			</div>
			<div class="accordion_sub">${list.faq_content}</div>
		</c:forEach>
		${page}
		</div>
	</div>
</div>
</body>
</html>