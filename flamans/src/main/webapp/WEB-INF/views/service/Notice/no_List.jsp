<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>
#no_list{
	width: 700px;
	margin: 0px auto;
	border-spacing: 0px;
}
#no_listth1,#no_listth2,#no_listth3,#no_listth4{
	border-top: 3px solid #BDBDBD;
	border-bottom: 3px solid #BDBDBD;
	height: 50px;
}
#no_listth1{
	width: 450px;
}
#no_listth2{
	width: 100px;
}
#no_listth3{
	width: 100px;
}
#no_listth4{
	width: 50px;
}
#no_listtd{
	border-bottom: 1px solid #BDBDBD;
	height: 40px;
	text-align: center;
}
h2{
	text-align: center;
}
</style>
</head>
<body>
<h2>공지사항</h2>
	<table id="no_list">
		<thead>
			<tr>
				<td colspan="4" align="right">
				<form name="no_find" action="no_find.do">
					<select>
						<option>- 전체 - </option>
						<option>  내용     </option>
						<option>  제목    </option>
					</select>
					<input type="text" name="searchNo">
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
				<td colspan="3" align="center">${no_page}</td>
				<td align="right"><input type="button" value="글쓰기" onclick="location.href='no_Write.do'"></td>
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
</body>
</html>