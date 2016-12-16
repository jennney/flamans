<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
#hospital{
	width: 700px;
	margin: 0px auto;
	border-spacing: 0px;
}
#th1,#th2,#th3{
	border-top: 2px solid #BDBDBD;
	border-bottom: 2px solid #BDBDBD;
	height: 30px;
	text-align: center;
}
#td1,#td2,#td3{
	text-align: center;
	border-bottom: 2px solid #BDBDBD;
	height: 30px;
}
</style>
<script type="text/javascript">
function click(name,num){
	opener.document.getElementById("hos_num").value=num;
	opener.document.getElementById("hos_span").innerHTML=name;
	window.close();
}

</script>
<body>
<form name="search" action="search_hos.do" method="post">
<input type="text" name="name">
<input type="hidden" name="kind" value="${kind}">
<input type="submit" value="검색">
</form>
<table id="hospital">
	<tr>
		<th id="th1">병원</th>
		<th id="th2">주소</th>
		<th id="th3">선택</th>
	</tr>
	<c:if test="${empty hos_list}">
		<tr>
			<td colspan="3" align="center">검색된 병원이 없습니다.</td>
		</tr>
	</c:if>
	<c:forEach var="hos_list" items="${hos_list}">
	<tr>
		<td id="td1">${hos_list.hos_name}</td>
		<td id="td2">${hos_list.hos_addr}</td>
		<td id="td3"><a href="javascript:click('${hos_list.hos_name}','${hos_list.hos_num}')">선택</a></td>
	</tr>
	</c:forEach>
</table>
</body>
</html>