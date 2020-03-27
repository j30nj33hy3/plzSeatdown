<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 이메일 인증</title>
<link rel="stylesheet" href="${contextPath}/resources/css/member-emailCheck.css" />
<link rel="stylesheet" href="${contextPath}/resources/css/member-progress.css" />
<style>
	/* number 태그 화살표 제거 */
	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
		-webkit-appearance: none;
		margin: 0;
	}
</style>
</head>
<body class="homepage is-preload">
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
	<div class="container">
		<div class="row emailContainer">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<h4>이메일 인증</h4>
				<p style="color: #965AAD; font-weight: bold">
					작성한 이메일 계정으로 인증 메일이 발송되었습니다.
					이메일 인증 후 사이트 이용이 가능합니다.
				</p>
				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-6">
						<div class="step-box">
							<div class="step-state step2-ing">
								<ul>
									<li><p>회원가입</p></li>
									<li><p>정보입력</p></li>
									<li><p>이메일 인증</p></li>
									<li><p>가입완료</p></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-md-3"></div>
				</div>
				<form action="mailAuth" method="POST" style="text-align: center">
					<div>
						<label for="mailAuthNumber">인증번호</label>&nbsp;&nbsp;
						<input type="number" id="mailAuthNumber"
						name="mailAuthNumber" placeholder="인증번호를 입력하세요.">
					</div>
					<br>
					<div id="authBtnBox">
						<button id="mailAuthBtn" type="submit" class="btn btn-primary">
							전송
						</button>
					</div>
					</form>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>