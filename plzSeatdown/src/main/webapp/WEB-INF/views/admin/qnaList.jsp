<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PLEASE SEATDOWN</title>

<link rel="stylesheet" href="${contextPath}/resources/css/qnaList.css" />
<link rel="stylesheet" href="${contextPath}/resources/css/admin.css" />
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
									<th scope="col">닉네임</th>
									<th scope="col">문의 내역</th>
									<th scope="col">작성일</th>
									<th scope="col">삭제</th>
									<th scope="col">처리</th>
								</tr>
							</thead>
							<tbody class="customtable">
								<c:if test="${empty qlist }">
									<tr>
										<td colspan="7">문의내역이 존재하지 않습니다.</td>
									</tr>
								</c:if>

								<c:if test="${!empty qlist }">
									<c:forEach var="qna" items="${qlist}" varStatus="vs">
										<tr>
											<td>${qna.qnaNo}</td>
											<td>${qna.memberId}</td>
											<td>${qna.memberName}</td>
											<td>${qna.memberNickname}</td>
											<td class="qnaTitle"><p class="ellip">${qna.qnaContent}</p></td>
											<td>${qna.qnaCreateDate}</td>
											<td><i class="fas fa-trash-alt deleteBtn"></td>
											<td>${qna.qnaStatus}</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
				<!-- 페이징바 -->
				<div class="col-md-12 d-flex justify-content-center">
					<ul class="pagination pagination-info">
						<c:if test="${pInf.currentPage > 1}">
							<li class="page-item"><a class="page-link"
								href=" 
			                    	<c:url value="list">
			                    		<c:if test="${!empty param.searchKey }">
							        		<c:param name="searchKey" value="${param.searchKey}"/>
							        	</c:if>
							        	
							        	<c:if test="${!empty param.searchValue }">
							        		<c:param name="searchValue" value="${param.searchValue}"/>
							        	</c:if>
			                    		<c:param name="currentPage" value="1"/>
			                    	</c:url>
		                    	">
									&lt;&lt; </a></li>
							<li class="page-item">
								<!-- 이전으로 --> <a class="page-link"
								href=" 
		                    	<c:url value="list">
		                    		<c:if test="${!empty param.searchKey }">
						        		<c:param name="searchKey" value="${param.searchKey}"/>
						        	</c:if>
						        	
						        	<c:if test="${!empty param.searchValue }">
                                            <c:param name="searchValue" value="${param.searchValue}"/>
                                    </c:if>
		                    		<c:param name="currentPage" value="${pInf.currentPage-1}"/>
		                    	</c:url>
	                    	">&lt;</a>
							</li>
						</c:if>

						<c:forEach var="p" begin="${pInf.startPage}" end="${pInf.endPage}">

							<c:if test="${p == pInf.currentPage}">
								<li class="active page-item"><a class="page-link">${p}</a>
								</li>
							</c:if>

							<c:if test="${p != pInf.currentPage}">
								<li class="page-item"><a class="page-link"
									href=" 
                                        <c:url value="list">
                                            <c:if test="${!empty param.searchKey }">
                                                <c:param name="searchKey" value="${param.searchKey}"/>
                                            </c:if>
                                            
                                            <c:if test="${!empty param.searchValue }">
                                                <c:param name="searchValue" value="${param.searchValue}"/>
                                            </c:if>
                                            <c:param name="currentPage" value="${p}"/>
                                        </c:url>
                                    ">${p}</a>
								</li>
							</c:if>
						</c:forEach>

						<!-- 다음 -->
						<c:if test="${pInf.currentPage < pInf.maxPage}">
							<li class="page-item"><a class="page-link"
								href="
                    			<c:url value="list">
                    				<c:if test="${!empty param.searchKey }">
                    					<c:param name="searchKey" value="${param.searchKey}"/>
                    				</c:if>
                    				<c:if test="${!empty param.searchValue }">
						        		<c:param name="searchValue" value="${param.searchValue}"/>
						        	</c:if>
		                    		<c:param name="currentPage" value="${pInf.currentPage+1}"/>
                    			</c:url>
                    			">&gt;</a>
							</li>

							<!-- 맨 끝으로(>>) -->
							<li class="page-item"><a class="page-link"
								href=" 
		                    	<c:url value="list">
		                    		<c:if test="${!empty param.searchKey }">
						        		<c:param name="searchKey" value="${param.searchKey}"/>
						        	</c:if>
						        	<c:if test="${!empty param.searchValue }">
						        		<c:param name="searchValue" value="${param.searchValue}"/>
						        	</c:if>
		                    		<c:param name="currentPage" value="${pInf.maxPage}"/>
		                    	</c:url>
	                    	">
									&gt;&gt; </a></li>
						</c:if>
					</ul>
				</div>


				<div>
					<form action="list" method="GET" class="text-center"
						id="searchForm">
						<select id="searchTitle" name="searchKey" class="form-control">
							<option value="id">아이디</option>
							<option value="content">문의 내역</option>
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
        // 문의내역 상세조회 기능
        $(function () {
            $(".qnaTitle").click(function(){
                var qnaNo = $(this).parent().children().eq(0).text();
                var qnaStatus = $(this).parent().children().eq(7).text();
                <c:url var="detailUrl" value="detail">
				<c:if test="${!empty param.searchKey}">
					<c:param name="searchKey" value="${param.searchKey}"/>
				</c:if>
				<c:if test="${!empty param.searchValue}">
					<c:param name="searchValue" value="${param.searchValue}"/>
				</c:if>
				<c:param name="currentPage" value="${pInf.currentPage}" />
				</c:url>
				
				location.href="${detailUrl}&no="+qnaNo;
			
            }).mouseenter(function(){
				$(this).css("cursor", "pointer");
			});	
		});
               
        
        $(function() {
			$(".deleteBtn").click(function(){
			var qnaNo = $(this).parent().parent().children().eq(0).text();
			var status = $(this).parent().parent().children().eq(7).text();
			console.log(status);
			if(confirm("정말 삭제 하시겠습니까?"))
				if(status == 'D') {
					alert("이미 삭제된 문의글입니다.");				
				} else {
					location.href = "delete?no="+qnaNo;
				}
			}).mouseenter(function(){
				$(this).parent().css("cursor", "pointer");
			});	
		});
	</script>
</body>
</html>