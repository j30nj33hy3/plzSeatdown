<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자게시판 - 회원 문의 보기</title>

<link rel="stylesheet"
	href="${contextPath}/resources/css/qnaDetail.css" />

</head>
<body>

	<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/>

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
					<div class="col-8">
						<h5 style="color: dimgray;">문의내역</h5>
						<hr>
						<form name="question" action="update?no=${qna.qnaNo}" method="post">
							<textarea id="question-detail" rows="7"	>
${qna.qnaContent}
                            </textarea>
							<br> <br> <br>
							<h5 style="color: dimgray;">답변</h5>
							<hr>
<c:if test="${empty qna }">
<textarea id="answer-detail" name="answer" rows="7" placeholder="답변을 등록해주세요." style="color:silver;"></textarea>
</c:if>

<c:if test="${!empty qna }">
<textarea id="answer-detail" name="answer" rows="7">
${qna.qnaAnswer }
</textarea>
</c:if>									

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

	<script>
	</script>


</body>
</html>