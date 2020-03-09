<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage-프로필</title>
<link href="mypage-changePwd.css" rel="stylesheet">
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
							<form id="profile" action="updatePwd" method="POST">
								<div class="idbox">
									<div class="form-group2 col-8 idcheck">
										<span><b>아이디</b></span>
										<span><b>|</b></span>
										<span><b>${loginMember.memberId}</b></span>
									</div>
								</div>
								<div class="form-group col-8">
									<label for="currentPwd" class="user">현재 비밀번호</label>
									<input type="password" class="form-control" id="currentPwd">
								</div>
								<div class="form-group col-8">
									<label for="newPwd1" class="user">새 비밀번호</label>
									<input type="password" class="form-control" id="newPwd1">
								</div>
								<div class="form-group col-8 npwdc">
									<label for="newPwd2" class="user">새 비밀번호 확인</label>
									<input type="password" class="form-control" id="newPwd2">
								</div>
								<button type="button" class="btn btn-outline-secondary updatebtn">변경</button>
							</form>
						</div>

					</div>
				</div>
			</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	<script>
		// submit 동작
		function validate() {
			// 비밀번호  유효성 검사
			//영어 대,소문자 + 숫자, 총 6~12글자
			var regExp = /^[A-Za-z0-9]{6,12}$/;
			if(!regExp.test($("#newPwd1").val())){ 
				alert("유효하지 않은 비밀번호 입니다.");
				$("#newPwd1").focus();
				
				return false;
            }
			
			if($("#newPwd1").val() != $("#newPwd2").val()){
				alert("새 비밀번호가 일치하지 않습니다.");
				$("#newPwd2").focus();
				
				return false;
			}

		}
		
	</script>
	
</body>
</html>