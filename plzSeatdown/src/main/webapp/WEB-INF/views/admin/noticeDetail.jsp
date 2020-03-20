<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자게시판 - 공지사항 보기</title>
<link rel="stylesheet"
	href="${contextPath}/resources/css/noticeList.css" />
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
		<div class="page-wrapper" style="background-color: white;">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<div class="page-breadcrumb">
				<div class="row">
					<div class="col-12 d-flex no-block align-items-center">
						<h3 class="page-title mt-3 ml-3">공지사항 보기</h3>
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
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->
				<div class="container py-5">
					<section>
						<header class="mb-3">
							<h4 class="text-left">${adminNotice.noticeTitle}</h3>
						</header>
						<div class="d-flex justify-content-between">
							<p style="display: inline-block;">${adminNotice.noticeModifyDate}</p>
							<p style="display: inline-block;">조회수
								&nbsp;${adminNotice.noticeCount}</p>
						</div>
					</section>
					<hr>
					<section class="my-5 py-5">
						<p>${adminNotice.noticeContent}</p>
					</section>
					<hr>
					<br>
					<ul class="navbar-nav float-right">
						<li class="nav-item dropdown pr-5">
							<button class="btn btn" id="editBtn"
								onclick="location.href='updateForm';">
								수정
							</button>
							<button class="btn btn" id="listBtn" onclick="location.href='list';">글목록</button>
</div>
						</li>
					</ul>

				</div>
			</div>
			<!-- ============================================================== -->
			<!-- End PAge Content -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Right sidebar -->
			<!-- ============================================================== -->
			<!-- .right-sidebar -->
			<!-- ============================================================== -->
			<!-- End Right sidebar -->
			<!-- ============================================================== -->
		</div>
		<!-- ============================================================== -->
		<!-- End Container fluid  -->
		<!-- ============================================================== -->

	</div>
	<!-- ============================================================== -->
	<!-- End Page wrapper  -->
	<!-- ============================================================== -->

	<script>
		
	</script>
</body>
</html>