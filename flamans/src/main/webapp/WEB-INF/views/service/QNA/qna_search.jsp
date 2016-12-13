<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function hide(kind){
	document.getElementById("hotel").style.display="none";
	document.getElementById("hospital").style.display="none";
	if(kind=='hospital'){
		document.getElementById("hospital").style.display="block";
	}else if(kind=='hotel'){
		document.getElementById("hotel").style.display="block";	
	}
}
function click(name,num){
	opener.document.getElementById("hos_num").value=num;
	opener.document.getElementById("hos_span").innerHTML=name;
	window.close();

}
</script>
</head>
<body onload="hide('${kind}')">
<form name="search" action="search.do" method="post">
<input type="text" name="name">
<input type="hidden" name="kind" value="${kind}">
<input type="submit" value="검색">
</form>
<table id="hotel">
	<tr>
		<th>호텔</th>
		<th>주소</th>
		<th>선택</th>
	</tr>
	<c:if test="${empty hot_list}">
		<tr>
			<th>검색된 호텔이 없습니다.</th>
		</tr>
	</c:if>
	<c:forEach var="hot_list" items="${hot_list}">
	<tr>
		<td>${hot_list.hot_name}</td>
		<td>${hot_list.hot_addr}</td>
		<td><a href="javascript:click('${hot_list.hot_name}','${hot_list.hot_num}')">선택</a></td>
	</tr>
	</c:forEach>
</table>
<table id="hospital">
	<tr>
		<th>병원</th>
		<th>주소</th>
		<th>선택</th>
	</tr>
	<c:if test="${empty hos_list}">
		<tr>
			<th>검색된 병원이 없습니다.</th>
		</tr>
	</c:if>
	<c:forEach var="hos_list" items="${hos_list}">
	<tr>
		<td>${hos_list.hos_name}</td>
		<td>${hos_list.hos_addr}</td>
		<td><a href="javascript:click('${hos_list.hos_name}','${hos_list.hos_num}')">선택</a></td>
	</tr>
	</c:forEach>
</table>
</body>
</html>