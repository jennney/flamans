<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style>
			.hotel_main_search ul li { list-style-type: none; text-align: center;}

            .hotel_list {width: 700px; border:2px solid black; margin: 0px auto;}
            .hotel_list ul {clear: left; margin: 0px; padding: 0px; list-style-type: none;}
            .hotel_list li {list-style-type: none;}
            /* list-style-type 블릿표시 padding: 0; 들여쓰기*/
            
            .hotel_list .subject {font-weight: bold;text-align: center;}
            .hotel_list ul li {text-align: center; float: left; margin: 0px; padding: 2px, 1px; list-style-type: none;}
            .hotel_info1{ width: 500px; }
            .wishlist{ width: 50px; }
            
            
            .hotel_list ul .col {width: 99px;} /* 표 라인 맞추기기 위해*/
</style>

<meta charset="UTF-8">
<title>[name] 호텔 리스트</title>
</head>
<body>

	<div align="center" style="border: 7px solid maroon; height: 2100px;">

		<%@ include file="headertest.jsp" %>
		
		<table style="margin: 0px auto;">
			<tr>
				<td align="center"><h2>검색된 호텔 리스트</h2></td>
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
					<li> ---- 검색된 호텔이 없습니다 ---- </li>
				</c:if>

				<c:forEach var="hotel_info" items="${hotel_info }">
				
					<c:url var="hotelinfoUrl" value="hotel_get_info.do">
 								<c:param name="hot_num">${hotel_info.hot_num }</c:param>
					</c:url>
		
					<a href="${hotelinfoUrl}">
					
						<div class="hotel_list">
						
							<div><h2>${hotel_info.hot_name}</h2></div>
							
							<ul>
								<li><img alt="호텔사진영역" src="${hotel_info.hot_img}" width="200" height="200"></li>
								<li class="hotel_info1">${hotel_info.hot_content}</li>
								<li class="wishlist"><input type="button" value="♥" onclick=""></li>
								<li><input type="button" value="예약" onclick=""></li>
							</ul>
							
							<ul></ul>
						
						</div>
						<br/>
						
					</a>
					
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>