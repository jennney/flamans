<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ검색</title>
<style>
#title1 {
	color: red;
	font-size: 30px;
}

#title2 {
	color: black;
	font-size: 30px;
}
.a{
	padding-top:50px;
	margin: 0px auto;
	width: 800px;
	float: right;
}
.b{
	padding-top: 50px;
}
.c{
	text-align: center;
}
.my-lnb {
	background: #f9f9f9;
	border: 1px solid #e1e4e6;
	color: #111;
	padding: 10px 0;
}

.my-area-left {
	width: 180px;
	float: left;
}

.my-lnb__unit {
	padding: 15px 17px;
}

.my-shape--divide-lnb {
	height: 0;
	border-top: 1px solid #fff;
	border-bottom: 1px solid #e1e4e6;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<div class="page-header">
		<div class="overlay">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h1>FAQ</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="my-area-left">
			<div class="my-lnb">
				<nav>
					<div class="my-lnb__unit">
						<div class="my-lnb__unit-body">
							<a href="no_List.do" class="my-lnb__link">Notice</a>
						</div>
					</div>
					<div class="my-shape--divide-lnb"></div>
					<div class="my-lnb__unit">
						<a href="faq_List.do"class="my-lnb__unit-title">FAQ</a>
					</div>
					<div class="my-shape--divide-lnb"></div>
					<div class="my-lnb__unit">
						<div class="my-lnb__unit-body">
							<ul class="my-lnb__list">
								<li class="my-lnb__item ">
									<a href="qna_List.do?qna_kind=site" class="my-lnb__link">사이트Q&amp;A</a>
								</li>
								<li class="my-lnb__item ">
									<a href="qna_List.do?qna_kind=hospital" class="my-lnb__link">병원Q&amp;A</a>
								</li>
								<li class="my-lnb__item ">
									<a href="qna_List.do?qna_kind=hotel" class="my-lnb__link">호텔Q&amp;A</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="my-shape--divide-lnb"></div>
					<div class="my-lnb__unit">
						<a href="page_List.do?pm_item=page1"class="my-lnb__unit-title">의료사고대처요령</a>
					</div>
					<div class="my-shape--divide-lnb"></div>
					<div class="my-lnb__unit">
						<a href="page_List.do?pm_item=page2"class="my-lnb__unit-title">출입국관련절차</a>
					</div>
				</nav>
			</div>
		</div>
	<div class="a">
		<span id="title1">"${findValue}"</span> <span id="title2">에 대해
			총 ${count}건의 FAQ가 검색되었습니다.</span>
		<div class="b">
			<h3>검색된 질문</h3>
		</div>
		<div class="panel-body">
			<c:if test="${empty list}">
			검색된 결과가 없습니다.
			</c:if>
			<div class="panel-group" id="accordion">
				<c:forEach var="list" items="${list}">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="${shap}${list.faq_idx}" class="collapsed"> <i
									class="fa fa-angle-left control-icon"></i> ${list.faq_subject}
								</a>
							</h4>
						</div>
						<div id="${list.faq_idx}" class="panel-collapse collapse"
							style="height: 0px;">
							<div class="panel-body">${list.faq_content}</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="c">
			<ul class="pagination">
				<li>${page}</li>
			</ul>
			</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>