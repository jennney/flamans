<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>QNA상세보기</title>
<style>
#qna_con ,#qna_re{
	width: 700px;
	margin: 0px auto;
	border-spacing: 0px;
}
#qna_conth1,#qna_contd1{
	border-top: 3px solid #BDBDBD;
	border-bottom: 3px solid #BDBDBD;
	height: 30px;
	
}
#qna_conth2,#qna_contd2{
	border-bottom: 3px solid #BDBDBD;
	height: 30px;
}
#qna_conth1,#qna_conth2{
	width: 200px;
}
#qna_contd1,#qna_contd2{
	width: 500px;
	text-align: left;
}
#qna_contd3,#qna_conth3{
	border-top: 2px solid #BDBDBD;
	border-bottom: 2px solid #BDBDBD;
	height: 30px;
}
#qna_conth1,#qna_conth2,#qna_conth3,#qna_conth5{
	text-align: center;
}
#qna_contd5{
	height: 50px;
}
h2{
	text-align: center;
}
#red{
	color: red;
}
#qna_retd1{
	text-align: right;
}
#qna_retx{
	width: 700px;
	height: 200px;
	resize: none;
}
#qna_retd{
	border-top: 2px solid #BDBDBD;
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
.all{
	border-bottom: 0px;
	border-top : 0px;
	border-left : 0px;
	border-right: 0px;
	width: 500px;
	background: #F6F6F6;
}
</style>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script>
function check(){
	
	var savepwd = $(':input[name=qna_savepwd]').val();
	var userpwd = $(':input[name=qna_pwd]').val();
	
	if(userpwd==""){
		window.alert('비밀번호를 입력하세요');
		return false;
		
	}
	
	if(userpwd != savepwd){
		window.alert('비밀번호가 맞지않습니다.');
		return false;
	}
}

document.getElementById(id)
function submit(form,url){
	
}

</script>
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
<form name="qna_Update" action="qna_Update.do" onsubmit="return check()">
	<table id="qna_con">
		<tr>
			<th id="qna_conth1">SUBJECT</th>
			<td id="qna_contd1">${qdto.qna_subject}</td>
		</tr> 
		<tr>
			<th id="qna_conth2" >WRITER</th>
			<td id="qna_contd2">${qdto.qna_writer}</td>
		</tr>
		<tr>
			<td colspan="2" align="right" height="30"> DATE ${qdto.qna_writedate} HIT  ${qdto.readnum}</td>
		</tr>
		<tr>
			<td colspan="2" align="center">${qdto.qna_content}</td>
		</tr>
	
		<tr>
			<th id="qna_conth3">비밀번호</th>
			<td id="qna_contd3">
				<input type="hidden" name="qna_idx" value="${qdto.qna_idx}">
				<input type="hidden" name="qna_savepwd" value="${qdto.qna_pwd}">
				<input type="hidden" name="qna_kind" value="${qdto.qna_kind}">
				<input type="password" name="qna_pwd" id="pwd" class="all"> <span id="red">!</span> 수정 및 삭제하려면 비밀번호를 입력하세요.
			</td> 
		</tr>
		<tr>
			<tr>
				<td id="qna_contd5">
					<button type="button" class="btn btn-default" onclick="location.href='qna_List.do?qna_kind=${qdto.qna_kind}'">목록으로</button>
				</td>
				<td align="right" id="qna_contd5">
					<button type="submit" class="btn btn-default">수정하기</button>
					<button type="submit" class="btn btn-default" onclick="this.form.action='qna_Delete.do?qna_idx=${qdto.qna_idx}'">삭제하기</button>
				</td>
			<tr>
		</tr>
	</table>
</form>
</div>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>