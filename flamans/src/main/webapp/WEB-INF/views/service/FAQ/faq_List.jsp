<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/header.jsp"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>

<style type="text/css">
.all {
	width: 800px;
	margin: 0px auto;
	float: right;

}

.my-faq-search {
	border-top: 2px solid #286db4;
	border-bottom: 1px solid #286db4;
	padding: 35px 10px 50px 35px;
}

.my-faq-search__title {
	margin: 4px 17px 0 0;
}

.my-col {
	float: left;
}

.my-faq-img--title {
	width: 85px;
	height: 44px;
	background-position: 0 0;
}

.my-faq-img {
	background:
		url(//img1a.coupangcdn.com/image/my/desktop/sprite-faq.png?201510271)
		no-repeat;
	vertical-align: top;
}

#a {
	margin-top: 50px;
}

.my-faq-search__input {
	border: 3px solid #0073e9;
	height: 44px;
	line-height: 44px;
	font-size: 14px;
	padding: 0 10px;
	box-shadow: inset 1px 1px #f4f4f4;
	-webkit-border-radius: 0;
	border-radius: 0;
	width: 324px;
}

.my-faq-search__submit {
	background: #0073e9;
	width: 65px;
	height: 44px;
	border: 1px solid #0070cc;
	border-bottom-color: #0165b8;
	margin-left: 4px;
	cursor: pointer;
	color: white;
}

.a {
	padding-top: 20px;
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
		<div class="all">
			<div class="my-faq-search">
				<form name="faq_List" action="faq_Find.do">
					<div>
						<div class="my-faq-search__title my-col">
							<label for="myFaqSearchInput"
								class="my-faq-img my-faq-img--title"></label>
						</div>
						<input type="text" id="myFaqSearchInput"
							class="my-faq-search__input my-col" name="findValue">
						<button type="submit" class="my-faq-search__submit my-col">검색</button>

					</div>
				</form>
			</div>
			<div class="a">
				<h3>자주묻는 질문 BEST 5</h3>
			</div>
			<div class="panel-body">
				<c:if test="${empty bestList}">
			등록된 글이 없습니다.
			</c:if>
				<div class="panel-group" id="accordion">
					<c:forEach var="bestList" items="${bestList}">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="${shap}${bestList.faq_idx}" class="collapsed"> <i
										class="fa fa-angle-left control-icon"></i>${bestList.faq_subject}</a>
								</h4>
							</div>
							<div id="${bestList.faq_idx}" class="panel-collapse collapse"
								style="height: 0px;">
								<div class="panel-body">${bestList.faq_content}</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-body">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#all" data-toggle="tab">전체</a></li>
						<li class=""><a href="#hospital" data-toggle="tab">병원</a></li>
						<li class=""><a href="#hotel" data-toggle="tab">호텔</a></li>
						<li class=""><a href="#member" data-toggle="tab">회원</a></li>
						<li class=""><a href="#etc" data-toggle="tab">기타</a></li>
					</ul>

					<div class="tab-content">
						<div class="tab-pane fade active in" id="all">
							<div class="panel-body">
								<c:if test="${empty list}">
								등록된 글이 없습니다.
								</c:if>
								<div class="panel-group" id="accordion">
									<c:forEach var="list" items="${list}">
										<div class="panel panel-default">
											<div class="panel-heading">
												<h4 class="panel-title">

													<c:set var="all" value="1" />
													<a data-toggle="collapse" data-parent="#accordion"
														href="${shap}${all}${list.faq_idx}" class="collapsed">
														<i class="fa fa-angle-left control-icon"></i>${list.faq_subject}</a>
												</h4>
											</div>
											<div id="${all}${list.faq_idx}"
												class="panel-collapse collapse" style="height: 0px;">
												<div class="panel-body">${list.faq_content}</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="hospital">
							<div class="panel-body">
								<c:if test="${empty hosList}">
								등록된 글이 없습니다.
								</c:if>
								<div class="panel-group" id="accordion">
									<c:forEach var="hosList" items="${hosList}">
										<div class="panel panel-default">
											<div class="panel-heading">
												<h4 class="panel-title">
													<c:set var="hos" value="2" />
													<a data-toggle="collapse" data-parent="#accordion"
														href="${shap}${hos}${hosList.faq_idx}" class="collapsed">
														<i class="fa fa-angle-left control-icon"></i>${hosList.faq_subject}</a>
												</h4>
											</div>
											<div id="${hos}${hosList.faq_idx}"
												class="panel-collapse collapse" style="height: 0px;">
												<div class="panel-body">${hosList.faq_content}</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="hotel">
							<div class="panel-body">
								<c:if test="${empty hotList}">
								등록된 글이 없습니다.
								</c:if>
								<div class="panel-group" id="accordion">
									<c:forEach var="hotList" items="${hotList}">
										<div class="panel panel-default">
											<div class="panel-heading">
												<c:set var="hot" value="3" />
												<h4 class="panel-title">
													<a data-toggle="collapse" data-parent="#accordion"
														href="${shap}${hot}${hotList.faq_idx}" class="collapsed">
														<i class="fa fa-angle-left control-icon"></i>${hotList.faq_subject}</a>
												</h4>
											</div>
											<div id="${hot}${hotList.faq_idx}"
												class="panel-collapse collapse" style="height: 0px;">
												<div class="panel-body">${hotList.faq_content}</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="member">
							<div class="panel-body">
								<c:if test="${empty memList}">
								등록된 글이 없습니다.
								</c:if>
								<div class="panel-group" id="accordion">
									<c:forEach var="memList" items="${memList}">
										<div class="panel panel-default">
											<div class="panel-heading">
												<c:set var="mem" value="4" />
												<h4 class="panel-title">
													<a data-toggle="collapse" data-parent="#accordion"
														href="${shap}${mem}${memList.faq_idx}" class="collapsed">
														<i class="fa fa-angle-left control-icon"></i>${memList.faq_subject}</a>
												</h4>
											</div>
											<div id="${mem}${memList.faq_idx}"
												class="panel-collapse collapse" style="height: 0px;">
												<div class="panel-body">${memList.faq_content}</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="etc">
							<div class="panel-body">
								<c:if test="${empty etcList}">
								등록된 글이 없습니다.
								</c:if>
								<div class="panel-group" id="accordion">
									<c:forEach var="etcList" items="${etcList}">
										<div class="panel panel-default">
											<div class="panel-heading">
												<c:set var="etc" value="5" />
												<h4 class="panel-title">
													<a data-toggle="collapse" data-parent="#accordion"
														href="${shap}${etc}${etcList.faq_idx}" class="collapsed">
														<i class="fa fa-angle-left control-icon"></i>${etcList.faq_subject}</a>
												</h4>
											</div>
											<div id="${etc}${etcList.faq_idx}"
												class="panel-collapse collapse" style="height: 0px;">
												<div class="panel-body">${etcList.faq_content}</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>