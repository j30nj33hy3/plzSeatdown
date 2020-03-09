<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage-프로필</title>
<link href="mypage-profile.css" rel="stylesheet">
</head>
<body class="homepage is-preload">
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
	
	<!-- Main -->
			<div class="wrapper style1">
				<div class="container">
					<div class="row gtr-200">
					
						<jsp:include page="/WEB-INF/views/mypage/sideMenu.jsp"/>

						<div class="col-10 col-12-mobile imp-mobile" id="content">
							<form id="profile" action="updateprofile" method="POST">
								<div class="image">
										<img src="images/user.png" alt="profile"/>
								</div>
								<div class="form-group col-8">
									<label for="userId" class="user">아이디</label>
									<input type="text" class="form-control" id="userId" value="${member.memberId}" readonly>
								</div>
								<div class="form-group col-8">
									<label for="userName" class="user">이름</label>
									<input type="text" class="form-control" id="userName" value="${member.memberName}" readonly>
								</div>
								<div class="form-group col-8">
									<label for="userNickname" class="user">닉네임</label>
									<input type="text" class="form-control" id="userNickname" value="${member.memberNickname}">
									<button type="button" class="btn btn-outline-secondary updatebtn">수정</button>
								</div>
								<div class="form-group col-8">
									<label for="userEmail" class="user">이메일</label>
									<input type="email" class="form-control" id="userEmail" value="${member.memberEmail}" readonly>
								</div>
							</form>
						</div>

					</div>
				</div>
			</div>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>