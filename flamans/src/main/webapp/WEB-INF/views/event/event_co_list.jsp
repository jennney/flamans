<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<body>
<div id="wrapper" align="center">
<%@ include file="/WEB-INF/views/myIndex.jsp"%>
	<div id="page-wrapper">
<table>
	<c:if test="${empty list}">
		<tr>
			<td colspan="4" align="center">
				등록된 게시글이 없습니다.
			</td>
		</tr>
	</c:if>
	<c:forEach var="dto" items="${list}">
	<c:url var="contentURL" value="event_hot_Content.do">
	<c:param name="e_idx">${dto.e_idx}</c:param>
	</c:url>
		
		<tr>   		
			<td colspan="4" style="padding-top: 60px;">${dto.e_subject}</td>
		<tr>
			<td>이벤트 기간 : </td>
			<td id="${dto.e_idx}"></td>
<!-- 			<script>
				var temp=document.getElementById('${dto.e_idx}')
				var temp1='${dto.e_start}';
				var temp2=temp1.split(' ');
				var temp3='${dto.e_end}';
				temp2+='~'+temp3.split(' ');
				alert(temp.innerHTML);
				alert(temp2[0]);
				temp.innerHTML=temp2[0];
			</script> -->
			<td>등록 날짜 : ${dto.e_start} ~ ${dto.e_end}</td>
			<td>${dto.e_date}</td>
			
		</tr>
		<tr>
			<td colspan="4"><a href="event_co_content.do?e_idx=${dto.e_idx}"><img src="img/img/${dto.e_img}" width="800px" height="400px"></a></td>
		</tr>
		
	</c:forEach>
	<tr>
		<td align="right" colspan="4"><input type="button" value="등록" onclick="location.href='event_add.do'"></td>
	</tr>
	<tr>
		<td colspan="4" align="center">
		<ul  class="pagination pagination-lg">
			<li>${pageStr }</li>
		</ul>
		   		
		</td>
	</tr>
	
</table>
</div>
</div>	
</body>
</html>