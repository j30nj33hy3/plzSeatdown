<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage-프로필</title>
<link href="mypage-secession.css" rel="stylesheet">
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
							<form id="profile" action="deleteMember" method="POST">
								<div class="idbox">
									<div class="form-group2 col-8 idcheck">
										<span>아이디</span>
										<span><b>${loginMember.memberId}</b></span>
										<span><b>|</b></span>
										<span>비밀번호</span>
										<input type="password" class="form-control" id="userPwd">
									</div>
								</div>
								<div class="form-group col-8">
									<label for="exampleTextarea"><b>회원탈퇴 약관</b><img src="images/exit.png" width=25 height=30 style="margin-left:5px;"></label>
									<div>
										<textarea class="form-control" id="exampleTextarea" rows="7" cols="100" readonly>

제1조
이 약관은 샘플 약관입니다.

① 약관 내용 1

② 약관 내용 2

③ 약관 내용 3

④ 약관 내용 4


제2조
이 약관은 샘플 약관입니다.

① 약관 내용 1

② 약관 내용 2

③ 약관 내용 3

④ 약관 내용 4
										</textarea>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input" id="customCheck1" checked="">
											<label class="custom-control-label" for="customCheck1">이 약관에 동의합니다</label>
										</div>
									</div>
    								</div>
								<button type="button" class="btn btn-outline-secondary updatebtn">변경</button>
							</form>
						</div>
						
					</div>
				</div>
			</div>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>