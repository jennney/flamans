<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

.joinMain ul li {
    float: left;
    width: 240px;
    height: 350px;
}
</style>
<%@ include file="/WEB-INF/views/header.jsp"%>
</head>
<body>
 <div class="container">
 	<section>
<article id="Contents" class="joinMain">
<ul>
			<li class="person">
				<div class="guide">
					<em></em><strong>좋은 일자리를 <span>찾으세요?</span></strong> 이력서를 등록하고, 재용정보를 검색하실 분
				</div>
			
				<div class="btnAction">
					<a class="btn btnType1 id" href="https://sign.alba.co.kr/user/join/JoinRegFormP.asp" onclick="MemberCommonCLS.goAdLink({action:'try_join'});">개인회원 가입(아이디)</a>
				</div>
				
					<p class="snsJoin">
						<span>SNS계정으로 쉽고 빠르게 가입하기</span>
						<a href="#" onclick="OauthLoginCLS.doLogin('F');return false;" class="sns facebook">페이스북 간편가입</a>
						<a href="#" onclick="OauthLoginCLS.doLogin('N');return false;" class="sns naver">네이버 간편가입</a>
						<a href="#" onclick="OauthLoginCLS.doLogin('K');return false;" class="sns kakao">카카오톡 간편가입</a>
					</p>
					<div id="OauthFrame"></div>
				
			</li>
		
			<li class="biz">
				<div class="guide">
					<em></em><strong>우수한 직원을 <span>찾으세요?</span></strong> 채용공고를 등록하고, 이력서를 검색하실 분
				</div>
				<div class="btnAction">
					<a class="btn btnType2" href="https://sign.alba.co.kr/user/join/JoinRegFormC.asp" onclick="MemberCommonCLS.goAdLink({action:'try_join'});">기업회원 가입</a>
				</div>
			
				<p>법인 및 개인사업자는 기업회원으로 가입해주세요</p>
			
			</li>
		</ul>
</article>
</section>
</div>
<%@ include file="/WEB-INF/views/footer.jsp"%>	
</body>
</html>