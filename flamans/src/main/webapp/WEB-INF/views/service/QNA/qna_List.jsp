<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>QNA</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
#img{
width: 10px;
height: 12px;
}
#img1{
width: 20px;
height: 12px;
}
#qn_list{
   width: 700px;
   margin: 0px auto;
   border-spacing: 0px;
}
#qna_listth1,#qna_listth2,#qna_listth3,#qna_listth4,#qna_listth5{
   border-top: 3px solid #BDBDBD;
   border-bottom: 3px solid #BDBDBD;
   height: 50px;
   text-align: center;
}
#qna_listth1{
   width: 350px;
}
#qna_listth2{
   width: 100px;
}
#qna_listth3{
   width: 100px;
}
#qna_listth4{
   width: 50px;
}
#qna_listth5{
	width: 100px;
}
#qna_listtd{
   border-bottom: 1px solid #BDBDBD;
   height: 40px;
   text-align: center;
}
#qna_listtd1{
   border-bottom: 1px solid #BDBDBD;
   height: 40px;
   text-align: left;
}
#qna_listtd7{
	height: 50px;
}
h2{
   text-align: center;
}

a:LINK {
	text-decoration: none;
}
#p{
	text-align: center;
}
.b{
	border-bottom: 1px solid #ff432f;
	border-top : 1px solid #ff432f;
	border-left : 1px solid #ff432f;
	border-right: 1px solid #ff432f;
	height: 34px;
	width: 300px;
}
.a{
	padding: 50px;
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
                    <h1>Q&amp;A</h1>
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
<c:if test="${qna_kind eq 'site'}">
<p id="p"><a href="qna_List.do?qna_kind=site">전체 보기</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="qna_List.do?qna_kind=site&qna_item=meminfo">회원정보문의</a>&nbsp;&nbsp;
|&nbsp;&nbsp;<a href="qna_List.do?qna_kind=site&qna_item=memgroup">단체회원문의</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="qna_List.do?qna_kind=site&qna_item=tieup">제휴문의</a>
&nbsp;&nbsp;|&nbsp;&nbsp;<a href="qna_List.do?qna_kind=site&qna_item=etc">기타문의</a></p>
</c:if>
<c:if test="${qna_kind eq 'hospital'}">
<p id="p"><a href="qna_List.do?qna_kind=hospital">전체 보기</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="qna_List.do?qna_kind=hospital&qna_item=cosmetic">성형문의</a>&nbsp;&nbsp;
|&nbsp;&nbsp;<a href="qna_List.do?qna_kind=hospital&qna_item=hosbooking">예약문의</a>&nbsp;&nbsp;
|&nbsp;&nbsp;<a href="qna_List.do?qna_kind=hospital&qna_item=etc">기타문의</a>
</c:if>
<c:if test="${qna_kind eq 'hotel'}">
<p id="p"><a href="qna_List.do?qna_kind=hotel">전체 보기</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="qna_List.do?qna_kind=hotel&qna_item=hotbooking">예약문의</a>&nbsp;&nbsp;
|&nbsp;&nbsp;<a href="qna_List.do?qna_kind=hotel&qna_item=room">방문의</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="qna_List.do?qna_kind=hotel&qna_item=etc">기타문의</a>
</c:if>
	<table id="qn_list">
		<thead>
			<tr>
		   		<td colspan="5" align="right">
		   		<form name="qna_FindList" action="qna_List.do">
		   		<div class="form-group input-group">
		      		<select name="findKey" style="width: 100px; height: 34px;">
		         		<option value="all"${findKey eq 'all'?"selected":""}> - 전체 - </option>
		         		<option value="qna_content" ${findKey eq 'qna_content'?"selected":""}>  내용     </option>
		         		<option value="qna_subject" ${findKey eq 'qna_subject'?"selected":""}>  제목    </option>
		         		<option value="qna_writer" ${findKey eq 'qna_writer'?"selected":""}>  작성자   </option>
		      		</select>
		      		<input type="hidden" name="qna_item" value="${qna_item}">
		      		<input type="hidden" name="qna_kind" value="${qna_kind}">
					<input type="text" name="findValue" value="${findValue}" placeholder="검색어를 입력하세요" class="b">
			    	<span class="input-group-btn"><button class="btn btn-primary" type="submit"><i class="fa fa-search"></i></button></span>
				</div>
		   		</form>
		   		</td>
			</tr>
		   	<tr>
		   		<th id="qna_listth5">ITME</th>
		    	<th id="qna_listth1">SUBJECT</th>
		      	<th id="qna_listth2">WRITER</th>
		      	<th id="qna_listth3">DATE</th>
		      	<th id="qna_listth4">HITS</th>
		   	</tr>
		</thead>
		<tfoot>
			<tr>
				<td colspan="4" align="center" id="qna_listtd7">
				<ul class="pagination">
				<li>${qna_page}</li>
				</ul>
				</td>
				<td align="right" id="qna_listtd7">
					<button class="btn btn-default" onclick="location.href='qna_Write.do?qna_kind=${qna_kind}'">글쓰기</button>				
				</td>
		   	</tr>
		</tfoot>
		<tbody>
		<c:if test="${empty qnaList}">
			<tr>
		   		<td colspan="5" id="qna_listtd">등록된 질문이 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="qnaList" items="${qnaList}">
			<tr>
				<td id="qna_listtd">${qnaList.qna_item}</td>
				<td id="qna_listtd1">
				<c:forEach begin="1" end="${qnaList.lev}" step="1">
					&nbsp;&nbsp;<img src="img/ico_re.gif" alt="답변" id="img1">
				</c:forEach>
				<c:choose>
					<c:when test="${qnaList.qna_secret eq 'open'}">
						<a href="qna_Content.do?qna_idx=${qnaList.qna_idx}">${qnaList.qna_subject}</a>
					</c:when>
					<c:when test="${qnaList.qna_secret eq 'secret'}">
						<img src="img/icon_lock.gif" alt="자물쇠" id="img"> 
						<a href="qna_PwdContent.do?qna_idx=${qnaList.qna_idx}&qna_kind=${qnaList.qna_kind}">${qnaList.qna_subject}</a>
					</c:when>
				</c:choose>
				</td>
				<td id="qna_listtd">${qnaList.qna_writer}</td>
				<td id="qna_listtd">${qnaList.qna_writedate}</td>
				<td id="qna_listtd">${qnaList.readnum}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
</div>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>