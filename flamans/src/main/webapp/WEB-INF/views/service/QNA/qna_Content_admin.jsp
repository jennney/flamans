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

#qna_contd5{
	height: 30px;
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
</head>
<body>
<div id="wrapper">
<%@ include file="/WEB-INF/views/myIndex.jsp"%>
	<div id="page-wrapper">
		<h2>Q&amp;A</h2>
		
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
					<tr>
						<td id="qna_contd5"><button class="btn btn-default" onclick="location.href='qna_List_admin.do?qna_kind=${qdto.qna_kind}'">목록으로</button></td>
						<td align="right" id="qna_contd5">
							<button class="btn btn-default" type="submit">수정</button> 
							<button class="btn btn-default" type="submit" onclick="this.form.action='qna_Delete.do?qna_idx=${qdto.qna_idx}'">삭제</button>    
						</td>
					<tr>
				</tr>
			</table>
		</form>
		
		<form name="qna_ReWrite" action="qna_ReWrite.do">	
			<table id="qna_re">
				<tr>
					<td id="qna_retd"></td>
				</tr>
				<tr>
					<td>
						<input type="hidden" name="ref" value="${qdto.ref}">
						<input type="hidden" name="lev" value="${qdto.lev}">
						<input type="hidden" name="sunbun" value="${qdto.sunbun}">
						<input type="hidden" name="qna_subject" value="${qdto.qna_subject}">
						<input type="hidden" name="qna_writer" value="${qdto.qna_writer}"> 
						<input type="hidden" name="qna_item" value="${qdto.qna_item}">
						<input type="hidden" name="qna_kind" value="${qdto.qna_kind}">
						<input type="hidden" name="qna_pwd" value="${qdto.qna_pwd}">
						<input type="hidden" name="qna_secret" value="${qdto.qna_secret}">
						<input type="hidden" name="qna_findname" value="${qdto.qna_findname}">
						<textarea name="qna_content" id="qna_retx"></textarea>
					</td>
				</tr>
				<tr>
					<td id="qna_retd1"><input type="submit" value="답변등록"></td>
				</tr>
			</table>
		</form>
	</div>
</div>
</body>
</html>