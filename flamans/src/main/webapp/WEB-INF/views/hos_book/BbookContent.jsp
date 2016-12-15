<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/flamans/js/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css">
<script src="js/script.js"></script>
<script>
function closeCon(){
	window.self.close();
}
function BbookreWrite(bookingnum){
	var addr='BbookreWrite.do?bookingnum='+bookingnum;
	window.open(addr, 'BbookreWrite', 'width=820px, height=650px, left=100, top=30');
	window.self.close();
}
function Bbook2(){
	
	var line="";
	line=WriteYearOptions();;
	$('#B_time').html(line);
	
	function WriteYearOptions()//disable
	{//dao로 예약일자 시간 받아서 컨트롤러에서 돌려서 disable넣어주고 데려오는 방법
	  for (i=9; i<=20; i++){
		  
		if(i>=9 && i<12){
		    line += "<OPTION value=AM"+i+":00 disable> AM ";
		    line += i+" : 00</OPTION>";
	 	 }else if(i==12){
			  line += "<OPTION value=PM"+i+":00 disable> PM ";
			  line += i+" : 00</OPTION>";
	 	 }else{
			  line += "<OPTION value=PM"+(i-12)+":00 disable> PM 0";
			  line += i-12+" : 00</OPTION>";
	 	 }  
	  }
	  return line;
	}
	
}
function bookDate(currentYear, currentMonth, dateNum){
	
/* 	var bookdate=document.getElementById("bookdate");
	bookdate.value = currentYear+"-"+currentMonth+"-"+dateNum; */
}
</script>
<style>
#td{
	text-align:center;width: 80px;height: 30px;
}
textarea{
	resize:none;
}
#bBook{
	 padding-left:20px; border-spacing: 20px; 
}
#kCalendar{
   width:260px; height:260px; border : 1px solid #EAEAEA;  font:15px/1.0 맑은 고딕;f   
}
#a{
	float: left;width:480px;height:600px; border : 1px solid pink;
	}
#b{
   width:800px;  height:650px;  margin-top: 30px;  border : 1px solid green;  
}
#d{
	float: right;  width:260px;	height:600px;
}
#doc{
	width:260px;text-align: center;font:15px/1.0 맑은 고딕; 
}
#B_time{
	width:260px;height:100px;text-align: center;font:15px/1.0 맑은 고딕;
}
#kCalendar{
   width:260px;   height:260px;   border : 1px solid #EAEAEA;    font:15px/1.0 맑은 고딕;   
}
</style>
</head>
<body onload="Bbook2();kCalendar('kCalendar');">
<h2>병원 예약</h2>
<fieldset>
	<div id="b" class="well well-lg">
	<div id="a">
		<table id="bBook">
		<c:set var="dto" value='${dto}'/>
			<tr>
			<td colspan="2" id="td"><h4>${dto.cm_name}</h4>
			</td>
			</tr>
			<tr style="padding-left: 8px;">
				<td><img src="${dto.doc_img }" width="100" height="100" ></td>
				<td><div id="doc"><label style="width:100px;">${dto.doc_name }</label>
				</div><br>
				'${dto.doc_career }'
				</td>
			</tr>
			<tr>
				<td colspan="2" ><br></td>
			</tr>
			<tr>
				<td style="padding-top: 10px; padding-top: 5px;" id="td">이 름</td>
				<td>${dto.name }</td>
			</tr>
			<tr>
				<td id="ss" style="text-align:center;width: 80px;height: 30px;">성 별</td>
				<td>${dto.sex}자</td>
			</tr>
			<tr>
				<td id="td">나이</td>
				<td>${dto.age}세</tr>
			<tr>
			<tr>
				<td id="td">국 적</td>
				<td>${dto.nationality}</td>
			</tr>
			<tr>
				<td id="td">예약일자</td>
				<td>${dto.bookingdate}</td>
			</tr>
			<tr>
				<td colspan="2" ><br>원하는 시술/수술<br>
				<textarea class="form-control" rows="2" cols="60" id="comment" name="surgery" style="background: white;" readonly>${dto.surgery}</textarea></td>
			</tr>
			<tr>
			<tr>
				<td colspan="2" >특이사항<br>
				<textarea class="form-control" rows="2" cols="60" id="comment" name="etc" style="background: white;" readonly>${dto.etc}</textarea><br><br></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
				<button type="button" class="btn btn-default" onclick="closeCon()">확인</button>
				<c:if test="${!empty sessionScope.cm_name }">
               		<button type="button" class="btn btn-default" onclick="BbookreWrite('${dto.bookingnum}')">수정</button>
            	</c:if>
			</tr>
		</table>
		</div>
		<div class="container" id="d" class="well well-lg">
			<div id="kCalendar" class="form-control"></div>
			<select multiple class="form-control" id="B_time" name="B_time" onchange="Btime1()">
			    	
		    </select>	
		    <div id="doc">
		    <br><br>
		    <fieldset>
				<c:forEach var="doctor" items="${doc}">
					<div id="doc"><img src="${doctor.doc_img }" width="50" height="50">
						<label style="width:100px;">${doctor.doc_name }</label>
					</div>		
				</c:forEach>
			</fieldset>		
			</div>
		</div>
		<br>		
	</div>
</fieldset>
</body>
</html>