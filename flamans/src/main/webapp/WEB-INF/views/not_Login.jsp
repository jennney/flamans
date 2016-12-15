<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${empty sessionScope.userid and empty sessionScope.savecoId}">
	<script>
		window.alert('로그인 후 이용하세요.');
		location.href='index.do';
	</script>
</c:if>

