<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

	<style>
		.hospital_main_search ul li { list-style-type: none; text-align: center;}
		
        .hospital_list {width: 700px; border:2px solid black; margin: 0px auto;}
        .hospital_list ul {clear: left; margin: 0px; padding: 0px; list-style-type: none;}
        .hospital_list li {list-style-type: none;}
        /* list-style-type 블릿표시 padding: 0; 들여쓰기*/
        
        .hospital_list .subject {font-weight: bold; text-align: center;}
        .hospital_list ul li {text-align: center; float: left; margin: 0px; padding: 2px, 1px; list-style-type: none;}
        .hospital_info1{ width: 500px; }
        .wishlist{ width: 50px; }
        .grade{display: none;}
        .hospital_list ul .col {width: 99px;} /* 표 라인 맞추기기 위해*/
	</style>
	
<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="js/jquery.tmpl.js"></script>
<script type="text/javascript" src="/flamans/js/httpRequest.js"></script>

<meta charset=UTF-8">
<title>Insert title here</title>

<script>
	
	function hospital_sub_search(param){
		sendRequest('hospital_sub_search.do', param, hospital_result_search, 'POST');
	}

	function hospital_result_search(){
		if(XHR.readyState==4){
			if(XHR.status==200){
				
				var data = XHR.responseText;
				var hospital_list = '';
				
				option = document.getElementsByName("option");
				
				optionimg1 = document.getElementById("optionimg1");
				optionimg2 = document.getElementById("optionimg2");
				optionimg3 = document.getElementById("optionimg3");
				optionimg4 = document.getElementById("optionimg4");
				optionimg5 = document.getElementById("optionimg5");
				
			
				if(option[0].checked){
					optionimg1.innerHTML = '<img alt="등급1" src="img/select_grade1.jpg" width="50" height="50">';
				}else{
					optionimg1.innerHTML = '<img alt="등급1" src="img/1.jpg" width="50" height="50">';
				}
				
				if(option[1].checked){
					optionimg2.innerHTML = '<img alt="등급1" src="img/select_grade2.jpg" width="50" height="50">';
				}else{
					optionimg2.innerHTML = '<img alt="등급1" src="img/2.jpg" width="50" height="50">';
				}
				
				if(option[2].checked){
					optionimg3.innerHTML = '<img alt="등급1" src="img/select_grade3.jpg" width="50" height="50">';
				}else{
					optionimg3.innerHTML = '<img alt="등급1" src="img/3.jpg" width="50" height="50">';
				}
				
				if(option[3].checked){
					optionimg4.innerHTML = '<img alt="등급1" src="img/select_grade4.jpg" width="50" height="50">';
				}else{
					optionimg4.innerHTML = '<img alt="등급1" src="img/4.jpg" width="50" height="50">';
				}
				
				if(option[4].checked){
					optionimg5.innerHTML = '<img alt="등급1" src="img/select_grade5.jpg" width="50" height="50">';
				}else{
					optionimg5.innerHTML = '<img alt="등급1" src="img/5.jpg" width="50" height="50">';
				}

				// http://localhost:9090/myweb/img/1.jpg;
				data = eval('('+data+')');
				
				pagedata = data.pageStr1;
				data = data.list;
				for(var i in data){
					hospital_list += '';
					hospital_list +='<a href="hospital_get_info.do?hos_num='+data[i].hos_num+'"><h2 align="left">'+data[i].hos_name+'</h2></a>';
					hospital_list +='<table><tr>';
					hospital_list +='<td width="200"><img alt="병원사진영역" src="'+data[i].hos_img+'"width="200" height="200"></td>';
					hospital_list +='<td width="400">'+data[i].hos_content+'</td>';
					hospital_list +='<td width="100"><a href="hos_wishlist.do?hos_num='+data[i].hos_num+'&hospital_link=hospital_list.do"><input type="button" value="♥"></a>';
					hospital_list +='<a href="booking_hos.do?hos_num='+data[i].hos_num+'"><input type="button" value="예약"></a></td>';
					hospital_list +='</tr></table>';
					
				}
				
				hospital_list +='<table><tr><td>'+pagedata+'</td></tr></table>';
				var hospitals = document.getElementById('hospitallistarea');
				hospitals.innerHTML=hospital_list;
				
			}
		}
	}

	function hos_grade_search(search_option){
	 	option = document.getElementsByName("option");
	 	
	 	var findname = document.hospital_main_search.findname.value;
	 	
		//////////////////■top옵션 ■/////////////////
		if(search_option == 'option1'){
			if(option[0].checked){
				option[0].checked = false;
			}else{
				option[0].checked = true;
			}
		}else if(search_option == 'option2'){
			if(option[1].checked){
				option[1].checked = false;
			}else{
				option[1].checked = true;
			}
		}else if(search_option == 'option3'){
			if(option[2].checked){
				option[2].checked = false;
			}else{
				option[2].checked = true;
			}
		}else if(search_option == 'option4'){
			if(option[3].checked){
				option[3].checked = false;
			}else{
				option[3].checked = true;
			}
		}else if(search_option == 'option5'){
			if(option[4].checked){
				option[4].checked = false;
			}else{
				option[4].checked = true;
			}
		}
	 	
		var params='';
		
		var z=0;
		
		for(var i=1; i<6; i++){	
			if(option[i-1].checked){
				if(z==1){
					params+='&';
				}
				params += 'option'+i+'='+i;
				z=1;
			}
		}
		
		if(findname!='' && findname!=null){
			if(z==1){
				params+='&';
			}
			params += 'findname='+findname;
			z=1;
		}
		
		hospital_sub_search(params);
	}
	
