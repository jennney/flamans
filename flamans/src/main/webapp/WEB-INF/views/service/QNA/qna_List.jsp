<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>QNA</title>
<style>
#qn_list{
   width: 700px;
   margin: 0px auto;
   border-spacing: 0px;
}
#qna_listth1,#qna_listth2,#qna_listth3,#qna_listth4,#qna_listth5{
   border-top: 3px solid #BDBDBD;
   border-bottom: 3px solid #BDBDBD;
   height: 50px;
}
#qna_listth1{
   width: 350px;
}
#qna_listth2{
   width: 100px;
}
#qna_listth3{
   width: 100px;
}
#qna_listth4{
   width: 50px;
}
#qna_listth5{
	width: 100px;
}
#qna_listtd{
   border-bottom: 1px solid #BDBDBD;
   height: 40px;
   text-align: center;
}
#qna_listtd1{
   border-bottom: 1px solid #BDBDBD;
   height: 40px;
   text-align: left;
}
h2{
   text-align: center;
}

a:LINK {
	text-decoration: none;
}
#p{
	text-align: center;
}
</style>
</head>
<body>
<h2>Q&A</h2>
<c:if test="${qna_kind eq 'site'}">
<p id="p"><a href="qna_List.do?qna_kind=site">전체 보기</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="qna_List.do?qna_kind=site&qna_item=meminfo">회원정보문의</a>&nbsp;&nbsp;
|&nbsp;&nbsp;<a href="qna_List.do?qna_kind=site&qna_item=memgroup">단체회원문의</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="qna_List.do?qna_kind=site&qna_item=tieup">제휴문의</a>
&nbsp;&nbsp;|&nbsp;&nbsp;<a href="qna_List.do?qna_kind=site&qna_item=etc">기타문의</a></p>
</c:if>
<c:if test="${qna_kind eq 'hospital'}">
<p id="p"><a href="qna_List.do?qna_kind=hospital">전체 보기</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="qna_List.do?qna_kind=hospital&qna_item=cosmetic">성형문의</a>&nbsp;&nbsp;
|&nbsp;&nbsp;<a href="qna_List.do?qna_kind=hospital&qna_item=hosbooking">예약문의</a>&nbsp;&nbsp;
|&nbsp;&nbsp;<a href="qna_List.do?qna_kind=hospital&qna_item=etc">기타문의</a>
</c:if>
<c:if test="${qna_kind eq 'hotel'}">
<p id="p"><a href="qna_List.do?qna_kind=hotel">전체 보기</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="qna_List.do?qna_kind=hotel&qna_item=hotbooking">예약문의</a>&nbsp;&nbsp;
|&nbsp;&nbsp;<a href="qna_List.do?qna_kind=hotel&qna_item=room">방문의</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="qna_List.do?qna_kind=hotel&qna_item=etc">기타문의</a>
</c:if>
	<table id="qn_list">
		<thead>
			<tr>
		   		<td colspan="4" align="right">
		   		<form name="qna_FindList" action="qna_List.do">
		      		<select name="findKey">
		         		<option value="all"${findKey eq 'all'?"selected":""}> - 전체 - </option>
		         		<option value="qna_content" ${findKey eq 'qna_content'?"selected":""}>  내용     </option>
		         		<option value="qna_subject" ${findKey eq 'qna_subject'?"selected":""}>  제목    </option>
		         		<option value="qna_writer" ${findKey eq 'qna_writer'?"selected":""}>  작성자   </option>
		      		</select>
		      		<input type="text" name="findValue" value="${findValue}">
		      		<input type="hidden" name="qna_item" value="${qna_item}">
		      		<input type="hidden" name="qna_kind" value="${qna_kind}">
		      		<input type="submit" value="검색">
		   		</form>
		   		</td>
			</tr>
		   	<tr>
		   		<th id="qna_listth5">ITME</th>
		    	<th id="qna_listth1">SUBJECT</th>
		      	<th id="qna_listth2">WRITER</th>
		      	<th id="qna_listth3">DATE</th>
		      	<th id="qna_listth4">HITS</th>
		   	</tr>
		</thead>
		<tfoot>
			<tr>
		      	<td colspan="4" align="center">${qna_page}</td>
				<td align="right"><input type="button" value="글쓰기" onclick="location.href='qna_Write.do?qna_kind=${qna_kind}'"></td>
		   	</tr>
		</tfoot>
		<tbody>
		<c:if test="${empty qnaList}">
			<tr>
		   		<td colspan="4" id="qna_listtd">등록된 질문이 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="qnaList" items="${qnaList}">
			<tr>
				<td id="qna_listtd">${qnaList.qna_item}</td>
				<td id="qna_listtd1">
				<c:forEach begin="1" end="${qnaList.lev}" step="1">
					&nbsp;&nbsp;<img src="img/ico_re.gif" alt="답변">
				</c:forEach>
				<c:choose>
					<c:when test="${qnaList.qna_secret eq 'open'}">
					<a href="qna_Content.do?qna_idx=${qnaList.qna_idx}">${qnaList.qna_subject}</a>
					</c:when>
					<c:when test="${qnaList.qna_secret eq 'secret'}">
					<img src="img/neo_lock.gif" alt="자물쇠">  <a href="qna_PwdContent.do?qna_idx=${qnaList.qna_idx}&qna_kind=${qnaList.qna_kind}">${qnaList.qna_subject}</a>
					</c:when>
				</c:choose>
				</td>
				<td id="qna_listtd">${qnaList.qna_writer}</td>
				<td id="qna_listtd">${qnaList.qna_writedate}</td>
				<td id="qna_listtd">${qnaList.readnum}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</body>
</html>