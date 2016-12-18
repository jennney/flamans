<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#hotel{
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
	opener.document.getElementById("hot_num").value=num;
	opener.document.getElementById("hot_span").innerHTML=name;
	window.close();

}
</script>
</head>
<body>
<div>
	<form name="search" action="search.do" method="post">
	<input type="text" name="name" class="form-control col-xs-3" style="width: 200px;">
	<button class="btn btn-default" type="submit">호텔검색<i class="fa fa-search"></i></button>
</form>
</div>
<table id="hotel">
	<tr>
		<th id="th1">호텔</th>
		<th id="th2">주소</th>
		<th id="th3">선택</th>
	</tr>
	<c:if test="${empty hot_list}">
		<tr>
			<td align="center" colspan="3">검색된 호텔이 없습니다.</td>
		</tr>
	</c:if>
	<c:forEach var="hot_list" items="${hot_list}">
	<tr>
		<td id="td1">${hot_list.hot_name}</td>
		<td id="td2">${hot_list.hot_addr}</td>
		<td id="td3"><a href="javascript:click('${hot_list.hot_name}','${hot_list.hot_num}')">선택</a></td>
	</tr>
	</c:forEach>
</table>

</body>
</html>