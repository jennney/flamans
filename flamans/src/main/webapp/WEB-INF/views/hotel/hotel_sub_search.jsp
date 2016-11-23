<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	.hotel_sub_search { border: 2px solid black;}

</style>
</head>
<body>

	<table border="0" class="hotel_sub_search" cellspacing="0" width="150">
		<tr>
			<th colspan="5">호텔등급</th>
		</tr>
		
		<tr>
			<td><img alt="등급1" src="img/1.jpg" width="50" height="50"></td>
			<td><img alt="등급2" src="img/2.jpg" width="50" height="50"></td>
			<td><img alt="등급3" src="img/3.jpg" width="50" height="50"></td>
			<td><img alt="등급4" src="img/4.jpg" width="50" height="50"></td>
			<td><img alt="등급4" src="img/5.jpg" width="50" height="50"></td>
		</tr>
		
		<tr>
			<td colspan="5"><hr></td>
		</tr>
		
		<tr>
			<th colspan="5">호텔평점</th>
		</tr>
		
		<tr>
			<td><img alt="평점1" src="img/1.jpg" width="50" height="50"></td>
			<td><img alt="평점2" src="img/2.jpg" width="50" height="50"></td>
			<td><img alt="평점3" src="img/3.jpg" width="50" height="50"></td>
			<td><img alt="평점4" src="img/4.jpg" width="50" height="50"></td>
			<td><img alt="평점5" src="img/5.jpg" width="50" height="50"></td>
		</tr>
		
		<tr>
			<td colspan="5"><hr></td>
		</tr>
		
		<tr>
			<th colspan="5">요금</th>
		</tr>
		
		<tr>
			<td colspan="5" align="center">현재요금 표시(센터)</td>
		</tr>
		
		<tr>
			<td colspan="5" align="center">[최저요금] [최고요금]</td>
		</tr>
		
		<tr>
			<td colspan="5" align="center"><input type="range" name="fee_hotel" min="50000" max="400000"></td>
		</tr>
		
		<tr>
			<td colspan="5"><hr></td>
		</tr>
		
		<tr>
			<td colspan="5" align="center"><input type="checkbox" name="available_hotel">예약가능 호텔만</td>
		</tr>
		
		<tr>
			<td colspan="5" align="center"><input type="checkbox" name="event_hotel">특가상품보기</td>
		</tr>
		
		<tr>
			<td colspan="5"><hr></td>
		</tr>
		
		<tr>
			<th colspan="5" align="center">거리</th>
		</tr>
		
		<tr>
			<td colspan="5" align="center">현재거리 표시</td>
		</tr>
		
		<tr>
			<td colspan="5" align="center">[최저거리] [최고거리]</td>
		</tr>
		
		<tr>
			<td colspan="5" align="center"><input type="range" name="distance_hotel" min="1" max="50"></td>
		</tr>
		
		<tr>
			<td colspan="5"><hr></td>
		</tr>
		
		<tr>
			<th colspan="5" align="center">TOP 옵션</th>
		</tr>
		
		<tr>
			<td><img alt="옵션1" src="img/1.jpg" width="50" height="50"></td>
			<td><img alt="옵션2" src="img/2.jpg" width="50" height="50"></td>
			<td><img alt="옵션3" src="img/3.jpg" width="50" height="50"></td>
			<td><img alt="옵션4" src="img/4.jpg" width="50" height="50"></td>
			<td><img alt="옵션5" src="img/5.jpg" width="50" height="50"></td>
		</tr>
		
		<tr>
			<th colspan="5" align="center"><hr></th>
		</tr>
		
		<tr>
			<td colspan="5" align="center"><input type="button" value="모든 검색 초기화"></td>
		</tr>
		
	</table>
</body>
</html>