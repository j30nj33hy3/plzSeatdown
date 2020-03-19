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
		
		<!------ Include the above in your HEAD tag ---------->
		<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<!------ Include the above in your HEAD tag ---------->
		
		<!-- 카카오맵 API -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=46bd51526fce597f882f7578409e88bc"></script>
		
	</head>
	<body class="homepage is-preload">
		
		<div id="page-wrapper">

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
										<button class="like mt-3" style="float: right; width: 65px;">
											<img src="images/like.png" alt="like" style="width: 18px; height: 15px; margin-right: 3px;">
											<p>2000</p>
										</button>
									</div>
									<div class="mb-4 mt-4">
										<div style="display: inline-block; width: 100px; font-weight: bold;">
											<span>시야</span>
											<span style="display: block;">★★★☆☆</span>
										</div>
										<div style="display: inline-block;  width: 100px; font-weight: bold;">
											<span>간격</span>
											<span style="display: block;">★★★★★</span>
										</div>
										<div style="display: inline-block;  width: 100px; font-weight: bold;">
											<span>편안함</span>
											<span style="display: block;">★★★☆☆</span>
										</div>
									</div>
									<a href="#">
										<img class="img-responsive" src="https://cdn-images-1.medium.com/freeze/max/640/0*f91Yj-y7rGzkXMp2." />
										<div class="sub-heading mt-4 mb-4">
											맺어 우리 인생을 풍부하게 하는 것이다 보라 청춘을 ! 
											그들의 몸이 얼마나 튼튼하며 그들의 피부가 얼마나 생생하며 
											그들의 눈에 무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 
											우리의 귀는 생의 찬미를 듣는다...
										</div>
									</a>
										<button class="flag"  style="float: right; width: 20px;">
											<img src="images/flag.png" alt="flag" style="width: 15px; height:18px;">
										</button>
								</div>
							</div>
							<!-- 카드 1 끝 -->

							<!-- 카드 2 시작 -->
							<div class="card">
								<div class="card-content">
									<div class="profile" style="display:inline-block; width:100%; height: 50px;">
										<img class="img-circle profile-photo" src="images/profile.jpg" width="50" height="50"/>
										<div style="display:inline-block; width:100px;">user012345678</div>
										<button class="like mt-3" style="float: right; width: 65px;">
											<img src="images/like.png" alt="like" style="width: 18px; height: 15px; margin-right: 3px;">
											<p>2000</p>
										</button>
									</div>
									<div class="mb-4 mt-4">
										<div style="display: inline-block; width: 100px; font-weight: bold;">
											<span>시야</span>
											<span style="display: block;">★★★☆☆</span>
										</div>
										<div style="display: inline-block;  width: 100px; font-weight: bold;">
											<span>간격</span>
											<span style="display: block;">★★★★★</span>
										</div>
										<div style="display: inline-block;  width: 100px; font-weight: bold;">
											<span>편안함</span>
											<span style="display: block;">★★★☆☆</span>
										</div>
									</div>
									<a href="#">
										<img class="img-responsive" src="https://cdn-images-1.medium.com/freeze/max/640/0*f91Yj-y7rGzkXMp2." />
										<div class="sub-heading mt-4 mb-4">
											맺어 우리 인생을 풍부하게 하는 것이다 보라 청춘을 ! 
											그들의 몸이 얼마나 튼튼하며 그들의 피부가 얼마나 생생하며 
											그들의 눈에 무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 
											우리의 귀는 생의 찬미를 듣는다...
										</div>
									</a>
										<button class="flag"  style="float: right; width: 20px;">
											<img src="images/flag.png" alt="flag" style="width: 15px; height:18px;">
										</button>
								</div>
							</div>
							<!-- 카드 2 끝 -->

							<!-- 카드 3 시작 -->
							<div class="card">
								<div class="card-content">
									<div class="profile" style="display:inline-block; width:100%; height: 50px;">
										<img class="img-circle profile-photo" src="images/profile.jpg" width="50" height="50"/>
										<div style="display:inline-block; width:100px;">user012345678</div>
										<button class="like mt-3" style="float: right; width: 65px;">
											<img src="images/like.png" alt="like" style="width: 18px; height: 15px; margin-right: 3px;">
											<p>2000</p>
										</button>
									</div>
									<div class="mb-4 mt-4">
										<div style="display: inline-block; width: 100px; font-weight: bold;">
											<span>시야</span>
											<span style="display: block;">★★★☆☆</span>
										</div>
										<div style="display: inline-block;  width: 100px; font-weight: bold;">
											<span>간격</span>
											<span style="display: block;">★★★★★</span>
										</div>
										<div style="display: inline-block;  width: 100px; font-weight: bold;">
											<span>편안함</span>
											<span style="display: block;">★★★☆☆</span>
										</div>
									</div>
									<a href="#">
										<img class="img-responsive" src="https://cdn-images-1.medium.com/freeze/max/640/0*f91Yj-y7rGzkXMp2." />
										<div class="sub-heading mt-4 mb-4">
											맺어 우리 인생을 풍부하게 하는 것이다 보라 청춘을 ! 
											그들의 몸이 얼마나 튼튼하며 그들의 피부가 얼마나 생생하며 
											그들의 눈에 무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 
											우리의 귀는 생의 찬미를 듣는다...
										</div>
									</a>
										<button class="flag"  style="float: right; width: 20px;">
											<img src="images/flag.png" alt="flag" style="width: 15px; height:18px;">
										</button>
								</div>
							</div>
							<!-- 카드 3 끝 -->
						</div>
					</div>
				</div>
				<div class="overlay"></div>
			</div>
			

			<div class="container container-fluid">
				
				<div class="mt-5 mb-5 pt-3">
					<h3>좌석 리뷰</h3>
				</div>

				<div class="row mb-5">
					<div class="col-md-12">
						공연장 이름 - 홀이름
                    </div>
				</div>

				<div class="row">
					<div class="col-md-9 text-center content" id="seat-status">
						나쁨 ooooo 좋음
						<div id="seats">
							<a href="#" data-placement="top"
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
							</a>
							
						</div>
					</div>
					<div class="col-md-3 showInfo ">
						<div class="showHeader">상영 중인 공연</div>
						<div class="text-center mt-3">
							<img src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF153249_190820_101253.gif">
						</div>
						<div class="mt-4">
							<div id="showTitle" class="text-center mt-3">아이다</div>
							<div id="showDate" class="text-center">2020/01/01 ~ 2020/02/22</div>
						</div>
						<div class="move text-center mt-4">
							<button class="btn btn-default" type="button">
								예매 페이지로 이동
							</button>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-7 theater">
						<div class="theaterImg text-center">
							<img src="images/bluesquare.gif">
						</div>
						<div class="theaterInfo">
							<p id="tName">
								블루스퀘어
							</p>
							<p id="tPhone">
								1544-1591
							</p>
							<p id="tHome">
								<a href=http://www.bluesquare.kr>http://www.bluesquare.kr/</a>
							</p>
						</div>
					</div>
					<div class="col-md-5">
						<div class="theaterMap" id="map"></div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<ul class="nav nav-tabs nav-fill" id="thInfo"> 
							<li class="nav-item">
								<a class="nav-link active" data-toggle="tab" href="#trans">교통정보</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" data-toggle="tab" href="#parking">주차정보</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" data-toggle="tab" href="#add">부대시설</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" data-toggle="tab" href="#toilet">화장실</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" data-toggle="tab" href="#cafe">주변식당</a>
							</li>
						</ul>
						  <!-- Tab panes -->
						<div class="tab-content">
							<div id="trans" class="container tab-pane active"><br>
								<h3>교통정보</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
							</div>
							<div id="parking" class="container tab-pane"><br>
								<h3>주차정보</h3>
								<p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
							</div>
							<div id="add" class="container tab-pane"><br>
								<h3>부대시설</h3>
								<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
							</div>
							<div id="toilet" class="container tab-pane"><br>
								<h3>화장실</h3>
								<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
							</div>
							<div id="cafe" class="container tab-pane"><br>
								<h3>주변식당</h3>
								<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
							</div>
						</div>
					</div>
				</div>

				

			</div>

			<!-- 카카오맵 script -->
			<script>
				var con = document.getElementById('map'); // 지도 담을 객체
				var options = {
					center: new kakao.maps.LatLng(33.450701, 126.570667),
					level: 3 // 지도의 레벨
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
				// sidebar
				$(function(){
					$("#seats").on({
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

				// popover 관련 
				const links = document.getElementById("seats").getElementsByTagName("a");
				//const links = document.getElementById("seat-a");
				console.log(links);

				[...links].forEach(link => {
					link.addEventListener("mouseover", handleMouseOver);
					link.addEventListener("mousemove", handleMouseMove);
					link.addEventListener("mouseleave", handleMouseLeave);
				});
				function handlePosition(e) {
					const ID = e.target.getAttribute("data-hover-id");
                    console.log(ID);
					const wrapper = document.getElementById(ID);
					let top = "";
					if (
						!(e.target.getBoundingClientRect().top + wrapper.offsetHeight > innerHeight)
					) {
						top = `${e.clientY + e.target.offsetHeight}px`;
					} else {
						top = `${e.clientY - (wrapper.offsetHeight + e.target.offsetHeight)}px`;
					}

					return `position: fixed; left: ${e.clientX - wrapper.offsetWidth / 2}px; top:${top}`;
				}

				function handleMouseOver(e) {
					const hoverContent = e.target.getAttribute("data-hover-content");
					const ID = Math.random().toString(36).substr(2, 9);
					const wrapper = document.createElement("DIV");
					e.target.setAttribute("data-hover-id", ID);
					wrapper.setAttribute("data-hover-wrapper", "");
					wrapper.setAttribute("id", ID);
					wrapper.setAttribute("style", "opacity: 0; transform: scale(.8)");
					wrapper.innerHTML = hoverContent;
					document.body.append(wrapper);
					wrapper.setAttribute("style", handlePosition(e));
				
					// You can remove this line when you are using. I had added for the demo.
					if (document.querySelector('.info')) document.querySelector('.info').remove();
					
					}

				function handleMouseLeave(e) {
					const ID = e.target.getAttribute("data-hover-id");
					document.getElementById(ID).style.opacity = 0;
					document.getElementById(ID).style.transform = "scale(.8)";
					setTimeout(() => {
						document.getElementById(ID).remove();
					}, 150);
				}

				function handleMouseMove(e) {
					const ID = e.target.getAttribute("data-hover-id");
					const wrapper = document.getElementById(ID);
					wrapper.setAttribute("style", handlePosition(e));
				}

				window.addEventListener('scroll', () => {
					const wrapper = document.querySelector('[data-hover-wrapper]');
					if (wrapper) wrapper.remove();
				});
				// popover 종료

			</script>

			<!-- Footer -->
			<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

		</div>

	</body>
</html>