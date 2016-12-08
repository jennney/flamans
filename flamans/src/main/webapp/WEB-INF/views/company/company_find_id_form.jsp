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
label{
	float: left;
	width: 80px;
}
.container{
 	width:500px;
  	height:300px;
  	margin-top: 30px;
   	border-color: green;
}
</style>
</head>
<body>
<div class="container" >
	  <h3>ID 찾기</h3><br><br>
	  <form class="form-inline" name="id" action="company_find_id.do" method="post">
	      <label for="Name">Name:</label>
	      <input type="text" class="form-control" name="cm_name" placeholder="Enter Name"><br>
	      <label for="Email">Email:</label>
	      <input type="text" class="form-control" name="cm_email" placeholder="Enter Email"><br><br>
	    <button type="submit" class="btn btn-default" style="float: right;">Submit</button><br><br>
	  </form>
</div>
</body>
</html>
