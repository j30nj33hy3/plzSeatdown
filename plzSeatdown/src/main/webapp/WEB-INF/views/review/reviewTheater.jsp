<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>PLEASE SEATDOWN</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${contextPath}/resources/css/review_theater.css" />
	</head>
	<body class="homepage is-preload" data-spy="scroll" data-target="initScroll" data-offset="1">
		<div id="page-wrapper">

			<jsp:include page="/WEB-INF/views/common/header.jsp"/>
			<jsp:include page="/WEB-INF/views/common/nav.jsp"/>

			<div class="container container-fluid">
				<div class="mt-5 mb-5 pt-3">
					<h3>공연장별</h3>
				</div>
				<div class="row mb-5">
					<div class="col-md-6">
					</div>
                    <div class="col-md-6 text-right">
						<div class="input-group">
							<input type="text" class="form-control" name="search-theater" placeholder="공연장명을 입력하세요">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button" style="background-color: #917EC6; color: white;"><i class="fas fa-search"></i></button>
							</span>
						</div>
                    </div>
				</div>
				<div class="row">
					<div class="col-md-12">
					
						<c:if test="${empty list }">
                    		<div class="row" style="justify-content: center;">
                    			<h5>등록된 공연장이 없습니다.</h5>
                    		</div>
                    	</c:if>
                    	
                    	<c:if test="${!empty list }">
                    		<div class="row">
                    			<c:forEach var="theater" items="${list}" varStatus="vs">
                    				<div class="col-md-4">
	                   					<div class="card">
    	                					<a href="#">
	                    						<img class="card-img-top" src="https://www.layoutit.com/img/people-q-c-600-200-1.jpg" />
	                    						<div class="card-block mt-3 ml-3 mr-3">
	                    							<h5 class="card-title">
	                    								${theater.thFullNm}
	                    							</h5>
	                    						</div>
	                    					</a>
                    					</div>
                    				</div>
                    			</c:forEach>
                    		</div>
                    	</c:if>
					</div>
				</div>
				
				<!-- 페이징바 -->
	            <div class="col-md-12 d-flex justify-content-center">
	                <ul class="pagination pagination-info">
	                	<c:if test="${pInf.currentPage > 1}">
		                	<li class="page-item">
				                    <a class="page-link" 
				                    	href=" 
				                    	<c:url value="theater">
				                    		<c:if test="${!empty param.searchKey }">
								        		<c:param name="searchKey" value="${param.searchKey}"/>
								        	</c:if>
								        	
								        	<c:if test="${!empty param.searchValue }">
								        		<c:param name="searchValue" value="${param.searchValue}"/>
								        	</c:if>
				                    		<c:param name="currentPage" value="1"/>
				                    	</c:url>
			                    	">
					                    &lt;&lt;
					                </a>
				            </li>
		                    <li class="page-item">
		                    	<!-- 이전으로 -->
		                    	<a class="page-link" href=" 
			                    	<c:url value="theater">
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
	                    
	                    <c:forEach var="p" begin="${pInf.startPage}" end="${pInf.endPage}">
	                    
	                    	<c:if test="${p == pInf.currentPage}">
	                    		<li class="active page-item">
	                    			<a class="page-link">${p}</a>
	                    		</li>
	                    	</c:if>
	                    	
	                    	<c:if test="${p != pInf.currentPage}">
	                    		<li class="page-item">
	                    			<a class="page-link"
	                    				href="
	                    				<c:url value="theater">
	                    					<c:if test="${!empty param.searchKey}">
	                    						<c:param name="searchKey" value="${param.searchKey}"/>
	                    					</c:if>
	                    					<c:if test="${!empty param.searchValue}">
	                    						<c:param name="searchKey" value="${param.searchValue}"/>
	                    					</c:if>
	                    					<c:param name="currentPage" value="${p}"/>
	                    				</c:url>
	                    				">${p}
	                    			</a>
	                    		</li>
	                    	</c:if>
		                    
	                    </c:forEach>
	                    
	                    <!-- 다음 -->
	                    <c:if test="${pInf.currentPage < pInf.maxPage}">
	                    	<li class="page-item">
	                    		<a class="page-link"
	                    			href="
	                    			<c:url value="theater">
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
			                <li class="page-item">
			                    <a class="page-link" 
			                    	href=" 
			                    	<c:url value="theater">
			                    		<c:if test="${!empty param.searchKey }">
							        		<c:param name="searchKey" value="${param.searchKey}"/>
							        	</c:if>
							        	<c:if test="${!empty param.searchValue }">
							        		<c:param name="searchValue" value="${param.searchValue}"/>
							        	</c:if>
			                    		<c:param name="currentPage" value="${pInf.maxPage}"/>
			                    	</c:url>
		                    	">
				                    &gt;&gt;
				                </a>
			                </li>
	                    </c:if>
	                </ul>
	            </div>

				
			</div>

			<!-- Footer -->
			<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

		</div>

		<script>
			// 공연시설장 상세보기 기능 (jquery를 통해 작업)
			$(function(){
				$("#list-table td").click(function(){
					var noticeNo = $(this).parent().children().eq(0).text();
					// 쿼리스트링을 이용하여 get 방식으로 글 번호를 server로 전달
					<c:url var="detailUrl" value="detail">
	              		<c:if test="${!empty param.searchKey }">
		        		<c:param name="searchKey" value="${param.searchKey}"/>
			        	</c:if>
			        	<c:if test="${!empty param.searchValue }">
			        		<c:param name="searchValue" value="${param.searchValue}"/>
			        	</c:if>
			        	
	                 	<c:param name="currentPage" value="${pInf.currentPage}"/>
	               	</c:url>
					
					location.href="${detailUrl}&no="+noticeNo;
				
				}).mouseenter(function(){
					$(this).parent().css("cursor", "pointer");
				
				});
				
			});
		</script>
	</body>
</html>