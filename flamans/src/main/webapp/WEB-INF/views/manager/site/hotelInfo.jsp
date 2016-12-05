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
			
			var msg='<table border="1" cellspacing="0" width="600"><tr><th> 호텔 이름 </th><th> 사업자 번호 </th><th> E-Mail </th><th> 전화 번호 </th><th> 관리</th></tr>';
			
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
</head>
<body>
<h2>호텔 관리 하기</h2>
<input type="button" value="승인된 호텔" onclick="show(1);">
<input type="button" value="신청한 호텔" onclick="show(2);">
<br><br>
<div id="table"></div>
</body>
</html>