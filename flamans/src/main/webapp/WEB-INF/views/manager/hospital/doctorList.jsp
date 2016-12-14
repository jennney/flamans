<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="wrapper">
<%@ include file="/WEB-INF/views/myIndex.jsp"%>
	<div id="page-wrapper">
		<h2>병원 의사 리스트</h2>
		<table border="1" cellspacing="0" width="600">
			<thead>
				<tr>
					<th>이름</th>
					<th>이미지</th>
					<th>진료과목</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td colspan="3">
						<a href="doctorAdd.do">의사 등록 하기</a>
					</td>
				</tr>
			</tfoot>
			<tbody>
				<c:if test="${empty list }">
					<tr>
						<td colspan="3"> 등록된 의사가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty list }">
					<c:forEach var="dto" items="${list }">
						<tr>
							<c:url var="doctorContentUrl" value="doctorContent.do">
								<c:param name="doc_num">${dto.doc_num }</c:param>
							</c:url>
							<td><a href="${doctorContentUrl }">${dto.doc_name }</a></td>
							<td>${dto.doc_img }</td>
							<td>${dto.doc_kind }</td>
						</tr> 
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
</div>		
</body>
</html>