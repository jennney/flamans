<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#a{
	height: 500px;;
}
ul {
    display: inline;
    list-style-type: disc;
    -webkit-margin-before: 1em;
    -webkit-margin-after: 1em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
    -webkit-padding-start: 40px;
}
.joinMain ul li {
    position: relative;
    height: 240px;
    padding: 24px;
   	margin-right: 50px;
    background: #fff;
    border: 1px solid #d7d7d7;
}

.joinMain ul li {
    float: left;
    width: 240px;
    height: 350px;
}
.btnAction {
    margin-top: 12px;
    padding: 0;
    font-size: 15px;
    text-align: center;
}
.joinMain{
	margin-top: 50px;
	text-align: center;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp"%>	
<div class="container">
	<div id="a">
	 	<section>
	 		<article id="Contents" class="joinMain">
	 		<ul>
				<li class="person">
					<div class="guide">
						<em><img src="img/people-2.png" alt="개인회원"></em>
						<strong></strong>
					</div>
					<div class="btnAction">
					<a href="company_join.do">
						<img src="https://contents.albamon.kr/monimg/login/btn_gg_1_n.png" alt="개인회원 가입">
					</a>
					</div>
					<div id="OauthFrame"></div>
		
				</li>
		
				<li class="biz">
					<div class="guide">
						<em><img src="img/people-1.png" alt="개인회원"></em>
					</div>
					<div class="btnAction">
					<a href="member_join.do">
						<img src="https://contents.albamon.kr/monimg/login/btn_gi_1_n.png" alt="기업회원 가입">
					</a>
					</div>
					<p>법인 및 개인사업자는 기업회원으로 가입해주세요</p>
		
				</li>
			</ul>
	 		</article>
	 	</section>
	</div>
</div>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>