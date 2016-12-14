<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
		<h2>병원 고객센터 문의 상세 보기</h2>
		<c:forEach var="dto" items="${list }">
			<table border="1" cellspacing="0" width="600">
				<tr>
					<th>SUBJECT</th>
					<td>${dto.qna_subject}</td>
				</tr> 
				<tr>
					<th>WRITER</th>
					<td>${dto.qna_writer}</td>
				</tr>
				<tr>
					<td colspan="2" align="right" height="30"> DATE ${dto.qna_writedate} HIT  ${dto.readnum}</td>
				</tr>
				<tr>
					<td colspan="2" align="center">${dto.qna_content}</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<a href="hospitalBbsList.do">목록으로</a>
						<c:url var="hospialBbsDeleteUrl" value="hospitalBbsDelete.do">
							<c:param name="qna_idx">${dto.qna_idx }</c:param>
						</c:url>
						<a href="${hospitalBbsDeleteUrl }">삭제하기</a>
						<c:url var="hospitalBbsReWriteUrl" value="hospitalBbsReWrite.do">
							<c:param name="qna_idx">${dto.qna_idx }</c:param>
						</c:url>
						<a href="${hospitalBbsReWriteUrl }">답변달기</a>				
					</td>
				</tr>
			</table>
		</c:forEach>
	</div>	
</div>		
</body>
</html>