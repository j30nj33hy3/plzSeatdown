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
								<li><a href="ask">문의 내역</a></li>
							</ul>
						</div>

						<div class="col-10 col-12-mobile imp-mobile" id="content">
							<div class="container">
								<div class="grid">
									<div class="row">
									
									<c:if test="${empty list}">
										<div class="col-md-12">
											<p>존재하는 사진이 없습니다.</p>
										</div>
									</c:if>
									<c:if test="${!empty list}">
										<c:forEach var="review" items="${list}" varStatus="vs">
										<div class="col-md-3">
											<figure class="effect-ravi">
											<%-- <%
										
                                        		String src = request.getContextPath()+"/resources/uploadImages/noImage.png";
                                        		for(Attachment file : aList ){
                                        			 //<c:if test="${ file.BoardNo == board.BoardNo && file.FileLevel ==0 && file.FileStatus.equals("N")}">
                                        			if(file.BoardNo() == board.getBoardNo() && file.getFileLevel()==0 && file.getFileStatus().equals("N")){
                                        				src = request.getContextPath()+"/resources/uploadImages/"+file.getFileChangeName();
                                        			}
                                        		}
                                        	%> --%>
												<img src="${src}" alt="img1" style="width: 200px; height: 175px;"/>
												<figcaption>
													<p>
														<a href="#"><i class="fa fa-search"></i></a>
													</p>
												</figcaption>
											</figure>
										</div>
										</c:forEach>
									</c:if>
										<div class="col-md-3">
											<figure class="effect-ravi">
												<img src="images/ticket2.jpg" alt="img2" style="width: 200px; height: 175px;"/>
												<figcaption>
													<p>
														<a href="#"><i class="fa fa-search"></i></a>
													</p>
												</figcaption>
											</figure>
										</div>
										<div class="col-md-3">
											<figure class="effect-ravi">
												<img src="images/ticket3.jpg" alt="img3" style="width: 200px; height: 175px;"/>
												<figcaption>
													<p>
														<a href="#"><i class="fa fa-search"></i></a>
													</p>
												</figcaption>
											</figure>
										</div>
										<div class="col-md-3">
											<figure class="effect-ravi">
												<img src="images/ticket4.jpg" alt="img4" style="width: 200px; height: 175px;"/>
												<figcaption>
													<p>
														<a href="#"><i class="fa fa-search"></i></a>
													</p>
												</figcaption>
											</figure>
										</div>

									   </div>

									   <div class="row rowbt">

										<div class="col-md-3">
											<figure class="effect-ravi">
												<img src="images/ticket1.jpg" alt="img5" style="width: 200px; height: 175px;"/>
												<figcaption>
													<p>
														<a href="#"><i class="fa fa-search"></i></a>
													</p>
												</figcaption>
											</figure>
										</div>
										<div class="col-md-3">
											<figure class="effect-ravi">
												<img src="images/ticket2.jpg" alt="img6" style="width: 200px; height: 175px;"/>
												<figcaption>
													<p>
														<a href="#"><i class="fa fa-search"></i></a>
													</p>
												</figcaption>
											</figure>
										</div>
										<div class="col-md-3">
											<figure class="effect-ravi">
												<img src="images/ticket3.jpg" alt="img7" style="width: 200px; height: 175px;"/>
												<figcaption>
													<p>
														<a href="#"><i class="fa fa-search"></i></a>
													</p>
												</figcaption>
											</figure>
										</div>
										<div class="col-md-3">
											<figure class="effect-ravi">
												<img src="images/ticket4.jpg" alt="img8" style="width: 200px; height: 175px;"/>
												<figcaption>
													<p>
														<a href="#"><i class="fa fa-search"></i></a>
													</p>
												</figcaption>
											</figure>
										</div>

									   </div>

									   <div class="form-group col-9">
										<ul class="pagination">
										  <li class="page-item disabled">
											<a class="page-link" href="#">◀</a>
										  </li>
										  <li class="page-item active">
											<a class="page-link" href="#">1</a>
										  </li>
										  <li class="page-item">
											<a class="page-link" href="#">2</a>
										  </li>
										  <li class="page-item">
											<a class="page-link" href="#">3</a>
										  </li>
										  <li class="page-item">
											<a class="page-link" href="#">4</a>
										  </li>
										  <li class="page-item">
											<a class="page-link" href="#">5</a>
										  </li>
										  <li class="page-item">
											<a class="page-link" href="#">▶</a>
										  </li>
										</ul>
									  </div>

									</div>
								</div>
							</div>

					</div>
				</div>
			</div>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>