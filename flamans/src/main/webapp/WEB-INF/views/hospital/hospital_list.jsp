<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

	<style>
		.hospital_main_search ul li { list-style-type: none; text-align: center;}
		
        .hospital_list {width: 700px; border:2px solid black; margin: 0px auto;}
        .hospital_list ul {clear: left; margin: 0px; padding: 0px; list-style-type: none;}
        .hospital_list li {list-style-type: none;}
        /* list-style-type 블릿표시 padding: 0; 들여쓰기*/
        
        .hospital_list .subject {font-weight: bold; text-align: center;}
        .hospital_list ul li {text-align: center; float: left; margin: 0px; padding: 2px, 1px; list-style-type: none;}
        .hospital_info1{ width: 500px; }
        .wishlist{ width: 50px; }
        
        .hospital_list ul .col {width: 99px;} /* 표 라인 맞추기기 위해*/
	</style>


<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center" style="height: 2100px;">

		<%@ include file="../header.jsp" %>
		
		<table style="margin: 0px auto;">
			<tr>
				<td align="center"><h2>검색된 병원 리스트</h2></td>
			</tr>
			
			<tr>
				<td><%@ include file="hospital_main_search.jsp" %></td>
			</tr>
		</table>
		
		<div style="width: 1000px;">
		
			<div style="border: 5px solid teal; width: 270px; float: left; white-space:nowrap; margin:0px center;">
				<%@ include file="hospital_sub_search.jsp" %>
			</div>
			
			<div style="border: 5px solid teal;  width: 700px; float: right; margin-left: 0px auto; padding-left: 7px;">
			
				<c:if test="${empty hospital_info }">
					<li> ---- 검색된 병원이 없습니다 ---- </li>
				</c:if>
				
				<c:forEach var="hospital_info" items="${hospital_info }">
				
					<c:url var="hospitalinfoUrl" value="hospital_get_info.do">
 								<c:param name="hos_num">${hospital_info.hos_num }</c:param>
					</c:url>
					
					<c:url var="wishlistUrl" value="hos_wishlist.do">
 								<c:param name="hos_num">${hospital_info.hos_num }</c:param>
 								<c:param name="hospital_link">hospital_list.do</c:param>
					</c:url>
					
				
					<h2 align="left"><a href="${hospitalinfoUrl}">〔 ${hospital_info.hos_name} 〕</a></h2>
					
					<table>
						<tr>
							<td width="200"><img alt="병원사진영역" src="${hospital_info.hos_img}" width="200" height="200"></td>
							<td width="400" valign="top" style="padding-left: 5px;">${hospital_info.hos_content}</td>
							<td width="100" valign="top"><a href="${ wishlistUrl}"><input type="button" value="♥"></a>
							<input type="button" value="예약" onclick=""></td>
						</tr>
					</table>
				
					<hr>
					
						
					
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>