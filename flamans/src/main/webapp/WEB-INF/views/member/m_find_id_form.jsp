<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
label{
	float: left;
	width: 80px;
}
#kkk{
	width:1200px;
  	height:450px;
  	margin: 0px auto;
	text-align: center;
  	
}
#kk{
 	width:500px;
  	height:300px;
	margin: 100px auto;
	text-align: center;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp"%>
<div id="kkk">
	<div id="kk"  class="well well-lg">
	  <h3>ID 찾기</h3><br><br>
	  <form class="form-inline" name="id" action="member_find_id.do" method="post">
	      <label for="Name">Name:</label>
	      <input type="text" class="form-control" name="m_name" placeholder="Enter Name"><br>
	      <label for="Email">Email:</label>
	      <input type="text" class="form-control" name="m_email" placeholder="Enter Email"><br><br>
	    <button type="submit" class="btn btn-default" style="float: right;">Submit</button><br><br>
	  </form>
	 </div>
</div>	  
<%@ include file="/WEB-INF/views/footer.jsp"%> 
</body>
</html>