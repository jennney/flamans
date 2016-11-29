<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/flamans/js/jquery-3.1.1.min.js"></script>
<script>


</script>
<style>
#b{
   width:840px;
   height:300px;
   margin-top: 30px;
   	border-color: green;
}

 #c{ 
   float:left;   
   width:400px;
   height:300px;
   margin:0px center;
   
   border-top: 5px double blue;
   border-bottom : 2px solid blue;
   border-left: 2px solid blue;
   boder-right: 2px solid blue;
  
}

#d{
   	width:400px;
   	height:300px;
   	float: left;
   	margin-left:15px;
   	margin-right:15px;
   
    border-right : 2px solid red;
   	border-top: 5px double red;
   	border-bottom : 2px solid red;
  	border-left: 2px solid red;
}

label{
	float: left;
	width: 80px;
}
#pp:LINK{
	color:black;
	text-decoration:none;
	font-size: 10px;
}

#pp:VISITED{
	color:black;
	text-decoration:none;
	font-size: 10px;
}
#pp:hover{
	color: #ffd700;
   	text-decoration: underline;
   	font-size: 10px;
}
</style>
</head>
<body>
<div id="b" >
	<div class="container" id="c">
		<p>병원관계자 로그인</p><br>
	  	<c:set var="saveBid" value="${cookie.saveBid.value}"></c:set>
	  	<form class="form-inline" action="company_Blogin.do" method="post">
	      <label for="id">id:</label>
	      <input type="text" class="form-control" name="B_id" placeholder="Enter ID" value="${saveBid }"><br>
	      <label for="pwd">Password:</label>
	      <input type="password" class="form-control" name="B_pwd" placeholder="Enter password"><br>
	      <label for="number1">사업자번호:</label>
	      <input type="text" class="form-control" size="3" name="b_number1">-
	      <input type="text" class="form-control" size="3" name="b_number2">-
	      <input type="text" class="form-control" size="4"name="b_number3"><br><br><br>
	      <input type="checkbox" name="saveBid" value="on" ${empty saveBid?'':'checked'}> Remember me
	    <button type="submit" class="btn btn-default" style="float: right;">Submit</button><br><br>
	    &nbsp;&nbsp;▶<a href="#" id="pp">&nbsp;아이디를 잊으셨나요?</a><br>
	    &nbsp;&nbsp;▶<a href="#" id="pp">&nbsp;비밀번호를 잊으셨나요?</a>
	  </form>
	</div>
	<div class="container" id="d">
	  <p>호텔관계자 로그인</p><br>
	  <c:set var="saveHid" value="${cookie.saveHid.value}"></c:set>
	  <form class="form-inline" action="company_Hlogin.do" method="post">
	      <label for="id">id:</label>
	      <input type="text" class="form-control" name="H_id" placeholder="Enter ID" value="${saveHid }"><br>
	      <label for="pwd">Password:</label>
	      <input type="password" class="form-control" name="H_pwd" placeholder="Enter password"><br>
	      <label for="number2">사업자번호:</label>
	      <input type="text" class="form-control" size="3" name="h_number1">-
	      <input type="text" class="form-control" size="3" name="h_number2">-
	      <input type="text" class="form-control" size="4" name="h_number3"><br><br><br>
	      <input type="checkbox" name="saveHid" value="on" ${empty saveHid?'':'checked'}> Remember me
	    <button type="submit" class="btn btn-default" style="float: right;">Submit</button><br><br>
	    &nbsp;&nbsp;▶<a href="#" id="pp">&nbsp;아이디를 잊으셨나요?</a><br>
	    &nbsp;&nbsp;▶<a href="#" id="pp">&nbsp;비밀번호를 잊으셨나요?</a>
	  </form>
	</div>
</div>
</body>
</html>