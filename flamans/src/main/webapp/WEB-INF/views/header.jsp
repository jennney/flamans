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
/**드롭다운*/
.dropbtn {
    background-color: grey;
    color: white;
    padding: 10px;
    font-size: 14px;
    width:150px;
    heigth: 80px;    
    border: none;
    cursor: pointer;
}

.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown-content a:hover {background-color: #f1f1f1}

.dropdown:hover .dropdown-content {
    display: block;
}

.dropdown:hover .dropbtn {
    background-color: grey;
}
#pp:LINK{
	color:black;
	text-decoration:none;
	font-size: 15px;
}

#pp:VISITED{
	color:black;
	text-decoration:none;
	font-size: 15px;
}
#pp:hover{
	color: black;
   	text-decoration: none;
   	font-size: 15px;
}
</style>
</head>
<body>
<div class="row">
  <div class="col-sm-5"></div>
  <div class="col-sm-3">
  	<img alt="logo" src="/flamanz/img/flawoong.gif" width="50%" height="30px">
  </div> 
  <div class="col-sm-2"></div>
  <div class="col-sm-2" >
	<img alt="heart" src="#">
	
	<div class="dropdown">	
		<button class="dropbtn">내 계정</button> 
		  <div class="dropdown-content">
		  	<c:if test="${empty sessionScope.username }">
		  		<c:if test="${empty sessionScope.cm_name }">
				    <a href="member_login.do" id="pp">로그인하기</a>
				    <a href="member_join.do" id="pp">회원가입하기</a>
				</c:if>
		    </c:if>
		    
		    <c:if test="${!empty sessionScope.username }">
				<a href="#">프로필</a>
				<a href="logout.do">로그아웃</a>
			</c:if>
			
			<c:if test="${!empty sessionScope.cm_name }">
				<a href="#">관리자계정</a>
				<a href="logout.do">로그아웃</a>
			</c:if>
		  </div>	  
		</div>
			
	</div>
</div>


<hr>
</body>
</html>