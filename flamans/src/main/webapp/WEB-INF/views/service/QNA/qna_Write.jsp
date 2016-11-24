<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>QNA글쓰기</title>
<style>
#qna_wr{
	width: 700px;
	margin: 0px auto;
	border-spacing: 0px;
}
#qna_wrth1,#qna_wrtd1{
	border-top: 3px solid #BDBDBD;
	border-bottom: 3px solid #BDBDBD;
	height: 30px;
}
#qna_wrth1{
	width: 200px;
	border-right: 3px solid #BDBDBD;
}
#qna_wrtd1{
	width: 500px;
}
#qna_wrtx{
	height: 500px;
	border-bottom: 2px solid #BDBDBD;
}
.ckeditor{
	width: 700px;
	height: 500px;
	resize: none;
}
#qna_wrtd2,#qna_wrth2{
	border-top: 2px solid #BDBDBD;
	border-bottom: 2px solid #BDBDBD;
	height: 30px;
}
#qna_wrth2,#qna_wrth3{
	border-right: 2px solid #BDBDBD;
}
#qna_wrtd5,#qna_wrth5{
	border-bottom: 2px solid #BDBDBD;
	height: 30px;
}
#qna_wrth5,#qna_wrth5{
	border-right: 2px solid #BDBDBD;
}
#qna_wrtd6,#qna_wrth6{
	border-bottom: 2px solid #BDBDBD;
	height: 30px;
}
#qna_wrth6,#qna_wrth6{
	border-right: 2px solid #BDBDBD;
}
#qna_wrtd3,#qna_wrth3{
	border-bottom: 2px solid #BDBDBD;
	height: 30px;
}
#qna_wrtd4{
	height: 30px;
	text-align: right;
}
h2{
	text-align: center;
}
</style>
</head>
<body>
<form name="qna_Write" action="qna_Write.do" method="post" enctype="multipart/form-data">
<h2>Q&A</h2>
	<table id="qna_wr">
		<tr>
			<th id="qna_wrth1">SUBJECT</th>
			<td id="qna_wrtd1"><input type="text" name="qna_subject"></td>
		</tr>
		<tr>
			<th id="qna_wrth5">WRITER</th>
			<td id="qna_wrtd5"><input type="text" name="qna_writer"></td>
		</tr>
		<tr>
			<th id="qna_wrth6">ITEM</th>
			<td id="qna_wrtd6">
				<select name="qna_item">
					<option> -전체 - </option>
					<option>회원정보</option>
					<option>단체회원이용</option>
					<option>제휴문의</option>
					<option>기타문의</option>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2" id="no_wrtx"><textarea name="qna_content" class="ckeditor"></textarea></td>
		</tr>
		<tr>	
			<th id="qna_wrth2">첨부파일1</th>
			<td id="qna_wrtd2"><input type="file" name="upload"></td>
		</tr>
		<tr>	
			<th id="qna_wrth3">첨부파일2</th>
			<td id="qna_wrtd3"><input type="file" name="upload"></td>
		</tr>
		<tr>
			<td id="qna_wrtd4" colspan="2"><input type="submit" value="작성"> <input type="reset" value="다시작성"></td>
		</tr>
	</table>
</form>
</body>
</html>