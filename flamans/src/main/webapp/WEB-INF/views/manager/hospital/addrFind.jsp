<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
<script>
function addrAdd(){
	var addr_num=document.getElementById("addr_num").value;
	var addr1=document.getElementById("addr1").value;
	var addr2=document.getElementById("addr2").value;
	var addr=addr1+addr2;
	opener.hospitalInfo.hos_addr.value=addr;
	window.self.close();
	
}
</script>
<style>
#addr_num, #addr1, #addr2, #addr3{
	padding: 12px 15px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 6px;
    box-sizing: border-box;
    
}
input[type=text]:focus{
	 border: 1px solid skyblue;
}
#addr_num{
	width: 50%;
}
#addr1, #addr2,#addr3{
	width: 100%;
}
body{
	background-color : #f2f2f2;
}
h2{
	text-align: center;
}
#bt1{
	text-align: center;
}
#postcodify_search_button,#bt1 input {
    background-color: white;
    border: 1px solid #ccc;
    border-radius: 6px;
    color: black;
    padding: 8px 15px;
    text-align: center;
    display: inline-block;
    font-size: 14px;
    margin: 8px 0;
    
}
#postcodify_search_button:hover{
	background-color: #f2f2f2;
    color: black;
}
#bt1 input{
	background-color: #f2f2f2;
    color: black;
}
</style>
</head>
<body>
<h2>주소 검색</h2>
<input type="text" name="addr_num" id="addr_num" class="postcodify_postcode5" value="" readonly />
<button id="postcodify_search_button">검색</button><br />
<input type="text" name="addr1" id="addr1" class="postcodify_address" value="" readonly /><br />
<input type="text" name="addr2" id="addr2" class="postcodify_details" value="" /><br />
<input type="text" name="addr3" id="addr3" class="postcodify_extra_info" value="" readonly /><br />
<div id="bt1"><input type="button" value="입력완료" onclick="addrAdd()"></div>
</body>
</html>