<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#list_table {
	width: 700px;
	margin: 0px auto;
	border-spacing: 0px;
}

#list_th1, #list_th2, #list_th3, #list_th4, #list_th5, #list_th6 {
	border-top: 3px solid #BDBDBD;
	border-bottom: 3px solid #BDBDBD;
	height: 50px;
	text-align: center;
}

#list_th1 {
	width: 50px;
}

#list_th2 {
	width: 100px;
}

#list_th3 {
	width: 250px;
}

#list_th4 {
	width: 100px;
}
#list_th5 {
	width: 100px;
}
#list_th6 {
	width: 100px;
}
#list_td {
	border-bottom: 1px solid #BDBDBD;
	height: 40px;
	text-align: center;
}

h2 {
	text-align: center;
}

#list_page{
	height: 50px;
}

</style>
</head>
<body>
<div id="wrapper">
<%@ include file="/WEB-INF/views/myIndex.jsp"%>
	<div id="page-wrapper">
		<h2>고객 센터 리스트 보기</h2>
		<table id="list_table">
			<thead>
				<tr>
					<th id="list_th1">번호</th>
					<th id="list_th2">구분</th>
					<th id="list_th3">제목</th>
					<th id="list_th4">작성자</th>
					<th id="list_th5">작성일자</th>
					<th id="list_th6">조회수</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td colspan="6" align="center" id="list_page"> ${hotBbsPage } </td>
				</tr>
			</tfoot>
			<tbody>
				<c:if test="${empty list }">
				<tr>
					<td colspan="6" align="center" id="list_td">
						검색된 게시 글이 없습니다.
					</td>
				</tr>
				</c:if>
				<c:if test="${!empty list }">
					<c:forEach var="dto" items="${list }">
						<tr>
							<td id="list_td">${dto.qna_idx }</td>
							<td id="list_td">${dto.qna_item }</td>
							<c:url var="hotelBbsContentUrl" value="hotelBbsContent.do">
								<c:param name="qna_idx">${dto.qna_idx }</c:param>
							</c:url>
							<td id="list_td"><a href="${hotelBbsContentUrl }">${dto.qna_subject }</a></td>
							<td id="list_td">${dto.qna_writer }</td>
							<td id="list_td">${dto.qna_writedate }</td>
							<td id="list_td">${dto.readnum }</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>