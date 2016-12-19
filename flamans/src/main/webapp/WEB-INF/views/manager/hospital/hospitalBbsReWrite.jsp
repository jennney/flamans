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
#no_conth1,#no_conth2,#no_conth3{
	width: 200px;
	text-align: center;
}
#no_contd1,#no_contd2,#no_contd3{
	width: 500px;
	text-align: left;
}
#no_contd3,#no_conth3{
	border-bottom: 3px solid #BDBDBD;
}

#no_contd5{
	text-align: center;
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
		<h2>병원 고객센터 답변 달기 폼</h2>
		<c:set var="dto" value="${dto }"/>
		<form name="hospitalBbsReWrite" action="hospitalBbsReWrite.do" method="post">
			<table id="no_con">
				<tr>
					<th id="no_conth1">SUBJECT</th>
						<td id="no_contd1"><input type="text" name="qna_subject" size="50" value="Re:${dto.qna_subject }"></td>
					</tr>
					<tr>
						<th id="no_conth2">WRITER</th>
						<td id="no_contd2">${sessionScope.cm_name} 관리자
						<input type="hidden" name="qna_writer" value="${sessionScope.savecoId}"></td>
					</tr>
					<tr>
						<th id="no_conth3">ITEM</th>
						<td id="no_conthd3">${dto.qna_item }</td>
					</tr>
					<tr>
						<td colspan="2"><textarea name="qna_content" class="form-control"></textarea></td>
					</tr>
					<tr>
						<td colspan="2" id="no_contd5">
							<input type="submit" value="등록" class="btn btn-default">
							<input type="reset" value="다시 작성" class="btn btn-default">			
						</td>
					</tr>
			</table>
			<input type="hidden" name="qna_item" value="${dto.qna_item }">
			<input type="hidden" name="qna_pwd" value="${dto.qna_pwd }">
			<input type="hidden" name="qna_secret" value="${dto.qna_secret }">
			<input type="hidden" name="qna_kind" value="${dto.qna_kind }">
			<input type="hidden" name="qna_findname" value="${sessionScope.cm_number }">
			<input type="hidden" name="ref" value="${dto.ref }">
			<input type="hidden" name="lev" value="${dto.lev }">
			<input type="hidden" name="sunbun" value="${dto.sunbun }">
			
		</form>
	</div>
</div>		
</body>
</html>