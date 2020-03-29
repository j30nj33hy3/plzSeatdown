<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- include libraries(jQuery, bootstrap) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" 
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" 
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
   
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-bs4.min.js"></script>

<!-- summernote 기능 구현 js -->
<script src="${contextPath}/resources/summernote/js/summernote.js"></script>

<!-- summernote 언어 설정 js -->
<script src="${contextPath}/resources/summernote/dist/summernote.js"></script>
<script src="${contextPath}/resources/summernote/dist/lang/summernote-ko-KR.js"></script>
	
<!-- 아이콘 -->
<script src="https://kit.fontawesome.com/ac130595f7.js" crossorigin="anonymous"></script>
<!-- image click -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
<script src="//cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>	
	
<link rel="stylesheet" href="${contextPath}/resources/css/main.css" />
<link rel="stylesheet" href="${contextPath}/resources/css/noscript.css" />
<script src="http://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script src="http://developers.kakao.com/sdk/js/kakao.min.js"></script>

<style>
#logoContainer{
	margin: 0 auto;
}
#HeadImgArea{
	height:30px;
	display: inline;
}
#HeadImgArea #prof1{
	margin-top:10px;
	width: 30px;
	height: 30px;
	display : block;
}
#intro-msg{
	line-height: 30px;
	color: #fff;
}
#logoutBtn{
	margin: 0 0.5em;
	background-color: #666;
    border: 0px;
}
#logoutBtn:hover{
	background-color: #444;
}
	
#logoutBtn:focus, #logoutBtn:active{
	outline: none !important;
   	box-shadow: none;
}
.otherBtn{
	margin: 0 0.5em;
	background-color: #FFD938;
	color: #000;
    border: 0px;
}
.otherBtn:hover{
	background-color: #FFC107;
	color: #000;
}
.otherBtn:focus, .otherBtn:active{
	outline: none !important;
   	box-shadow: none;
}
.headBtn:focus, .headBtn:active{
	outline: none !important;
   	box-shadow: none;
}
#chatIcon{
	color: #fff;
	padding: 8px 0px;
}
#msgIcon{
	color: #fff;
	padding: 8px 0px;
	margin-right: 1em;
}
#loginArea{
	padding: 0;
}
@media screen and (max-width: 840px) {
	#loginArea{
		font-size: 0.9em;
	}
}
@media screen and (max-width: 767px) {
	#iconBtnBox{
		margin: 1em 0;
	}
	#headBtnArea{
		margin: 15px 0;
	}
}
	#alarmDropdownArea{
   		background-color: rgba(255, 255, 255, 0.9);
   	}
   	#alarmDropdownArea > a{
   		border-bottom: solid 0.5px #ccc;
   		font-size:12px;
   	}
   	#alarmDropdownArea > a:last-child{
   		border-bottom: none;
   	}
   	#alarmDropdown:hover{
   		cursor:pointer;
   	}
   	#alarmDropdownArea a:hover{
   		background-color: rgb(255, 255, 255);
   	}
