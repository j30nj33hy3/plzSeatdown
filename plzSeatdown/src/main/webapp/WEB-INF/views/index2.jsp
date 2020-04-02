<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!--   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/buttercake@3.0.0/dist/css/butterCake.min.css"> -->
  <link rel="stylesheet" href="${contextPath}/resources/css/chat.css" />
<meta charset="UTF-8">
<title>PLEASE SEATDOWN</title>
<style>
#entranceForm{
	max-width : 400px;
}
#exampleTextarea{

	background-color:#917ec6;
	color : white;
}
</style>
</head>
<!-- LOGIN CONTAINER -->
<body class="homepage is-preload">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/nav.jsp" />
		<!-- FORM -->
		<div id="entranceForm"class="w-100 mx-auto px-2">
      <div class="accordion py-3" id="accordionExample">
            <div class="card mb-3">
                <div class="cheader account py-2 pr-1" id="headingOne" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                    <h2 class="mb-0 d-flex justify-content-between">
                        <a class="btn btn-link collapsed" type="button"> 
                        <b>Q. 채팅방 이용규정이 따로있나요?</b>
                        </a>
                        <i class="fas fa-angle-down" style="color:#DBC9FF;"></i>
                    </h2>
                </div>
                <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                    <div class="card-body">
        1. 상대방에게 폭언 또는 욕설 시 제재를 받을 수 있습니다. 매너있는 채팅 부탁드려요.<br><br>
        2. 타인에게 아이디 및 연락처를 노출하지 말아주세요. 여러분의 개인정보는 소중합니다.<br><br>
        3. 채팅창에 홍보성 글 작성 시 제재를 받을 수 있습니다.<br><br>
                    </div>
                </div>
            </div>
            <div class="card mb-3">
                <div class="cheader account py-2 pr-1" id="headingTwo" data-toggle="collapse"
                data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                    <h2 class="mb-0 d-flex justify-content-between">
                        <a class="btn btn-link collapsed" type="button" >
                            <b>Q. 채팅방은 만들 수 없나요?</b>
                        </a>
                        <i class="fas fa-angle-down" style="color:#C1B7E8;"></i>
                    </h2>
                </div>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                    <div class="card-body">
                    현재 서비스 개발중이며 빠른 시일내로 도입할 수 있도록 노력하겠습니다.   
                    </div>
                </div>
            </div>
            <div class="card mb-3">
                <div class="cheader inform py-2 pr-1" id="headingThree" data-toggle="collapse"
                data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                    <h2 class="mb-0 d-flex justify-content-between">
                        <a class="btn btn-link collapsed" type="button" >
                            <b>Q. 채팅에서 신고는 어떻게하나요?</b>
                        </a>
                        <i class="fas fa-angle-down" style="color:#A88FCF;"></i>
                    </h2>
                </div>
                <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                    <div class="card-body">
                        문제가 되는 부분 캡쳐해서 관리자 메일로 전송해주시면 처리하겠습니다.
                    </div>
                </div>
            </div>
        </div>
			<form action="${pageContext.request.contextPath}/chatting.do"
				enctype="multipart/form-data" method="post">
				<div class="card overflow-unset mt-3 mb-1">
					<div class="card-body">
						<!-- 프로필 -->
						<div id="profile" class="avatar-icon text-center">
                     		<c:set var="src" value="${contextPath}/resources/images/user.png"/>
                          	<c:if test="${loginMember.profilePath != null}">
                              <c:set var ="src" value="${contextPath}/resources/profileImages/${loginMember.profilePath}"/>
                           </c:if>
				            <%-- <c:if test="${!empty member.profilePath}">
				            	<c:set var ="src" value="${contextPath}/resources/profileImages/${member.profilePath}"/>
				            </c:if>
				            <c:if test="${empty member.profilePath}">
				            	<c:set var="src" value="${contextPath}/resources/images/user.png"/>
				            </c:if> --%>
			            	<input type="hidden" name="profile" value="${src}">
				            <img class="img-circle" src="${src}" style="width : 150px; border-radius: 5em;">
						</div><br>
						<!-- 닉네임 -->
						<div class="form-group">
  							<input class="form-control form-control-lg" type="text" 
  								name="nickName" id="nickName" value="${member.memberNickname}" readonly>
						</div>
						<!-- LOGIN -->
						<div class="group">
							<button id="chatBtn" class="btn btn-primary">입장하기</button>
						</div>
					</div>
				</div>
			</form>
		</div><br><br>
	<script src="https://cdn.jsdelivr.net/npm/buttercake@3.0.0/dist/js/butterCake.min.js"></script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>