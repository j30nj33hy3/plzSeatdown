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

/*var updateCheck = {
    "name": false,
    "nickname" : false,
    "email": false
};*/

$(document).ready(function () {
	var $name = $("#name");
    var $nickname = $("#nickname");
    var $email = $("#email");

    // 이름 유효성 검사 
    // 한글 두 글자 이상
    $name.on("input", function () {
        var regExp = /^[가-힣]{1,}$/;
        if (!regExp.test($name.val())) {
            updateCheck.name = false;
        } else {
            updateCheck.name = true;
        }
    });

    $nickname.on("input", function() {
    	var regExp = /^[가-힣A-Za-z0-9]{1,15}$/;
    	if(!regExp.test($nickname.val())) {
    		updateCheck.nickname = false;
    	} else {
    		updateCheck.nickname = true;
    	}
    });
    
    $email.on("input", function () {
        var regExp = /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/;
        if (!regExp.test($email.val())) {
            updateCheck.email = false;
        } else {
            updateCheck.email = true;
        }
    });

    // 프로필 이미지 클릭 시 파일 선택 클릭
    // $("#profileImg").click(function () {
    //     $("#inputImg").click();
    // });

});
// 이미지 첨부 시 이미지 출력
// var flag = false;
// function LoadImg(value) {
//     // 파일 확장자 검사
//     var dot = $(value).val().lastIndexOf(".");
//     var ext = $(value).val().substring(dot + 1, $(value).val().length);

//     ext = ext.toLowerCase();

//     // 이미지 파일이면 false, 그 외면 true
//     switch (ext) {
//         case "jpg": case "png": case "gif": case "jpeg": case "bmp": case "tiff": case "raw":
//             flag = false; break;
//         default: flag = true; break;
//     }

//     if (value.files && value.files[0]) {
//         // -> 파일이 선택이 된 경우
//         var reader = new FileReader();

//         reader.onload = function (e) {
//             $("#profileImg").prop("src", e.target.result);
//         }

//         // file에서 내용(Content)을 읽어옴
//         // + base64 인코딩된 경로를 반환
//         reader.readAsDataURL(value.files[0]);
//     }
// }

// submit 동작
function validate() {
    console.log(updateCheck.idDup);
    for (var key in updateCheck) {
        if (!updateCheck[key]) {
            console.log("유효값 false -> " + key + " : "
                + updateCheck[key])
            alert("일부 입력값이 잘못되었습니다.");
            var id = "#" + key;
            $(id).focus();
            return false;
        }
    }
    return true;
}