</style>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/>
	<c:if test="${!empty msg}">
		<script>alert("${msg}")</script>
		<c:remove var="msg"/>
	</c:if>
	<!-- Header -->
	<section id="header">
		<div class="row">
			<div class="col-md-3 mb-4"></div>
			<div id="logoContainer" class="col-md-6 mt-5 mb-5">
					<!-- Logo -->
					<a href="${contextPath}"><img src="${contextPath}/resources/images/logo.png"></a>
			</div>
				<c:if test="${ empty sessionScope.loginMember }">
					<div class="col-md-3 mb-4">
						<div id="headBtnBox" class="mt-3">
							<a id="modal-120930" href="#modal-container-120930" data-toggle="modal" class="btn btn-sm otherBtn d-md-inline-block">Login</a>
							<a href="${contextPath}/member/signUpForm" class="btn btn-sm otherBtn head-menu ">Sign Up</a>
						</div>
					</div>
					<%-- 로그인 되어있지 않은 경우 END --%>
				</c:if>
				<c:if test="${! empty sessionScope.loginMember }">
				<div class="col-md-3">
					<div id="loginArea">
						<div id="HeadImgArea" class="d-inline-block">
							<c:set var="src" value="${contextPath}/resources/images/user.png"/>
					        	<c:if test="${loginMember.profilePath != null}">
					            	<c:set var ="src" value="${contextPath}/resources/profileImages/${loginMember.profilePath}"/>
					            </c:if>
					        <img id="prof1" src="${src}" style="border-radius: 5em;">
						</div>
						<span id="intro-msg">${loginMember.memberNickname }님 앉아주세요</span>
						<div id="iconBtnBox">
							<a class="d-md-inline-block mr-3" id="alarmDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<i class="fa fa-bell" aria-hidden="true" style="color:white;"></i>
								<!-- <span class="badge badge-pill badge-warning" id="alarmBadge">1</span> -->
							</a>
							<div class="dropdown-menu dropdown-menu-right alarm-dropdown mt-2 py-2" aria-labelledby="alarmDropdown" id="alarmDropdownArea">
							</div>
							<a id="msgIcon" href="${contextPath}" class="d-md-inline-block"><i class="fas fa-envelope"></i></a>
							<a id="chatIcon" href="${contextPath}/index2" class="d-md-inline-block"><i class="fas fa-comments"></i></a>
						</div>
						<div id="headBtnArea">
							<c:choose>
								<c:when test="${! empty sessionScope.loginMember && loginMember.memberGrade == 'U' }">
									<button class="btn btn-primary btn-sm d-md-inline-block headBtn otherBtn" onclick="location.href='${contextPath}/mypage/mypage'">MyPage</button>
									<button id="logoutBtn" class="btn btn-primary btn-sm d-md-inline-block headBtn" onclick="location.href='${contextPath}/member/logout'">Logout</button>
								</c:when>
								<c:when test="${!empty sessionScope.loginMember && loginMember.memberGrade == 'A'}">
									<button class="btn btn-primary btn-sm d-md-inline-block headBtn otherBtn" onclick="location.href='${contextPath}/admin/member/list'">Admin</button>
									<button id="logoutBtn" class="btn btn-primary btn-sm d-md-inline-block headBtn" onclick="location.href='${contextPath}/member/logout'">Logout</button>
								</c:when>
							</c:choose>
						</div>
					</div>
				</div>
			</c:if>
		</div>
	</section>
			<div class="modal fade text-center" id="modal-container-120930" role="dialog"
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
	<script type="text/javascript" src="${contextPath}/resources/js/jquery.dropotron.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/jquery.scrolly.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/jquery.scrollex.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/browser.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/breakpoints.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/util.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/main.js"></script>
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
	<script>
	var socket = null;
	
	<c:if test="${!empty loginMember}">
		var socket = new SockJS('<c:url value="/replyAlarmEcho"/>');
	</c:if>
	
	// 출력
	socket.onmessage = function(evt){
		var data = evt.data;
		console.log("ReceiveMessage : " + data + "\n");
		
		toastr.options.closeButton = true;
		toastr.options.progressBar = true;
		toastr.info(data,{timeOut: 5000});
		toastr.options.newestOnTop = true;
	};
	
	socket.onclose = function(evt){
		console.log('connect close');
	};
	
	socket.onerror = function(err){
		console.log('Errors :' , err);
	};
	
	$('#alarmDropdown').on('click',function(){
		var $alarmDropdownArea = $('#alarmDropdownArea');
		$.ajax({
			url : "${contextPath}/alarm/alarmlist",
			type : "POST",
			success : function(alist){
				$alarmDropdownArea.html("");
				if(alist == ""){
					$alarmDropdownArea.append('<p class="text-muted px-1">받은 알림이 없습니다.<br>전체 알림은 마이페이지에서 확인 가능합니다.</p>');
					$alarmDropdownArea.append('<a href="#" class="dropdown-item text-muted font-weight-bold">내 알림 전체보기</a>');
				}else{
					$.each(alist, function(i){
						$alarmDropdownArea.append('<a href="#" class="dropdown-item text-muted updateAlarm">'+alist[i].alarmContent+'</a>');
						$alarmDropdownArea.append('<input type="hidden" value="'+alist[i].alarmUrl+'">');
						$alarmDropdownArea.append('<input type="hidden" value="'+alist[i].alarmNo+'">');
					});
					$alarmDropdownArea.append('<a href="#" class="dropdown-item text-muted font-weight-bold pt-2">내 알림 전체보기</a>');
				}
			},
			error : function(){
				console.log("알림목록조회 ajax 호출 실패");
			}
		})
	});
	
	$(document).on('click','.updateAlarm', function(){
		var alarmUrl = $(this).next().val();
		var alarmNo = $(this).next().next().val();
		location.href = "/plzSeatdown/alarm/updateAlarm?no="+alarmNo+"&url="+alarmUrl;
	});
	</script>
</body>
</html>