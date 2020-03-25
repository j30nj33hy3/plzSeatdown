<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/buttercake@3.0.0/dist/css/butterCake.min.css">
  <link rel="stylesheet" href="${contextPath}/resources/css/chat.css" />
<meta charset="UTF-8">
<title>PleaseSeatDown</title>
</head>
<!-- LOGIN CONTAINER -->
<body class="homepage is-preload">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/nav.jsp" />
	<section class="login-page flex-center-center py-5 bg-light">
		<!-- FORM -->
		<div class="w-100 mx-auto px-2" style="max-width: 400px">
			<form action="${pageContext.request.contextPath}/chatting.do"
				method="post">
				<div class="card overflow-unset mt-9 mb-1">
					<div class="card-body">
						<!-- profile -->
						<div class="avatar-icon text-center">
							<img src="https://placehold.it/128x128" alt="Avatar"
								class="img-circle">
						</div>
						<!-- EMAIL -->
						<div class="group">
							<input type="text" class="input" name="userName" id="userName"
								placeholder="닉네임 입력">
						</div>
						<!-- LOGIN -->
						<div class="group">
							<button id="chatBtn" class="btn btn-primary" >입장하기</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>
	<script src="https://cdn.jsdelivr.net/npm/buttercake@3.0.0/dist/js/butterCake.min.js"></script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>