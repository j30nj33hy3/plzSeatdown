<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage-프로필</title>
<link rel="stylesheet" href="${contextPath}/resources/css/mypage_changePwd.css"/>

</head>
<body class="homepage is-preload">
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
	
	<!-- Main -->
			<div class="wrapper style1">
				<div class="container">
					<div class="row gtr-200">
					
					<div class="col-2 col-12-mobile" id="sidebar" style="width: 200px;">
						<h4><a href="mypage">비밀번호 변경</a></h4>
							<ul>
								<li><a href="mypage">프로필</a></li>
								<li><a href="changePwd">비밀번호 변경</a></li>
								<li><a href="secession">회원 탈퇴</a></li>
								<li><a href="myreview">내 리뷰</a></li>
								<li><a href="myticket">내 티켓</a></li>
								<li><a href="ask">문의 내역</a></li>
							</ul>
					</div>		


						<div class="col-10 col-12-mobile imp-mobile" id="content">
							<form id="profile" action="updatePwd" onsubmit="return validate();" method="POST">
								<div class="idbox">
									<div class="form-group2 col-8 idcheck" style="width:500px">
										<span><b>아이디</b></span>
										<span><b>|</b></span>
										<span><b>${loginMember.memberId}</b></span>
									</div>
								</div>
								<div class="form-group col-8 mb-0">
									<label for="currentPwd" class="user">현재 비밀번호</label>
									<input type="password" class="form-control" id="currentPwd" name="memberPwd"  style="border-radius: 1em;">
								</div>
								<div class="form-group col-8 mb-0">
									<label for="newPwd1" class="user">새 비밀번호</label>
									<input type="password" class="form-control" id="newPwd1" name="newPwd1" style="border-radius: 1em;">
								</div>
								<div class="form-group col-8 npwdc mb-0">
									<label for="newPwd2" class="user">새 비밀번호 확인</label>
									<input type="password" class="form-control" id="newPwd2" name="newPwd2" style="border-radius: 1em;">
								</div>
								<button id="updatebtn" type="submit" class="btn btn-outline-secondary">변경</button>
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