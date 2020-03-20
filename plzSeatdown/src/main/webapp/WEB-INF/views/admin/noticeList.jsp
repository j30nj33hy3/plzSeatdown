<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자게시판 - 공지사항</title>
<link rel="stylesheet"
	href="${contextPath}/resources/css/noticeList.css" />
</head>
<body>

	<c:set var="contextPath"
		value="${pageContext.servletContext.contextPath }" scope="application" />

	<c:if test="${!empty msg}">
		<script>alert("${msg}")</script>
		<c:remove var="msg" />
	</c:if>

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
											<th scope="col">글번호</th>
											<th scope="col">제목</th>
											<th scope="col">작성일</th>
											<th scope="col">상태</th>
											<th scope="col">삭제</th>
										</tr>
									</thead>
									<tbody class="customtable">
										<c:if test="${empty aNoticeList }">
											<tr>
												<td colspan="5">공지사항이 존재하지 않습니다.</td>
											</tr>
										</c:if>

										<c:if test="${!empty aNoticeList }">
											<c:forEach var="notice" items="${aNoticeList}" varStatus="vs">
												<tr>
													<td>${notice.noticeNo}</td>
													<td class="noticeTitle">${notice.noticeTitle}</td>
													<td>${notice.noticeCreateDate}</td>
													<td>${notice.noticeStatus}</td>
													<td><i class="fas fa-trash-alt deleteBtn"></td>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
									<!-- <tbody class="customtable">
										<tr>
											<td>1</td>
											<td>공지사항 1번째 글입니다</td>
											<td>2020/01/01</td>
											<td>Y</td>
											<td><i class="fas fa-trash-alt"></td>
										</tr>
									</tbody> -->
								</table>
							</div>
						</div>


						<!-- 						<nav aria-label="Page navigation example">
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
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										<span class="sr-only">Next</span>
								</a></li>
							</ul>
						</nav> -->

						<%-- <!-- 페이징바 -->
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
	                    	">PREV</a>
									</li>
								</c:if>

								<c:forEach var="p" begin="${pInf.startPage}"
									end="${pInf.endPage}">

									<c:if test="${p == pInf.currentPage}">
										<li class="active page-item"><a class="page-link">${p}</a>
										</li>
									</c:if>

									<c:if test="${p != pInf.currentPage}">
										<li class="page-item"><a class="page-link"
											href="
                    				<c:url value="list">
                    					<c:if test="${!empty param.searchKey}">
                    						<c:param name="searchKey" value="${param.searchKey}"/>
                    					</c:if>
                    					<c:if test="${!empty param.searchValue}">
                    						<c:param name="searchKey" value="${param.searchValue}"/>
                    					</c:if>
                    					<c:param name="currentPage" value="${p}"/>
                    				</c:url>
                    				">${p}
										</a></li>
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
                    			">NEXT</a>
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
 --%>

						<!---------------------------------- 페이징 바 ---------------------------------->
						<div style="clear: both;">
							<nav aria-label="Page navigation example">
								<ul class="pagination" style="justify-content: center;">
									<c:if test="${pInf.currentPage > 1}">
										<li>
											<!-- 맨 처음으로(<<) --> <!-- 
                                    c:url 태그에 var 속성이 존재하지 않으면
                                   	 변수처럼 사용되는 것이 아닌, 작성된 자리에 바로 URL 형식으로 표기됨
                                --> <a class="page-link"
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
												&lt;&lt; </a>
										</li>

										<li>
											<!-- 이전으로(<) --> <a class="page-link"
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
                                ">
												&lt; </a>
										</li>
									</c:if>

									<!-- 10개의 페이지 목록 -->
									<c:forEach var="p" begin="${pInf.startPage}"
										end="${pInf.endPage}">


										<c:if test="${p == pInf.currentPage}">
											<li><a class="page-link">${p}</a></li>
										</c:if>

										<c:if test="${p != pInf.currentPage}">
											<li><a class="page-link"
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
                                    ">
													${p} </a></li>
										</c:if>

									</c:forEach>

									<!-- 다음 페이지로(>) -->
									<c:if test="${pInf.currentPage < pInf.maxPage }">
										<li><a class="page-link"
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
                                ">
												&gt; </a></li>

										<!-- 맨 끝으로(>>) -->
										<li><a class="page-link"
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
							</nav>
						</div>


						<br>
						<ul class="navbar-nav float-right">
							<li class="nav-item dropdown pr-5">
								<button class="btn btn" id="write-btn"
									onclick="location.href='insertForm';">
									<%-- <a href="${contextPath }/admin/notice/insertF" id="write-href"> --%>
									글작성
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

        // 공지사항 상세조회 기능
        $(function () {
            $(".noticeTitle").click(function(){
                var noticeNo = $(this).parent().children().eq(0).text();
				console.log(noticeNo);
                <c:url var="detailUrl" value="detail">
				<c:if test="${!empty param.searchKey}">
					<c:param name="searchKey" value="${param.searchKey}"/>
				</c:if>
				<c:if test="${!empty param.searchValue}">
					<c:param name="searchValue" value="${param.searchValue}"/>
				</c:if>
				<c:param name="currentPage" value="${pInf.currentPage}" />
				</c:url>
				location.href="${detailUrl}&no="+noticeNo;
			}).mouseenter(function(){
				$(this).css("cursor", "pointer");
			});	
		});
        
           $(function() {
			$(".deleteBtn").click(function(){
			var noticeNo = $(this).parent().parent().children().eq(0).text();
			console.log(noticeNo); 
			if(confirm("정말 삭제 하시겠습니까?"))
				location.href = "delete?no="+noticeNo;
			}).mouseenter(function(){
				$(this).parent().css("cursor", "pointer");
			});	
		});
               
                
                
	</script>
</body>
</html>