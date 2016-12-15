<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>QNA수정하기</title>
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
<script type="text/javascript" src="js/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script>
	window.onload=function(){
	    CKEDITOR.replace('qna_content', {
       		filebrowserUploadUrl : "qna_Uplaod.do",
       		height: "400"
	    });
	    
	    CKEDITOR.on('dialogDefinition', function (ev) {
	           var dialogName = ev.data.name;
	           var dialog = ev.data.definition.dialog;
	           var dialogDefinition = ev.data.definition;
	           if (dialogName == 'image') {

	               dialogDefinition.removeContents('advanced');
	               dialogDefinition.removeContents('Link');
	           }
	       });
	 }

	function check(){
		var qna_item = $(':input[name=qna_item]').val();
		var qna_pwd = $(':input[name=qna_pwd]').val();
		var qna_subject = $(':input[name=qna_subject]').val();
		var qna_writer = $(':input[name=qna_writer]').val();
		var qna_findname = $(':input[name=qna_findname]').val();
		
		if(qna_pwd="" || qna_pwd==null){
			window.alert('비밀번호를 입력해주세요');
			return false;
		}else if(qna_item=="all"){
			window.alert('카테고리분류를 선택해주세요');
			return false;
		}else if(qna_subject=""){
			window.alert('제목을 입력하세요');
			return false;
		}else if(qna_writer=""){
			window.alert('작성자를  입력하세요');
			return false;
		}else if(qna_findname=""){
			window.alert('해당 병원 또는 호텔을 검색해주세요');
			return false;
		}
	}
	
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp"%>
<section>
	<div class="center">
	   <h2>Q&amp;A</h2>
	</div>
<form name="qna_Update" action="qna_Update.do" method="post" onsubmit="return check()">
	<table id="qna_wr">
		<tr>
			<th id="qna_wrth1">SUBJECT</th>
			<td id="qna_wrtd1"><input type="text" name="qna_subject" value="${qdto.qna_subject}"></td>
		</tr>
		<tr>
			<th id="qna_wrth5">WRITER</th>
			<td id="qna_wrtd5">
				<c:if test="${empty sessionScope.userid }">
					${sessionScope.cm_name}
					<input type="hidden" name="qna_writer" value="${sessionScope.cm_name}">
				</c:if>
				<c:if test="${empty sessionScope.savecoId}">
					${sessionScope.username}
					<input type="hidden" name="qna_writer" value="${sessionScope.username}">
				</c:if>
			</td>																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																							
		</tr>
		<tr>
			<th id="qna_wrth6">ITEM</th>
			<td id="qna_wrtd6">
				<c:choose>
					<c:when test="${qdto.qna_kind eq 'site'}">
						<select name="qna_item" onchange="qna_select()" id="qna_item">
							<option value="all"${qdto.qna_item eq 'all'?"selected":""}> - 전체 - </option>
							<option value="meminfo" ${qdto.qna_item eq 'meminfo'?"selected":""}>회원정보문의</option>
							<option value="memgroup" ${qdto.qna_item eq 'memgroup'?"selected":""}>단체회원이용</option>
							<option value="tieup" ${qdto.qna_item eq 'tieup'?"selected":""}>제휴문의</option>
							<option value="etc" ${qdto.qna_item eq 'etc'?"selected":""}>기타문의</option>
						</select>
						<input type="hidden" name="qna_findname" value="site">
					</c:when>
					<c:when test="${qdto.qna_kind eq 'hospital'}">
						<select name="qna_item" onchange="qna_select()" id="qna_item">
							<option value="all" ${qdto.qna_item eq 'all'?"selected":""}> - 전체 - </option>
							<option value="cosmetic" ${qdto.qna_item eq 'cosmetic'?"selected":""}>성형문의</option>
							<option value="hosbooking" ${qdto.qna_item eq 'hosbooking'?"selected":""}>예약문의</option>
							<option value="etc" ${qdto.qna_item eq 'etc'?"selected":""}>기타문의</option>
						</select>
						&nbsp;&nbsp;&nbsp; 병원 검색 <input type="text" name="qna_findname" ><input type="button" value="검색하기" onclick="qna_Search()">
					</c:when>
					<c:when test="${qdto.qna_kind eq 'hotel'}">
						<select name="qna_item" onchange="qna_select()" id="qna_item">
							<option value="all" ${qdto.qna_item eq 'all'?"selected":""}> - 전체 - </option>
							<option value="hotbooking" ${qdto.qna_item eq 'hotbooking'?"selected":""}>예약문의</option>
							<option value="room" ${qdto.qna_item eq 'room'?"selected":""}>방문의</option>
							<option value="etc" ${qdto.qna_item eq 'etc'?"selected":""}>기타문의</option>
						</select>
						&nbsp;&nbsp;&nbsp; 호텔 검색 <input type="text" name="qna_findname"><input type="button" value="검색하기" >
					</c:when>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td colspan="2" id="no_wrtx"><textarea name="qna_content" id="qna_content"></textarea></td>
		</tr>
		<tr>
			<th id="qna_wrth6">비밀번호</th>
			<td id="qna_wrtd6"><input type="password" name="qna_pwd" value="${qdto.qna_pwd}"></td>
		</tr>
		<tr>
			<th id="qna_wrth6">비밀글설정</th>
			<td id="qna_wrtd6">
				<input type="radio" value="secret" name="qna_secret" ${qdto.qna_secret eq secret?"":"checked"}> 비밀글 
				<input type="radio" value="open" name="qna_secret" ${qdto.qna_secret eq open?"":"checked"}> 공개글
			</td>
		</tr>
		<tr>
			<input type="hidden" name="qna_idx" value="${qdto.qna_idx}">
			<input type="hidden" name="qna_kind" value="${qdto.qna_kind}">
			<td id="qna_wrtd4" colspan="2"><input type="submit" value="작성"> <input type="reset" value="다시작성"></td>
		</tr>
	</table>
</form>
</section>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>