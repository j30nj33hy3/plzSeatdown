<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="${contextPath}/resources/css/member-pwdAuthForm.css" />
<style>
	
</style>
</head>
<body class="homepage is-preload">
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
	<div class="container">
		<div class="row formContainer">
			<div class="col-md-1"></div>
			<div class="col-md-10">
					<h4>비밀번호 찾기</h4>
					<p style="color: #965AAD; font-weight: bold">
						작성한 이메일 계정으로 임시비밀번호가 발송되었습니다.
						인증 후 비밀번호 재설정이 가능합니다.
					</p>
					<form action="pwdAuth" method="POST" style="text-align: center">
						<div>
							<label for="pwdAuthNumber">임시 비밀번호</label>&nbsp;&nbsp;
							<input type="text" id="pwdAuth"
							name="pathAuth" placeholder="인증번호를 입력하세요.">
						</div>
						<br>
						<div id="authBtnBox">
							<button id="pwdAuthBtn" type="submit" class="btn btn-primary">
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