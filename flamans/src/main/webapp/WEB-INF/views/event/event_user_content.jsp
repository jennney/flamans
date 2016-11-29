<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function print(){
		 var divToPrint = document.getElementById('imgPrint');
		 var newWin = window.open();
		 newWin.document.write(imgPrint.innerHTML);
		 newWin.print();
		 newWin.close();
	}
</script>
</head>
<body>
	<c:set var="dto" value="${list}"/>
	
	<h2>본문 보기</h2>
	<table width="450" border="1" cellspacing="0">
		<tr>
			<th>번호</th>
			<td>${dto.e_idx}</td>
			<th>글쓴이</th>
			<td>${dto.e_name}</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${dto.e_readnum}</td>
			<th>작성날짜</th>
			<td>${dto.e_date}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3" align="left">
			${dto.e_subject}
			</td>
		</tr>
		<tr>
			<th>이벤트 기간</th>
			<td colspan="3" align="left">
			${dto.e_start} ~ ${dto.e_end}
			</td>
		</tr>
		<div id="imgPrint">
		<tr>
			<td colspan="4">
			<img src="img/${dto.e_img }"></td>
		</tr>
		</div>
		<tr>
			<td colspan="3" align="center">
				<a href="event_user_startlist.do"><input type="button" value="목록"></a>
			</td>
			<td><input type="button" value="프린터" onclick="window.print()"></td>
		</tr>
</table>

</body>
</html>