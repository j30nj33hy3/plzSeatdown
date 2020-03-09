<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 - 회원 목록</title>
<link rel="stylesheet"
	href="${contextPath}/resources/css/member_list.css" />
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
						<h3 class="page-title mt-3 ml-3 mb-3">회원 목록</h3>
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
						<table class="table">
							<thead class="thead-light">
								<tr>
									<th><label class="customcheckbox m-b-20"> <input
											type="checkbox" id="mainCheckbox" /> <span class="checkmark"></span>
									</label></th>
									<th scope="col">회원번호</th>
									<th scope="col">아이디</th>
									<th scope="col">이름</th>
									<th scope="col">이메일</th>
									<th scope="col">가입일</th>
									<th scope="col">상태</th>
									<th scope="col">신고 횟수</th>
									<th scope="col">수정</th>
									<th scope="col">삭제</th>

								</tr>
							</thead>
							<tbody class="customtable">
								<tr>
									<th><label class="customcheckbox"> <input
											type="checkbox" class="listCheckbox" /> <span
											class="checkmark"></span>
									</label></th>
									<td>1</td>
									<td>user01</td>
									<td>유저일</td>
									<td>user01@plzsd.com</td>
									<td>2020/01/01</td>
									<td>Y</td>
									<td>0</td>
									<td><a class="edit" href="member_detail.html"><i
											class="mdi mdi-settings"></i></a></td>
									<td><i class="fas fa-trash-alt"></td>
								</tr>
								<tr>
									<th><label class="customcheckbox"> <input
											type="checkbox" class="listCheckbox" /> <span
											class="checkmark"></span>
									</label></th>
									<td>2</td>
									<td>user02</td>
									<td>유저이</td>
									<td>user02@plzsd.com</td>
									<td>2020/01/02</td>
									<td>Y</td>
									<td>0</td>
									<td><a class="edit" href="member_detail.html"><i
											class="mdi mdi-settings"></i></a></td>
									<td><i class="fas fa-trash-alt"></td>
								</tr>
								<tr>
									<th><label class="customcheckbox"> <input
											type="checkbox" class="listCheckbox" /> <span
											class="checkmark"></span>
									</label></th>
									<td>3</td>
									<td>user03</td>
									<td>유저삼</td>
									<td>user03@plzsd.com</td>
									<td>2020/01/03</td>
									<td>Y</td>
									<td>0</td>
									<td><a class="edit" href="member_detail.html"><i
											class="mdi mdi-settings"></i></a></td>
									<td><i class="fas fa-trash-alt"></td>
								</tr>
								<tr>
									<th><label class="customcheckbox"> <input
											type="checkbox" class="listCheckbox" /> <span
											class="checkmark"></span>
									</label></th>
									<td>4</td>
									<td>user04</td>
									<td>유저사</td>
									<td>user04@plzsd.com</td>
									<td>2020/01/04</td>
									<td>Y</td>
									<td>1</td>
									<td><a class="edit" href="member_detail.html"><i
											class="mdi mdi-settings"></i></a></td>
									<td><i class="fas fa-trash-alt"></td>
								</tr>
								<tr>
									<th><label class="customcheckbox"> <input
											type="checkbox" class="listCheckbox" /> <span
											class="checkmark"></span>
									</label></th>
									<td>5</td>
									<td>user05</td>
									<td>유저오</td>
									<td>user05@plzsd.com</td>
									<td>2020/01/05</td>
									<td>Y</td>
									<td>0</td>
									<td><a class="edit" href="member_detail.html"><i
											class="mdi mdi-settings"></i></a></td>
									<td><i class="fas fa-trash-alt"></td>
								</tr>
								<tr>
									<th><label class="customcheckbox"> <input
											type="checkbox" class="listCheckbox" /> <span
											class="checkmark"></span>
									</label></th>
									<td>6</td>
									<td>user06</td>
									<td>유저육</td>
									<td>user06@plzsd.com</td>
									<td>2020/01/06</td>
									<td>Y</td>
									<td>2</td>
									<td><a class="edit" href="member_detail.html"><i
											class="mdi mdi-settings"></i></a></td>
									<td><i class="fas fa-trash-alt"></td>
								</tr>
								<tr>
									<th><label class="customcheckbox"> <input
											type="checkbox" class="listCheckbox" /> <span
											class="checkmark"></span>
									</label></th>
									<td>7</td>
									<td>user07</td>
									<td>유저칠</td>
									<td>user07@plzsd.com</td>
									<td>2020/01/07</td>
									<td>Y</td>
									<td>0</td>
									<td><a class="edit" href="member_detail.html"><i
											class="mdi mdi-settings"></i></a></td>
									<td><i class="fas fa-trash-alt"></td>
								</tr>
								<tr>
									<th><label class="customcheckbox"> <input
											type="checkbox" class="listCheckbox" /> <span
											class="checkmark"></span>
									</label></th>
									<td>8</td>
									<td>user08</td>
									<td>유저팔</td>
									<td>user08@plzsd.com</td>
									<td>2020/01/08</td>
									<td>Y</td>
									<td>0</td>
									<td><a class="edit" href="member_detail.html"><i
											class="mdi mdi-settings"></i></a></td>
									<td><i class="fas fa-trash-alt"></td>
								</tr>
								<tr>
									<th><label class="customcheckbox"> <input
											type="checkbox" class="listCheckbox" /> <span
											class="checkmark"></span>
									</label></th>
									<td>9</td>
									<td>user09</td>
									<td>유저구</td>
									<td>user09@plzsd.com</td>
									<td>2020/01/09</td>
									<td>Y</td>
									<td>0</td>
									<td><a class="edit" href="member_detail.html"><i
											class="mdi mdi-settings"></i></a></td>
									<td><i class="fas fa-trash-alt"></td>
								</tr>
								<tr>
									<th><label class="customcheckbox"> <input
											type="checkbox" class="listCheckbox" /> <span
											class="checkmark"></span>
									</label></th>
									<td>10</td>
									<td>user10</td>
									<td>유저십</td>
									<td>user10@plzsd.com</td>
									<td>2020/01/10</td>
									<td>Y</td>
									<td>1</td>
									<td><a class="edit" href="member_detail.html"><i
											class="mdi mdi-settings"></i></a></td>
									<td><i class="fas fa-trash-alt"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

				<div>
					<form action="list" method="GET" class="text-center"
						id="searchForm">
						<select id="searchTitle" name="searchKey" class="form-control">
							<option value="id">아이디</option>
							<option value="name">이름</option>
						</select> <input type="text" id="searchInput" name="searchValue"
							class="form-control" placeholder="검색어를 입력해주세요.">
						<button id="searchBtn" class="form-control btn btn-primary">검색</button>
					</form>

					<!-- 페이지 이동 후에도 검색 결과가 검색창 input 태그에 표시되도록 하는 script -->
					<script>
						$(function() {
							var searchKey = "${param.searchKey}";
							var searchValue = "${param.searchValue}";

							if (searchKey != "null" && searchValue != "null") {
								$.each($("select[name=searchKey] > option"),
										function(index, item) {
											if ($(item).val() == searchKey) {
												$(item)
														.prop("selected",
																"true");
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
			<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />
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