<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

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

#messageReply {
	width: 100%;
	border: none;
	resize: none;
}

textarea:focus {
	outline: none;
}

button:focus {
	outline: none;
}

input:focus {
	outline: none;
}
</style>
<title>PLEASE SEATDOWN</title>

<meta charset="UTF-8">
</head>


<body>
	<div id="chatbox" class='form-group'>
		<div id="chattop">
			<img id="chatlogo" src="${contextPath}/resources/images/logo.png"
				width="150" height="50">
			<c:if test="${!empty message}">
				<div style="float: right; margin: 10px 5px 0 0;">
					<jsp:useBean id="now" class="java.util.Date" />
					<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
					<c:out value="${today}" />
					<br> 받는사람 : ${message.senderNickname }
				</div>
			</c:if>

			<!-- 대화내용이 출력되는 부분 -->
			<form action="sendReply" method="post" onsubmit="return validate();">
				<input type="hidden" name="senderNo"
					value="${message.messageSenderNo }"> <input type="hidden"
					name="receiverNo" value="${message.messageReceiverNo }">

				<div id="chatting">
					<div id='sessionuserid'>
						<p
							style="text-align: inherit; padding: 3px; color: black; font-size: 24px;">
							<textarea id="messageReply" name="messageReply" rows="10">
</textarea>
						</p>
					</div>
					<br>

					<div class='panel panel-default'>
						<div id='chatdata' class='panel-body'></div>
					</div>
				</div>
				<div class="buttonArea">
					<button
						class="btn btn-primary btn-sm d-md-inline-block headBtn otherBtn replyBtn"
						id="replyBtn" type="submit">전송</button>
					<a
						class="btn btn-primary btn-sm d-md-inline-block headBtn btn btn-sm deleteBtn"
						type="button" href="javascript:history.go(-1);">취소</a>
				</div>
			</form>
			<script>
				
				function validate() {
					if ($("#messageReply").val().trim().length == 0) {
						alert("내용을 입력해 주세요.");
						$("#messageReply").focus();
						return false;
					} else {
						window.opener.location.reload();
						window.close();
						location.replace("receiveList.jsp");
						/* mouseenter(function() {
							$(this).parent().css("cursor", "pointer");
						}); */
					}
				};
			</script>
</body>
</html>
