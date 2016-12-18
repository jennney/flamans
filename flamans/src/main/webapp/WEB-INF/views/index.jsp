<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/header.jsp"%>
</head>
<style>
#im{width:400px; height: 300px;}
</style>
<body>
<%@ include file="/WEB-INF/views/header.jsp"%>	
<section>
	<!-- <div style="text-align: center; height: 500px; ">
		<h2>Do you wanna beauty and vacation ?</h2><br><br>
		<img src="img/beauty.png" id="im">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<img src="img/hotell.png" id="im">
	</div> -->
</section>
<%@ include file="/WEB-INF/views/footer.jsp"%>	
<div class="banner">
    <div class="overlay">
        <div class="container">
            <div class="intro-text">
                <h1>Welcome To The <span>Flamans</span></h1>
                <p>Generate a flood of new business with the <br> power of a digital media platform</p>
                <a href="hospital_list.do" class="page-scroll btn btn-primary">Hospital</a>
                 <a href="hotel_list.do" class="page-scroll btn btn-primary">Hotel</a>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/footer.jsp"%>

</body>
</html>