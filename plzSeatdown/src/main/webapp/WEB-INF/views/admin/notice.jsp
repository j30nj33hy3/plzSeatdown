<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자게시판 - 공지사항</title>
<link rel="stylesheet" href="${contextPath}/resources/css/notice.css" />
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
						<h3 class="page-title mt-3 ml-3 mb-3">공지사항</h3>

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
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="table-responsive">
								<table class="table" id="list-table">
									<thead class="thead-light">
										<tr>
											<th><label class="customcheckbox m-b-20"> <input
													type="checkbox" id="mainCheckbox" /> <span
													class="checkmark"></span>
											</label></th>
											<th scope="col">글번호</th>
											<th scope="col">제목</th>
											<th scope="col">작성일</th>
											<th scope="col">상태</th>
											<th scope="col">삭제</th>

										</tr>
									</thead>
									<tbody class="customtable">
										<tr>
											<th><label class="customcheckbox"> <input
													type="checkbox" class="listCheckbox" /> <span
													class="checkmark"></span>
											</label></th>
											<td>5</td>
											<td>공지사항 5번째 글입니다</td>
											<td>2020/01/05</td>
											<td>Y</td>
											<td><i class="fas fa-trash-alt"></td>
										</tr>
										<tr>
											<th><label class="customcheckbox"> <input
													type="checkbox" class="listCheckbox" /> <span
													class="checkmark"></span>
											</label></th>
											<td>4</td>
											<td>공지사항 4번째 글입니다</td>
											<td>2020/01/04</td>
											<td>Y</td>
											<td><i class="fas fa-trash-alt"></td>
										</tr>
										<tr>
											<th><label class="customcheckbox"> <input
													type="checkbox" class="listCheckbox" /> <span
													class="checkmark"></span>
											</label></th>
											<td>3</td>
											<td>공지사항 3번째 글입니다</td>
											<td>2020/01/03</td>
											<td>Y</td>
											<td><i class="fas fa-trash-alt"></td>
										</tr>
										<tr>
											<th><label class="customcheckbox"> <input
													type="checkbox" class="listCheckbox" /> <span
													class="checkmark"></span>
											</label></th>
											<td>2</td>
											<td>공지사항 2번째 글입니다</td>
											<td>2020/01/02</td>
											<td>Y</td>
											<td><i class="fas fa-trash-alt"></td>
										</tr>
										<tr>
											<th><label class="customcheckbox"> <input
													type="checkbox" class="listCheckbox" /> <span
													class="checkmark"></span>
											</label></th>
											<td>1</td>
											<td>공지사항 1번째 글입니다</td>
											<td>2020/01/01</td>
											<td>Y</td>
											<td><i class="fas fa-trash-alt"></td>
										</tr>

									</tbody>
								</table>
							</div>
						</div>

						<ul class="navbar-nav float-right">
							<li class="nav-item dropdown pr-5">
								<button class="btn btn" id="write-btn" href="">
									<a href="notice_insert.jsp" id="write-href">글작성</a>
								</button>
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
		
        /****************************************
         *       Basic Table                   *
         ****************************************/
        $('#zero_config').DataTable();

        // 공지사항 상세조회 기능
        $(function () {
            $("#list-table td").on("click", function () {
                var noticeNo = $(this).parent().children().eq(0).text();

                // 쿼리스트링을 이용하여 GET 방식으로 글 번호를 Server로 전달
                location.href = "member_notice_detail.html";
                // "<%=request.getContextPath()%>
		/notice/detail?no="+noticeNo;
			}).on("mouseenter", function() {
				$(this).parent().css("cursor", "pointer");
			});
		});
	</script>
</body>
</html>