
// 프로필사진 수정 버튼
$(function () {
    $("#upload").css("display", "none");
    $("#upBtn").css({	
        "width": "50px",
        "text-align": "center"
    }).mouseenter(function () {
        $(this).css("cursor", "pointer");
    });
});

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


var signUpCheck = {

    "name": false,
    "email": false
};

$(document).ready(function () {
    // Add the following code if you want the name of the file appear on select
    // $(".custom-file-input").on("change", function () {
    //     var fileName = $(this).val()
    //         .split("\\").pop();

    //     $(this).siblings(".custom-file-label")
    //         .addClass("selected").html(fileName);
    // });

    // jQuery 변수 : 변수에 직접적으로 jQuery메소드를 사용할 수 있음.

    var $name = $("#name");
    var $email = $("#email")


    // 이름 유효성 검사
    // 한글 두 글자 이상
    $name.on("input", function () {
        var regExp = /^[가-힣]{2,}$/;
        if (!regExp.test($name.val())) {
            signUpCheck.name = false;

        } else {
            signUpCheck.name = true;
        }
    });

    $email.on("input", function () {
        var regExp = /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/;
        if (!regExp.test($email.val())) {
            signUpCheck.email = false;
        } else {
            signUpCheck.email = true;
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

    //console.log(signUpCheck.idDup);
    for (var key in signUpCheck) {
        if (!signUpCheck[key]) {
            console.log("유효값 false -> " + key + " : "
                + signUpCheck[key])
            alert("일부 입력값이 잘못되었습니다.");
            var id = "#" + key;
            $(id).focus();
            return false;
        }
    }

    // if (flag) {
    //     alert("프로필에 사용할 수 없는 확장자입니다.\n다음과 같은 확장자 파일을 사용해 주세요.\n.jpg .png .gif .jpeg .bmp .tiff .raw");
    //     return false;
    // }
    return true;
}
