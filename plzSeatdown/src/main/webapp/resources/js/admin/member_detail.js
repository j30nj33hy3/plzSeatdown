// 이메일
// $('#email-domain').change(function () {
//     $("#email-domain option:selected").each(function () {
//         if ($(this).val() == '1') { //직접입력일 경우
//             $("#str_email02").val(''); //값 초기화
//             $("#str_email02").attr("disabled", false); //활성화
//         } else { //직접입력이 아닐경우
//             $("#str_email02").val($(this).text()); //선택값 입력
//             $("#str_email02").attr("disabled", true); //비활성화
//         }
//     });
// });

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
	var regExp = /^[가-힣]{1,}$/;
	if (!regExp.test($name.val())) {
		updateCheck.name = false;
	} else {
		updateCheck.name = true;
	}

	var regExp = /^[가-힣A-Za-z0-9]{1,15}$/;
	if (!regExp.test($nickname.val())) {
		updateCheck.nickname = false;
	} else {
		updateCheck.nickname = true;
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
