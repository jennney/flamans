<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<body>
<%@ include file="/WEB-INF/views/header.jsp"%>
<div class="page-header">
    <div class="overlay">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>Event</h1>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container" align="center">
<table>
   <c:if test="${empty list}">
      <tr>
         <td colspan="4" align="center">
            등록된 게시글이 없습니다.
         </td>
      </tr>
   </c:if>
   <c:forEach var="dto" items="${list}">
   <c:url var="contentURL" value="event_user_Content.do">
   <c:param name="e_idx">${dto.e_idx}</c:param>
   </c:url>
      <tr>         
         <td colspan="4" style="padding-bottom: 15px;"><font size="5">${dto.e_subject}</font></td>
      <tr>
         <td>이벤트 기간 : </td>
         <td>${dto.e_start} ~ ${dto.e_end}</td>
         <td>등록 날짜 : </td>
         <td>${dto.e_date}</td>
      </tr>
      <tr>
         <td colspan="4"><a href="event_user_content1.do?e_idx=${dto.e_idx}"><img src="img/${dto.e_img}" width="800px" height="400px"></a></td>
      </tr>
   </c:forEach>
   <tr>
      <td colspan="4" align="center">
      <ul class="pagination">
         <li>${pageStr }   </li>
      </ul>      
      </td>
   </tr>
</table>   
</div>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>