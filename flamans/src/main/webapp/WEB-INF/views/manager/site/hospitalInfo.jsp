<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script>
function show(i){
	if(i==1){
		sendRequest('permittedHospital.do', 'str=B', showResult, 'POST');
	}else if(i==2){
		sendRequest('unpermitHospital.do', 'str=B', showResult, 'POST');
	}
}
function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			
			data=eval('('+data+')');
			
			var hospitalList=data.list;
			
			var msg='<table border="1" cellspacing="0" width="600"><tr><th> 병원 이름 </th><th> 사업자 번호 </th><th> E-Mail </th><th> 전화 번호 </th><th> 관리</th></tr>';
			
			if(hospitalList.length==0){
				msg+='<tr><td colspan="5" align="center"> 검색된 병원이 없습니다 </td></tr></table>';	
			}else{
				for(var i=0;i<hospitalList.length;i++){						
					var hospital=hospitalList[i];
					if(hospital.cm_permit=='0'){
						msg+='<tr><td>'+hospital.cm_name+'</td><td>'+hospital.cm_number+'</td><td>'+hospital.cm_email+'</td><td>'+hospital.cm_tel+'</td><td><a href="permitOk.do?cm_number='+hospital.cm_number+'">승인</a></td></tr>';	
					}else{
						msg+='<tr><td>'+hospital.cm_name+'</td><td>'+hospital.cm_number+'</td><td>'+hospital.cm_email+'</td><td>'+hospital.cm_tel+'</td><td><a href="companyOut.do?cm_number='+hospital.cm_number+'">삭제</a></td></tr>';
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
</head>
<body>
<div id="wrapper">
<%@ include file="/WEB-INF/views/myIndex.jsp"%>
	<div id="page-wrapper">
		<h2>병원 관리 하기</h2>
		<input type="button" value="승인된 병원" onclick="show(1);">
		<input type="button" value="신청한 병원" onclick="show(2);">
		<br><br>
		<div id="table"></div>
	</div>
</div>
</body>
</html>