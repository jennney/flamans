<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="js/jquery-3.1.1.min.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $("#datepicker1").datepicker({
       numberOfMonths: 1,
       dateFormat : 'yy-mm-dd',
       minDate: 0,
        closeText : '닫기',
       onSelect: function(selected) {
       	$("#datepicker2").datepicker("option","minDate", selected)
       }
       });
       $("#datepicker2").datepicker({
       numberOfMonths: 1,
       dateFormat : 'yy-mm-dd',
       minDate: 0,
        closeText : '닫기',
       onSelect: function(selected) {
      	 $("#datepicker1").datepicker("option","maxDate", selected)
       }
       });
 });
</script>
</head>
<body>

<section>
	<table>
		<tr> 
			<th>체크인</th>
			<td><input type="text" id="datepicker1"></td>
			<th>체크아웃</th>
			<td><input type="text" id="datepicker2"></td>
		</tr>
		<tr>
			<th>성인</th>
			<td>성인</td>
			<th>어린이</th>
			<td>성인</td>
		</tr>
	</table>
</section>
<%@ include file="/WEB-INF/views/footer.jsp"%>	
</body>
</html>