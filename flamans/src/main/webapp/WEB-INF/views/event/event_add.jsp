<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">  
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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

</script>
</head>
<body>
<fieldset>
	<legend>이벤트 등록하기</legend>
	
		<form name="event_add" action="event_add.do">
		<table>
	      		<tr>
					<th>제목</th>
					<td><input type="text" name="e_subject" placeholder="SUBJECT"></td>
				
				</tr>
				<tr>
					<th>시작일</th>
					<td><input type="text" id="datepicker" name="calender" class="btn btn-default" placeholder="이벤트 시작일" ></td>
					<th>종료일</th>
					<td><input type="text" id="datepicker" name="calender" class="btn btn-default" placeholder="이벤트 종료일" ></td>
				
				
				</tr>
				<tr>
					<th>이미지</th>
					
				</tr>
		</table>
		<table>
				<tr>
					<td colspan="3"><input type="submit" value="등록">
					  <input type="reset" value="다시작성">
					</td>
					<td><a href="event_list.do"><input type="button" value="목록"></a></td>
				</tr>
		</table>
	</form>
</fieldset>
</body>
</html>