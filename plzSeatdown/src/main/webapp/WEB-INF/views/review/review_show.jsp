<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>PLEASE SEATDOWN</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/review_show.css" />
	</head>
	<body class="homepage is-preload">
		<div id="page-wrapper">

			<jsp:include page="/WEB-INF/views/common/header.jsp"/>
			<jsp:include page="/WEB-INF/views/common/nav.jsp"/>

			<!-- sidebar -->
			<div id="wrap">
				<div class="sidebar">
					<div class="showInfo">
						<div class="poster">
							<img src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF153249_190820_101253.gif">
						</div>
						<div class="showContent pl-3 pr-10">
							<div id="cont">
								<div id="showTitle" class="text-center">아이다</div>
								<div id="showDate" class="text-center">2019.11.13 ~ 2020.02.23</div>
								<div id="showTheater" class="text-center">블루스퀘어 인터파크홀</div>
							</div>
							<div class="move text-center">
								<button class="btn btn-default mb-3" type="button">
									예매 페이지로 이동
								</button>
								<button class="btn btn-default" type="button" >
									좌석 리뷰 페이지로 이동
								</button>
							</div>
						</div>
					</div>
					<div class="introImg">
						<div class="img1" style="width: 100%;">
							<img src="http://www.kopis.or.kr/upload/pfmIntroImage/PF_PF153249_190820_1012530.jpg">
						</div>
						<div class="img2">
							<img src="http://www.kopis.or.kr/upload/pfmIntroImage/PF_PF153249_190821_1045343.jpg">
						</div>
						<div class="img3">
							<img src="">
						</div>
						<div class="img4">
							<img src="">
						</div>
					</div>
				</div>
				<div class="overlay"></div>
			</div>
			

			<div class="container container-fluid">
				
				<div class="mt-5 mb-5 pt-3">
					<h3>공연별</h3>
				</div>
				<div class="row mb-5">
					<div class="col-md-6">
						<a href="">상영 예정</a> | 
						<a href="">상영 중</a> | 
						<a href="">상영 종료</a> 
					</div>
                    <div class="col-md-6 text-right">
						<div class="input-group">
							<input type="text" class="form-control" name="search-show" placeholder="공연명을 입력하세요">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button" style="background-color: #917EC6; color: white;"><i class="fas fa-search"></i></button>
							</span>
						</div>
                    </div>
                </div>
				<div class="row">
					<div class="col-md-12">
						<div class="col-md-3 show" id="show1">
							<a href="#">
								<img src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF153249_190820_101253.gif" alt="Alps">
								<h4>아이다</h4>
							</a>
						</div>
						<div class="col-md-3 show" id="show2">
							<a href="#">
								<img src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF153249_190820_101253.gif" alt="Alps">
								<h4>아이다</h4>
							</a>
						</div>
						<div class="col-md-3 show" id="show3">
							<a href="#">
								<img src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF153249_190820_101253.gif" alt="Alps">
								<h4>아이다</h4>
							</a>
						</div>
						<div class="col-md-3 show" id="show4">
							<a href="#">
								<img src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF153249_190820_101253.gif" alt="Alps">
								<h4>아이다</h4>
							</a>
						</div>
					</div>
					<div class="col-md-12">
						<div class="col-md-3 show" id="show5">
							<a href="#">
								<img src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF153249_190820_101253.gif" alt="Alps">
								<h4>아이다</h4>
							</a>
						</div>
						<div class="col-md-3 show" id="show6">
							<a href="#">
								<img src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF153249_190820_101253.gif" alt="Alps">
								<h4>아이다</h4>
							</a>
						</div>
						<div class="col-md-3 show" id="show7">
							<a href="#">
								<img src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF153249_190820_101253.gif" alt="Alps">
								<h4>아이다</h4>
							</a>
						</div>
						<div class="col-md-3 show" id="show8">
							<a href="#">
								<img src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF153249_190820_101253.gif" alt="Alps">
								<h4>아이다</h4>
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


			<script>
				$(function(){
					$("#show1").on({
						click : function(){
							$(".sidebar").addClass("active");
							$("body").addClass("scrollHidden").on("scroll touchmove mousewheel", function(e){
								e.preventDefault();
							}); // 스크롤 불가능
							$(".overlay").fadeIn();
						}
					});
					$(".overlay").on({
						click : function(){
							$(".sidebar").removeClass("active");
							$("body").removeClass("scrollHidden").off("scroll touchmove mousewheel");
							$(".overlay").fadeOut();
						}
					});
				});
			</script>

			<!-- Footer -->
			<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

		</div>

	</body>
</html>