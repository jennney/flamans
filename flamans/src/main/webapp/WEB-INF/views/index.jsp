<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/header.jsp"%>
</head>
<body>
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