<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 - 회원 상세 보기</title>

<link rel="stylesheet"
	href="${contextPath}/resources/css/member_detail.css" />
	
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script src="${contextPath}/resources/js/admin/member_detail.js"></script>
   
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
					<div class="jumbotron ml-3 mr-3" style="text-align: left;">
						<form class="form-group" method="POST" action="#"
							onsubmit="return validate();">

							<div class="col-md-8" style="float: left;">
								<h6>회원번호</h6>
								<input type="text" class="form-control input-comment" id="no"
									name="no" value="회원번호" disabled required> <br>

								<h6>아이디</h6>
								<input type="text" class="form-control input-comment" id="id"
									name="id" value="아이디" disabled required> <br>

								<h6>이름</h6>
								<input type="text" class="form-control input-comment" id="name"
									name="name" value="이름" required> <br>

								<h6>이메일</h6>
								<input type="email" class="form-control input-comment"
									id="email" name="email" value="user00@plzsd.com" required>
								<br>

								<h6>전화번호</h6>
								<!-- <select class="custom-select form-control input-comment" id="phone1" name="phone1"
                                    style="float:left; width:165px; background-color: white;" disabled required>
                                    <option>010</option>
                                    <option>011</option>
                                    <option>016</option>
                                    <option>017</option>
                                    <option>019</option>
                                </select> -->
								<input type="number" class="form-control input-comment phone"
									id="phone1" name="phone1" maxlength="3" value="010" disabled
									required>- <input type="number"
									class="form-control input-comment phone" id="phone2"
									name="phone2" maxlength="4" value="0000" disabled required>-
								<input type="number" class="form-control input-comment phone"
									id="phone3" name="phone3" maxlength="4" value="0000" disabled
									required>
							</div>

							<div class="col-md-3" style="display: inline-block;">

								<div class="ml-3" id="profile-wrap">
									<h6>프로필 사진</h6>
									<img class="member-profile" id="profile-img"
										src="${contextPath }/resources/images/navi-icon-default.png"
										alt="프로필아이콘" style="width: 80%"> <br> <label
										for="upload" id="upBtn"
										class="btn btn-sm form-control profile-edit-btn"
										style="float: right;">변경</label> <input type="file"
										id="upload" accept="image/*">
								</div>

							</div>


							<div class="col-md-12" style="clear: both; text-align: center;">

								<button class="btn mt-5 form-control edit-btn" id="editBtn" type="submit"
									style="width: 20%">수정</button>
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>

	</div>




</body>
</html>