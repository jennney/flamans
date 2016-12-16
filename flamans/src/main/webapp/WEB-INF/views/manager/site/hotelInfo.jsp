<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript" src="/flamans/js/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
function show(i){
	if(i==1){
		sendRequest("permittedHotel.do", "str=H", showResult, "POST");
	}else if(i==2){
		sendRequest("unpermitHotel.do", "str=H", showResult, "POST");
	}
}
function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			
			data=eval('('+data+')');
			
			var hotelList=data.list;
			
			var msg='<table id="list_table"><tr><th id="list_th1"> 호텔 이름 </th><th id="list_th2"> 사업자 번호 </th><th id="list_th3"> E-Mail </th><th id="list_th4"> 전화 번호 </th><th id="list_th5"> 관리</th></tr>';
			
			if(hotelList.length==0){
				msg+='<tr><td colspan="5" align="center"> 검색된 호텔이 없습니다 </td></tr></table>';	
			}else{
				for(var i=0;i<hotelList.length;i++){						
					var hotel=hotelList[i];
					if(hotel.cm_permit=='0'){
						msg+='<tr><td>'+hotel.cm_name+'</td><td>'+hotel.cm_number+'</td><td>'+hotel.cm_email+'</td><td>'+hotel.cm_tel+'</td><td><a href="permitOk.do?cm_number='+hotel.cm_number+'">승인</a></td></tr>';	
					}else{
						msg+='<tr><td>'+hotel.cm_name+'</td><td>'+hotel.cm_number+'</td><td>'+hotel.cm_email+'</td><td>'+hotel.cm_tel+'</td><td><a href="companyOut.do?cm_number='+hotel.cm_number+'">삭제</a></td></tr>';
					}
				}
				msg+='</table>';
					
			}
			
			var table=document.getElementById("table");
			table.innerHTML=msg;
			
		}
	}
}
</script>
<style>
#list_table {
	width: 700px;
	margin: 0px auto;
	border-spacing: 0px;
}
#list_th1, #list_th2, #list_th3, #list_th4, #list_th5{
	border-top: 3px solid #BDBDBD;
	border-bottom: 3px solid #BDBDBD;
	height: 50px;
	text-align: center;
}

#list_th1 {
	width: 150px;
}

#list_th2 {
	width: 150px;
}

#list_th3 {
	width: 150px;
}

#list_th4 {
	width: 150px;
}

#list_th5 {
	width: 100px;
}
#list_table tr td {
	border-bottom: 1px solid #BDBDBD;
	height: 40px;
	text-align: center;
}
h3{
	text-align: center;
}
h2 {
	text-align: center;
}
</style>
</head>
<body onload="show(1);">
<div id="wrapper">
<%@ include file="/WEB-INF/views/myIndex.jsp"%>
	<div id="page-wrapper">
		<h2>호텔 관리 하기</h2>
		<h3>
			<input type="button" value="승인된 호텔" onclick="show(1);" class="btn btn-default">
			<input type="button" value="신청한 호텔" onclick="show(2);" class="btn btn-default">
		</h3>
		<br><br>
		<div id="table"></div>
	</div>
</div>
</body>
</html>