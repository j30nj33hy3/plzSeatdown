<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="${contextPath}/resources/css/member-signUp.css" />
<link rel="stylesheet" href="${contextPath}/resources/css/member-progress.css" />
<style>
	/* number 태그 화살표 제거 */
	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
		-webkit-appearance: none;
		margin: 0;
	}
</style>
</head>
<body class="homepage is-preload">
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
	
	<!-- Main -->
	<div class="signUpStyle">
		<div class="container">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<div class="row">
						<div id="signUpTitle" class="col-md-3">
							<h4>회원가입</h4>
						</div>
			
						<div id="signUpFormBox" class="col-md-6">
							<div class="step-box">
								<div class="step-state step1">
									<ul>
										<li><p>회원가입</p></li>
										<li><p>정보입력</p></li>
										<li><p>이메일 인증</p></li>
										<li><p>가입완료</p></li>
									</ul>
								</div>
							</div>
							<form action="signUp" enctype="multipart/form-data" role="form" method="POST" onsubmit="return validate();">
								<!-- 아이디 -->
								<div class="form-group">
									<label for="id">
										아이디
									</label>
									<input type="text" class="form-control" id="id" name="memberId" 
										maxlength="20" placeholder="아이디 입력" autocomplete="off" required/>
									<input type="hidden" name="idDup" id="idDup" value="false">
									<div>
	                            		<span id="checkId" style="font-size: 0.8em">첫 글자 영어 소문자, 나머지 영어 대·소문자,숫자 조합 (6~12글자)</span>
	                        		</div>
								</div>
                        		
                        		<!-- 비밀번호 -->
								<div class="form-group">
									<label for="pwd1">
										비밀번호
									</label>
									<input type="password" class="form-control" id="pwd1" name="memberPwd" maxlength="30" placeholder="비밀번호 입력" required/>
									<div>
                            			<span id="checkPwd1" style="font-size: 0.8em">&nbsp;</span>
                        			</div>
								</div>
								
								<!-- 비밀번호 확인 -->
								<div class="form-group">
									<label for="pwd2">
										비밀번호 확인
									</label>
									<input type="password" class="form-control" id="pwd2" maxlength="30" placeholder="비밀번호 확인" required/>
									<div>
                            			<span id="checkPwd2" style="font-size: 0.8em">&nbsp;</span>
                        			</div>
								</div>
								
								<!-- 이름 -->
								<div class="form-group">
									<label for="name">
										이름
									</label>
									<input type="text" class="form-control" id="name" name="memberName" maxlength="10" required/>
									<div>
                            			<span id="checkName" style="font-size: 0.8em">&nbsp;</span>
                        			</div>
								</div>
								
								<!-- 닉네임 -->
								<div class="form-group">
									<label for="nickname">
										닉네임
									</label>
									<input type="text" class="form-control" id="nickname" name="memberNickname" maxlength="10" required/>
									<input type="hidden" name="nicknameDup" id="nicknameDup" value="false">
									<div>
                            			<span id="checkNickname" style="font-size: 0.8em">한글, 영어 대·소문자, 숫자 조합 가능</span>
                        			</div>
								</div>
								
			                    <!-- 이메일 -->
			                    <div class="form-row">
			                        <div class="col-md-3">
			                            <label for="email">이메일</label>
			                        </div>
			                        <div class="col-md-9">
			                            <input type="email" class="form-control" id="email" name="memberEmail" autocomplete="off" required>
			                        </div>
			                    </div>
			                    <div>
			                       	<span id="checkEmail" style="font-size: 0.8em">&nbsp;</span>
			                    </div>
			                    
								<!-- 전화번호 -->
			                    <div class="row mb-3 form-row">
			                        <div class="col-md-3">
			                            <label for="phone1">전화번호</label>
			                        </div>
			                        <!-- 전화번호1 -->
			                        <div class="col-md-3">
			                            <select class="custom-select" id="phone1" name="phone1" required>
			                                <option>010</option>
			                                <option>011</option>
			                                <option>016</option>
			                                <option>017</option>
			                                <option>019</option>
			                            </select>
			                        </div>
                        
			                        <!-- 전화번호2 -->
			                        <div class="col-md-3">
			                            <input type="number" class="form-control phone" id="phone2"  maxlength="4" name="phone2" required>
			                        </div>
			                        
			                        <!-- 전화번호3 -->
			                        <div class="col-md-3">
			                            <input type="number" class="form-control phone" id="phone3"  maxlength="4" name="phone3" required>
			                        </div>
			                    </div>
			                    <div>
			                        <span id="checkPhone" style="font-size: 0.8em">&nbsp;</span>
			                    </div>
			                    <!-- 프로필사진 -->
			                    <div class="form-row">
				                	<div class="col-md-4">
				                    	<label for="profileImg">프로필사진</label>
				                    	<br>
				                    	<a id="deleteImg" style="color:#fff" class="btn btn-primary"><i class="fas fa-user-times"></i> 삭제</a>
				                    </div>
				                    <div class="col-md-8">
				                    	<div class="profileImg" id="profileImgArea">
				                       		<img id="profileImg" src="${contextPath}/resources/images/user.png" width="200" height="200" style="border-radius: 5em">
				                       	</div>
				                        <div id="fileArea">
											<input type="file" id="img1" name="profile" onchange="LoadImg(this)">
										</div>
										<br>
										<div>
                            				<span id="checkProfile" style="color:#666; font-size:0.8em;">
                            					기본 제공 사진이 자동으로 등록됩니다.
                            				</span>
                        				</div>
				                    </div>
			                    </div>
			                    <br>
								<button id="signUpBtn" type="submit" class="btn btn-primary">
									회원가입
								</button>
							</form>
						</div>
					</div>
				</div>
				<div class="col-md-1">
					
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<!-- Script -->
	<!-- 이미지 업로드 jQuery -->
    <script type="text/javascript">

    	// 유효성 검사 결과를 저장할 객체
    	var signUpCheck = {
    			"id":false,
    			"idDup":false,
    			"pwd1":false,
    			"pwd2":false,
    			"name":false,
    			"nickname":false,
    			"nicknameDup":false,
    			"email":false
    	}
    	
    	// 실시간 입력 형식 검사
    	// 정규표현식
		$(function(){
			
			// jQuery 변수 : 변수에 직접적으로 jQuery 메소드를 사용할 수 있음
			var $id = $("#id");
			var $pwd1 = $("#pwd1");
			var $pwd2 = $("#pwd2");
			var $name = $("#name");
			var $nickname = $("#nickname");
			var $email = $("#email");
			var $phone2 = $("#phone2");
			var $phone3 = $("#phone3");
			var $img1 = $("#img1");
			
			// 아이디  유효성 검사
			$id.on("input", function(){
				// 첫글자는 영어 소문자, 나머지 글자는 영어 대,소문자 + 숫자, 총 6~12글자
				var regExp = /^[a-z][a-zA-z\d]{5,11}$/;
				if(!regExp.test($id.val())){
                	$("#checkId").text("아이디 형식이 유효하지 않습니다.").css({"color":"red"});
                	signUpCheck.id = false;
                }else{
                	signUpCheck.id = true;
                	$.ajax({
                		url : "idDupCheck",
                		data : {memberId: $id.val() },
                		type : "post",
                		success : function(result){
                			
                			if(result == "true"){
                				$("#checkId").text("사용 가능한 아이디 입니다.").css({"color":"green"});
                				signUpCheck.idDup = true;
                			}else{
                				$("#checkId").text("사용할 수 없는 아이디 입니다.").css({"color":"red"});
                				signUpCheck.idDup = false;
                			}
                		},
                		
                		error : function(e){
                			console.log("ajax 통신 실패");
                			console.log(e);
                		}
                	});
                	signUpCheck.idDup = true;
                	
                }
			});
			
			// 비밀번호  유효성 검사
			$pwd1.on("input", function(){
				//영어 대,소문자 + 숫자, 총 6~12글자
				var regExp = /^[A-Za-z0-9]{6,12}$/;
				if(!regExp.test($pwd1.val())){ 
                	$("#checkPwd1").text("비밀번호 형식이 유효하지 않습니다.").css("color","red");
                	signUpCheck.pwd1 = false;
                }else{
                	$("#checkPwd1").text("유효한 비밀번호 형식입니다.").css("color","green");
                	signUpCheck.pwd1 = true;
                }

			});
			
			
			// 비밀번호 일치 여부
			$pwd2.on("input", function(){
				if($pwd1.val().trim() != $pwd2.val().trim()){
					$("#checkPwd2").text("비밀번호 불일치").css("color","red");
					signUpCheck.pwd2 = false;
				}else{
					$("#checkPwd2").text("비밀번호 일치").css("color","green");
					signUpCheck.pwd2 = true;
				}
			});
			
			// 이름 유효성 검사
			$name.on("input", function(){
				var regExp =  /^[가-힣]{2,}$/; // 한글 두 글자 이상
				
				if(!regExp.test($(this).val())){ // 이름이 정규식을 만족하지 않을경우
					$("#checkName").text("한글 두 글자 이상을 입력하세요").css("color","red");
					signUpCheck.name = false;
				}else{
					$("#checkName").text("정상입력").css("color","green");
					signUpCheck.name = true;
				}
			});
			
			// 닉네임  유효성 검사
			$nickname.on("input", function(){
				var regExp = /^[A-Za-z\d가-힣]{2,10}$/;
				if(!regExp.test($nickname.val())){
                	$("#checkNickname").text("닉네임 형식이 유효하지 않습니다.").css({"color":"red"});
                	signUpCheck.nickname = false;
                }else{
                	signUpCheck.nickname = true;
                	$.ajax({
                		url : "nicknameDupCheck",
                		data : {memberNickname: $nickname.val() },
                		type : "post",
                		success : function(result){
                			if(result == "true"){
                				$("#checkNickname").text("사용 가능한 닉네임 입니다.").css({"color":"green"});
                				signUpCheck.nicknameDup = true;
                			}else{
                				$("#checkNickname").text("사용할 수 없는 닉네임 입니다.").css({"color":"red"});
                				signUpCheck.nicknameDup = true;
                			}
                		},
                		
                		error : function(e){
                			console.log("ajax 통신 실패");
                			console.log(e);
                		}
                	});
                	signUpCheck.nicknameDup = true;
                	
                }
			});
			
			
			// 전화번호 관련
		 	$(".phone").on("input",function(){
		 		
				// 전화번호 input 태그에 4글자 이상 입력하지 못하게 하는 이벤트
                if ($(this).val().length > $(this).prop("maxLength")){
                    $(this).val($(this).val().slice(0, $(this).prop("maxLength")));
                }
                
				// 전화번호 유효성 검사
                var regExp1 =  /^\d{3,4}$/; // 숫자 3~4 글자
                var regExp2 =  /^\d{4,4}$/; // 숫자 4 글자
                
                if(!regExp1.test($phone2.val()) || !regExp2.test($phone3.val())){
                	$("#checkPhone").text("전화번호가 유효하지 않습니다.").css("color","red");
					signUpCheck.phone = false;
                }else{
					$("#checkPhone").text("유효한 전화번호입니다.").css("color","green");
					signUpCheck.phone = true;
				}
				
				
            });
			
			// 이메일 유효성 검사
			$email.on("input", function(){
				var regExp =  /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/; // 한글 두 글자 이상
				
				if(!regExp.test($(this).val())){ // 이름이 정규식을 만족하지 않을경우
					$("#checkEmail").text("이메일 형식이 유효하지 않습니다.").css("color","red");
					signUpCheck.email = false;
				}else{
					$("#checkEmail").text("유효한 이메일 형식입니다.").css("color","green");
					signUpCheck.email = true;
				}
			});
			
			$img1.on("input", function(){
				if($(this).val()!=""){
					$("#checkProfile").text("삭제하려면 삭제 버튼을 눌러주세요.").css("color","#888");
				}
			});
			
			
			$("#fileArea").hide();
			$("#profileImgArea").click(function(){
				$("#img1").click();
			});
			$("#deleteImg").click(function(){
				$("#profileImg").attr("src", "${contextPath}/resources/images/user.png");
				$("#img1").val("");
				$("#checkProfile").text("기본 제공 사진이 자동으로 등록됩니다.").css("color","#888");
			});
		});
		
    	function LoadImg(value){
    		if(value.files && value.files[0]){
    			var reader = new FileReader();
    			
    			reader.onload = function(e){
    				$("#profileImg").attr("src", e.target.result);
    			}
    		}
    		reader.readAsDataURL(value.files[0]);
    	}
    	
    	// submit 동작
		function validate(){
			// 아이디 중복 검사 결과
			//if( $("#idDup").val() == "true")	signUpCheck.idDup = true;
			//else				  				signUpCheck.idDup = false;
			for(var key in signUpCheck){
				if(!signUpCheck[key]){
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