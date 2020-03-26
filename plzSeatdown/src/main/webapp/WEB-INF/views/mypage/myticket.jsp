<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage-프로필</title>
<link rel="stylesheet" href="${contextPath}/resources/css/mypage_myticket.css"/>

</head>
<body class="homepage is-preload">
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
	
	<!-- Main -->
			<div class="wrapper style1">
				<div class="container">
					<div class="row gtr-200">
					
						<div class="col-2 col-12-mobile" id="sidebar" style="width: 200px;">
						<h4><a href="mypage">내 티켓</a></h4>
							<ul>
								<li><a href="mypage">프로필</a></li>
								<li><a href="changePwd">비밀번호 변경</a></li>
								<li><a href="secession">회원 탈퇴</a></li>
								<li><a href="myreview">내 리뷰</a></li>
								<li><a href="myticket">내 티켓</a></li>
								<li><a href="mycommu">내 커뮤</a></li>
								<li><a href="ask">문의 내역</a></li>
							</ul>
						</div>
						
						
						<div class="col-10 col-12-mobile imp-mobile" id="content">
							<div class="container">
								<div class="grid">
									<div class="row gallery">
									
									 <c:if test="${empty rimgList}">
                                   		<div id="nolistdiv" class="col-md-12">
                                      		<span id="nolist">존재하는 게시글이 없습니다</span>
                                  		</div>
                             		</c:if>
									
									<c:if test="${!empty rimgList}">
                             			<c:forEach var="reviewimg" items="${rimgList}" varStatus="vs">
									  	
          							  <div class='col-md-3'>
          							  	<div style="display:none;">${reviewimg.reviewNo}</div>
          							  	
          							  		<c:if test="${reviewimg.reviewWriter == loginMember.memberNo}">
                                         		<c:set var="src" value="${contextPath}/resources/reviewImages/${reviewimg.reviewImagePath}"/>
                                        	</c:if>
                                      
                							<a class="thumbnail fancybox" rel="ligthbox" href="${src}">
                    							<img class="img-responsive" src="${src}" style="width: 200px; height: 175px;" />
              								</a>
           							  </div> 
           							  
           							  	</c:forEach>
           							 </c:if>
            

									   </div>

									     <!-- 페이징바 -->
           					 <div class="col-md-12 d-flex justify-content-center" style="margin-top: 175px;">
	         				   <ul class="pagination pagination-info">
	            				<c:if test="${pInf.currentPage > 1}">
	                			<li class="page-item">
	                				<!-- 맨 처음으로(<<) -->
	                    			<a class="page-link" href="
	                    			<c:url value="myticket"> 
	                    				<c:param name="currentPage" value="1"/>
	                    			</c:url>
	                    			">&lt;&lt;</a>
	                			</li>
	                
	                			<li class="page-item">
	                				<!-- 이전으로(<) -->
                   					<a class="page-link" href="
                   					<c:url value="myticket">
                   					<c:param name="currentPage" value="${pInf.currentPage-1}"/>
                   					</c:url>
                   					">PREV</a>
	                			</li>
	                			</c:if>
	                
	              			  <!-- 10개의 페이지 목록 -->
	               			 	 <c:forEach var="p" begin="${pInf.startPage}" end="${pInf.endPage}">
	                				<c:if test="${p == pInf.currentPage}">
		              			  		<li class="active page-item">
		               			   	  		<a class="page-link">${p}</a>
		               					 </li>
	                				</c:if>
	                				<c:if test="${p != pInf.currentPage}">
                						<li class="page-item">
	                    					<a class="page-link" href="
	                    					<c:url value="myticket">
	                    						<c:param name="currentPage" value="${p}"/>
	                    					</c:url>
	                    					">${p}</a>
	                					</li>
	                					</c:if>
	            			  	 </c:forEach>
	                			<!-- 다음 페이지로(>) -->
	                			<c:if test="${pInf.currentPage < pInf.maxPage }">
	                			<li class="page-item">
	                			    <a class="page-link" href="
	                			    	<c:url value="myticket">
	                			    		<c:param name="currentPage" value="${pInf.currentPage+1}"/>
	                			    	</c:url>
	                			    ">NEXT</a>
	                			</li>
	                
	               			 <!-- 맨 끝으로(>>) -->
	              			  <li class="page-item">
	                   			 <a class="page-link" href="
	                   			 	<c:url value="myticket">
	                   			 		<c:param name="currentPage" value="${pInf.maxPage}"/>
	                   			 	</c:url>
	                   			 ">&gt;&gt;</a>
	               			 </li>
	               			 </c:if>
	        			    </ul>
							  </div>

										</div>
									</div>
									</div>

					</div>
				</div>
			</div>
			
			<script>
			
			$(document).ready(function(){
			    //FANCYBOX
			    //https://github.com/fancyapps/fancyBox
			    $(".fancybox").fancybox({
			        openEffect: "none",
			        closeEffect: "none"
			    });
			});
			   
			</script>
		
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>