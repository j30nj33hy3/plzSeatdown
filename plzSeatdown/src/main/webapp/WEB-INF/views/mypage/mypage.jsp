<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage-프로필</title>
<link rel="stylesheet" href="${contextPath}/resources/css/mypage_profile.css"/>
</head>
<body class="homepage is-preload">
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
	
	<!-- Main -->
			<div class="wrapper style1">
				<div class="container">
					<div class="row gtr-200">
					
						<div class="col-2 col-12-mobile" id="sidebar" style="width: 200px;">
						<h4><a href="mypage">프로필</a></h4>
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
							<form id="profile" action="updateprofile" method="POST">
								<div id="image">
									<img id="img1" src="${contextPath}/resources/images/user.png" alt="profile"/>
								</div>
								<div>
									<input type="file" id="img2" name="imageUpload" style="width: 300px;">
								</div>
								<div class="form-group col-8 mb-0">
									<label for="userId" class="user">아이디</label>
									<input type="text" class="form-control" id="userId" value="${member.memberId}" readonly style="border-radius: 1em;">
								</div>
								<div class="form-group col-8 mb-0">
									<label for="userName" class="user">이름</label>
									<input type="text" class="form-control" id="userName" value="${member.memberName}" readonly style="border-radius: 1em;">
								</div>
								<div class="form-group col-8 mb-0">
									<label for="userNickname" class="user">닉네임</label>
									<input type="text" class="form-control" id="userNickname" value="${member.memberNickname}" style="border-radius: 1em;">
									<button id="updatebtn" type="button" class="btn btn-outline-secondary">수정</button>
								</div>
								<div class="form-group col-8 mb-0">
									<label for="userEmail" class="user">이메일</label>
									<input type="email" class="form-control" id="userEmail" value="${member.memberEmail}" readonly style="border-radius: 1em;">
								</div>
							</form>
						</div>

					</div>
				</div>
			</div>
	
	
	<!-- 이미지 업로드 jQuery -->
              <script type="text/javascript">
                function readURL(input) {
                  if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                      $('#img1').prop('src', e.target.result);
                    }
                    reader.readAsDataURL(input.files[0]);
                  }  
                }

                $("#img2").change(function () {
                  readURL(this);
                });
              </script>
            </div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>