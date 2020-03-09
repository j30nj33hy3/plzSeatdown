<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage-프로필</title>
<link href="mypage-myreview.css" rel="stylesheet">
</head>
<body class="homepage is-preload">
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
	
	<!-- Main -->
			<div class="wrapper style1">
				<div class="container">
					<div class="row gtr-200">
					
						<jsp:include page="/WEB-INF/views/mypage/sideMenu.jsp"/>

						<div class="col-10 col-12-mobile imp-mobile" id="content">
							<table class="table">
								<thead>
								  <tr>
								  	<th scope="col">번호</th>
									<th scope="col">장소(좌석)</th>
									<th scope="col">좌석 별점</th>
									<th scope="col">공연</th>
									<th scope="col">날짜</th>
									<th scope="col">사진</th>
									<th scope="col"></th>
								  </tr>
								</thead>
								<tbody>
									<c:if test="${empty list}">
										<tr>
											<td colspan="7">존재하는 리뷰가 없습니다.</td>
										</tr>
									</c:if>
									<c:if test="${!empty list}">
										<c:forEach var="review" items="${list}" varStatus="vs">
											<tr>
												<td>${review.reviewNo}</td>
												<td>${review.theaterName}</td>
												<td>☆☆★★★</td>
												<td>${review.showTitle}</td>
												<td>${review.reviewCreateDate}</td>
												<td>${review.seatImageStatus}</td>
												<td><button type="button" class="updatebtn"><img src="images/pen.png" class="edit"></button></td>
									 	 </tr>
										</c:forEach>
									</c:if>
								</tbody>
							  </table>

							  <div class="form-group col-9">
								<ul class="pagination">
								
								<c:if test="${pInf.currentPage > 1}">
								<!-- 이전으로(<) -->
								  <li class="page-item disabled">
									<a class="page-link" href="
										<c:url value="list">
		                    				<c:param name="currentPage" value="${pInf.currentPage-1}"/>
		                    			</c:url>
									">◀</a>
								  </li>
								</c:if>
								<!-- 5개의 페이지 목록 -->
								<c:forEach var="p" begin="${pInf.startPage}" end="${pInf.endPage}">
	                				<c:if test="${p == pInf.currentPage}">
			              			  <li class="page-item">
			                    		<a class="page-link">${p}</a>
			               			  </li>
		               				</c:if>
		               				
	                				<c:if test="${p != pInf.currentPage}">
	                				  <li class="page-item">
		                    			<a class="page-link" 
			                    		href=" 
			                    		<c:url value="list">
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
										<c:url value="list">
		                    				<c:param name="currentPage" value="${pInf.currentPage+1}"/>
		                    			</c:url>
									">▶</a>
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