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
<section>
	<div class="center">
	   <h2>Q&amp;A</h2>
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
				<input type="password" name="qna_pwd" id="pwd" class="form-control"> <span id="red">!</span> 수정 및 삭제하려면 비밀번호를 입력하세요.
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
</section>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>