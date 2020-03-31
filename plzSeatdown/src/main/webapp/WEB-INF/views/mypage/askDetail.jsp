<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage-프로필</title>
<link rel="stylesheet" href="${contextPath}/resources/css/mypage_askDetail.css"/>

</head>
<body class="homepage is-preload">
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
	
	<!-- Main -->
			<div class="wrapper style1">
				<div class="container">
					<div class="row gtr-200">
					
						<div class="col-2 col-12-mobile" id="sidebar" style="width: 200px;">
						<h4><a href="mypage">문의 내역</a></h4>
							<ul>
								<li><a href="mypage">프로필</a></li>
								<c:set var="snslogin" value="${loginMember.memberId }"/>
                        		<c:if test="${!fn:startsWith(snslogin,'_')}">
									<li><a href="changePwd">비밀번호 변경</a></li>
									<li><a href="secession">회원 탈퇴</a></li>
                        		</c:if>
								<li><a href="myreview">내 리뷰</a></li>
								<li><a href="myticket">내 티켓</a></li>
								<li><a href="mycommu">내 커뮤</a></li>
								<li><a href="ask">문의 내역</a></li>
								<li><a href="alarmSetting">알림 설정</a></li>
							</ul>
						</div>

						<div class="col-10 col-12-mobile imp-mobile" id="content">
							<div class= "toptext">
								<p class="titleQ">문의내역<img src="${contextPath}/resources/images/answer.png"></p>
								<div class="form-group col-10">
									<p>${qnaeh.qnaContent}</p>
								</div>
							</div>
							<div class= "toptext">
								<p class="titleA">답변<img src="${contextPath}/resources/images/question.png"></p>
								<div class="form-group col-10">
									<p>${qnaeh.qnaAnswer}</p>
								</div>
							</div>
							<div class="btndiv">
								<a id="updatebtn" href="ask?currentPage=${currentPage}" class="btn btn-outline-secondary m-3">목록으로</a>
							</div>	
						</div>

					</div>
				</div>
			</div>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>