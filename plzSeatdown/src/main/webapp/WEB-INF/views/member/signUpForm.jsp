<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="${contextPath}/resources/css/member-signUp.css" />
<style>
	/* number 태그 화살표 제거 */
	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
		-webkit-appearance: none;
		margin: 0;
	}
</style>
</head>
<body class="homepage is-preload">
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
	
	<!-- Main -->
	<div class="signUpStyle">
		<div class="container">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<div class="row">
						<div id="signUpTitle" class="col-md-3">
							<h4>회원가입</h4>
						</div>
						<div id="signUpFormBox" class="col-md-6">
							<form name="signUpForm" action="signUp" method="POST" onsubmit="return validate();">
								<!-- 아이디 -->
								<div class="form-group">
									<label for="id">
										아이디
									</label>
									<input type="text" class="form-control" id="id" name="memberId" 
										maxlength="20" placeholder="아이디 입력" autocomplete="off" required/>
									<input type="hidden" name="idDup" id="idDup" value="false">
								</div>
								<div>
                            		<span id="checkId">&nbsp;</span>
                        		</div>
                        		<!-- 비밀번호 -->
								<div class="form-group">
									<label for="pwd1">
										비밀번호
									</label>
									<input type="password" class="form-control" id="pwd1" name="memberPwd" maxlength="30" placeholder="비밀번호 입력" required/>
									<div>
                            			<span id="checkPwd1">&nbsp;</span>
                        			</div>
								</div>
								
								<!-- 비밀번호 확인 -->
								<div class="form-group">
									<label for="pwd2">
										비밀번호 확인
									</label>
									<input type="password" class="form-control" id="pwd2" maxlength="30" placeholder="비밀번호 확인" required/>
									<div>
                            			<span id="checkPwd2">&nbsp;</span>
                        			</div>
								</div>
								
								<!-- 이름 -->
								<div class="form-group">
									<label for="name">
										이름
									</label>
									<input type="text" class="form-control" id="name" name="memberName" maxlength="10" required/>
									<div>
                            			<span id="checkName">&nbsp;</span>
                        			</div>
								</div>
								
								<!-- 닉네임 -->
								<div class="form-group">
									<label for="nickname">
										닉네임
									</label>
									<input type="text" class="form-control" id="nickname" name="memberNickname" maxlength="10" required/>
									<div>
                            			<span id="checkNickname">&nbsp;</span>
                        			</div>
								</div>
								
			                    <!-- 이메일 -->
			                    <div class="form-row">
			                        <div class="col-md-3">
			                            <label for="email">이메일</label>
			                        </div>
			                        <div class="col-md-9">
			                            <input type="email" class="form-control" id="email" name="memberEmail" autocomplete="off" required>
			                        </div>
			                        <div class="col-md-6 offset-md-3">
			                            <span id="checkEmail">&nbsp;</span>
			                        </div>
			                    </div>
			                    
								<!-- 전화번호 -->
			                    <div class="row mb-3 form-row">
			                        <div class="col-md-3">
			                            <label for="phone1">전화번호</label>
			                        </div>
			                        <!-- 전화번호1 -->
			                        <div class="col-md-3">
			                            <select class="custom-select" id="phone1" name="phone1" required>
			                                <option>010</option>
			                                <option>011</option>
			                                <option>016</option>
			                                <option>017</option>
			                                <option>019</option>
			                            </select>
			                        </div>
                        
			                        <!-- 전화번호2 -->
			                        <div class="col-md-3">
			                            <input type="number" class="form-control phone" id="phone2"  maxlength="4" name="phone2" required>
			                        </div>
			                        
			                        <!-- 전화번호3 -->
			                        <div class="col-md-3">
			                            <input type="number" class="form-control phone" id="phone3"  maxlength="4" name="phone3" required>
			                        </div>
			                        
			                        <div class="col-md-6 offset-md-3">
			                            <span id="checkPhone">&nbsp;</span>
			                        </div>
			                        
			                        <!-- 프로필사진 -->
			                        <div class="form-row">
				                        <div class="col-md-3">
				                            <label for="profile">프로필사진</label>
				                        </div>
				                        <div class="col-md-9">
				                        	<img>
				                            <input type="email" class="form-control" id="email" name="memberEmail" autocomplete="off" required>
				                        </div>
				                        <div class="col-md-6 offset-md-3">
				                            <span id="checkEmail">&nbsp;</span>
				                        </div>
			                    	</div>
			                    </div>
								<button id="signUpBtn" type="submit" class="btn btn-primary">
									회원가입
								</button>
							</form>
						</div>
					</div>
				</div>
				<div class="col-md-1">
					
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>