
        // 각 유효성 검사 결과를 저장할 객체
        var signUpCheck = { 
        		"id":false,
        		"idDup":false,
				"name":false,
				"phone":false,
				"name":false,
				"email":false
				};
        
   	 	// 실시간 입력 형식 검사
		// 정규표현식
		$(document).ready(function(){
			
			// jQuery 변수 : 변수에 직접적으로 jQuery메소드를 사용할 수 있음.
			var $id = $("#id");
			var $pwd1 = $("#pwd1");
			var $pwd2 = $("#pwd2");
			var $name = $("#name");
			var $phone2 = $("#phone2");
			var $phone3 = $("#phone3");
			var $email = $("#email");
			
			
			// 아이디  유효성 검사
			$id.on("input", function(){
				// 첫글자는 영어 소문자, 나머지 글자는 영어 대,소문자 + 숫자, 총 6~12글자
				var regExp = /^[a-z][a-zA-z\d]{5,11}$/;
				if(!regExp.test($id.val())){
                	$("#checkId").text("아이디 형식이 유효하지 않습니다.").css({"color":"red","font-weight":"bold"});
                	signUpCheck.id = false;
                }else{
                	signUpCheck.id = true;
                		$.ajax({
                		url : "idDupCheck",
                		data : {memberId: $id.val() }, // paramter->k:v형태
                		type : "post",
                		success : function(result){
                			
                			if(result == "true"){
                				$("#checkId").text("사용 가능한 아이디 입니다.").css({"color":"green","font-weight":"bold"});
                				signUpCheck.idDup = true;
                			}else{
                				$("#checkId").text("사용할 수 없는 아이디 입니다.").css({"color":"red","font-weight":"bold"});
                				signUpCheck.idDup = false;
                			}
                		},
                		
                		error : function(e){
                			console.log("ajax 통신 실패");
                			console.log(e);
                		}
                	});
                	
                	
                	
                	
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
			
			
		});
        
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