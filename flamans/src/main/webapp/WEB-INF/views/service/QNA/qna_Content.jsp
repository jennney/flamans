<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>QNA상세보기</title>
<style>
#qna_con{
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
#qna_contd3{
	border-top: 2px solid #BDBDBD;
	height: 30px;
}
#qna_contd4{
	border-bottom: 2px solid #BDBDBD;
	height: 30px;
}
#qna_contd5{
	height: 30px;
}
h2{
	text-align: center;
}
#red{
	color: red;
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

</script>
</head>
<body>
<h2>QNA</h2>
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
			<th>비밀번호</th>
			<input type="hidden" name="qna_idx" value="${qdto.qna_idx}">
			<input type="hidden" name="qna_savepwd" value="${qdto.qna_pwd}">
			<input type="hidden" name="qna_kind" value="${qdto.qna_kind}">
			<td><input type="password" name="qna_pwd" id="pwd"> <span id="red">!</span> 수정 및 삭제하려면 비밀번호를 입력하세요.</td> 
		</tr>
		<tr>
			<tr>
				<td id="qna_contd5"><input type="button" value="목록으로" onclick="location.href='qna_List.do?qna_kind=${qdto.qna_kind}'"></td>
				<td align="right" id="qna_contd5">
					<input type="submit" value="수정하기">     
					<input type="button" value="삭제하기" onclick="submit(this.form,'qna_Delete.do?qna_idx=${qdto.qna_idx}')">
				</td>
			<tr>
		</tr>
	</table>
</form>
</body>
</html>