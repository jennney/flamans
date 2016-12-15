<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/flamans/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="/flamans/js/httpRequest.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){ //문서가 불러지고 난 후 
   
   $("#del").on("click",function(){ // main을 클릭하면 
         $("#del1").toggle(); //서브를 토글시킴 
         
      }) 
    
      $("#update").on("click",function(){ // main을 클릭하면 
         $("#update1").toggle(); //서브를 토글시킴 
      
      }) 
      
    $("#pwd_update").on("click",function(){ // main을 클릭하면 
         $("#pwd_update1").toggle(); //서브를 토글시킴 
      })   
             
         
    $("#member_myqna").on("click",function(){ // main을 클릭하면 
          $("#member_myqna1").toggle(); //서브를 토글시킴      
      
     })      
})
/* 숫자만 입력받기 */
function fn_press(event, type) {
    if(type == "numbers") {
        if(event.keyCode < 48 || event.keyCode > 57) return false;
        //onKeyDown일 경우 좌, 우, tab, backspace, delete키 허용 정의 필요
    }
}

var line;

function updateSet(which){
   var dto=which;
   
   document.member_update.m_sex.value='${dto.m_sex}';
   document.member_update.m_nationality.value='${dto.m_nationality}';
   
   /**생일*/
   var m_birthday='${dto.m_birthday}';
   var m_Year=m_birthday.substring(0, 4);
   var m_Month=m_birthday.substring(4, 6);
   var m_Day=m_birthday.substring(6, 8);
      
   Now = new Date();
   NowDay = Now.getDate();
   NowMonth = Now.getMonth();
   NowYear = Now.getFullYear();   
   
   function WriteYearOptions(NowYear){

        line = "";
        for (i=NowYear; i>1960; i--){
       line += "<OPTION value="+i+">";
       line += i+"</OPTION>";
        
        }
        return line;   
   }
   
   
   line=WriteYearOptions(NowYear);
   $('#Year').html(line);


   document.member_update.Year.value=m_Year;
   document.member_update.Month.value=m_Month; 
   document.member_update.Day.value=m_Day;

      
    if (NowYear < 2000) NowYear += 1900; 
   function DaysInMonth(WhichMonth, WhichYear)
   {
     var DaysInMonth = 31;
     if (WhichMonth == "Apr" || WhichMonth == "Jun" || WhichMonth == "Sep" || WhichMonth == "Nov") DaysInMonth = 30;
     if (WhichMonth == "Feb" && (WhichYear/4) != Math.floor(WhichYear/4))        DaysInMonth = 28;
     if (WhichMonth == "Feb" && (WhichYear/4) == Math.floor(WhichYear/4))        DaysInMonth = 29;
     return DaysInMonth;
   }

   function ChangeOptionDays(Which)
   {
     DaysObject = eval("document.member_update." + Which + "Day");
     MonthObject = eval("document.member_update." + Which + "Month");
     YearObject = eval("document.member_update." + Which + "Year");

     Month = MonthObject[MonthObject.selectedIndex].text;
     Year = YearObject[YearObject.selectedIndex].text;
     /**/
     alert(Year);
     /**/
     
     DaysForThisSelection = DaysInMonth(Month, Year);
     CurrentDaysInSelection = DaysObject.length;
     if (CurrentDaysInSelection > DaysForThisSelection)
     {
       for (i=0; i<(CurrentDaysInSelection-DaysForThisSelection); i++)
       {
         DaysObject.options[DaysObject.options.length - 1] = null
       }
     }
     if (DaysForThisSelection > CurrentDaysInSelection)
     {
       for (i=0; i<(DaysForThisSelection-CurrentDaysInSelection); i++)
       {
         NewOption = new Option(DaysObject.options.length + 1);
         DaysObject.add(NewOption);
       }
     }
       if (DaysObject.selectedIndex < 0) DaysObject.selectedIndex == 0;
       
   }

   
   /**eamil*/
   var email='${dto.m_email}';
   var result = email.split('@');
   
   document.member_update.email1.value=result[0];
   document.member_update.email2.value=result[1];  
   
   
   /**tel*/
   var tel='${dto.m_tel}';
   tel=tel.split('-');
   
   document.member_update.kind.selected=tel[0];
   document.member_update.number1.value=tel[1]; 
   document.member_update.number2.value=tel[2];
   
   
}

function email3(userinput){
    var selval = userinput.selEmail.value;
    if(selval==""){
     //직접선택이면 메일란을 보인다.
     userinput.email2.style.display = 'inline';
     userinput.email2.value="";
     userinput.email2.focus();
    } else {
     //콤보에서 선택하는 경우에는 메일주소 입력란을 안보이게 하고 메일주소란에 선택 메일주소를 넣어준다.
     userinput.email2.style.display = 'none'; 
     userinput.email2.value=selval;
    }
   }  
