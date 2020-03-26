<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/main.css" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<style>
	#loginBtn {
		background-color: #917EC6;
		color:#fff;
	}
	#forgotForm{
		color: #555;
	}
	#forgotForm:hover{
		color: #917EC6;
		text-decoration: none;
	}
	#saveIdLabel{
		margin: 0.2em 0em;
	}
	#save{
		font-size: 0.75em;
	}
	#kakao-login-btn{
		margin-bottom: 0.5em;
	}
	/* .subMenu{
		padding-left: 0px;
	}
	.subMenu>li{
		position: relative;
	}
	.subMenu ul{
		position: absolute;
		top: 38px;
		left: 0;
		width: 150px;
		padding: 10px; 
		background-color: #C6B4CD;
		border-radius: 3px;
		list-style: none;
		z-index: 9999;
	}
	.subMenu ul a{
		color: white;
	} */
	#nav{
		position: relative;
		background: rgb(198, 180, 205);
		border-bottom: solid 1px #ccc;
		/* padding: 1em 0 1em 0; */
		text-align: center;
		font-family: 'Handon3gyeopsal600g';
	}
	#nav2{
		background: rgb(198, 180, 205);
		border-bottom: solid 1px #ccc;
		text-align: center;
		font-family: 'Handon3gyeopsal600g';
	}
	#nav a{
		color: white;
	}
	#nav a:hover{
		color:rgb(163, 99, 189);
		text-decoration:none;
		list-style:none;
	}
	.dropdown-menu{
		background-color: rgb(198, 180, 205);
		text-align: center; 
		border-radius: 4px; 
	}
	.dropdown-menu a{
		color:inherit;
		text-decoration:none;
		text-align: center; 
	}
	.dropdown-menu a:hover{
		background: rgb(198, 180, 205);
		border:0px;
	}

	.navbar-toggler{
		margin: 0 auto;
	}
	
	#navbarTogglerDemo01{
      	background: rgb(198, 180, 205);
   	}
   	.alarm-dropdown{
   		background-color: rgba(255, 255, 255, 0.8);
   	}
   	.alarm-dropdown > a{
   		border-bottom: solid 0.5px #ccc;
   	}
