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
</style>
</head>
<body>
<h2>QNA</h2>
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
		<td align="center" id="qna_contd3">첨부 파일 1 : </td>
		<td align="left" id="qna_contd3">${qdto.qna_file1}</a></td>
	</tr>
	<tr>
		<td align="center" id="qna_contd4">첨부 파일 2 : </td>
		<td align="left" id="qna_contd4">${qdto.qna_file2}</td>
	</tr>
	<tr>
		<tr>
			<td id="qna_contd5"><input type="button" value="목록으로" onclick="location.href='qna_List.do?qna_kind=${qdto.qna_kind}'"></td>
			<td align="right" id="qna_contd5">
				<input type="button" value="수정하기" onclick="location.href='qna_Update.do?idx=${qdto.qna_idx}'">     
				<input type="button" value="삭제하기" onclick="location.href='qna_Delete.do?idx=${qdto.qna_idx}'">
			</td>
		<tr>
	</tr>
</table>
</body>
</html>