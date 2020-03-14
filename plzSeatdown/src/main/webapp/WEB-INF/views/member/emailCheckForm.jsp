<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 이메일 인증</title>
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
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				
				<p style="color: #965AAD; font-weight: bold">
					작성한 이메일 계정으로 인증 메일이 발송되었습니다.
					이메일 인증 후 사이트 이용이 가능합니다.
				</p>
				<div style="text-align: center">
					<form action="mailAuth" method="POST">
						<div>
							<label for="mailAuthNumber">인증번호</label>
							<input type="number" id="mailAuthNumber"
							name="mailAuthNumber" placeholder="인증번호를 입력하세요.">
						</div>
						<br>
						<button id="mailAuthBtn" type="submit" class="btn btn-primary">
							전송
						</button>
					</form>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>