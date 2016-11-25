<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>QNA글쓰기</title>
<style>
#qna_wr{
	width: 700px;
	margin: 0px auto;
	border-spacing: 0px;
}

#qna_wrth1,#qna_wrtd1{
	border-top: 3px solid #BDBDBD;
	border-bottom: 3px solid #BDBDBD;
	height: 30px;
}
#qna_wrth1{
	width: 200px;
	border-right: 3px solid #BDBDBD;
}
#qna_wrtd1{
	width: 500px;
}
#qna_wrtx{
	height: 500px;
	border-bottom: 2px solid #BDBDBD;
}
.ckeditor{
	width: 700px;
	height: 500px;
	resize: none;
}
#qna_wrtd2,#qna_wrth2{
	border-top: 2px solid #BDBDBD;
	border-bottom: 2px solid #BDBDBD;
	height: 30px;
}
#qna_wrth2,#qna_wrth3{
	border-right: 2px solid #BDBDBD;
}
#qna_wrtd5,#qna_wrth5{
	border-bottom: 2px solid #BDBDBD;
	height: 30px;
}
#qna_wrth5,#qna_wrth5{
	border-right: 2px solid #BDBDBD;
}
#qna_wrtd6,#qna_wrth6{
	border-bottom: 2px solid #BDBDBD;
	height: 30px;
}
#qna_wrth6,#qna_wrth6{
	border-right: 2px solid #BDBDBD;
}
#qna_wrtd3,#qna_wrth3{
	border-bottom: 2px solid #BDBDBD;
	height: 30px;
}
#qna_wrtd4{
	height: 30px;
	text-align: right;
}
#qna_wrth7{
	height: 60px;
	border-bottom: 2px solid #BDBDBD;
	border-right: 2px solid #BDBDBD;
}

#qna_wr2{
	width: 500px;
	border-spacing: 0px;
	border: 1px solid;
}
#wr_th1,#wr_th2,#wr_th3{
	border-bottom: 1px solid; 
	background: #BDBDBD;
}
#wr_th1,#wr_td1{
	border-right: 1px solid;
	width: 150px;
}
#wr_th2,#wr_td2{
	border-right: 1px solid;
	width: 200px;
}
#wr_th3{
	width: 150px;
}
#wr_td1,#wr_td2,#wr_td3{
	text-align: center;
	background: #F6F6F6;
}
h2{
	text-align: center;
}
#star{
	color: red;
}
</style>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script>
	function check(){
		var qna_item = $(':input[name=qna_item]').val();
		var agree = $(':input[name=cb]:radio:checked').val();
		
		if(qna_item=="all"){
			window.alert('카테고리분류를 선택해주세요');
			return false;
		}	
		
		if(agree=="n"){
			window.alert('정보수집에 동의 하셔야 이용할 수 있습니다.');
			return false;
		}
	}
	
	function cbcheck(){
		window.alert('정부수집에 동의하지 않으면 서비스 이용에 제한이 있습니다.');
	}
	
	function qna_Search(){
		window.opener();
	}
</script>
</head>
<body>
<form name="qna_Write" action="qna_Write.do" method="post" enctype="multipart/form-data" onsubmit="return check()">
<h2>Q&A</h2>
	<table id="qna_wr">
		<tr>
			<th id="qna_wrth1">SUBJECT</th>
			<td id="qna_wrtd1"><input type="text" name="qna_subject"></td>
		</tr>
		<tr>
			<th id="qna_wrth5">WRITER</th>
			<td id="qna_wrtd5"><input type="text" name="qna_writer"></td>
		</tr>
		<tr>
			<th id="qna_wrth6">ITEM</th>
			<td id="qna_wrtd6">
				<c:choose>
					<c:when test="${qna_kind eq 'site'}">
						<select name="qna_item" onchange="qna_select()" id="qna_item">
							<option value="all"> - 전체 - </option>
							<option value="meminfo">회원정보</option>
							<option value="memgroup">단체회원이용</option>
							<option value="tieup">제휴문의</option>
							<option value="etc">기타문의</option>
						</select>
						<input type="hidden" name="qna_findname" value="site">
					</c:when>
					<c:when test="${qna_kind eq 'hospital'}">
						<select name="qna_item" onchange="qna_select()" id="qna_item">
							<option value="all"> - 전체 - </option>
							<option value="cosmetic">성형문의</option>
							<option value="hosbooking">예약문의</option>
							<option value="etc">기타문의</option>
						</select>
						&nbsp;&nbsp;&nbsp; 병원 검색 <input type="text" name="qna_findname" >
						<input type="button" value="검색하기" onclick="qna_Search()">
					</c:when>
					<c:when test="${qna_kind eq 'hotel'}">
						<select name="qna_item" onchange="qna_select()" id="qna_item">
							<option value="all"> - 전체 - </option>
							<option value="hotbooking">예약문의</option>
							<option value="room">방문의</option>
							<option value="etc">기타문의</option>
						</select>
						&nbsp;&nbsp;&nbsp; 호텔 검색 <input type="text" name="qna_findname" ><input type="button" value="검색하기">
					</c:when>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td colspan="2" id="no_wrtx"><textarea name="qna_content" class="ckeditor"></textarea></td>
		</tr>
		<tr>	
			<th id="qna_wrth2">첨부파일1</th>
			<td id="qna_wrtd2"><input type="file" name="upload"></td>
		</tr>
		<tr>	
			<th id="qna_wrth3">첨부파일2</th>
			<td id="qna_wrtd3"><input type="file" name="upload"></td>
		</tr>
		<tr>
			<th id="qna_wrth6">비밀번호</th>
			<td id="qna_wrtd6"><input type="password" name="qna_pwd"></td>
		</tr>
		<tr>
			<th id="qna_wrth6">비밀글설정</th>
			<td id="qna_wrtd6"><input type="radio" value="secret" name="qna_secret"> 비밀글 <input type="radio" value="open" name="qna_secret"> 공개글</td>
		</tr>
		<tr>
			<th id="qna_wrth7">개인정보 수집 및 이용 동의</th>
			<td id="qna_wrtd6">
				<table id="qna_wr2">
					<tr>
						<th id="wr_th1">목적</th>
						<th id="wr_th1">항목</th>
						<th id="wr_th1">보유기간</th>
					</tr>
					<tr>
						<td id="wr_td1">게시판 서비스 제공</td>
						<td id="wr_td2">이름, 비밀번호, 작성내용, IP Address</td>
						<td id="wr_td3">게시글 삭제시</td>
					</tr>
				</table>
				<input type="radio" name="cb" value="y"> 동의함  <input type="radio" name="cb" value="n" onclick="cbcheck()">동의 안함
				<span id="star"> * </span> 동의하셔야 서비스를 이용할 수 있습니다.
			</td>
		</tr>
		<tr>
			<input type="hidden" name="qna_kind" value="${qna_kind}">
			<td id="qna_wrtd4" colspan="2"><input type="submit" value="작성"> <input type="reset" value="다시작성"></td>
		</tr>
	</table>
</form>
</body>
</html>