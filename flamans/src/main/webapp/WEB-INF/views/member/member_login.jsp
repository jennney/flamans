<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
#b{
   width:730px;
   height:300px;
   margin-top: 30px;
   	border-color: green;
   	margin: auto;
}

 #c{ 
   float:left;   
   width:350px;
   height:300px;
   margin:0px center;
   
   border-top: 5px solid grey;
   border-bottom : 2px solid grey;
   border-left: 2px solid grey;
   boder-right: 2px solid grey;
  
}

#d{
   	width:350px;
   	height:300px;
   	float: left;
   	margin-left:15px;
   	margin-right:15px;
   
    border-right : 2px solid grey;
   	border-top: 5px solid grey;
   	border-bottom : 2px solid grey;
  	border-left: 2px solid grey;
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
<%@ include file="/WEB-INF/views/header.jsp"%>
</head>
<body>
<div class="container">
<div id="b" >
	<div id="c">
	<div style="padding-left: 8px;">
	<h2>개인 회원 로그인</h2><br>
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
	<div class="container" id="d">	  
	  <h2>기업회원 로그인</h2><br>
	  <c:set var="saveid" value="${cookie.savecoId.value}"></c:set>
	  <form class="form-inline" action="company_login.do" method="post">
	      <label for="id">id:</label>
	      <input type="text" class="form-control" name="cm_id" placeholder="Enter ID" value="${savecoId}"><br>
	      <label for="pwd">Password:</label>
	      <input type="password" class="form-control" name="cm_pwd" placeholder="Enter password"><br><br>
	      <input type="checkbox" name="savecoId" value="on" ${empty savecoId?'':'checked'}> Remember me
	    <button type="submit" class="btn btn-default" style="float: right;">Submit</button><br><br>
	    &nbsp;&nbsp;▶<a href="member_find_id.do" id="pp">&nbsp;아이디를 잊으셨나요?</a><br>
	    &nbsp;&nbsp;▶<a href="member_find_pwd.do" id="pp">&nbsp;비밀번호를 잊으셨나요?</a>
	  </form>
	</div>
</div>
</div>
<%@ include file="/WEB-INF/views/footer.jsp"%> 
</body>
</html>