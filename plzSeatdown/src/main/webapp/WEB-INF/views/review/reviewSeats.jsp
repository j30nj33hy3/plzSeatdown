<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>PLEASE SEATDOWN</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${contextPath}/resources/css/main.css" />
		<link rel="stylesheet" href="${contextPath}/resources/css/review_seats.css" />
		
		<!-- 카카오맵 API -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=46bd51526fce597f882f7578409e88bc"></script>
		
		<style>
        a {
        	text-decoration: none;
        }

        .popover_title {
	        font-size: 24px;
	        line-height: 36px;
	        text-decoration: none;
	        color: rgb(228, 68, 68);
	        text-align: center;
	        padding: 15px 0;
        }
        .popover_wrapper {
	        position: relative;
	        margin-top: 1.5rem;
	        display: inline-block;
        }
        .popover_content {
	        opacity: 0;
	        visibility: hidden;
	        position: absolute;
	        left: -150px;
	        transform: translate(0, 10px);
	        background-color: #bfbfbf;
	        padding: 1.5rem;
	        box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.26);
	        width: auto;
        }
        .popover_content:before {
	        position: absolute;
	        z-index: -1;
	        content: "";
	        right: calc(50% - 10px);
	        top: -8px;
	        border-style: solid;
	        border-width: 0 10px 10px 10px;
	        border-color: transparent transparent #bfbfbf transparent;
	        transition-duration: 0.3s;
	        transition-property: transform;
        }
        .popover_title:hover{
	        cursor: pointer;
        }
        .popover_wrapper:hover .popover_content {
	        z-index: 10;
	        opacity: 1;
	        visibility: visible;
	        transform: translate(0, -20px);
	        transition: all 0.5s cubic-bezier(0.75, -0.02, 0.2, 0.97);
        }
        .popover_message {
        	text-align: center;
        }
    </style>
		
	</head>
	<body class="homepage is-preload">
		
		<div id="page-wrapper">
		
			<div class="overlay"></div>

			<jsp:include page="/WEB-INF/views/common/header.jsp"/>
			<jsp:include page="/WEB-INF/views/common/nav.jsp"/>

			<!-- sidebar -->
			<div id="wrap">
				<div class="sidebar">
					<div class="showContent pl-3 pr-10">
						<div id="title" class="mb-4">
							<h4>두산아트센터 - 연강홀</h4>
						</div>
						<div id="seatId" class="mb-5">
							<h5>A구역 4열 8번에 대한 리뷰</h5>
						</div>
						<div id="review">
							<!-- 카드 1 시작 -->
							<div class="card">
								<div class="card-content">
									<div class="profile" style="display:inline-block; width:100%; height: 50px;">
										<img class="img-circle profile-photo" src="images/profile.jpg" width="50" height="50"/>
										<div style="display:inline-block; width:100px;">user012345678</div>
										<!-- <button class="like mt-3" style="float: right; width: 65px;">
											<i class="far fa-heart"></i>
											<i class="fas fa-heart"></i>
											<p>2000</p>
										</button> -->
									</div>
									<div class="row mb-4 mt-4" >
										<div class="col text-center" style="font-weight: bold;">
											<span>시야</span>
											<span style="display: block;">★★★☆☆</span>
										</div>
										<div class="col text-center" style="font-weight: bold;">
											<span>간격</span>
											<span style="display: block;">★★★★★</span>
										</div>
										<div class="col text-center" style="font-weight: bold;">
											<span>편안함</span>
											<span style="display: block;">★★★☆☆</span>
										</div>
									</div>
									<a href="#">
										<img class="img-responsive" src="https://cdn-images-1.medium.com/freeze/max/640/0*f91Yj-y7rGzkXMp2." />
										<div class="mt-4 mb-4">
											맺어 우리 인생을 풍부하게 하는 것이다 보라 청춘을 ! 
											그들의 몸이 얼마나 튼튼하며 그들의 피부가 얼마나 생생하며 
											그들의 눈에 무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 
											우리의 귀는 생의 찬미를 듣는다...
										</div>
									</a>
										<!-- <button class="flag"  style="float: right; width: 20px;">
											<i class="fas fa-flag"></i>
										</button> -->
								</div>
							</div>
							<!-- 카드 1 끝 -->


						</div>
					</div>
				</div>
				
			</div>
			

			<div class="container container-fluid">
				
				<div class="mt-5 mb-5 pt-3">
					<h3>좌석 리뷰</h3>
				</div>

				<div class="row mb-5">
					<div class="col-md-12">
						${theater.thNm}
                    </div>
				</div>

				<div class="row">
					<div class="col-md-9 text-center content" id="seat-status">
						나쁨 ooooo 좋음
						<div id="seats">
							<%-- <a href="#" data-placement="top"
								data-hover-content="<div class='hover-content'>
								<img src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/344846/eyfel-kulesi-paris.jpg'>
								<p><b>A구역 1열 1번</b></p>
								<p>
									★★★☆☆
								</p>
								<p>좌석 후기가 어쩌고저쩌고.. 근데 마우스 움직일 때마다 움직이네... 음..... 고정됐으면 좋겠는디</p>
								<p>리뷰 총 개수</p>
								</div>">
								좌석 어떻게 해요.............................
							</a> --%>
							
							<div class="seat" data-toggle="popover" data-trigger="hover">
								<div class="popover_wrapper">
							        <h2 class="popover_title">Hover:me</h2>
							        <div class="popover_content">
							          <p class="popover_message">Joseph Francis "Joey" Tribbiani, Jr.</p>
							          <img alt="Joseph Francis Joey Tribbiani, Jr." src="https://media.giphy.com/media/11SIBu3s72Co8w/giphy.gif">
							        </div>
							    </div>
							    <div class="popover_wrapper">
							        <h2 class="popover_title">Hover:me</h2>
							        <div class="popover_content">
							          <p class="popover_message">Joseph Francis "Joey" Tribbiani, Jr.</p>
							          <img alt="Joseph Francis Joey Tribbiani, Jr." src="https://media.giphy.com/media/11SIBu3s72Co8w/giphy.gif">
							        </div>
							    </div>
							</div>
							
							
						</div>
					</div>
					<div class="col-md-3 showInfo ">
						<div class="showHeader">상영 중인 공연</div>
						<c:if test="${empty show}">
							<div class="text-center mt-3">
								<img src="${contextPath}/resources/images/no_show.png" style="width: 100%;">
							</div>
						</c:if>
						<c:if test="${!empty show}">
							<div class="text-center mt-3">
								<img src="${show.posterPath}" style="width: 100%;">
							</div>
							<div class="mt-4">
								<div id="showTitle" class="text-center mt-3">${show.showTitle}</div>
								<div id="showDate" class="text-center">${show.startDt} ~ ${show.endDt}</div>
							</div>
							<div class="move text-center mt-4">
								<button class="btn btn-default" type="button">
									예매 페이지로 이동
								</button>
							</div>
                        </c:if>
					</div>
				</div>

				<div class="row">
					<div class="col-md-7 theater">
						<div class="theaterImg text-center">
							<c:set var="src" value="${contextPath}/resources/images/theater_noImage.png"/>
	                        <c:if test="${!empty theater.thLogoPath}">
	                        	<c:set var ="src" value="${contextPath}/resources/theaterLogo/${theater.thLogoPath}"/>
	                        </c:if>
	                        <img src="${src}" style="width:100%;">
						</div>
						<div class="theaterInfo">
							<p id="tName">
								${theater.thNm}
							</p>
							<p id="tPhone">
								${theater.thPhone}
							</p>
							<p id="tHome">
								<a href=http://www.bluesquare.kr>${theater.thPage}</a>
							</p>
						</div>
					</div>
					<div class="col-md-5">
						<div class="theaterMap" id="map"></div>
					</div>
				</div>


				

			</div>

			<!-- 카카오맵 script -->
			<script>
				var con = document.getElementById('map'); // 지도 담을 객체
				var options = {
					center: new kakao.maps.LatLng(${theater.thLat}, ${theater.thLong}),
					level: 4 // 지도의 레벨
				};
		
				var map = new kakao.maps.Map(con, options); // 지도 생성

				// 지도 타입 컨트롤
				var mapTypeControl = new kakao.maps.MapTypeControl();
				map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
				
				// 줌 컨트롤
				var zoomControl = new kakao.maps.ZoomControl();
				map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

				// 위치를 마커로 표시
				var marker = new kakao.maps.Marker({
					map : map,
					position: options.center
				});
					
			</script>
			
			<script>
				
			</script>

			<script>
				// sidebar
				$(function(){
					$(".seat").on({
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