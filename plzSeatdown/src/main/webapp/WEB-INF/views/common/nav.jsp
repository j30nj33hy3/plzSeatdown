<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/main.css" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<style>
	#loginBtn {
		background-color: #917EC6;
		color:#fff;
	}
	#forgotForm{
		color: #555;
	}
	#forgotForm:hover{
		color: #917EC6;
		text-decoration: none;
	}
	#saveIdLabel{
		margin: 0.2em 0em;
	}
	#save{
		font-size: 0.75em;
	}
	#kakao-login-btn{
		margin-bottom: 0.5em;
	}
	/* .subMenu{
		padding-left: 0px;
	}
	.subMenu>li{
		position: relative;
	}
	.subMenu ul{
		position: absolute;
		top: 38px;
		left: 0;
		width: 150px;
		padding: 10px; 
		background-color: #C6B4CD;
		border-radius: 3px;
		list-style: none;
		z-index: 9999;
	}
	.subMenu ul a{
		color: white;
	} */
	#nav{
		position: relative;
		background: rgb(198, 180, 205);
		border-bottom: solid 1px #ccc;
		/* padding: 1em 0 1em 0; */
		text-align: center;
		font-family: 'Handon3gyeopsal600g';
	}
	#nav2{
		background: rgb(198, 180, 205);
		border-bottom: solid 1px #ccc;
		text-align: center;
		font-family: 'Handon3gyeopsal600g';
	}
	#nav a{
		color: white;
	}
	#nav a:hover{
		color:rgb(163, 99, 189);
		text-decoration:none;
		list-style:none;
	}
	.dropdown-menu{
		background-color: rgb(198, 180, 205);
		text-align: center; 
		border-radius: 4px; 
	}
	.dropdown-menu a{
		color:inherit;
		text-decoration:none;
		text-align: center; 
	}
	.dropdown-menu a:hover{
		background: rgb(198, 180, 205);
		border:0px;
	}

	.navbar-toggler{
		margin: 0 auto;
	}
	
	#navbarTogglerDemo01{
      	background: rgb(198, 180, 205);
   	}
   	
</style>
</head>
<body>
	<nav id="nav" class="navbar navbar-light navbar-expand-lg px-5">
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse px-5 mx-5" id="navbarTogglerDemo01">
			<ul class="container-fluid navbar-nav d-flex flex-colum flex-md-row justify-content-around">
			<li class="nav-item"><a href="${contextPath}/notice/list" class="nav-link d-md-inline-block">Notice</a></li>
			<li class="nav-item">
				<a href="${contextPath}/review/theater" class="nav-link d-md-inline-block" >Review</a>
				<%-- <div class="dropdown-menu mt-3 py-3" aria-labelledby="navbarDropdown">
					<a href="${contextPath}/review/theater" class="dropdown-item">공연장별</a>
					<a href="${contextPath}/review/show" class="dropdown-item">공연별</a>
					<c:if test="${! empty sessionScope.loginMember}">
					<a href="${contextPath}/review/writeForm" class="dropdown-item">리뷰 작성</a>
					</c:if>
				</div> --%>
			</li>
			<li class="nav-item"><a href="${contextPath}/community/list" class="nav-link d-md-inline-block">Community</a></li>
			<li class="nav-item"><a href="${contextPath}/qna/list" class="nav-link d-md-inline-block">Q&A</a></li>
			</ul>
		</div>
		</nav>
	<script>
		// 로그인 유효성 검사
		function loginValidate(){
			if($("#memberId").val().trim().length == 0){
				alert("아이디를 입력하세요.");
				$("#memberId").focus();
				
				return false;
			}
			
			if($("#memberPwd").val().trim().length == 0){
				alert("비밀번호를 입력하세요.");
				$("#memberPwd").focus();
				
				return false;
			}
			
			return true;
		}
		
		//Review 메뉴 호버 이벤트
	    /* $(function () {
	      $(".subMenu>li").on({
	        mouseenter: function () {
	          $(this).find("ul").stop().slideDown(300);
	        },
	        mouseleave: function () {
	          $(this).find("ul").stop().slideUp(300);
	        }
	      });
	    }); */
	</script>
</body>
</html>