<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="wrapper">
<%@ include file="/WEB-INF/views/myIndex.jsp"%>
<div id="page-wrapper">
<h2>호텔 예약 정보</h2>
    <table>
       <tr>
       <th>호텔 명</th>
       <th>예약 날짜</th>
       <th>체크인</th>
       <th>체크아웃</th>
       <th>예약여부</th>
    </tr>
      <c:if test="${empty mdto}">
    <tr>
       <td colspan="5" align="center">예약 사항이 없습니다.</td>
    </tr>
   </c:if>
   
   <c:forEach var="mdto" items="${mdto}">
    <tr>
       <td>${mdto.hot_num}</td>
       <td>${mdto.bookingdate}</td>
       <td>${mdto.checkin}</td>
       <td>${mdto.checkout}</td>
        <td>
           <c:choose>
                <c:when test="${mdto.permit >0}">
                   <h4 style="color: red;">예약 확정</h4>
                 </c:when>
             <c:otherwise>
                <h4 style="color: blue;">예약 대기 </h4>
             </c:otherwise>
          </c:choose>
       </td>
    </tr>  
    </c:forEach>
 </table>
      
	<h2>병원 예약 정보</h2>
       <table>
               <tr>
               <th>병원 명</th>
               <th>예약 날짜</th>
               <th>예약여부</th>
            </tr>
              <c:if test="${empty bdto}">
            <tr>
               <td colspan="5" align="center">예약 사항이 없습니다.</td>
            </tr>
           </c:if>
           
           <c:forEach var="bdto" items="${bdto}">
            <tr>
               <td>${bdto.hos_num}</td>
               <td>${bdto.bookingdate}</td>
               <td>
                   <c:choose>
                        <c:when test="${bdto.permit >0}">
                           <h4 style="color: red;">예약 확정</h4>
                         </c:when>
                     <c:otherwise>
                        <h4 style="color: blue;">예약 대기 </h4>
                     </c:otherwise>
                  </c:choose>
               </td>
            </tr>  
            </c:forEach>
         </table>

</div>        
</div>
</body>
</html>