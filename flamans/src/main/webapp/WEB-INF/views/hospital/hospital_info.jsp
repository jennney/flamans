<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
<meta charset=UTF-8">
<title>Insert title here</title>

	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	  
</head>
	
<body>

	<div align="center">

		<%@ include file="../header.jsp" %>
		<table style="margin: 0px auto;">
		
			<tr>
				<td align="center"><h2>병원의 상세정보 페이지</h2></td>
			</tr>
			
			<tr>
				<td><%@ include file="hospital_main_search.jsp" %></td>
			</tr>
			
		</table>
		
		<div style="width: 1000px;">
			
			<div style="border: 5px solid teal; width: 270px; float: left; white-space:nowrap; margin:0px center;">
				<%@ include file="hospital_sub_search.jsp" %>
			</div>
			
			<div style="border: 5px solid teal;  width: 700px; float: right; margin-left: 0px auto;">
			
				<c:if test="${empty hospital_info }">
					<li> ---- 병원이 없습니다. 오류오류 ---- </li>
				</c:if>
				
				<c:forEach var="hospital_info" items="${hospital_info }">
				
					<c:url var="wishlistUrl" value="hos_wishlist.do">
 								<c:param name="hos_num">${hospital_info.hos_num }</c:param>
 								<c:param name="hospital_link">hospital_get_info.do</c:param>
					</c:url>
					
					<table border="0" width="700" class="table table-hover">
					
						<tr>
							<td width="600" style="padding-top: 30px;"><h1>【  ${hospital_info.hos_name } 】</h1><br></td>
							<td width="100" style="vertical-align: middle;"> <a href="${wishlistUrl}"><input type="button" value=" ♥ "></a>
							<input type="button" value="예약"></td>
						</tr>
					</table>
					
					<table border="0"  width="700" class="table table-hover">
						<tr>
							<td width="150"> <img alt="병원사진영역" src="${hospital_info.hos_img }" width="150" height="150"></td>
							<td width="550" valign="top" rowspan="2">■병원 상세정보 입력란■ ${hospital_info.hos_content }</td>
						</tr>
						
						<tr>
							<td width="150"> <img alt="지도영역" src="img/map.jpg" width="150" height="150"></td>
						</tr>
						
					</table>
					
					<form name="doctors" action="bBook.do">
					
					 	<br/>
					 	<hr>
					 	<h3>의료진 정보</h3>
					 	<c:forEach var="hospital_doclist" items="${hospital_doclist }">
							
							<table border="1" class="table table-hover">
								
								<tr>
									<td width="100"><img alt="의사사진" src="img/${hospital_doclist.doc_img }" width="100" height="100"></td>
									<td width="500">
									이름: ${hospital_doclist.doc_name }<br/>
									학력: ${hospital_doclist.doc_level }<br/>
									경력: ${hospital_doclist.doc_career }<br/>
									기타: ${hospital_doclist.doc_etc }<br/>
									</td>
									<td><input type="radio" name="doctor_num"+${hospital_doclist.doc_name}></td>
								</tr>
								
							</table>
							
						</c:forEach>
					</form>
				</c:forEach>
			
				<hr>
				
				<h4>[ 평점/후기 작성 ]</h4>
				
				<c:set var="hospital_info" value="${hospital_info}"/>
				
					<form name="comment_write" action="hospital_input_comment_grade.do">
						<table class="table table-hover">
							
							<tr>
								<td><textarea rows="4" cols="90" name="c_comment" placeholder="로그인 후 체크아웃시 작성 가능합니다."></textarea></td>
							</tr>
							
						</table>
						
						<table class="table table-hover">
							<tr>
								<td width="110">평점테스트:</td>
								<td width="200"><input type="text" name="c_grade"></td>
								<td></td>
							</tr>
							
							<tr>
								<td width="110">작성자테스트:</td><td>
								<input type="text" name="c_writer"></td>
								<td><input type="submit" value="작성"></td>
							</tr>
							
						</table>
						
						<hr>
							<input type="hidden" name="c_number" value="1">
						<br>
						
					</form>
					
				<h2>평점/후기</h2>
				<c:if test="${empty hospital_comment }">
					<li> ---- 덧글이 없습니다. 남겨주세요! ---- </li>
				</c:if>
				
				<c:forEach var="hospital_comment" items="${hospital_comment }">
					<div class="container" style="width: 700px;">
						<table class="table table-hover"  style="float: left;">
							<thead>
								<tr>
									<th width="100">[작성자]</th>
									<th width="100">[평점]</th>
									<th width="400">[내용]</th>
									<th width="100">[작성일]</th>
								</tr>
							</thead>
							
							<tbody>
								<tr>
									<td>${hospital_comment.c_writer }</td>
									<td>${hospital_comment.c_grade } </td>
									<td>${hospital_comment.c_comment }</td>
									<td>${hospital_comment.c_date }</td>
								</tr>
							</tbody>
						</table>
					</div>
					<br/>
				</c:forEach>
					
			</div>
		</div>
	</div>

</body>
</html>