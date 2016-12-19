<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/flamans/js/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
function down(){
	location.href='${url}';
}
</script>
<style>
h4{
	text-align: center;
}
#imgdiv{
	width: 400px;
	height: 400px;
	margin: 10px auto;
}
#button_list{
	text-align: center;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp"%>
<section>
	<article>
	<h4>수정한 이미지 보기</h4>
	<br>
		<div id="imgdiv">
			<img alt="수정된 이미지" src="${url }">
		</div>
		<div id="button_list">
			<input type="button" value="저장" onclick="down();" class="btn btn-default">
			<a href="index.do" class="btn btn-default">돌아가기</a>
		</div>
	</article>
</section>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>