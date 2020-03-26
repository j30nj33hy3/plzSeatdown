

var signUpCheck = { 
        		"id":false,
        		"idDup":false,
				"name":false,
				"nickname":false,
				"email":false
				};
        
   	 	// 실시간 입력 형식 검사
		// 정규표현식
		$(document).ready(function(){
			
			// jQuery 변수 : 변수에 직접적으로 jQuery메소드를 사용할 수 있음.
			var $name = $("#name");
			var $nickname = $("#nickname");
			var $email = $("#email");
			
			
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
                	$("#checkNickname").text("닉네임 형식이 유효하지 않습니다.").css({"color":"red","font-weight":"bold"});
                	updateCheck.nickname = false;
                }else{
                	updateCheck.nickname = true;
                		$.ajax({
                		url : "nicknameDupCheck",
                		data : {memberaNickname: $nickname.val() }, // paramter->k:v형태
                		type : "post",
                		success : function(result){
                			
                			if(result == "true"){
                				$("#checkNickname").text("사용 가능한 닉네임입니다.").css({"color":"green","font-weight":"bold"});
                				updateCheck.nicknameDup = true;
                			}else{
                				$("#checkNickname").text("사용할 수 없는 닉네임 입니다.").css({"color":"red","font-weight":"bold"});
                				updateCheck.nicknameDup = false;
                			}
                		},
                		
                		error : function(e){
                			console.log("ajax 통신 실패");
                			console.log(e);
                		}
                	});
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
						
			for(var key in signUpCheck){
				if(!signUpCheck[key]){
					alert("일부 입력값이 잘못되었습니다.");
					var id = "#"+key;
					$(id).focus();
					return false;
				}
			}
		}





var updateCheck = {
	"name" : false,
	"nickname" : false,
	"email" : false
};

function validate() {
	var $name = $("#name");
	var $nickname = $("#nickname");
	var $email = $("#email");

	// 이름 유효성 검사
	// 한글 두 글자 이상
	var regExp = /^[가-힣]{2,}$/;
	if (!regExp.test($name.val())) {
		updateCheck.name = false;
	} else {
		updateCheck.name = true;
	}

	var regExp = /^[가-힣A-Za-z0-9]{2,15}$/;
	if (!regExp.test($nickname.val())) {
		updateCheck.nickname = false;
	} else{
        	updateCheck.nickname = true;
        		$.ajax({
        		url : "nicknameDupCheck",
        		data : {memberNickname: $nickname.val() }, // paramter->k:v형태
        		type : "post",
        		success : function(result){
        			
        			if(result == "true"){
        				$("#checkNickname").text("사용 가능한 닉네임 입니다.").css({"color":"green","font-weight":"bold"});
        				updateCheck.nicknameDup = true;
        			}else{
        				$("#checkNickname").text("사용할 수 없는 닉네임 입니다.").css({"color":"red","font-weight":"bold"});
        				updateCheck.nicknameDup = false;
        			}
        		},
        		
        		error : function(e){
        			console.log("ajax 통신 실패");
        			console.log(e);
        		}
        	});
	
	
	}

	var regExp = /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/;
	if (!regExp.test($email.val())) {
		updateCheck.email = false;
	} else {
		updateCheck.email = true;
	}

	for ( var key in updateCheck) {
		if (!updateCheck[key]) {
			alert("일부 입력값이 잘못되었습니다.");
			var id = "#" + key;
			$(id).focus();
			return false;
		}
	}

}
