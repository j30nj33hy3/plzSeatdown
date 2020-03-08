<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>PLEASE SEATDOWN</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/review_theater.css" />
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
						<div class="col-md-3 theater" id="th1">
							<a href="#">
								<img src="images/bluesquare.gif">
								<h4>블루스퀘어 - 아이마켓홀</h4>
							</a>
						</div>
						<div class="col-md-3 theater" id="th1">
							<a href="#">
								<img src="images/bluesquare.gif">
								<h4>블루스퀘어 - 인터파크홀</h4>
							</a>
						</div>
						<div class="col-md-3 theater" id="th1">
							<a href="#">
								<img src="images/bluesquare.gif">
								<h4>블루스퀘어 - 아이마켓홀</h4>
							</a>
						</div>
						<div class="col-md-3 theater" id="th1">
							<a href="#">
								<img src="images/bluesquare.gif">
								<h4>블루스퀘어 - 인터파크홀</h4>
							</a>
						</div>
					</div>
					<div class="col-md-12">
						<div class="col-md-3 theater" id="th1">
							<a href="#">
								<img src="images/bluesquare.gif">
								<h4>블루스퀘어 - 아이마켓홀</h4>
							</a>
						</div>
						<div class="col-md-3 theater" id="th1">
							<a href="#">
								<img src="images/bluesquare.gif">
								<h4>블루스퀘어 - 인터파크홀</h4>
							</a>
						</div>
						<div class="col-md-3 theater" id="th1">
							<a href="#">
								<img src="images/bluesquare.gif">
								<h4>블루스퀘어 - 아이마켓홀</h4>
							</a>
						</div>
						<div class="col-md-3 theater" id="th1">
							<a href="#">
								<img src="images/bluesquare.gif">
								<h4>블루스퀘어 - 인터파크홀</h4>
							</a>
						</div>
					</div>
					<div class="col-md-12">
						<div class="col-md-3 theater" id="th1">
							<a href="#">
								<img src="images/bluesquare.gif">
								<h4>블루스퀘어 - 아이마켓홀</h4>
							</a>
						</div>
						<div class="col-md-3 theater" id="th1">
							<a href="#">
								<img src="images/bluesquare.gif">
								<h4>블루스퀘어 - 인터파크홀</h4>
							</a>
						</div>
						<div class="col-md-3 theater" id="th1">
							<a href="#">
								<img src="images/bluesquare.gif">
								<h4>블루스퀘어 - 아이마켓홀</h4>
							</a>
						</div>
						<div class="col-md-3 theater" id="th1">
							<a href="#">
								<img src="images/bluesquare.gif">
								<h4>블루스퀘어 - 인터파크홀</h4>
							</a>
						</div>
					</div>
				</div>

				<!-- 페이징 바 -->
				<div class="row">
					<div class="col-md-12 d-flex justify-content-center">
						<ul class="pagination pagination-info">
							<li class="page-item"><a href="#" class="page-link">PREV</a></li>
							<li class="active page-item"><a href="#" class="page-link">1</a></li>
							<li class="page-item"><a href="#" class="page-link">2</a></li>
							<li class="page-item"><a href="#" class="page-link">3</a></li>
							<li class="page-item"><a href="#" class="page-link">4</a></li>
							<li class="page-item"><a href="#" class="page-link">5</a></li>
							<li class="page-item"><a href="#" class="page-link">NEXT</a></li>
						</ul>
					</div>
				</div>
				
			</div>

			<!-- Footer -->
			<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

		</div>

	</body>
</html>