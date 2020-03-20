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
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js" 
integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l" crossorigin="anonymous"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js" 
integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c" crossorigin="anonymous"></script>	
	
<link rel="stylesheet" href="${contextPath}/resources/css/main.css" />
<link rel="stylesheet" href="${contextPath}/resources/css/noscript.css" />
</head>
<body>
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/>
	<c:if test="${!empty msg}">
		<script>alert("${msg}")</script>
		<c:remove var="msg"/>
	</c:if>
	<!-- Header -->
	<section id="header">
		<div class="row container-fluid">
			<div class="col-md-4">
			
			</div>
			<div class="col-md-4">
				<!-- Logo -->
				<a href="${contextPath}"><img src="${contextPath}/resources/images/logo.png"></a>
			</div>
			<div class="col-md-4">
			
			</div>
		</div>
	</section>
	
	
	
	
	
	
	<script type="text/javascript" src="${contextPath}/resources/js/jquery.dropotron.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/jquery.scrolly.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/jquery.scrollex.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/browser.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/breakpoints.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/util.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/main.js"></script>
</body>
</html>