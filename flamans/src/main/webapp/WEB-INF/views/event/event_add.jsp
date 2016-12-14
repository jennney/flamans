<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script>
	$(document).ready(
			function() {
				$.datepicker.regional['ko'] = {
					closeText : '닫기',
					prevText : '이전달',
					nextText : '다음달',
					currentText : '오늘',
					monthNames : [ '1월(JAN)', '2월(FEB)', '3월(MAR)', '4월(APR)',
							'5월(MAY)', '6월(JUN)', '7월(JUL)', '8월(AUG)',
							'9월(SEP)', '10월(OCT)', '11월(NOV)', '12월(DEC)' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					weekHeader : 'Wk',
					dateFormat : 'yy-mm-dd',
					firstDay : 0,
					isRTL : false,
					showMonthAfterYear : true,
					yearSuffix : '',
					showOn : 'both',
					buttonText : "달력",
					changeMonth : true,
					changeYear : true,
					showButtonPanel : true,
					yearRange : 'c-99:c+99',
				};
				$.datepicker.setDefaults($.datepicker.regional['ko']);

				$('#datepicker').datepicker();
				$('#datepicker').datepicker("option", "maxDate",
						$("#datepicker1").val());
				$('#datepicker').datepicker(
						"option",
						"onClose",
						function(selectedDate) {
							$("#datepicker").datepicker("option", "maxDate",
									selectedDate);
						});

				$('#datepicker').datepicker();
				$('#datepicker').datepicker("option", "minDate",
						$("#datepicker1").val());
				$('#datepicker').datepicker(
						"option",
						"onClose",
						function(selectedDate) {
							$("#datepicker").datepicker("option", "minDate",
									selectedDate);
						});
			});
</script>
<script>
	$(document).ready(
			function() {
				$.datepicker.regional['ko'] = {
					closeText : '닫기',
					prevText : '이전달',
					nextText : '다음달',
					currentText : '오늘',
					monthNames : [ '1월(JAN)', '2월(FEB)', '3월(MAR)', '4월(APR)',
							'5월(MAY)', '6월(JUN)', '7월(JUL)', '8월(AUG)',
							'9월(SEP)', '10월(OCT)', '11월(NOV)', '12월(DEC)' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					weekHeader : 'Wk',
					dateFormat : 'yy-mm-dd',
					firstDay : 0,
					isRTL : false,
					showMonthAfterYear : true,
					yearSuffix : '',
					showOn : 'both',
					buttonText : "달력",
					changeMonth : true,
					changeYear : true,
					showButtonPanel : true,
					yearRange : 'c-99:c+99',
				};

				$.datepicker.setDefaults($.datepicker.regional['ko']);

				$('#datepicker1').datepicker();
				$('#datepicker1').datepicker("option", "maxDate",
						$("#datepicker1").val());
				$('#datepicker1').datepicker(
						"option",
						"onClose",
						function(selectedDate) {
							$("#datepicker1").datepicker("option", "maxDate",
									selectedDate);
						});

				$('#datepicker1').datepicker();
				$('#datepicker1').datepicker("option", "minDate",
						$("#datepicker1").val());
				$('#datepicker1').datepicker(
						"option",
						"onClose",
						function(selectedDate) {
							$("#datepicker1").datepicker("option", "minDate",
									selectedDate);

						});
			});
</script>
</head>
<body>
	<form name="event_add" action="event_add.do" method="post"
		enctype="multipart/form-data">
		<fieldset>
			<legend>이벤트 등록하기</legend>
			<table>
				<tr>
					<th>제목</th>
					<td><input type="text" name="e_subject" placeholder="SUBJECT"></td>

				</tr>
				<tr>
					<th>시작일</th>
					<td><input type="text" id="datepicker" name="e_start"
						class="btn btn-default" placeholder="이벤트 시작일"></td>
					<th>종료일</th>
					<td><input type="text" id="datepicker1" name="e_end"
						class="btn btn-default" placeholder="이벤트 종료일"></td>
				</tr>
				<tr>
					<th>파일</th>
					<td><input type="file" name="uploadimg"></td>
				</tr>
				<tr>
					<td>
					
				<input type="hidden" name="e_name" value="${sessionScope.savecoId}">
					</td>

					<td colspan="3"><input type="submit" value="등록">
						<input type="reset" value="다시작성"></td>
					<td><a href="event_list.do"><input type="button"
							value="목록"></a></td>
					<input type="hidden" name="e_item" value="1">
				</tr>
			</table>

		</fieldset>
	</form>
</body>
</html>