</script>

</head>
<body onload="hos_grade_search('abc');">
<div align="center" style="height: 2100px;">

		<%@ include file="../header.jsp" %>
		
		<table style="margin: 0px auto;">
			<tr>
				<td align="center"><h2>검색된 병원 리스트</h2></td>
			</tr>
			
			<tr>
				<td>

					<form name="hospital_main_search">
					
		
						<table>
								<tr>
									<td align="center">
										<input type="text" id="findname" size="84" onkeypress="if(event.keyCode==13) {hos_grade_search(); return false;}">
										<input type="button" value="검색" class="btn btn-default" onclick="hos_grade_search()">
									</td>
								</tr>
						</table>
						<br/>
					</form>
	
				</td>
			</tr>
		</table>
		
		<div style="width: 1000px;">
		
			<div style="border: 5px solid teal; width: 270px; float: left; white-space:nowrap; margin:0px center;">
				<form name="hos_option_select" action="hotel_sub_search.do">

					<table border="0" class="hospital_sub_search" cellspacing="0" width="150">
						
						<tr>
							<th colspan="5" align="center">TOP 옵션</th>
						</tr>
						
						<tr>
							<td onclick="hos_grade_search('option1')">
								<div id=optionimg1><img alt="옵션1" src="img/1.jpg" width="50" height="50"></div>
								<input type="checkbox" name="option" class="grade" value="1">
							</td>
							
							<td onclick="hos_grade_search('option2')">
								<div id=optionimg2><img alt="옵션2" src="img/2.jpg" width="50" height="50"></div>
								<input type="checkbox" name="option" class="grade" value="2">
							</td>
							
							<td onclick="hos_grade_search('option3')">
								<div id=optionimg3><img alt="옵션3" src="img/3.jpg" width="50" height="50"></div>
								<input type="checkbox" name="option" class="grade" value="3">
							</td>
							
							<td onclick="hos_grade_search('option4')">
								<div id=optionimg4><img alt="옵션4" src="img/4.jpg" width="50" height="50"></div>
								<input type="checkbox" name="option" class="grade" value="4">
							</td>
							
							<td onclick="hos_grade_search('option5')">
								<div id=optionimg5><img alt="옵션5" src="img/5.jpg" width="50" height="50"></div>
								<input type="checkbox" name="option" class="grade" value="5">
							</td>
						</tr>
						
						<tr>
							<th colspan="5" align="center"><hr></th>
						</tr>
						
						<tr>
							<td colspan="5" align="center"><input type="button" class="btn btn-default" value="모든 검색 초기화"></td>
						</tr>
						
						<tr>
							<th colspan="5" align="center"><hr></th>
						</tr>
						
						
					</table>
				
				</form>
			</div>
			
			<div style="border: 5px solid teal;  width: 700px; float: right; margin-left: 0px auto; padding-left: 7px;">
			
				<%--<c:if test="${empty hospital_info }">
					<li> ---- 검색된 병원이 없습니다 ---- </li>
				</c:if>
				
				<c:forEach var="hospital_info" items="${hospital_info }">
				
					<c:url var="hospitalinfoUrl" value="hospital_get_info.do">
 								<c:param name="hos_num">${hospital_info.hos_num }</c:param>
					</c:url>
					
					<c:url var="wishlistUrl" value="hos_wishlist.do">
 								<c:param name="hos_num">${hospital_info.hos_num }</c:param>
 								<c:param name="hospital_link">hospital_list.do</c:param>
					</c:url>
					
				
					<h2 align="left"><a href="${hospitalinfoUrl}">〔 ${hospital_info.hos_name} 〕</a></h2>
					
					<table>
						<tr>
							<td width="200"><img alt="병원사진영역" src="${hospital_info.hos_img}" width="200" height="200"></td>
							<td width="400" valign="top" style="padding-left: 5px;">${hospital_info.hos_content}</td>
							<td width="100" valign="top"><a href="${ wishlistUrl}"><input type="button" value="♥"></a>
							<input type="button" value="예약" onclick=""></td>
						</tr>
					</table>
				
					<hr>
					
						
					
				</c:forEach>--%>
				
				<p id="hospitallistarea">
					
				</p>
			</div>
		</div>
	</div>
</body>
</html>