function openEmail() {

   var email = document.member_update.email1.value;
   email+='@';
   email+=document.member_update.email2.value;
   document.member_update.m_email.value=email;
   
   var params='email='+email;
   sendRequest('m_emailCheck.do', params, emailCheckResult, 'GET');
}
var data_global=null;
function emailCheckResult(){
   if(XHR.readyState==4){
      if(XHR.status==200){
         var data=XHR.responseText;
         data=data.trim();
         data_global=data;
         window.alert('이메일을 발송하였습니다.');      
      }
   }
}  

function emailCheckOk() {
   var number = document.getElementById("emailCheck");
   var  verification = data_global;
   
   if(number.value==''){
      window.alert('인증번호를 입력하세요');
      return;
   }
   else if(number.value!=verification){
      window.alert('틀린번호입니다. 인증번호를 다시 입력하세요.');
      number.value='';
   }
   else if(number.value==verification){
      window.alert('인증완료');
      document.member_update.email_check.value='인증완료';
      window.self.close();
   }
}

function yearmonth(){
     Month = document.getElementById("Month");
     Year = document.getElementById("Year");
     Day = document.getElementById("Day");
     
     var m_birthday=Year.value+Month.value+Day.value;
   
     document.member_update.m_birthday.value=m_birthday;
   
}

/* function update(){
   sendRequest('member_update.do', null, updateResult, 'GET');
}

function updateResult(){
   if(XHR.readyState==4){
      if(XHR.status==200){
         var data=XHR.responseText;      
         var dto=data;
         alert(data);
         alert(dto);
         alert("qq"+dto.dto);
         document.member_update.m_sex.value=dto.m_sex;
         document.member_update.m_nationality.value=dto.m_nationality;
         
      }
   }
}
 */
</script>
<style>
#del1, #update1, #pwd_update1, #member_myqna1 {
   display: none;
   width: 700px;
   height: 350px;
   background-color: white;
}

#del, #update, #pwd_update, #member_myqna {
   width: 700px;
   padding: 5px;
   border-right: 1px solid grey;
   border-top: 1px solid grey;
   border-bottom: 1px solid grey;
   border-left: 1px solid grey;
}

#color {
   /* font:12px/1.2 맑은 고딕; */
   color: green;
}

#color1 {
   color: red;
}

#pwd {
   float: left;
   width: 80px;
}
#label_update{
	float: left;
	width: 100px;
}
</style>
</head>
<body onload="updateSet('${dto}')">
<div id="wrapper">
<%@ include file="/WEB-INF/views/myIndex.jsp"%>
	<div id="page-wrapper">
	<div class="container-fluid" style="height: 700px;">
		<h2>My Page</h2>
		 <div id="member_myqna">내 문의 리스트</div>
         <div id="member_myqna1">
            <table>
               <c:if test="${empty myqna}">
                  <tr>
                     <td colspan="2" align="center">등록된 게시글이 없습니다.</td>
                  </tr>
               </c:if>
               <tr>
                  <th>제목</th>
                  <th>답변여부</th>
               </tr>
               <c:forEach var="dto" items="${myqna}">
                  <c:url var="contentURL" value="qna_Content.do">
                     <c:param name="qna_idx">${dto.qna_idx}</c:param>
                  </c:url>
                  <tr>
                     <td><a href="${contentURL}">${dto.qna_subject}</a></td>
                     <td><c:choose>
                           <c:when test="${dto.lev >0}">
                              <h4 style="color: red;">답변 완료</h4>
                           </c:when>
                           <c:otherwise>
                              <h4 style="color: blue;">답변 중</h4>
                           </c:otherwise>
                        </c:choose></td>
                  </tr>
               </c:forEach>
            </table>
         </div>
         <div id="update">계정 관리</div>
         <div id="update1" class="well well-lg">
            <%@include file="member_update.jsp"%>
         </div>
         <div id="pwd_update">비밀번호 변경</div>
         <div id="pwd_update1" class="well well-lg">
            <%@include file="member_update_pw.jsp"%>
         </div>
         <div id="del">회원탈퇴</div>
         <div id="del1" class="well well-lg">
            <form name="del" action="member_out.do" class="form-inline">
               탈퇴 후에는 아이디 &nbsp; &nbsp; <input type="text" class="form-control"
                  id="focusedInput" name="m_id" value="${sessionScope.userid }"
                  readonly style="width: 150px; background-color: white;"> 의
               데이터는 복구할 수 없습니다.<br> <br> 또한, 해당 아이디를 사용해 flamans의 서비스를 이용
               할 수 없게 됩니다.<br> <br> 게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다.<br>
               <br> 본인 확인을 위해 비밀번호를 입력한 후, &nbsp; “탈퇴확인” 버튼을 눌러주세요.<br> <br>
               <label id="pwd">Password:</label> <input type="password"
                  class="form-control" name="m_pwd" placeholder="Enter password"
                  style="width: 300px;"> <br> <span id="color1">(회원
                  탈퇴시 나의계정의 모든 정보와 DB가 자동 삭제됩니다.)</span><br>
               <button type="submit" class="btn btn-default" style="float: right;">탈퇴확인</button>
            </form>
         </div>
         
         
	</div>
	</div>
</div>
</body>
</html>