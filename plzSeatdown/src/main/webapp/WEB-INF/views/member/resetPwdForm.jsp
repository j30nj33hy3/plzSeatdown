<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
<link rel="stylesheet" href="${contextPath}/resources/css/member-resetPwd.css" />

</head>
<body class="homepage is-preload">
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
	<div class="container">
		<div class="row pwdContainer">
			<div class="col-md-1"></div>
			<div class="col-md-10">
					<h4>비밀번호 재설정</h4>
					<p style="color: #965AAD; font-weight: bold">
						비밀번호 변경 후 서비스를 이용해 주시기 바랍니다.
					</p>
					<form action="resetPwd" method="POST" style="text-align: center" onsubmit="return validate();">
						<!-- 비밀번호 -->
						<div class="form-group">
							<div class="row">
								<div class="col-md-3">
									<label for="pwd1">
										변경 비밀번호
									</label>
								</div>
								<div class="col-md-6">
									<input type="password" class="form-control" id="pwd1" name="memberPwd" maxlength="30" placeholder="비밀번호 입력" required/>
								</div>
							</div>
							<div>
                            	<span id="checkPwd1">&nbsp;</span>
                        	</div>
						</div>
								
						<!-- 비밀번호 확인 -->
						<div class="form-group">
							<div class="row">
								<div class="col-md-3">
									<label for="pwd2">
										비밀번호 확인
									</label>
								</div>
								<div class="col-md-6">
									<input type="password" class="form-control" id="pwd2" maxlength="30" placeholder="비밀번호 확인" required/>
								</div>
							</div>
							<div>
                            	<span id="checkPwd2">&nbsp;</span>
                        	</div>
						</div>
						<br>
						<input type="hidden" name="memberId" value="${memberId}">
						<div id="submitBtnBox">
							<button id="submitBtn" type="submit" class="btn btn-primary">
								변경
							</button>
						</div>
					</form>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script type="text/javascript">
	
		var resetPwdCheck = {
				"pwd1":false,
				"pwd2":false,
		}
		
		$(function(){
			var $pwd1 = $("#pwd1");
			var $pwd2 = $("#pwd2");
			
			// 비밀번호  유효성 검사
			$pwd1.on("input", function(){
				//영어 대,소문자 + 숫자, 총 6~12글자
				var regExp = /^[A-Za-z0-9]{6,12}$/;
				if(!regExp.test($pwd1.val())){ 
                	$("#checkPwd1").text("비밀번호 형식이 유효하지 않습니다.").css("color","red");
                	resetPwdCheck.pwd1 = false;
                }else{
                	$("#checkPwd1").text("유효한 비밀번호 형식입니다.").css("color","green");
                	resetPwdCheck.pwd1 = true;
                }

			});
			
			
			// 비밀번호 일치 여부
			$pwd2.on("input", function(){
				if($pwd1.val().trim() != $pwd2.val().trim()){
					$("#checkPwd2").text("비밀번호 불일치").css("color","red");
					resetPwdCheck.pwd2 = false;
				}else{
					$("#checkPwd2").text("비밀번호 일치").css("color","green");
					resetPwdCheck.pwd2 = true;
				}
			});
		});
		
		// submit 동작
		function validate(){
			for(var key in resetPwdCheck){
				if(!resetPwdCheck[key]){
					alert("일부 입력값이 잘못되었습니다.");
					var id = "#"+key;
					$(id).focus();
					return false;
				}
			}
		}
		
	</script>
</body>
</html>