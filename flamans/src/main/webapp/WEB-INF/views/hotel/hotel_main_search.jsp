<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[name] 호텔 리스트</title>
</head>
<body>
	
	<form name="hotel_main_search" action="hotel_search_name.do">
		
		<table>
				<tr>
					<td align="center"><input type="text" name="hotel_name" size="84">
					<input type="submit" value="검색"></td>
				</tr>
		
				<tr>
					<td><a href="#"><img src="img/checkin.jpg" width="200" height="30"></a>    <a href="#"><img src="img/checkout.jpg" width="200" height="30"></a>    <a href="#"><img src="img/checkroom.jpg" width="200" height="30"></a></td>
				</tr>
		</table>
		
	</form>
	
</body>
</html>