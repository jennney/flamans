<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script> 
$(function() {
    $( "#datepicker" ).datepicker({
         showButtonPanel: true,       
         closeText: '닫기', 
         dateFormat: "yy-mm-dd",
         changeMonth: true, 
         dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
         dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
         monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']

  });
});

$(function() {
    $( "#datepicker1" ).datepicker({
         showButtonPanel: true,       
         closeText: '닫기', 
         dateFormat: "yy-mm-dd",
         changeMonth: true, 
         dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
         dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
         monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']

  });
});

</script>
</head>
<body>
<fieldset>
	<legend>글 수정하기</legend>
	
		<form name="event_update" action="event_co_update.do" method="post" enctype="multipart/form-data">
		<c:set var="dto" value="${event_co_update}"/>
		<table width="450" border="1" cellspacing="0">
		<tr>
			<input type="hidden" name="e_idx" value="${dto.e_idx}">
			<th>글쓴이</th>
			<td><input type="text" name="e_name" value="${dto.e_name}" readonly="readonly"></td>
		</tr>
		<tr>
			
			<th>작성날짜</th>
			<td><input type="text" name="e_date" value="${dto.e_date}" readonly="readonly"> </td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3" align="left">
			<input type="text" name="e_subject" value="${dto.e_subject}">
			</td>
						
		</tr>
		<tr>
			<th>이벤트 기간</th>
			<td colspan="3" align="left">
			<input type="text"  id="datepicker" name="e_start" value="${dto.e_start}"> ~<input type="text"  id="datepicker1" name="e_end" value="${dto.e_end}">
	
			</td>
		</tr>

		<tr>
			<td colspan="4">
			<input type="file" name="uploadimg"> </td>
		</tr>
		
		<tr>
			<td colspan="4" align="center">
				<a href="event_co_list.do"><input type="button" value="목록"></a>
			<input type="submit" value="수정"></td>
		</tr>
		</table>
	</form>
</fieldset>
</body>
</html>