<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지관리</title>
<style type="text/css">
.container {
	width: 700px; margin: 10px auto;
}

ul.tabs {
	margin: 0;
   	padding: 0;
   	float: left;
   	list-style: none;
   	height: 32px;
   	border-bottom: 1px solid #999;
   	border-left: 1px solid #999;
   	width: 100%;
}
/*탭메뉴*/
ul.tabs li {
	float: left;
   	margin: 0;
   	padding: 0;
   	height: 31px;
   	line-height: 31px;
   	border: 1px solid #999;
   	border-left: none;
   	margin-bottom: -1px;
  	overflow: hidden;
   	position: relative;
}
ul.tabs li a {
   	text-decoration: none;
   	color: #000;
   	display: block;
   	font-size: 1.2em;
   	padding: 0 20px;
   	border: 1px solid #fff;
   	outline: none;
}
ul.tabs li a:hover {
   	background: #ccc;
}   
html ul.tabs li.active, html ul.tabs li.active a:hover  {
	background: #fff;
   	border-bottom: 1px solid #fff;
}

.tab_container {
	border: 1px solid #999;
   	border-top: none;
   	clear: both;
   	float: left; 
   	width: 100%;
   	background: #fff;
   	-moz-border-radius-bottomright: 5px;
   	-khtml-border-radius-bottomright: 5px;
   	-webkit-border-bottom-right-radius: 5px;
   	-moz-border-radius-bottomleft: 5px;
   	-khtml-border-radius-bottomleft: 5px;
   	-webkit-border-bottom-left-radius: 5px;
}

.tab_content {
   	padding: 20px;
   	font-size: 1.2em;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
<script type="text/javascript">
$(document).ready(function() {

   //Default Action
   	$(".tab_content").hide(); //Hide all content
   	$("ul.tabs li:first").addClass("active").show(); //Activate first tab
   	$(".tab_content:first").show(); //Show first tab content
   
   //On Click Event
	$("ul.tabs li").click(function() {
		$("ul.tabs li").removeClass("active"); //Remove any "active" class
     	$(this).addClass("active"); //Add "active" class to selected tab
      	$(".tab_content").hide(); //Hide all tab content
      	var activeTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
      	$(activeTab).fadeIn(); //Fade in the active content
      	return false;
	});
   	
});

function fileUpload1(fileValue){
	var file = fileValue.files; 
	var fileName = document.getElementById('page1').value;
	var reader = new FileReader(); 
	
	var fileExtSub = fileName.substring(fileName.lastIndexOf(".")+1);
	
	var check = false;
	var fileExt = ['jpg','png','gif','JPG','PNG','GIF','JPEG'];
	for(var i=0;i<fileExt.length;i++){
		if(fileExtSub==fileExt[i]){
			check = true;
		}
	}
	if(!check){
		window.alert('이미지 파일만 첨부 가능합니다.');
		document.getElementById('page1').value='';
	}
	
	reader.onload = function(rst){
		$('#page1Img').attr('src',rst.target.result); 
	}
	reader.readAsDataURL(file[0]);
}

function fileUpload2(fileValue){
	var file = fileValue.files; 
	var fileName = document.getElementById('page2').value;
	var reader = new FileReader(); 
	
	var fileExtSub = fileName.substring(fileName.lastIndexOf(".")+1);
	
	var check = false;
	var fileExt = ['jpg','png','gif','JPG','PNG','GIF','JPEG'];
	for(var i=0;i<fileExt.length;i++){
		if(fileExtSub==fileExt[i]){
			check = true;
		}
	}
	if(!check){
		window.alert('이미지 파일만 첨부 가능합니다.');
		document.getElementById('page2').value='';
	}
	
	reader.onload = function(rst){
		$('#page2Img').attr('src',rst.target.result); 
	}
	reader.readAsDataURL(file[0]);
}

</script>
</head>

<body>
<div class="container">
    <ul class="tabs">
        <li><a href="#tab1">의료사고대처요령</a></li>
        <li><a href="#tab2">출입국절차리스트</a></li>
    </ul>
    <div class="tab_container">
        <div id="tab1" class="tab_content">
        	<form name="page1_Write" action="page1_Write.do" method="post" enctype="multipart/form-data">
        		<input type="hidden" name="pm_item" value="page1">
        		<input type="file" name="upload" id="page1" onchange="fileUpload1(this)">
        		<input type="submit" value="파일올리기">
        	</form>
        	<img src="" id="page1Img" width="100" height="100">
        </div>
        
        <div id="tab2" class="tab_content">
           	<form name="page2_Write" action="page2_Write.do" method="post" enctype="multipart/form-data">
           		<input type="hidden" name="pm_item" value="page2">
        		<input type="file" name="upload" id="page2" onchange="fileUpload2(this)">
        		<input type="submit" value="파일올리기">
        	</form>
			<img src="" id="page2Img" width="100" height="100">
        </div>
    </div>
</div>
</body>
</html>