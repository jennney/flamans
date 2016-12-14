<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>자주하는 질문 등록</title>
<style>
#faq_wr{
	width: 700px;
	margin: 0px auto;
	border-spacing: 0px;
}
#faq_wrth1,#faq_wrtd1{
	border-top: 3px solid #BDBDBD;
	border-bottom: 3px solid #BDBDBD;
	height: 30px;
}
#faq_wrth1,#faq_wrth2{
	width: 200px;
}
#faq_wrtd1,#faq_wrtd2{
	width: 500px;
}
#faq_wrtd2,#faq_wrth2{
	height: 30px;
	border-bottom: 2px solid #BDBDBD;
}
#tx{
	resize: none;
	height: 400px;
	width: 700px;
}
#faq_wrtd3{
	border-top: 2px solid #BDBDBD;
	height: 30px;
	text-align: right;
}
h2{
	text-align: center;
}
</style>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script>
	function check(){
		
		var no_subject = $(':input[name=faq_subject]').val();
		var no_content = $(':input[name=faq_content]').val();
		
		if(faq_subject==""){
			window.alert('제목을 입력하세요');
			return false;
		}else if(faq_content=""){
			window.alert('내용을 입력하세요');
			return false;
		}
	}
</script>
</head>
<body>
<div id="wrapper">
<%@ include file="/WEB-INF/views/myIndex.jsp"%>
	<div id="page-wrapper">
		<h2>FAQ</h2>
		<form name="faq_Update" action="faq_Update.do" method="post" onsubmit="return check()">
			<table id="faq_wr">
				<tr>
					<th id="faq_wrth1">SUBJECT</th>
					<td id="faq_wrtd1"><input type="text" name="faq_subject" size="70" value="${fdto.faq_subject}"></td>
				</tr>
				<tr>
					<th id="faq_wrth2">ITME</th>
					<td colspan="1" id="faq_wrtd2">
						<select name="faq_item">
							<option value="hospital"${fdto.faq_item eq 'hospital'?"selected":""}>병원</option>
							<option value="hotel" ${fdto.faq_item eq 'hotel'?"selected":""}>호텔</option>
							<option value="member" ${fdto.faq_item eq 'member'?"selected":""}>회원서비스</option>
							<option value="etc" ${fdto.faq_item eq 'etc'?"selected":""}>기타</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2"><textarea name="faq_content" id="tx">${fdto.faq_content}</textarea></td>
				</tr>
				<tr>
					<td colspan="2" id="faq_wrtd3">
						<input type="hidden" name="faq_idx" value="${fdto.faq_idx}">
						<input type="checkbox" value="on" name = "faq_checked" ${fdto.faq_checked eq 'on'?"checked":""}>BEST 등록   
						<input type="submit" value="작성하기">   <input type="reset" value="다시쓰기">
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
</body>
</html>