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
#list_th1, #list_th2, #list_th3{
	border-top: 3px solid #BDBDBD;
	border-bottom: 3px solid #BDBDBD;
	height: 50px;
	text-align: center;
}

#list_th1 {
	width: 250px;
}

#list_th2 {
	width: 200px;
}

#list_th3 {
	width: 250px;
}
#list_td {
	border-bottom: 1px solid #BDBDBD;
	height: 40px;
	text-align: center;
}
#list_page{
	height: 50px;
}
h2 {
	text-align: center;
}
</style>
</head>
<body>
<div id="wrapper">
<%@ include file="/WEB-INF/views/myIndex.jsp"%>
	<div id="page-wrapper">
		<h2>병원 의사 리스트</h2>
		<table id="list_table">
			<thead>
				<tr>
					<th id="list_th1">이미지</th>
					<th id="list_th2">이름</th>
					<th id="list_th3">진료과목</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td colspan="3" id="list_td">
						<a href="doctorAdd.do">의사 등록 하기</a>
					</td>
				</tr>
			</tfoot>
			<tbody>
				<c:if test="${empty list }">
					<tr>
						<td colspan="3" id="list_td"> 등록된 의사가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty list }">
					<c:forEach var="dto" items="${list }">
						<tr>
							<td id="list_td"><img alt="의사사진" src="img/hospital/${sessionScope.cm_number }/doctor/${dto.doc_img }" width="100" height="100"/></td>
							<c:url var="doctorContentUrl" value="doctorContent.do">
								<c:param name="doc_num">${dto.doc_num }</c:param>
							</c:url>
							<td id="list_td"><a href="${doctorContentUrl }">${dto.doc_name }</a></td>
							
							<td id="list_td">${dto.doc_kind }</td>
						</tr> 
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
</div>		
</body>
</html>