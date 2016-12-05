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
<h2>병원 관리 하기</h2>
<h4>미승인 병원</h4>
<table border="1" cellspacing="0" width="600">
	<thead>
		<tr>
			<th> 병원 이름 </th>
			<th> 사업자 번호 </th>
			<th> E-Mail </th>
			<th> 전화 번호 </th>
			<th> 승인여부 </th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<td colspan="5" align="center">페이징</td>
		</tr>
	</tfoot>
	<tbody>
	<c:if test="${empty unlist }">
		<tr>
			<td colspan="5" align="center">신청중인 병원이 없습니다.</td>
		</tr>
	</c:if>
	<c:if test="${!empty unlist }">
		<c:forEach var="unlist" items="${unlist }">
		<tr>
			<td>${unlist.cm_name }</td>
			<td>${unlist.cm_number }</td>
			<td>${unlist.cm_email }</td>
			<td>${unlist.cm_tel }</td>
			<c:url var="permitOkUrl" value="permitOk.do">
				<c:param name="cm_number">${unlist.cm_number }</c:param>
			</c:url>
			<td><a href="${permitOkUrl }">승인</a></td>
		</tr>
		</c:forEach>
	</c:if>
	</tbody>
</table>
<h4>승인된 병원</h4>
<table border="1" cellspacing="0" width="600">
	<thead>
		<tr>
			<th> 병원 이름 </th>
			<th> 사업자 번호 </th>
			<th> E-Mail </th>
			<th> 전화 번호 </th>
			<th> 승인여부 </th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<td colspan="5" align="center">페이징</td>
		</tr>
	</tfoot>
	<tbody>
	<c:if test="${empty list }">
		<tr>
			<td colspan="5" align="center">제휴중인 병원이 없습니다.</td>
		</tr>
	</c:if>
	<c:if test="${!empty list }">
		<c:forEach var="list" items="${list }">
		<tr>
			<td>${list.cm_name }</td>
			<td>${list.cm_number }</td>
			<td>${list.cm_email }</td>
			<td>${list.cm_tel }</td>
			<c:url var="hospitalOutUrl" value="hospitalOut.do">
				<c:param name="cm_number">${list.cm_number }</c:param>
			</c:url>
			<td><a href="${hospitalOutUrl }">삭제</a></td>
		</tr>
		</c:forEach>
	</c:if>
	</tbody>
</table>
</body>
</html>