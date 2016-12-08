<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Information</title>
<script type="text/javascript" src="/flamans/js/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
function readLevel(result){
	/* var level=document.getElementById('level');
	var result=level.value; */
	alert(result);
	result=result
	alert(result);
	level.value=result;
}
function closeDoc(){
	if('${what}'=='reBbook'){
		window.self.close();	
	}else if('${what}'=='Bbook'){
		window.self.close();	
	}
}

function selDoctor(hos_num, doc_num){
	if('${what}'=='reBbook'){
		var address='BbookreWrite.do?doc_num='+doc_num+'&bookingnum='+'${bookingnum}';
		opener.location.href=address;
		window.self.close();	

	}
	else if('${what}'=='Bbook'){
		var addr='bBook.do?hos_num='+hos_num+'&doc_num='+doc_num;
		opener.location.href=addr;
		window.self.close();	
	}
}
</script>
<style>
#docimg{
	float: left;
	width:200px;
	height: 200px;
	padding-right: 10px;
}

</style>
</head>
<body>
<c:set var="docInfo" value="${dto}"/>
<fieldset>
	<div><h3 style="text-align: center;">${docInfo.doc_name }</h3><br>
		<img src="${docInfo.doc_img}" id="docimg"><br>
		<span id="level">${docInfo.doc_level }</span>
	</div>
</fieldset><br>
<fieldset>
	<legend>의사 경력</legend>${docInfo.doc_career }
</fieldset><br>
<fieldset>
	<legend>메모</legend>${docInfo.doc_etc }
</fieldset>	
<form>
	<div style="text-align: center;">
		<input type="hidden" value="${docInfo.hos_num}">
		<input type="hidden" value="${docInfo.doc_num}">
		<button type="button" class="btn btn-default" onclick="closeDoc()">닫기</button>
		<button type="submit" class="btn btn-default" onclick="selDoctor('${docInfo.hos_num}', '${docInfo.doc_num}')">선택</button>
	</div>
</form>
</body>
</html>