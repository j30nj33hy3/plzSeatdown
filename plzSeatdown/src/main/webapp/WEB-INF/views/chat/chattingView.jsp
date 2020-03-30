<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- cdn방식으로 sockjs불러오기 -->
<script src="http://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<!-- 부트스트랩적용 -->
<!-- Latest compiled and minified CSS -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
Optional theme
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
Latest compiled and minified JavaScript
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script> -->
<meta charset="UTF-8">
<title>실시간 채팅</title>
<link rel="stylesheet" href="${contextPath}/resources/css/chattingView.css"/>
</head>
<style>
.alert alert-info{
	word-break : break-all;
}
</style>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/nav.jsp"/>


<div id="chatgroup">
<div id="chatbox" class='form-group'>
	<div id="chattop">
	<img id="chatlogo" src="${contextPath}/resources/images/logo.png" width="100" height="35">
		<button class='btn btn-primary' id='exitBtn'>
			<img src="${contextPath}/resources/images/close.png" width="20" height="20">
		</button>
	</div>
	<!-- 대화내용이 출력되는 부분 -->
	<div id="chatting"> 
		<div id='sessionuserid'><h6 style="color:white;">${nickName}님이 입장하셨습니다.</h6></div><br/>
	<div class='panel panel-default'>
		<div id='chatdata' class='panel-body'></div>
	</div>
	</div>
	<!-- 메세지 작성부분 -->
	<div>
	<textarea rows="2" cols="75" name='message' id='message' style="resize: none; font-size:16px;" placeholder="메세지를 입력하세요"></textarea>
	<button class='btn btn-primary' id='sendBtn'>
		<img src="${contextPath}/resources/images/send.jpg" width="50" height="50">
	</button>
	</div>
</div>
</div>
<script>

	/* SockJS객체생성 보낼 url경로를 매개변수로 등록 */
	var sock=new SockJS("<c:url value='/echo'/>");
	sock.onmessage=onMessage;
	sock.onclose=onClose;
	var today=null;
	$(function(){
		$("#sendBtn").click(function(){
			console.log("send message.....");
			/* 채팅창에 작성한 메세지 전송 */
			sendMessage();
			/* 전송 후 작성창 초기화 */
			$("#message").val('');
		});
		
		$('#message').keypress(function(event){
		     if ( event.which == 13 ) {
		         $('#sendBtn').click();
		         return false;
		     }
		});
		
		$("#exitBtn").click(function(){
			console.log("exit message.....");
			/* 채팅창에 작성한 메세지 전송 */
			sock.onclose();
		});
	});
	function sendMessage(){
		/* 맵핑된 핸들러 객체의 handleTextMessage매소드가 실행 */
		sock.send($("#message").val());
	
	};
	function onMessage(evt){
		var data=evt.data;//new text객체로 보내준 값을 받아옴.
		var host=null;//메세지를 보낸 사용자 ip저장
		var strArray=data.split("|");//데이터 파싱처리하기
		var nickName=null;//대화명 저장
		var profile=null;
		

		//전송된 데이터 출력해보기
		for(var i=0;i<strArray.length;i++)
		{
			console.log('str['+i+'] :' + strArray[i]);	 		
		}
		if(strArray.length>1)
		{
			sessionId=strArray[0];
			message=strArray[1];
			host=strArray[2].substr(1,strArray[2].indexOf(":")-1);
			nickName=strArray[3];
			today=new Date();
			printDate=today.getFullYear()+"/"+(today.getMonth()+1)+"/"+today.getDate()+" "+today.getHours()+":"+today.getMinutes()+":"+today.getSeconds();
			
			console.log(today);
			var ck_host='${host}';
	
			console.log(sessionId);
			console.log(message);
			console.log('host : '+host);
			console.log('ck_host : '+ck_host);
			/* 서버에서 데이터를 전송할경우 분기 처리 */
			if(host==ck_host||(host==0&&ck_host.includes('0:0:')))
			{
				var printHTML="<div class='well' style='margin-left: 30%;'>";
				printHTML+="<div class='alert alert-info' style='background-color:rgb(255,217,110); border:0px; word-break:break-all;'>";		
				printHTML+="<strong>"+"<img src='${profile}' id='img'>"+" "+" "+" "+nickName+" : "+message+"</strong><br/>";
				printHTML+="<sub>"+printDate+"</sub>";
				printHTML+="</div>";
				printHTML+="</div>";
				$('#chatdata').append(printHTML);	
				$("#chatting").scrollTop($("#chatting")[0].scrollHeight);
			}
			else{
				var printHTML="<div class='well'  style='margin-left: -5%;margin-right:30%;'>";
				printHTML+="<div class='alert alert-warning' style='background-color:rgb(255,217,110); border:0px;'>";
				printHTML+="<strong>"+"<img src='${profile}' id='img'>"+" "+" "+" "+nickName+" : "+message;"</strong><br/>";
				printHTML+="<sub>"+printDate+"</sub>";
				printHTML+="</div>";
				printHTML+="</div>";
				$('#chatdata').append(printHTML);
				$("#chatting").scrollTop($("#chatting")[0].scrollHeight);
			}
			//console.log('chatting data : '+data);
		}
		else
		{
			today=new Date();
			printDate=today.getFullYear()+"/"+today.getMonth()+"/"+today.getDate()+" "+today.getHours()+":"+today.getMinutes()+":"+today.getSeconds();
			message=strArray[0];
			var printHTML="<div class='well'  style='margin-left30%:'>";
			printHTML+="<div class='alert alert-danger'>";
			printHTML+="<sub>"+printDate+"</sub><br/>";
			printHTML+="<strong>[서버관리자] : "+message+"</strong>";
			printHTML+="</div>";
			printHTML+="</div>";
			$('#chatdata').append(printHTML);							
		}
	};
	
	function onClose(evt){
		location.href='${pageContext.request.contextPath};';
	};
</script>


	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>


</body>
</html>