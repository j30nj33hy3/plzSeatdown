<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage-프로필</title>
<link rel="stylesheet" href="${contextPath}/resources/css/mypage_ask.css"/>

</head>
<body class="homepage is-preload">
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
	
	<!-- Main -->
			<div class="wrapper style1">
				<div class="container">
					<div class="row gtr-200">
					
						<div class="col-2 col-12-mobile" id="sidebar" style="width: 200px;">
						<h4><a href="mypage">문의 내역</a></h4>
							<ul>
								<li><a href="mypage">프로필</a></li>
								<li><a href="changePwd">비밀번호 변경</a></li>
								<li><a href="secession">회원 탈퇴</a></li>
								<li><a href="myreview">내 리뷰</a></li>
								<li><a href="myticket">내 티켓</a></li>
								<li><a href="ask">문의 내역</a></li>
							</ul>
						</div>

						<div class="col-10 col-12-mobile imp-mobile" id="content">
							<table class="table">
								<thead>
								  <tr>
								  	<th scope="col">글번호</th>
									<th scope="col">내용</th>
									<th scope="col">날짜</th>
									<th scope="col">답장 여부</th>
								  </tr>
								</thead>
								<tbody>
								<c:if test="${empty list}">
										<tr>
											<td colspan="4">존재하는 리뷰가 없습니다.</td>
										</tr>
								</c:if>
								<c:if test="${!empty list}">
									<c:forEach var="qna" items="${list}" varStatus="vs">
										<tr>
											<td>${qna.qnaNo}</td>
											<td>${qna.qnaContent}</td>
											<td>${qna.qnaCreateDate}</td>
											<td>${qna.qnaStatus}</td>
										</tr>
									</c:forEach>
								</c:if>
								</tbody>
							  </table>


							   <!-- 페이징바 -->
							  <div class="form-group col-9">
	         				   <ul class="pagination">
	            				<c:if test="${pInf.currentPage > 1}">
	                			<li>
	                				<!-- 맨 처음으로(<<) -->
	                    			<a class="page-link" href="
	                    			<c:url value="list"> 
	                    				<c:param name="currentPage" value="1"/>
	                    			</c:url>
	                    			">&lt;&lt;</a>
	                			</li>
	                
	                			<li>
	                				<!-- 이전으로(<) -->
                   					<a class="page-link" href="
                   					<c:url value="list">
                   					<c:param name="currentPage" value="${pInf.currentPage-1}"/>
                   					</c:url>
                   					">&lt;</a>
	                			</li>
	                			</c:if>
	                
	              			  <!-- 10개의 페이지 목록 -->
	               			 	 <c:forEach var="p" begin="${pInf.startPage}" end="${pInf.endPage}">
	                				<c:if test="${p == pInf.currentPage}">
		              			  		<li>
		               			   	  		<a class="page-link">${p}</a>
		               					 </li>
	                				</c:if>
	                				<c:if test="${p != pInf.currentPage}">
                						<li>
	                    					<a class="page-link" href="
	                    					<c:url value="list">
	                    						<c:param name="currentPage" value="${p}"/>
	                    					</c:url>
	                    					">${p}</a>
	                					</li>
	                					</c:if>
	            			  	 </c:forEach>
	                			<!-- 다음 페이지로(>) -->
	                			<c:if test="${pInf.currentPage < pInf.maxPage }">
	                			<li>
	                			    <a class="page-link" href="
	                			    	<c:url value="list">
	                			    		<c:param name="currentPage" value="${pInf.currentPage+1}"/>
	                			    	</c:url>
	                			    ">&gt;</a>
	                			</li>
	                
	               			 <!-- 맨 끝으로(>>) -->
	              			  <li>
	                   			 <a class="page-link" href="
	                   			 	<c:url value="list">
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
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>