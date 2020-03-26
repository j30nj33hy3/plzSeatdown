<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- include libraries(jQuery, bootstrap) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" 
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" 
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
   
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-bs4.min.js"></script>

<!-- summernote 기능 구현 js -->
<script src="${contextPath}/resources/summernote/js/summernote.js"></script>

<!-- summernote 언어 설정 js -->
<script src="${contextPath}/resources/summernote/dist/summernote.js"></script>
<script src="${contextPath}/resources/summernote/dist/lang/summernote-ko-KR.js"></script>
	
<!-- 아이콘 -->
<script src="https://kit.fontawesome.com/ac130595f7.js" crossorigin="anonymous"></script>
<!-- image click -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
<script src="//cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>	
	
<link rel="stylesheet" href="${contextPath}/resources/css/main.css" />
<link rel="stylesheet" href="${contextPath}/resources/css/noscript.css" />
<script src="http://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

<style>
	#logoContainer{
		margin: 0 auto;
	}
</style>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/>
	<c:if test="${!empty msg}">
		<script>alert("${msg}")</script>
		<c:remove var="msg"/>
	</c:if>
	<!-- Header -->
	<section id="header">
		<div id="logoContainer" class="col-md-12">
				<!-- Logo -->
				<a href="${contextPath}"><img src="${contextPath}/resources/images/logo.png"></a>
		</div>
	</section>
	
	<script type="text/javascript" src="${contextPath}/resources/js/jquery.dropotron.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/jquery.scrolly.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/jquery.scrollex.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/browser.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/breakpoints.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/util.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/main.js"></script>
	
	<script>
	var socket = null;
	
	// servlet-context와 매칭됨
	<c:if test="${!empty loginMember}">
		var socket = new SockJS('<c:url value="/replyAlarmEcho"/>'); // comm에서 받은거 다시 핸들러로
	</c:if>
	
	// 출력
	socket.onmessage = function(evt){
		var data = evt.data;
		console.log("ReceiveMessage : " + data + "\n");
		
		toastr.options.closeButton = true;
		toastr.options.progressBar = true;
		toastr.info(data,{timeOut: 5000});
		toastr.options.newestOnTop = true;

	};
	
	socket.onclose = function(evt){
		console.log('connect close');
	};
	
	socket.onerror = function(err){
		console.log('Errors :' , err);
	};
	</script>
</body>
</html>