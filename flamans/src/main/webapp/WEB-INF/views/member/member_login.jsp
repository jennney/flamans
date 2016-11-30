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
<style>
#b{
   width:730px;
   height:300px;
   margin-top: 30px;
   	border-color: green;
}

 #c{ 
   float:left;   
   width:350px;
   height:300px;
   margin:0px center;
   
   border-top: 5px double blue;
   border-bottom : 2px solid blue;
   border-left: 2px solid blue;
   boder-right: 2px solid blue;
  
}

#d{
   	width:350px;
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
	<div id="c">
	<p>로그인을 해주세요</p><br>
	  <c:set var="saveid" value="${cookie.saveid.value}"></c:set>
	  <form class="form-inline" action="member_login1.do" method="post">
	      <label for="id">id:</label>
	      <input type="text" class="form-control" name="cm_id" placeholder="Enter ID" value="${saveid }"><br>
	      <label for="pwd">Password:</label>
	      <input type="password" class="form-control" name="cm_pwd" placeholder="Enter password"><br><br>
	      <input type="checkbox" name="saveid" value="on" ${empty saveid?'':'checked'}> Remember me
	    <button type="submit" class="btn btn-default" style="float: right;">Submit</button><br><br>
	    &nbsp;&nbsp;▶<a href="member_find_id.do" id="pp">&nbsp;아이디를 잊으셨나요?</a><br>
	    &nbsp;&nbsp;▶<a href="member_find_pwd.do" id="pp">&nbsp;비밀번호를 잊으셨나요?</a>
	  </form>
	</div>
	<div class="container" id="d">
	  <p>로그인을 해주세요</p><br>
	  <c:set var="saveid" value="${cookie.saveid.value}"></c:set>
	  <form class="form-inline" action="member_login.do" method="post">
	      <label for="id">id:</label>
	      <input type="text" class="form-control" name="m_id" placeholder="Enter ID" value="${saveid }"><br>
	      <label for="pwd">Password:</label>
	      <input type="password" class="form-control" name="m_pwd" placeholder="Enter password"><br><br>
	      <input type="checkbox" name="saveid" value="on" ${empty saveid?'':'checked'}> Remember me
	    <button type="submit" class="btn btn-default" style="float: right;">Submit</button><br><br>
	    &nbsp;&nbsp;▶<a href="member_find_id.do" id="pp">&nbsp;아이디를 잊으셨나요?</a><br>
	    &nbsp;&nbsp;▶<a href="member_find_pwd.do" id="pp">&nbsp;비밀번호를 잊으셨나요?</a>
	  </form>
	</div>
</div> 
</body>
</html>