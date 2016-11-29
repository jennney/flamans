<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<title>[name] 호텔 상세페이지</title>

</head>
<body>
	
	<div align="center" style="border: 7px solid maroon; height: 2100px;">

		<%@ include file="../header.jsp" %>
		
		<table style="margin: 0px auto;">
			<tr>
				<td align="center"><h2>호텔의 상세정보 페이지</h2></td>
			</tr>
			
			<tr>
				<td><%@ include file="hotel_main_search.jsp" %></td>
			</tr>
		</table>
		
		<div style="width: 1000px;">
		
			<div style="border: 5px solid pink; width: 270px; float: left; white-space:nowrap; margin:0px center;">
				<%@ include file="hotel_sub_search.jsp" %>
			</div>
		
			<div style="border: 5px solid pink;  width: 700px; float: right; margin-left: 0px auto;">
			
				<c:if test="${empty hotel_info }">
					<li> ---- 호텔이 없습니다. 오류오류 ---- </li>
				</c:if>
				
				<c:forEach var="hotel_info" items="${hotel_info }">
					
					<c:url var="wishlistUrl" value="hot_wishlist.do">
						<c:param name="hot_num">${hotel_info.hot_num }</c:param>
						<c:param name="hotel_link">hotel_get_info.do</c:param>
					</c:url>
					
					<table>
						<tr>
							<td colspan="4"><h1>[ ${hotel_info.hot_name } ] 정보</h1></td>
						</tr>
						<tr>
							<td><img alt="호텔사진영역" src="${hotel_info.hot_img }" width="150" height="150"></td>
							<td width="500">■호텔 상세정보 입력란(1)■ ${hotel_info.hot_content }</td>
							<td><a href="${ wishlistUrl}"><input type="button" value="♥"></a></td>
							<td><input type="button" value="예약"></td>
						</tr>
						
						<tr>
							<td><img alt="지도영역" src="img/map.jpg" width="150" height="150"></td>
							<td>■호텔 상세정보 입력란(2)■ ${hotel_info.hot_content }</td>
						</tr>
					</table>
				</c:forEach>
			
				<hr>
				
				
				<h4>[ 평점/후기 작성 ]</h4>
				
				<c:set var="hotel_info" value="${hotel_info}"/>
				<form name="comment_write" action="hotel_input_comment_grade.do">
					
					<table>
					
						<tr>
							<td><textarea rows="4" cols="100" name="c_comment" placeholder="로그인 후 체크아웃시 작성 가능합니다."></textarea></td>
						</tr>
						<tr>
							<td>평점테스트:<input type="text" name="c_grade"></td>
						</tr>
						<tr>
							<td>작성자테스트:<input type="text" name="c_writer">
							<input type="submit" value="작성"></td>
						</tr>
					</table>
					<input type="hidden" name="c_number" value="1">
					<br>
				</form>
				
				<c:if test="${empty hotel_comment }">
					<li> ---- 덧글이 없습니다. 남겨주세요! ---- </li>
				</c:if>
				
				<c:forEach var="hotel_comment" items="${hotel_comment }">

						<table border="1" style="float: left;">
							<tr>
								<th>[ 작성자 ] </th>
								<td>${hotel_comment.c_writer }</td>
								<th>[평점] </th> 
								<td>${hotel_comment.c_grade } </td>
							</tr>
							
							<tr>
								<th>[ 내용 ] </th>
								<td>${hotel_comment.c_comment }</td>
							</tr>
							
							<tr>
								<th>[ 작성일 ] </th>
								<td>${hotel_comment.c_date }</td>
							</tr>
						</table>
						
				</c:forEach>
					
			</div>
		</div>
	</div>
</body>
</html>