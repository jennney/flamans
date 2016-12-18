<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항상세보기</title>
<style>
#no_con{
	width: 700px;
	margin: 0px auto;
	border-spacing: 0px;
}
#no_conth1,#no_contd1{
	border-top: 3px solid #BDBDBD;
	border-bottom: 3px solid #BDBDBD;
	height: 50px;
	text-align: center;
}   
#no_conth2,#no_contd2{
	border-bottom: 3px solid #BDBDBD;
	height: 50px;
	text-align: center;
}
#no_conth1,#no_conth2{
	width: 200px;
	text-align: center;
}
#no_contd1,#no_contd2{
	width: 500px;
	text-align: left;
}
#no_contd3{
	border-top: 2px solid #BDBDBD;
	height: 30px;
}
#no_contd4{
	border-bottom: 2px solid #BDBDBD;
	height: 30px;
}
#no_contd5{
	height: 50px;
}
h2{
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
<table id="no_con">
	<tr>
		<th id="no_conth1">SUBJECT</th>
		<td id="no_contd1">${ndto.no_subject}</td>
	</tr>
	<tr>
		<th id="no_conth2" >WRITER</th>
		<td id="no_contd2">관리자</td>
	</tr>
	<tr>
		<td colspan="2" align="right" height="30">DATE ${ndto.no_writedate} HIT ${ndto.no_readnum}</td>
	</tr>
	<tr>
		<td colspan="2" align="center">${ndto.no_content}</td>
	</tr>
	<tr>
		<td align="center" id="no_contd3">첨부 파일 1 : </td>
		<td align="left" id="no_contd3"><a href="no_down.do?no_file=${ndto.no_file1}">${ndto.no_file1}</a></td>
	</tr>
	<tr>
		<tr>
			<td id="no_contd5" colspan="2"><input type="button" value="목록으로" onclick="location.href='no_List.do'" class="btn btn-default"></td>
		<tr>
	</tr>
</table>
</div>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>