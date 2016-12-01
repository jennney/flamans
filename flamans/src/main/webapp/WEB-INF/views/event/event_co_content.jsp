<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>이벤트 상세보기</h2>
	<c:set var="dto" value="${list}"/>
	
	<table width="450" border="1" cellspacing="0">
		<tr>
			<th>번호</th>
			<td>${dto.e_idx}</td>
			<th>글쓴이</th>
			<td>${dto.e_name}</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${dto.e_readnum}</td>
			<th>작성날짜</th>
			<td>${dto.e_date}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3" align="left">
			${dto.e_subject}
			</td>
		</tr>
		<tr>
			<th>이벤트 기간</th>
			<td colspan="3" align="left">
			${dto.e_start} ~ ${dto.e_end}
			</td>
		</tr>
		
		<tr>
			<td colspan="4">
			<img src="img/${dto.e_img }"></td>
		</tr>
	
		<tr>
			<td colspan="4" align="center">
				<a href="event_co_list.do"><input type="button" value="목록"></a>
				<input type="button" value="수정" onclick="location.href='event_co_update.do?e_idx=${dto.e_idx}'">
				<input type="button" value="삭제" onclick="location.href='event_co_delete.do?e_idx=${dto.e_idx}&e_name=${dto.e_name}'">
			</td>
		</tr>
</table>
</body>
</html>