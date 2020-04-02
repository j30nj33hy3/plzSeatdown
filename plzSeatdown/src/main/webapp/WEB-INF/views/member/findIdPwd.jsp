<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
<link rel="stylesheet" href="${contextPath}/resources/css/member-findIdPwd.css" />
</head>
<body class="homepage is-preload">
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
	<div class="container findContainer">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div id="wrapper">
					<h4><i id="infoIcon" class="fas fa-info-circle"></i> 아이디 / 비밀번호 찾기</h4>
					<hr>
					<ul class="infomation">
						<li><p>SNS계정(네이버, 카카오)회원은 아이디/비밀번호 찾기가 제공되지 않습니다.</p></li>
						<li><p>회원가입시 입력하셨던 정보로만 확인이 가능합니다.</p></li>
						<li><p>가입 당시 입력한 이메일로 비밀번호 재설정 메일을 발송합니다.</p></li>
					</ul>
					<br>
					<br>
					<!-- 탭 메뉴 영역 -->
					<ul class="tabs">
						<li><a href="#tab1">아이디 찾기</a></li>
						<li><a href="#tab2">비밀번호 찾기</a></li>
					</ul>
					<!-- 탭 콘텐츠 영역 -->
					<div class="tab-container">
						<div id="tab1" class="tab-content">
							<form class="form-horizontal" role="form" method="POST" action="findId" onsubmit="return validate();">
								<div class="row">
									<div class="col-md-2"></div>
									<div class="col-md-8">
										<div class="form-group has-danger">
											<div class="input-group mb-2 mr-sm-2 mb-sm-0">
												<label for="name" class="labelBox">이름</label>&nbsp;&nbsp;
												<input type="text" name="memberName" class="form-control"
												id="name" placeholder="이름" required autofocus>
											</div>
											<div class="checkMsg">
			                            		<span id="checkName" style="font-size: 0.8em">&nbsp;</span>
			                        		</div>
										</div>
									</div>
									<div class="col-md-2"></div>
								</div>
								<div class="row">
									<div class="col-md-2"></div>
									<div class="col-md-8">
										<div class="form-group">
											<div class="input-group mb-2 mr-sm-2 mb-sm-0">
												<label for="email1" class="labelBox">이메일</label>&nbsp;&nbsp;
												<input type="text" name="email1" class="form-control"
												id="email1" placeholder="계정" required>&nbsp;@&nbsp;
												<input type="text" name="email2" class="form-control"
												id="email2" placeholder="도메인" required>
												<select id="selectEmail" name="selectEmail" class="form-input">
													<option value="1">직접입력</option>
													<option value="naver.com">naver.com</option>
													<option value="gmail.com">gmail.com</option>
													<option value="daum.net">daum.net</option>
													<option value="hanmail.net">hanmail.net</option>
													<option value="nate.com">nate.com</option>
												</select>
											</div>
											<div class="checkMsg">
							                	<span id="checkEmail" style="font-size: 0.8em">&nbsp;</span>
							               	</div>
										</div>
									</div>
									<div class="col-md-2"></div>
								</div>
								<div class="row">
									<div class="col-md-2"></div>
									<div class="col-md-8 findBox">
										<button id="findBtn" type="submit" class="btn btn-primary">
											찾기
										</button>
									</div>
									<div class="col-md-2"></div>
								</div>
							</form>
						</div>
						<div id="tab2" class="tab-content">
							<form class="form-horizontal" role="form" method="POST" action="findPwd" onsubmit="return validate2();">
								<div class="row">
									<div class="col-md-2"></div>
									<div class="col-md-8">
										<div class="form-group has-danger">
											<div class="input-group mb-2 mr-sm-2 mb-sm-0">
												<label for="id" class="labelBox">아이디</label>&nbsp;&nbsp;
												<input type="text" name="memberId" class="form-control"
												id="id" placeholder="아이디" required autofocus>
											</div>
											<div class="checkMsg">
			                            		<span id="checkId" style="font-size: 0.8em">&nbsp;</span>
			                        		</div>
										</div>
									</div>
									<div class="col-md-2"></div>
								</div>
								<div class="row">
									<div class="col-md-2"></div>
									<div class="col-md-8">
										<div class="form-group has-danger">
											<div class="input-group mb-2 mr-sm-2 mb-sm-0">
												<label for="name2" class="labelBox">이름</label>&nbsp;&nbsp;
												<input type="text" name="memberName" class="form-control"
												id="name2" placeholder="이름" required>
											</div>
											<div class="checkMsg">
			                            		<span id="checkName2" style="font-size: 0.8em">&nbsp;</span>
			                        		</div>
										</div>
									</div>
									<div class="col-md-2"></div>
								</div>
								<div class="row">
									<div class="col-md-2"></div>
									<div class="col-md-8">
										<div class="form-group">
											<div class="input-group mb-2 mr-sm-2 mb-sm-0">
												<label for="email3" class="labelBox">이메일</label>&nbsp;&nbsp;
												<input type="text" name="email3" class="form-control"
												id="email3" placeholder="계정" required>&nbsp;@&nbsp;
												<input type="text" name="email4" class="form-control"
												id="email4" placeholder="도메인" required>
												<select id="selectEmail2" name="selectEmail2" class="form-input">
													<option value="1">직접입력</option>
													<option value="naver.com">naver.com</option>
													<option value="gmail.com">gmail.com</option>
													<option value="daum.net">daum.net</option>
													<option value="hanmail.net">hanmail.net</option>
													<option value="nate.com">nate.com</option>
												</select>
											</div>
											<div class="checkMsg">
							                	<span id="checkEmail2" style="font-size: 0.8em">&nbsp;</span>
							                </div>
										</div>
									</div>
									<div class="col-md-2"></div>
								</div>
								<div class="row">
									<div class="col-md-2"></div>
									<div class="col-md-8 findBox">
										<button id="findBtn2" type="submit" class="btn btn-primary">
											찾기
										</button>
									</div>
									<div class="col-md-2"></div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
		// 유효성 검사 결과를 저장할 객체
		var findIdCheck = {
				"name" : false,
				"email1" : false,
				"email2" : false
		}
		$(function(){
			$(".tab-content").hide();
			$("ul.tabs li:first").addClass("active").show();
			$(".tab-content:first").show();
			
			// onClick 이벤트
			$("ul.tabs li").click(function(){
				$("ul.tabs li").removeClass("active");
				$(this).addClass("active");
				$(".tab-content").hide();
				
				var activeTab = $(this).find("a").attr("href");
				$(activeTab).fadeIn();
				return false;
			});
			
			$("#selectEmail").change(function(){
				$("#selectEmail option:selected").each(function(){
					if($(this).val() == "1"){ // 직접 입력일 경우
						$("#email2").val(''); // 값 초기화
						$("#email2").prop("readonly", false); // 입력창 활성화
					}else{ // 직접 입력이 아닐 경우
						$("#email2").val($(this).text()); // 선택값 입력
						/* console.log($("#email2").val()); */
						
						$("#email2").attr("readonly", true); // 입력창 비활성화
					}
				});
			});
			
			var $name = $("#name");
			var $email1 = $("#email1");
			var $email2 = $("#email2");
			
			// 이름 유효성 검사
			$name.on("input", function(){
				var regExp =  /^[가-힣]{2,}$/; // 한글 두 글자 이상
				if(!regExp.test($(this).val())){ 
					$("#checkName").text("한글 두 글자 이상을 입력하세요").css("color","red");
					findIdCheck.name = false;
				}else{
					$("#checkName").text("정상입력").css("color","green");
					findIdCheck.name = true;
				}
			});
			
			// 이메일 유효성 검사 /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/;
			$email1.on("input", function(){
				var regExp =  /^[\w]{4,}$/; 
				
				if(!regExp.test($(this).val())){ 
					$("#checkEmail").text("이메일 형식이 유효하지 않습니다.").css("color","red");
					findIdCheck.email1 = false;
				}else{
					findIdCheck.email1 = true;
				}
			});
			
			$email2.on("input", function(){
				var regExp2 =  /^[\w]+(\.[\w]+){1,3}$/; 
				
				if(!regExp2.test($(this).val())){ 
					$("#checkEmail").text("이메일 형식이 유효하지 않습니다.").css("color","red");
					findIdCheck.email2 = false;
				}else{
					$("#checkEmail").text("유효한 이메일 형식입니다.").css("color","green");
					findIdCheck.email2 = true;
				}
			});
			
			$("#selectEmail").change(function(){
				var regExp =  /^[\w]{4,}$/; 
				var regExp2 =  /^[\w]+(\.[\w]+){1,3}$/; 
				
				if(!regExp.test($email1.val()) || !regExp2.test($email2.val())){ 
					$("#checkEmail").text("이메일 형식이 유효하지 않습니다.").css("color","red");
					findIdCheck.email2 = false;
				}else{
					$("#checkEmail").text("유효한 이메일 형식입니다.").css("color","green");
					findIdCheck.email2 = true;
				}
			});
		});
		
		// submit 동작
		function validate(){
			// 아이디 중복 검사 결과
			for(var key in findIdCheck){
				if(!findIdCheck[key]){
					alert("일부 입력값이 잘못되었습니다.");
					var id = "#"+key;
					$(id).focus();
					return false;
				}
			}
		}
		
		var findPwdCheck = {
				"id" : false,
				"name2" : false,
				"email3" : false,
				"email4" : false
		}
		
		$(function(){
			var $id= $("#id");
			var $name2 = $("#name2");
			var $email3 = $("#email3");
			var $email4 = $("#email4");
			
			$("#selectEmail2").change(function(){
				$("#selectEmail2 option:selected").each(function(){
					if($(this).val() == "1"){ // 직접 입력일 경우
						$("#email4").val(''); // 값 초기화
						$("#email4").prop("readonly", false); // 입력창 활성화
					}else{ // 직접 입력이 아닐 경우
						$("#email4").val($(this).text()); // 선택값 입력
						$("#email4").attr("readonly", true); // 입력창 비활성화
					}
				});
			});
			
			$id.on("input", function(){
				// 첫글자는 영어 소문자, 나머지 글자는 영어 대,소문자 + 숫자, 총 6~12글자
				var regExp = /^[a-z][a-zA-z\d]{5,11}$/;
				if(!regExp.test($id.val())){
	            	$("#checkId").text("아이디 형식이 유효하지 않습니다.").css({"color":"red"});
	            	findPwdCheck.id = false;
	            }else{
	            	$("#checkId").text("정상입력").css({"color":"green"});
	            	findPwdCheck.id = true;
	            }
			});
			
			// 이름 유효성 검사
			$name2.on("input", function(){
				var regExp =  /^[가-힣]{2,}$/; // 한글 두 글자 이상
				if(!regExp.test($(this).val())){ 
					$("#checkName2").text("한글 두 글자 이상을 입력하세요").css("color","red");
					findPwdCheck.name2 = false;
				}else{
					$("#checkName2").text("정상입력").css("color","green");
					findPwdCheck.name2 = true;
				}
			});
			
			// 이메일 유효성 검사 /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/;
			$email3.on("input", function(){
				var regExp =  /^[\w]{4,}$/; 
				
				if(!regExp.test($(this).val())){
					$("#checkEmail2").text("이메일 형식이 유효하지 않습니다.").css("color","red");
					findPwdCheck.email3 = false;
				}else{
					findPwdCheck.email3 = true;
				}
			});
			
			$email4.on("input", function(){
				var regExp2 =  /^[\w]+(\.[\w]+){1,3}$/; 
				
				if(!regExp2.test($(this).val())){ 
					$("#checkEmail2").text("이메일 형식이 유효하지 않습니다.").css("color","red");
					findPwdCheck.email4 = false;
				}else{
					$("#checkEmail2").text("유효한 이메일 형식입니다.").css("color","green");
					findPwdCheck.email4 = true;
				}
			});
			
			$("#selectEmail2").change(function(){
				var regExp =  /^[\w]{4,}$/; 
				var regExp2 =  /^[\w]+(\.[\w]+){1,3}$/; 
				
				if(!regExp.test($email3.val()) || !regExp2.test($email4.val())){ 
					$("#checkEmail2").text("이메일 형식이 유효하지 않습니다.").css("color","red");
					findIdCheck.email3 = false;
					findIdCheck.email4 = false;
				}else{
					$("#checkEmail2").text("유효한 이메일 형식입니다.").css("color","green");
					findIdCheck.email3 = true;
					findIdCheck.email4 = true;
				}
			});
			// submit 동작
			function validate2(){
				for(var key in findPwdCheck){
					if(!findPwdCheck[key]){
						alert("일부 입력값이 잘못되었습니다.");
						var id = "#"+key;
						$(id).focus();
						return false;
					}
				}
			}
		});
		
	</script>
</body>
</html>