<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="/flamans/js/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
<script>
function addrAdd(){
	var addr_num=document.getElementById("addr_num").value;
	var addr1=document.getElementById("addr1").value;
	var addr2=document.getElementById("addr2").value;
	var addr=addr1+" "+addr2;
	opener.hotelInfo.hot_addr.value=addr;
	window.self.close();
	
}
</script>
</head>
<body>
<h2>주소 찾기 창?</h2>
<input type="text" name="addr_num" id="addr_num" class="postcodify_postcode5" value="" />
<button id="postcodify_search_button">검색</button><br />
<input type="text" name="addr1" id="addr1" class="postcodify_address" value="" /><br />
<input type="text" name="addr2" id="addr2" class="postcodify_details" value="" /><br />
<input type="text" name="addr3" id="addr3" class="postcodify_extra_info" value="" /><br />
<input type="button" value="입력완료" onclick="addrAdd()">
</body>
</html>