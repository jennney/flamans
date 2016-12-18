<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Notice</title>
<link href="mypage/assets/css/bootstrap.css" rel="stylesheet" />
<style>
#no_list {
	width: 700px;
	margin: 0px auto;
	border-spacing: 0px;
}

#no_listth1, #no_listth2, #no_listth3, #no_listth4 {
	border-top: 3px solid #BDBDBD;
	border-bottom: 3px solid #BDBDBD;
	height: 50px;
	text-align: center;
}

#no_listth1 {
	width: 450px;
}

#no_listth2 {
	width: 100px;
}

#no_listth3 {
	width: 100px;
}

#no_listth4 {
	width: 50px;
}

#no_listtd {
	border-bottom: 1px solid #BDBDBD;
	height: 40px;
	text-align: center;
}
#no_listtdd{
	height: 50px;
}
.a{
	padding: 50px;
}
.b{
	border-bottom: 1px solid #ff432f;
	border-top : 1px solid #ff432f;
	border-left : 1px solid #ff432f;
	border-right: 1px solid #ff432f;
	height: 34px;
	width: 300px;
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
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script>
	function check() {
		var findValue = $(':input[name=findValue]').val();

		if (findValue == "" || findValue == null) {
			window.alert('검색어를 입력해주세요');
			return false;
		}
	}
</script>
<%@ include file="/WEB-INF/views/header.jsp"%>
</head>
<body>
<div class="page-header">
    <div class="overlay">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>Notice</h1>
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
	<table id="no_list">
		<thead>
			<tr>
				<td colspan="4" align="right">
					<form name="no_find" action="no_List.do" method="post" onsubmit="return check()" role="form">
							<div class="form-group input-group">
								<select name="findKey" style="width: 100px; height: 34px;">
									<option value="all" ${findKey eq 'all'?"selected":""}>- 전체
										-</option>
									<option value="no_content" ${findKey eq 'no_content'?"selected":""}>
										내용</option>
									<option value="no_subject" ${findKey eq 'no_subject'?"selected":""}>
										제목</option>
								</select>
								<input type="text" name="findValue" value="${findValue}" placeholder="검색어를 입력하세요" class="b">
						    	<span class="input-group-btn"><button class="btn btn-primary" type="submit"><i class="fa fa-search"></i></button></span>
						    </div>
					</form>
				</td>
			</tr>
			<tr>
				<th id="no_listth1">SUBJECT</th>
				<th id="no_listth2">WRITER</th>
				<th id="no_listth3">DATE</th>
				<th id="no_listth4">HITS</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<td colspan="4" align="center" id="no_listtdd">
					<ul class="pagination">
						<li>${no_page}</li>
					</ul>
				</td>
			</tr>
		</tfoot>
		<tbody>
			<c:if test="${empty noList}">
				<tr>
					<td colspan="4" id="no_listtd">등록된 공지사항이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="noList" items="${noList}">
				<c:url var="noticeURL" value="no_Content.do">
					<c:param name="idx">${noList.no_idx}</c:param>
				</c:url>
				<tr>
					<td id="no_listtd"><a href="${noticeURL}">${noList.no_subject}</a></td>
					<td id="no_listtd">관리자</td>
					<td id="no_listtd">${noList.no_writedate}</td>
					<td id="no_listtd">${noList.no_readnum}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</div>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>