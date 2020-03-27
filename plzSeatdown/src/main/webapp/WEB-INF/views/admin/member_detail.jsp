<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 - 회원 상세 보기</title>

<link rel="stylesheet"
	href="${contextPath}/resources/css/member_detail.css" />

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>

</head>
<body>

	<c:set var="contextPath"
		value="${pageContext.servletContext.contextPath }" scope="application" />


	<div id="main-wrapper">

		<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />
		<jsp:include page="/WEB-INF/views/admin/common/nav.jsp" />

		<!-- ============================================================== -->
		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<div class="page-breadcrumb">
				<div class="row">
					<div class="col-12 d-flex no-block align-items-center">
						<h3 class="page-title mt-3 ml-3 mb-3">회원 상세 보기</h3>
						<div class="ml-auto text-right">
							<nav aria-label="breadcrumb"></nav>
						</div>
					</div>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- End Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid">
				<div class="row">
					<div class="ml-3 mr-3" style="text-align: left;">
						<form class="form-group" method="POST"
							action="updateMember?no=${member.memberNo}"
							onsubmit="return validate();">
							<div class="col-md-8" style="float: left;">

								<h6>회원번호</h6>
								<input type="text" class="form-control input-comment mb-3"
									id="no" name="no" value="${member.memberNo }" disabled required>

								<h6>아이디</h6>
								<input type="text" class="form-control input-comment mb-3"
									id="id" name="id" value="${member.memberId }" disabled required>

								<h6>이름</h6>
								<input type="text" class="form-control input-comment mb-3 name"
									id="name" name="name" maxlength="10"
									value="${member.memberName }" required>

								<h6>닉네임</h6>
								<input type="text" class="form-control input-comment nickname"
									style="display: inline-block; width: 84%;" id="nickname"
									name="nickname" value="${member.memberNickname }" required>&nbsp;&nbsp;<a
									class="btn" id="nickname-edit-btn">변경하기</a>
								<div class="mb-3" id="checkNickname" style="height: 1.5em;"></div>
								<h6>이메일</h6>
								<input type="email" class="form-control input-comment email"
									id="email" name="email" value="${member.memberEmail }" required>
								<div class="mb-3" id="checkEmail" style="height: 1.5em;"></div>
								<h6>전화번호</h6>
								<!-- <select class="custom-select form-control input-comment" id="phone1" name="phone1"
                                    style="float:left; width:165px; background-color: white;" disabled required>
                                    <option>010</option>
                                    <option>011</option>
                                    <option>016</option>
                                    <option>017</option>
                                    <option>019</option>
                                </select> -->

								<c:set var="phone" value="${fn:split(member.memberPhone, '-')}" />

								<input type="number"
									class="form-control input-comment phone mb-3" id="phone1"
									name="phone1" maxlength="3" value="${phone[0] }" disabled>-
								<input type="number"
									class="form-control input-comment phone mb-3" id="phone2"
									name="phone2" maxlength="4" value="${phone[1] }" disabled>-
								<input type="number"
									class="form-control input-comment phone mb-3" id="phone3"
									name="phone3" maxlength="4" value="${phone[2] }" disabled>
							</div>

							<div class="col-md-4" style="display: inline-block;">

								<h6>프로필 사진</h6>
								<div id="profile-wrap" style="text-align: center;">
									<%-- <c:choose> --%>
									<c:if test="${empty attachment }">
										<img class="member-profile" id="profile-img"
											src="${contextPath }/resources/images/user.png" alt="프로필아이콘"
											style="width: 240px">
									</c:if>
									<c:if test="${!empty attachment }">
										<img class="member-profile" id="profile-img"
											src="${contextPath}/resources/profileImages/${attachment.profilePath}"
											alt="프로필아이콘"
											style="width: 240px; height: 240px; border-radius: 50%;">
										<br>
										<button type="button" id="upBtn"
											class="btn btn-sm form-control profile-edit-btn"
											style="width: 50px; float: right;">삭제</button>
									</c:if>
									<%-- </c:choose> --%>
									<br>

								</div>
							</div>
							<div class="col-md-12" style="clear: both; text-align: center;">

								<button class="btn mt-5 form-control edit-btn" id="editBtn"
									type="submit" style="width: 20%">수정</button>

								<a href="list" class="btn mt-5 form-control edit-btn"
									id="cancleBtn" type="button" style="width: 20%">취소</a>

							</div>
						</form>

						<script>
						$(function() {
							$("#upBtn").click(function(){
							var memberNo = ${member.memberNo};
							console.log(memberNo); 
							if(confirm("기본 이미지로 변경하시겠습니까?"))
								location.href = "deleteImg?no="+memberNo;
							}).mouseenter(function(){
								$(this).parent().css("cursor", "pointer");
							});	
						});
						
						
						// 유효성 & 중복검사
						var nameCheck = {
							"name":false
						}
						var nicknameCheck = {
							"nickname":false
						}
						var nicknameDup = {
							"nicknameDup":false
						}
						var email = {
							"email":false
						}
						var emailDup = {
							"emailDup":false
						}
						
						$(function() {
							var $name = $("#name");
							var $nickname = $("#nickname");
							var $email = $("#email");
							
							$(".name").on("input", function(){
								var regExp =  /^[가-힣]{2,}$/;
								
								if(!regExp.test($(this).val())){ // 이름이 정규식을 만족하지 않을경우
									nameCheck = false;
								}else{
									nameCheck = true;
								}
							});
							
							$(".nickname").on("input",function(){
								var regExp = /^[가-힣A-Za-z0-9]{2,15}$/;
								
								if(!regExp.test($nickname.val())){
				                	$("#checkNickname").text("닉네임 형식이 유효하지 않습니다.").css({"color":"red","font-weight":"bold"});
				                	nicknameCheck = false;
				                }else{
				                	nicknameCheck = true;
				                		$.ajax({
				                		url : "nicknameDupCheck",
				                		data : {memberNickname: $nickname.val() }, // paramter->k:v형태
				                		type : "post",
				                		success : function(result){
				                			if(result == "true"){
				                				$("#checkNickname").text("사용 가능한 닉네임입니다.").css({"color":"green","font-weight":"bold"});
				                				nicknameDup = true;
				                			}else{
				                				$("#checkNickname").text("사용할 수 없는 닉네임입니다.").css({"color":"red","font-weight":"bold"});
				                				nicknameDup = false;
				                			}
				                		},
				                		error : function(e){
				                			console.log("ajax 통신 실패");
				                			console.log(e);
				                		}
				                	});
				                }
							});
							
							$(".email").on("input",function(){
								var regExp = /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/;
								
								if(!regExp.test($email.val())){
				                	$("#checkEmail").text("이메일 형식이 유효하지 않습니다.").css({"color":"red","font-weight":"bold"});
				                	emailCheck = false;
				                }else{
				                	emailCheck = true;
				                		$.ajax({
				                		url : "emailDupCheck",
				                		data : {memberEmail: $email.val() }, // paramter->k:v형태
				                		type : "post",
				                		success : function(result){
				                			if(result == "true"){
				                				$("#checkEmail").text("사용 가능한 이메일입니다.").css({"color":"green","font-weight":"bold"});
				                				emailDup = true;
				                			}else{
				                				$("#checkEmail").text("사용할 수 없는 이메일입니다.").css({"color":"red","font-weight":"bold"});
				                				emailDup = false;
				                			}
				                		},
				                		error : function(e){
				                			console.log("ajax 통신 실패");
				                			console.log(e);
				                		}
				                	});
				                }
							});
						});
						
						
						
						// 닉네임 변경 버튼 클릭시					
						$(function(){
							$("#nickname-edit-btn").click(function(){
							var memberId = '${member.memberId}';
							var ranNum = Math.round(Math.random()*10000);
							var nickname = memberId + ranNum;
							$("#nickname").attr('value', nickname);

							var $nickname = $("#nickname");
							$.ajax({
		                		url : "nicknameDupCheck",
		                		data : {memberaNickname: $nickname.val() }, // paramter->k:v형태
		                		type : "post",
		                		success : function(result){
		                			if(result == "true"){
		                				$("#checkNickname").text("[변경버튼]사용 가능한 닉네임입니다.").css({"color":"green","font-weight":"bold"});
		                				updateCheck.nicknameDup = true;
		                			}else{
		                				$("#checkNickname").text("[변경버튼]사용할 수 없는 닉네임입니다.").css({"color":"red","font-weight":"bold"});
		                				updateCheck.nicknameDup = false;
		                			}
		                		}
							})
						});
					});
						
						// 수정 버튼 클릭시
						function validate(){
			
							if(nameCheck == false){
									alert("이름이 잘못 입력되었습니다.");
									$("#name").focus();
									return false;
							}
							
							if(nicknameCheck == false){
								alert("닉네임이 잘못 입력되었습니다.");
								$("#nickname").focus();
								return false;
							
							}
							if(nicknameDup == false){
								alert("중복된 닉네임입니다.");
								$("#nickname").focus();
								return false;
							
							}
							if(emailCheck == false){
								alert("이메일이 잘못 입력되었습니다.");
								$("#email").focus();
								return false;
							
							}
							if(emailDup == false){
								alert("중복된 이메일입니다.");
								$("#email").focus();
								return false;
							
							}
						}			
  	
						
						/* $(function() {
								$("#upBtn").click(function() {
								var memberNo = ${member.memberNo};
									console.log(memberNo);
									var check = confirm("기본 이미지로 변경하시겠습니까?");
									if (check) {
										$.ajax({
											url : "deleteImg",
											type : "POST",
											data : {"memberNo" : memberNo},
											success : function(result){
													if(result == 1) {
				 										console.log(memberNo);
				 										$("#profile-img").attr('src', '${contextPath}/resources/images/user.png');
				 										alert("프로필 사진이 삭제되었습니다.");
													}
											},
											error : function(e) {
												console.log("프로필 삭제 ajax 실패");	
												console.log(e);
											}
									});
								}
							});
						}); */
						</script>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>