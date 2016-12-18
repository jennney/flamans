<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<style>

#event_con{
	width: 700px;
	margin: 0px auto;
	border-spacing: 0px;
}
#event_conth1,#event_contd1{
	border-top: 3px solid #BDBDBD;
	border-bottom: 3px solid #BDBDBD;
	height: 30px;
	text-align: center;
}   
#event_conth2,#event_contd2{
	border-bottom: 3px solid #BDBDBD;
	height: 30px;
	text-align: center;
}
#event_conth1,#event_conth2{
	width: 200px;
	
	text-align: center;
}
#event_contd1,#event_contd2{
	width: 500px;
	
	text-align: left;
}

h2{
	text-align: center;
}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function pagePrint(target){
	
	var originalContent = document.body.innerHTML;
	var targetContent = document.getElementById(target).innerHTML;
	
	document.body.innerHTML = targetContent; 
	
	window.print();
	
	document.body.innerHTML = originalContent;
}
</script>
</head>
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
	<c:set var="dto" value="${list}"/>
	
	
	<table width="450"  cellspacing="0" id="event_con">
		<tr>
			<th id="event_conth1">번호</th>
			<td id="event_contd1">${dto.e_idx}</td>
			<th id="event_conth1">글쓴이</th>
			<td id="event_contd1">${dto.e_name}</td>
		</tr>
		<tr>
			<th id="event_conth2">조회수</th>
			<td id="event_contd2">${dto.e_readnum}</td>
			<th id="event_conth2">작성날짜</th>
			<td id="event_contd2">${dto.e_date}</td>
		</tr>
		<tr>
			<th id="evnet_conth1" style="padding-left: 45px;" height="30px;">제목</th>
			<td colspan="1" align="left" id="evnet_contd1">
			${dto.e_subject}
			</td>
		</tr>
		<tr>
			<th id="event_conth1">이벤트 기간</th>
			<td colspan="3" align="left" id="event_contd1">
			${dto.e_start} ~ ${dto.e_end}
			</td>
		</tr>
		<tr>
		</tr>
		<tr>
			<td colspan="4">
				<div id="div_target"><img src="img/${dto.e_img }"></div>
			</td>
		</tr>
		
		<tr>
			<td colspan="3" align="center">
				<a href="event_user_list2.do?e_item=2"><input type="button" value="목록"></a>
			</td>
			<td><input type="button" value="프린트" onclick="pagePrint('div_target')"></td>
		</tr>
</table>
</div>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>