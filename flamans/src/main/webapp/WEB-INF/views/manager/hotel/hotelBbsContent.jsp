<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/flamans/js/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
	border-top: 1px solid #BDBDBD;
}

#no_contd5{
	border-top: 3px solid #BDBDBD;
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
		<h2>고객센터 본문보기</h2>
		<c:forEach var="dto" items="${list }">
			<table id="no_con">
				<tr>
					<th id="no_conth1">SUBJECT</th>
					<td id="no_contd1">${dto.qna_subject}</td>
				</tr> 
				<tr>
					<th id="no_conth2">WRITER</th>
					<td id="no_contd2">${dto.qna_writer}</td>
				</tr>
				<tr>
					<td colspan="2" align="right" height="30"> DATE ${dto.qna_writedate} HIT  ${dto.readnum}</td>
				</tr>
				<tr>
					<td colspan="2" align="center" id="no_contd3">${dto.qna_content}</td>
				</tr>
				<tr>
					<td colspan="2" align="center" id="no_contd5">
						<a href="hotelBbsList.do" class="btn btn-default">목록으로</a>
						<c:url var="hotelBbsDeleteUrl" value="hotelBbsDelete.do">
							<c:param name="qna_idx">${dto.qna_idx }</c:param>
						</c:url>
						<a href="${hotelBbsDeleteUrl }" class="btn btn-default">삭제하기</a>
						<c:url var="hotelBbsReWriteUrl" value="hotelBbsReWrite.do">
							<c:param name="qna_idx">${dto.qna_idx }</c:param>
						</c:url>
						<a href="${hotelBbsReWriteUrl }" class="btn btn-default">답변달기</a>				
					</td>
				</tr>
			</table>
		</c:forEach>
	</div>
</div>
</body>
</html>