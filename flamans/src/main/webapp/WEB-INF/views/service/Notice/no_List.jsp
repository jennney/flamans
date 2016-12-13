<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE>
<html>
<head>

	<script src="https://cdn.socket.io/socket.io-1.3.7.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
<meta charset="UTF-8">
<title>Notice</title>
<style>
#no_list {
	width: 700px;
	margin: 0px auto;
	border-spacing: 0px;
}

#no_listth1, #no_listth2, #no_listth3, #no_listth4 {
	border-top: 3px solid #BDBDBD;
	border-bottom: 3px solid #BDBDBD;
	height: 50px;
	text-align: center;
}

#no_listth1 {
	width: 450px;
}

#no_listth2 {
	width: 100px;
}

#no_listth3 {
	width: 100px;
}

#no_listth4 {
	width: 50px;
}

#no_listtd {
	border-bottom: 1px solid #BDBDBD;
	height: 40px;
	text-align: center;
}

h2 {
	text-align: center;
}

#no_listtdd{
	height: 50px;
}
#mess > li{

list-style: none;
}

   #fo { background: #000; padding: 3px;  }
      #fo input { border: 0; padding: 10px; width: 90%; margin-right: .5%; }

</style>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script>
	function check() {
		var findValue = $(':input[name=findValue]').val();

		if (findValue == "" || findValue == null) {
			window.alert('검색어를 입력해주세요');
			return false;
		}
	}
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp"%>
<section>

<div class="center">
   <h2>공지사항</h2>
</div>

	<table id="no_list">
		<thead>
			<tr>
				<td colspan="4" align="right">
					<form name="no_find" action="no_List.do" method="post" onsubmit="return check()">
						<select name="findKey">
							<option value="all" ${findKey eq 'all'?"selected":""}>- 전체
								-</option>
							<option value="no_content" ${findKey eq 'no_content'?"selected":""}>
								내용</option>
							<option value="no_subject" ${findKey eq 'no_subject'?"selected":""}>
								제목</option>
						</select> <input type="text" name="findValue" value="${findValue}" >
						<input type="submit" value="검색">
					</form>
				</td>
			</tr>
			<tr>
				<th id="no_listth1">SUBJECT</th>
				<th id="no_listth2">WRITER</th>
				<th id="no_listth3">DATE</th>
				<th id="no_listth4">HITS</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<c:if test="${sessionScope.permit eq 3}">
					<td colspan="3" align="center" id="no_listtdd">
						<ul  class="pagination pagination-lg">
							<li>${no_page}</li>
						</ul>
					</td>
					<td align="right" colspan="1" id="no_listtdd">
						<button type="button" class="btn btn-default" onclick="location.href='no_Write.do'">글쓰기</button>
					</td>
				</c:if>
				<c:if test="${empty sessionScope.permit}">
					<td colspan="4" align="center" id="no_listtdd">
					<ul  class="pagination pagination-lg">
						<li>${no_page}</li>
					</ul>
					</td>
				</c:if>
			</tr>
		</tfoot>
		<tbody>
			<c:if test="${empty noList}">
				<tr>
					<td colspan="4" id="no_listtd">등록된 공지사항이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="noList" items="${noList}">
				<c:url var="noticeURL" value="no_Content.do">
					<c:param name="idx">${noList.no_idx}</c:param>
				</c:url>
				<tr>
					<td id="no_listtd"><a href="${noticeURL}">${noList.no_subject}</a></td>
					<td id="no_listtd">관리자</td>
					<td id="no_listtd">${noList.no_writedate}</td>
					<td id="no_listtd">${noList.no_readnum}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</section>
<section style="border: 1px solid red;">
	
	
		  <form action="" id = "fo">
      <input id="m" autocomplete="off" /><button>Send</button>
    </form>
    <ul id="mess">
    
	</ul>


</section>



<!-- ========================================================================================7 -->
<script>

var socket = io('https://192.168.20.18:8080');

$('form').submit(function(){
    socket.emit('chat_message', $('#m').val());
    $('#m').val('');
    return false;
  });


socket.on('chat_message', function(msg){
	
console.log(msg)
	//document.getElementById("li_4").innerHTML = ""+msg+"";
	   $('#mess').append($('<li>').text(msg));
	
});

send  = function(){
	
	
	var msg = document.getElementById("m").value;
	//window.alert(msg);
	socket.emit('chat_message',msg);
	
}







</script>
<!-- ========================================================================================7 -->

<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>