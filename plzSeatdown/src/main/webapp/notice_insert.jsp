<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자게시판 - 공지사항 등록</title>

<link rel="stylesheet"
	href="${contextPath}/resources/css/notice_insert.css" />
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/summernote-lite.css">
</head>

<body>

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
						<h3 class="page-title mt-3 ml-3 mb-3">공지사항 작성</h3>
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
				<!-- editor -->
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title"></h4>
								<!-- Create the editor container -->
								<form name="notice_incert" action="#" method="get">
									<!-- <label class="input-group-addon mr-3">제목</label> -->
									<input type="text" class="form-control" id="noticeTitle"
										name="noticeTitle" size="70"> <br>
									<textarea id="summernote" name="editordata"></textarea>
									<br> <br>
									<div style="text-align: center;">
										<button class="form-control btn btn-primary" id="submit-btn"
											type="submit">등록</button>
										<button class="form-control btn btn-primary" id="reset-btn"
											type="reset">취소</button>
									</div>
								</form>
							</div>
						</div>
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
		<!-- End Wrapper -->
		<!-- ============================================================== -->
		<!-- This Page JS -->

		<script
			src="${contextPath}/resources/js/admin/jquery.inputmask.bundle.min.js"></script>
		<script src="${contextPath}/resources/js/admin/mask.init.js"></script>
		<script src="${contextPath}/resources/js/admin/select2.full.min.js"></script>
		<script src="${contextPath}/resources/js/admin/select2.min.js"></script>
		<script src="${contextPath}/resources/js/admin/jquery-asColor.min.js"></script>
		<script src="${contextPath}/resources/js/admin/jquery-asGradient.js"></script>
		<script
			src="${contextPath}/resources/js/admin/jquery-asColorPicker.min.js"></script>
		<script
			src="${contextPath}/resources/js/admin/jquery.minicolors.min.js"></script>
		<script
			src="${contextPath}/resources/js/admin/bootstrap-datepicker.min.js"></script>

		<script src="${contextPath}/resources/js/admin/summernote-lite.js"></script>
		<script src="${contextPath}/resources/js/admin/summernote-ko-KR.js"></script>
		<script src="${contextPath}/resources/js/admin/notice_insert.js"></script>

</body>
</html>