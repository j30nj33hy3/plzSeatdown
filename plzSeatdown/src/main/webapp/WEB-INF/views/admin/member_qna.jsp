<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자게시판 - 회원 문의 목록</title>

<link rel="stylesheet"
	href="${contextPath}/resources/css/member_qna.css" />

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
						<h3 class="page-title mt-3 ml-3 mb-3">회원 문의</h3>
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
				<div class="card">
					<div class="table-responsive">
						<table class="table" id="list-table">
							<thead class="thead-light">
								<tr>
									<th scope="col">글번호</th>
									<th scope="col">아이디</th>
									<th scope="col">이름</th>
									<th scope="col">제목</th>
									<th scope="col">작성일</th>
									<th scope="col">삭제</th>
									<th scope="col">처리</th>
								</tr>
							</thead>
								<tbody class="customtable">
								<c:if test="${empty list }">
									<tr>
										<td colspan="7">문의내역이 존재하지 않습니다.</td>
									</tr>
								</c:if>

								<c:if test="${!empty list }">
									<c:forEach var="qna" items="${list}" varStatus="vs">
										<tr>
											<td>${qna.qnaNo}</td>
											<td>${qna.qnaWriterId}</td>
											<td>${qna.qnaWriterName}</td>
											<td>${qna.qnaContent}</td>
											<td>${qna.qnaCreateDate}</td>
											<td><i class="fas fa-trash-alt"></td>
											<td>${qna.qnaStatus}</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
							<!-- <tbody class="customtable">
								<tr>
									<td>1</td>
									<td>user05</td>
									<td>유저오</td>
									<td>문의문의문의문의문의문의문의문의문의..</td>
									<td>2020/01/15</td>
									<td><i class="fas fa-trash-alt"></td>
									<td>N</td>
								</tr>
							</tbody> -->
						</table>
					</div>
				</div>
				<div>
					<form action="list" method="GET" class="text-center"
						id="searchForm">
						<select id="searchTitle" name="searchKey" class="form-control">
							<option value="id">아이디</option>
							<option value="title">제목</option>
						</select> <input type="text" id="searchInput" name="searchValue"
							class="form-control" placeholder="검색어를 입력해주세요.">
						<button id="searchBtn" class="form-control btn btn-primary">검색</button>
					</form>
					<!-- 페이지 이동 후에도 검색 결과가 검색창 input 태그에 표시되도록 하는 script -->
					<script>
                        $(function () {
                            var searchKey = "${param.searchKey}";
                            var searchValue = "${param.searchValue}";
                            if (searchKey != "null" && searchValue != "null") {
                                $.each($("select[name=searchKey] > option"), function (index, item) {
                                    if ($(item).val() == searchKey) {
                                        $(item).prop("selected", "true");
                                    }
                                });
                                $("input[name=searchValue]").val(searchValue);
                            }
                        });
                    </script>
				</div>
				<br>
				<nav aria-label="Page navigation example">
					<ul class="pagination" style="justify-content: center;">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								<span class="sr-only">Previous</span>
						</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
								class="sr-only">Next</span>
						</a></li>
					</ul>
				</nav>
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
        /****************************************
         *       Basic Table                   *
         ****************************************/
        $('#zero_config').DataTable();
        // 문의내역 상세조회 기능
        $(function () {
            $("#list-table td").on("click", function () {
                var noticeNo = $(this).parent().children().eq(0).text();

                // 쿼리스트링을 이용하여 GET 방식으로 글 번호를 Server로 전달
                location.href = "member_qna_detail.html";
                // "<%=request.getContextPath()%>
		/notice/detail?no="+noticeNo;
			}).on("mouseenter", function() {
				$(this).parent().css("cursor", "pointer");
			});
		});
	</script>
</body>
</html>