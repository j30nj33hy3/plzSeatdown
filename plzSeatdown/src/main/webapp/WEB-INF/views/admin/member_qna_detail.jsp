<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자게시판 - 회원 문의 보기</title>

<link rel="stylesheet"
	href="${contextPath}/resources/css/member_qna_detail.css" />

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
						<h3 class="page-title mt-3 ml-3 mb-5">회원 문의 보기</h3>
					</div>
					<br>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- End Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid">
				<div class="card ml-3 mr-3"
					style="border: none; background-color: #eeeeee;">
					<div class="col-12">
						<h5 style="color: dimgray;">문의내역</h5>
						<hr>
						<form name="question" action="#" method="get">
							<textarea id="question-detail" rows="7">
문의문의문의문의문의문의문의문의문의문의문의문의문의문의문의문의문의문의문의문의
문의문의문의문의문의문의문의문의문의문의문의문의문의문의문의문의문의문의문의문의
                            </textarea>
							<br> <br> <br>
							<h5 style="color: dimgray;">답변</h5>
							<hr>
							<textarea id="answer-detail" rows="7">
                        </textarea>
							<br> <br> <br>
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
		<!-- End Page wrapper  -->
		<!-- ============================================================== -->
	</div>
	<!-- ============================================================== -->
	<!-- End Wrapper -->
	<!-- ============================================================== -->

	<!-- 	<script>
		/****************************************
		 *       Basic Table                   *
		 ****************************************/
		$('#zero_config').DataTable();
	</script> -->


</body>
</html>