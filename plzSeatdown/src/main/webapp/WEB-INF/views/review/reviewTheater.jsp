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
	
	<style>
		.ellip{
		   margin: 0;
		   margin: auto;
		   width: 100px;
		   height: 1.5em;
		   overflow: hidden;
		   text-overflow: ellipsis;
		   white-space: nowrap;
		}
		.card :hover{
			cursor: pointer;
		}
	</style>
	
	</head>
	<!-- <body class="homepage is-preload" data-spy="scroll" data-target="initScroll" data-offset="1"> -->
	<body>
		<!-- <div id="page-wrapper"> -->

			<jsp:include page="../common/header.jsp"/>
			<jsp:include page="../common/nav.jsp"/>

			<div class="container container-fluid my-5">
				<div class="pb-4">
		            <h5>공연장별</h5>
		        </div>
				<div class="row mb-5">
					<div class="col-md-6">
					</div>
                    <div class="col-md-6 text-right">
                    	<form>
							<div class="input-group">
								<input type="text" class="form-control" name="searchTheater" placeholder="공연장명을 입력하세요">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button" style="background-color: #917EC6; color: white;"><i class="fas fa-search"></i></button>
								</span>
							</div>
						</form>
                    </div>
				</div>
				<div class="row">
					<jsp:include page="/WEB-INF/views/review/reviewSideMenu.jsp"/>
					<div class="col-md-10">
					
						<div class="row">
							<c:if test="${empty list }">
	                    		<div class="row" style="justify-content: center;">
	                    			<h5>등록된 공연장이 없습니다.</h5>
	                    		</div>
	                    	</c:if>
	                    	
	                    	<c:if test="${!empty list }">
	                    		<div class="row">
	                    			<c:forEach var="theater" items="${list}" varStatus="vs">
	                    				<div class="col-md-4 mb-3">
		                   					<div class="card" onclick="location.href='seats?thCode=${theater.thCode }'">
	   	                						<div style="height: 115px;">
		                    						<c:set var="src" value="${contextPath}/resources/images/theater_noImage.png"/>
							                        <c:if test="${!empty theater.thLogoPath}">
							                        	<c:set var ="src" value="${contextPath}/resources/theaterLogo/${theater.thLogoPath}"/>
							                        </c:if>
							                        <img id="${theater.thCode}Img" class="card-img-top" src="${src}" style="width: 100%; height: 100%;">
	                    						</div>
	                    						<div class="card-block mt-2 ml-3 mr-3 mb-2">
	                    							<span class="card-title ellip">
	                    								${theater.thNm}
	                    							</span>
	                    						</div>
	                    					</div>
	                    				</div>
	                    			</c:forEach>
	                    		</div>
	                    	</c:if>
						</div>
						
						<!-- 페이징바 -->
			            <div class="row d-flex justify-content-center mt-5">
			                <ul class="pagination pagination-info">
			                	<c:if test="${pInf.currentPage > 1}">
				                	<li class="page-item">
						                    <a class="page-link" 
						                    	href=" 
						                    	<c:url value="theater">
										        	<c:if test="${!empty param.searchTheater }">
										        		<c:param name="searchTheater" value="${param.searchTheater}"/>
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
									        	<c:if test="${!empty param.searchTheater }">
									        		<c:param name="searchTheater" value="${param.searchTheater}"/>
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
			                    					<c:if test="${!empty param.searchTheater}">
			                    						<c:param name="searchTheater" value="${param.searchTheater}"/>
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
			                    				<c:if test="${!empty param.searchTheater }">
									        		<c:param name="searchTheater" value="${param.searchTheater}"/>
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
									        	<c:if test="${!empty param.searchTheater }">
									        		<c:param name="searchTheater" value="${param.searchTheater}"/>
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
				</div>
				
				

				
			</div>

			<!-- Footer -->
			<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

		<!-- </div> -->
		
		<!-- 페이지 이동 후에도 검색 결과가 검색창 input 태그에 표시되도록 하는 script -->
		<script>
			$(function(){
				var searchTheater = "${param.searchTheater}";
				
				if(searchTheater != "null"){
					$("input[name=searchTheater]").val(searchTheater);
				}
				
			});
		</script>
		
		<!-- 사이드 메뉴 이름 변경 -->
		<script>
			$(function(){
				$("#sideMenu #clickedPage").attr("href","theater").html("공연장별");
			});
		</script>

		<!-- <script>
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
		</script> -->
	</body>
</html>