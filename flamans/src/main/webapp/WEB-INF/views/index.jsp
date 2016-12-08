<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
	width: 100%;
	margin: 0px auto;
}
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<h2>flamans final시작</h2>
	<a href="company_join.do">업체 회원가입</a>
	<br>
	<a href="member_join.do">회원가입</a>
	<br>
	<a href="qna_List.do?qna_kind=site">Q&A사이트</a>
	<br>
	<a href="qna_List.do?qna_kind=hospital">Q&A병원</a>
	<br>
	<a href="qna_List.do?qna_kind=hotel">Q&A호텔</a>
	<br>
	<a href="no_List.do">공지사항</a>
	<br>
	<a href="event_user_list.do?e_item=1">진행중인 이벤트</a>
	<br>
	<a href="event_user_list.do?e_item=2">종료된 이벤트</a>
	<br>
	<a href="page_List.do?pm_item=page1">의료사고대처요령</a>
	<br>
	<a href="page_List.do?pm_item=page2">출입국절차</a>
	<br>
	<a href="page_Write.do">의료사고대처요령/출입국절차 수정</a>
	<br>
	<a href="faq_List.do">FAQ</a>
	<br>
	<a href="bBbook_list.do">관리자-예약요청리스트</a>
	<br>
		<c:url var="BbookUrl" value="bBook.do">
		<c:param name="hos_num" value="B5042377484"/>
		<c:param name="doc_num" value="1"/>
	</c:url>
	<a href="${BbookUrl}">병원 예약</a>
	<br>
<%@ include file="footer.jsp" %>
</body>
</html>