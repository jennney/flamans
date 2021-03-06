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
</style>
</head>
<body>
<div id="wrapper">
<%@ include file="/WEB-INF/views/myIndex.jsp"%>
	<div id="page-wrapper">
   <h2>공지사항</h2>

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
		<th align="center" id="no_contd3">첨부 파일 1 : </th>
		<td align="left" id="no_contd3"><a href="no_down.do?no_file=${ndto.no_file1}">${ndto.no_file1}</a></td>
	</tr>
	<tr>
		<tr>
			<td id="no_contd5"><input type="button" value="목록으로" onclick="location.href='no_List_admin.do'" class="btn btn-default"></td>
			<td align="right" id="no_contd5">
				<input type="button" value="수정하기" onclick="location.href='no_Update.do?idx=${ndto.no_idx}'" class="btn btn-default">     
				<input type="button" value="삭제하기" onclick="location.href='no_Delete.do?idx=${ndto.no_idx}'" class="btn btn-default">
			</td>
		<tr>
	</tr>
</table>
</div>
</div>
</body>
</html>