<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">
img{
	width: 200px;
}
#a{
	margin-left: 200px;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp"%>
    <section id="pricing-section" class="pricing-section">
        <div class="container">
        	<div id="a">
	            <div class="row">
	                <div class="col-md-4">
	                    <div class="pricing">
	                        <div class="pricing-header">
	                            <img src="img/peo-1.png" alt="개인">
	                        </div>
	                        <div class="pricing-body">
	                            <h3 class="pricing-title">개인 회원가입</h3>
	                            <p>병원/호텔 검색 또는 예약 서비스를 원하는 분은 개인회원으로 가입해주세요</p>
	                            <a href="member_join.do" class="btn btn-primary">개인회원</a>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-md-4">
	                    <div class="pricing">
	                        <div class="pricing-header">
	                            <img src="img/peo-2.png" alt="기업">
	                        </div>
	                        <div class="pricing-body">
	                            <h3 class="pricing-title">기업 회원가입</h3>
	                            <p>사이트를 이용하는 법인 및 개인사업자는 기업회원으로 가입해주세요</p>
	                            <a href="company_join.do" class="btn btn-primary">기업회원</a>
	                        </div>
	                    </div>
	                </div>
	            </div>
            </div>
        </div>
    </section>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>