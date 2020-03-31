<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<style>
@font-face {
	font-family: 'Handon3gyeopsal300g';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/Handon3gyeopsal300g.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

body {
	font-family: 'Handon3gyeopsal300g', '삼겹살체 300g';
}

#chatting {
	padding: 15px;
	background-color: white;
	overflow: scroll;
	width: 470px;
	height: 450px;
	margin: 0 auto;
	overflow: scroll;
	width: 470px;
	height: 450px;
	margin: 0 auto;
	border: dashed 1.1px silver;
}

#chatgroup {
	height: 590px;
}

#chatbox {
	background-color: rgb(145, 126, 198, 0.2);
	border: 1px solid lightgray;
	border-radius: 20px;
	width: 490px;
	height: 590px;
	margin: auto;
	top: 0px;
	left: 0px;
	right: 0px;
	bottom: 0px;
	box-shadow: 0 0 4px rgba(0, 0, 0, .15);
	border: 1px solid lightgray;
}

#sessionuserid>h6 {
	text-align: center;
}

::-webkit-scrollbar {
	display: none;
}

#message {
	margin: 17px 10px 10px 20px;
	border: 0px;
}

#sendBtn {
	position: absolute;
	float: right;
	width: 100px;
	height: 70px;
	margin: 10px 25px 10px 0px;
	background-color: white;
	border: 0px;
}

#chattop {
	height: 50px;
}

#exitBtn {
	float: right;
	margin: 10px 10px 10px 10px;
	background-color: white;
	border: 0px;
}

#chatlogo {
	folat: left;
	margin: 12px 10px 10px 20px;
}

sub {
	left: 430px;
}

#img {
	width: 40px;
	height: 40px;
	border: 1px solid gray;
	border-radius: 50%;
}

.buttonArea {
	margin-top: 20px;
	text-align: center;
}

.replyBtn {
	margin: 0 0.5em;
	background-color: #FFD938;
	color: #000;
	border: 0px;
}

.deleteBtn {
	margin: 0 0.5em;
	background-color: #666;
	border: 0px;
}

.otherBtn:hover {
	background-color: #FFC107;
	color: #000;
}

.otherBtn:focus, .otherBtn:active {
	outline: none !important;
	box-shadow: none;
}

.deleteBtn:hover {
	background-color: #444;
}

.deleteBtn:focus, .deleteBtn:active {
	outline: none !important;
	box-shadow: none;
}
</style>
<title>보낸 쪽지 확인</title>

<meta charset="UTF-8">
</head>


<body>

	<c:if test="${!empty message}">
		<form action="sendDelMsg?no=${message.messageNo }" method="post">
			<div id="chatgroup" style="width: 490; height: 590;">
				<div id="chatbox" class='form-group'>
					<div id="chattop">
						<img id="chatlogo" src="${contextPath}/resources/images/logo.png"
							width="150" height="50">
						<div style="float: right; margin: 10px 5px 0 0;">${message.messageDate}<br>
							받는사람 : ${message.receiverNickname}
						</div>

						<!-- 대화내용이 출력되는 부분 -->
						<div id="chatting">
							<div id='sessionuserid'>
								<p
									style="text-align: inherit; padding: 3px; color: black; font-size: 28px;">
									${message.messageContent}</p>
							</div>
							<br>

							<div class='panel panel-default'>
								<div id='chatdata' class='panel-body'></div>
							</div>
						</div>
						<div class="buttonArea">
							<button
								class="btn btn-primary btn-sm d-md-inline-block headBtn otherBtn replyBtn"
								id="deleteBtn" type="submit">삭제하기</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</c:if>
	<script>
		// 쪽지 삭제
		$(function() {
			$("#deleteBtn").click(function() {
				var messageNo = ${message.messageNo};
				
				if (confirm("쪽지를 삭제하시겠습니까?")) {
					location.href = "deleteMessage?no=" + messageNo;
					window.opener.location.reload();
					window.close();
					setTimeout("history.go(0);", 3000);
				} else{
					return false;
				}
			}).mouseenter(function() {
				$(this).parent().css("cursor", "pointer");
			});
		});
	</script>
</body>
</html>
