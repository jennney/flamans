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
	width: 180px;
}
</style>
</head>
<body>
<div class="container">
 
  <c:set var="content" value="${dto}"/>
  <div class="well well-lg" style="width:500px; height:300px;">
   <h3>ID 찾기</h3><br>
	  <h4>${dto.m_name }님의 ID는<br><br>
	  <label></label>${dto.m_id }&nbsp;&nbsp;입니다.</h4><br><br>
	   &nbsp;&nbsp;▶<a href="member_find_pwd.do" id="pp">&nbsp;비밀번호를 잊으셨나요?</a>
   </div>
</div>
</body>
</html>