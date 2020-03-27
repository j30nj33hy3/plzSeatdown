<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 이메일 인증</title>
<link rel="stylesheet" href="${contextPath}/resources/css/member-progress.css" />
<style>
	#btnBox{
		width: 100px;
		margin: 0 auto;
	}
	#completeBtn{
	    height: 40px;
	    font-size: 15px;
	    width: 100%;
	    background-color: rgba(163, 99, 189, 0.8);
	    color : white;
	    border: 0px;
	    float:left;
	}

	#completeBtn:hover{
	    background-color:rgb(163, 99, 189);
	    color : white;
	    border : 0px;
	}
</style>
</head>
<body class="homepage is-preload">
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
	<div class="container">
		<div class="row mt-4 mb-4">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<h4>회원가입 완료</h4>
				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-6">
						<div class="step-box">
							<div class="step-state step4">
								<ul>
									<li><p>회원가입</p></li>
									<li><p>정보입력</p></li>
									<li><p>이메일 인증</p></li>
									<li><p>가입완료</p></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
					<div class="col-md-3"></div>
				<p style="color: #965AAD; font-weight: bold" class="text-center">
					회원가입이 완료되었습니다. 로그인 후 서비스 이용 바랍니다.
				</p>
				<div id="btnBox">
					<button id="completeBtn" onclick="location.href='${contextPath}'">확인</button>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>