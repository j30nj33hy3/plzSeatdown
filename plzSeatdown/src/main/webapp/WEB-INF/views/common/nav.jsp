<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/main.css" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
	<nav id="nav">
		<ul>
			<%-- 로그인이 되어있지 않을 경우 로그인 버튼 노출 --%>
			<c:if test="${ empty sessionScope.loginMember }">
				<div class="col-4 d-flex justify-content-end align-items-center">
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
											name="memberPwd" placeholder="비밀번호"> <br>
										<div class="checkbox mb-3">
											<label> <!-- <input type="checkbox"> 아이디 저장 --> <!-- Cookie 배운 후 -->
												<c:if test="${! empty cookie.saveId.value }">
													<input type="checkbox" name="save" id="save" checked> 아이디 저장
												</c:if> <c:if test="${ empty cookie.saveId.value }">
													<input type="checkbox" name="save" id="save"> 아이디 저장
												</c:if>

											</label>
										</div>
										<br>
										<button class="btn btn-lg btn-success btn-block" type="submit">로그인</button>
										
										<a class="btn btn-lg btn-secondary btn-block"
											href="${contextPath}/member/signUpForm">회원가입</a>
									</form>
									<br>
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
				<li><a id="modal-120930" href="#modal-container-120930" data-toggle="modal">Login</a></li>
				<%-- 로그인 되어있지 않은 경우 END --%>
			</c:if>
			<%-- 로그인 된 경우 --%>
			<c:if test="${! empty sessionScope.loginMember }">
				<li><a href="${contextPath}/member/mypage">MyPage</a></li>
				<li><a href="${contextPath}/member/logout">Logout</a></li>
			</c:if>
			<li><a href="${contextPath}/notice/list">Notice</a></li>
			<li><a href="${contextPath}/review/theater">Review</a>
				<ul>
					<li><a href="${contextPath}/review/theater">공연장별</a></li>
					<li><a href="${contextPath}/review/show">공연별</a></li>
					<li><a href="${contextPath}/review/write">리뷰 작성</a></li>
				</ul></li>
			<li><a href="${contextPath}/community/list">Community</a></li>
			<li><a href="${contextPath}/qna/list">Q&A</a></li>
		</ul>
	</nav>
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
	</script>
</body>
</html>