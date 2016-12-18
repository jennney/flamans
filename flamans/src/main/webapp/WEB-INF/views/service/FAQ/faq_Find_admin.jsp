<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#title1{
	color: red;
	font-size: 50px;
}
#title2{
	color: black;
	font-size: 50px;
}
</style>
</head>
<body>
<div id="wrapper">
<%@ include file="/WEB-INF/views/myIndex.jsp"%>
	<div id="page-wrapper">
	<span id="title1">"${findValue}"</span> <span id="title2">에 대해 총 ${count}건의 FAQ가 검색되었습니다.</span>
		<div class="panel panel-default" id="a">
        <div class="panel-heading">
        	<h3>검색된 질문</h3>
        </div>
        <div class="panel-body">
        	<c:if test="${empty list}">
			등록된 글이 없습니다.
			</c:if>
	        <div class="panel-group" id="accordion">
	        <c:forEach var="list" items="${list}">
	            <div class="panel panel-default">
	                <div class="panel-heading">
	                    <h4 class="panel-title">
	                    	<a data-toggle="collapse" data-parent="#accordion" href="${shap}${list.faq_idx}" class="collapsed">${list.faq_subject}</a>
	                    </h4>
	                </div>
	                <div id="${list.faq_idx}" class="panel-collapse collapse" style="height: 0px;">
	                    <div class="panel-body">
	                    	${list.faq_content}
	                    </div>
	                </div>
	            </div>
	        </c:forEach>
	        </div>
    	</div>
    	</div>
    </div>
</div>
</body>
</html>