</style>
</head>
<body>
	<nav id="nav" class="navbar navbar-light navbar-expand-lg px-5">
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse px-5 mx-5" id="navbarTogglerDemo01">
			<ul class="container-fluid navbar-nav d-flex flex-colum flex-md-row justify-content-around">
			<%-- 로그인이 되어있지 않을 경우 로그인 버튼 노출 --%>
			<c:if test="${ empty sessionScope.loginMember }">
				<li class="nav-item"><a id="modal-120930" href="#modal-container-120930" data-toggle="modal" class="nav-link d-md-inline-block">Login</a></li>
				<%-- 로그인 되어있지 않은 경우 END --%>
			</c:if>
			<%-- 로그인 된 경우 --%>
			<c:choose>
				<c:when test="${! empty sessionScope.loginMember && loginMember.memberGrade == 'U' }">
					<li class="nav-item"><a href="${contextPath}/mypage/mypage" class="nav-link d-md-inline-block">MyPage</a></li>
					<li class="nav-item"><a href="${contextPath}/member/logout" class="nav-link d-md-inline-block">Logout</a></li>
				</c:when>
				<c:when test="${!empty sessionScope.loginMember && loginMember.memberGrade == 'A'}">
					<li class="nav-item"><a href="${contextPath}/admin/member/list" class="nav-link d-md-inline-block">Admin</a></li>
					<li class="nav-item"><a href="${contextPath}/member/logout" class="nav-link d-md-inline-block">Logout</a></li>
				</c:when>
			</c:choose>
			<li class="nav-item"><a href="${contextPath}/notice/list" class="nav-link d-md-inline-block">Notice</a></li>
			<li class="nav-item dropdown">
				<a href="#" class="nav-link d-md-inline-block" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Review</a>
				<div class="dropdown-menu mt-3 py-3" aria-labelledby="navbarDropdown">
					<a href="${contextPath}/review/theater" class="dropdown-item">공연장별</a>
					<a href="${contextPath}/review/show" class="dropdown-item">공연별</a>
					<c:if test="${! empty sessionScope.loginMember}">
					<a href="${contextPath}/review/write" class="dropdown-item">리뷰 작성</a>
					</c:if>
				</div>
			</li>
			<li class="nav-item"><a href="${contextPath}/community/list" class="nav-link d-md-inline-block">Community</a></li>
			<li class="nav-item"><a href="${contextPath}/qna/list" class="nav-link d-md-inline-block">Q&A</a></li>
			<c:if test="${! empty sessionScope.loginMember}">
				<li class="nav-item"><a href="${contextPath}/index2" class="nav-link d-md-inline-block"><i class="far fa-comments"></i></a></li>
				<li class="nav-item dropdown">
					<a href="" class="nav-link d-md-inline-block" id="alarmDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<i class="fa fa-bell" aria-hidden="true" style="color:white;"></i>
						<span class="badge badge-pill badge-warning">1</span>
					</a>
					<div class="dropdown-menu alarm-dropdown mt-3 py-3" aria-labelledby="alarmDropdown">
						<a href="" class="dropdown-item text-muted">알람표시</a>
						<a href="" class="dropdown-item text-muted">됩니다</a>
						<a href="" class="dropdown-item text-muted">아마도....</a>
					</div>
				</li>
			</c:if>
			</ul>
		</div>
		</nav>
		<div id="nav2" class="col-4 d-flex justify-content-end align-items-center">
					<div class="modal fade" id="modal-container-120930" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="myModalLabel">로그인</h5>
									<button type="button" class="close" data-dismiss="modal">
										<span aria-hidden="true">×</span>
									</button>
								</div>
								<div class="modal-body">
									<form class="form-signin" method="POST"
										action="${contextPath}/member/login"
										onsubmit="return loginValidate();">
										<input type="text" class="form-control" id="memberId"
											name="memberId" placeholder="아이디"
											value="${cookie.saveId.value }"> <br> <input
											type="password" class="form-control" id="memberPwd"
											name="memberPwd" placeholder="비밀번호">
										<div class="checkbox">
											<label id="saveIdLabel"> <!-- <input type="checkbox"> 아이디 저장 --> <!-- Cookie 배운 후 -->
												<c:if test="${! empty cookie.saveId.value }">
													<input type="checkbox" name="save" id="save" checked> 아이디 저장
												</c:if> <c:if test="${ empty cookie.saveId.value }">
													<input type="checkbox" name="save" id="save"> 아이디 저장
												</c:if>
											</label>
										</div>
										<a id="forgotForm" href="${contextPath}/member/forgotForm">아이디 / 비밀번호 찾기</a>
										<button id="loginBtn" class="btn btn-lg btn-block" type="submit">로그인</button>
										<a class="btn btn-lg btn-secondary btn-block"
											href="${contextPath}/member/signUpForm">회원가입</a>
									</form>
									<hr>
										<a id="kakao-login-btn" style="width: 600px"></a>
									    <a href="http://developers.kakao.com/logout"></a>
									    <script type='text/javascript'>
									      //<![CDATA[
									        // 사용할 앱의 JavaScript 키를 설정해 주세요.
									        Kakao.init('44e60f3df8ed94bfd87cb89c72bd86a0');
									        // 카카오 로그인 버튼을 생성합니다.
									        Kakao.Auth.createLoginButton({
									          container: '#kakao-login-btn',
									          success: function(authObj) {
									            alert(JSON.stringify(authObj));
									          },
									          fail: function(err) {
									             alert(JSON.stringify(err));
									          }
									        });
									      //]]>
									    </script>
									    
									    <!-- 네이버 로그인 창으로 이동 -->
									    <br>
										<div id="naver_id_login" style="text-align:center width: 600px"><a href="${url}">
										<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
										<br>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
				</div>
	
	<script>
		// 로그인 유효성 검사
		function loginValidate(){
			if($("#memberId").val().trim().length == 0){
				alert("아이디를 입력하세요.");
				$("#memberId").focus();
				
				return false;
			}
			
			if($("#memberPwd").val().trim().length == 0){
				alert("비밀번호를 입력하세요.");
				$("#memberPwd").focus();
				
				return false;
			}
			
			return true;
		}
		
		//Review 메뉴 호버 이벤트
	    $(function () {
	      $(".subMenu>li").on({
	        mouseenter: function () {
	          $(this).find("ul").stop().slideDown(300);
	        },
	        mouseleave: function () {
	          $(this).find("ul").stop().slideUp(300);
	        }
	      });
	    });
	</script>
</body>
</html>