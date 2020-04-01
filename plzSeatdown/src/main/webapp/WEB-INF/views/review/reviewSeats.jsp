<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>PLEASE SEATDOWN</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${contextPath}/resources/css/main.css" />
		<link rel="stylesheet" href="${contextPath}/resources/css/review_seats.css" />
		
		<!-- 카카오맵 API -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=44e60f3df8ed94bfd87cb89c72bd86a0"></script>
		
		<style>
	        a {
	        	text-decoration: none;
	        }
	        
	        .card > .profile > img{
	        	width : 50%;
	        	height : 50%;
	        }
	        
	        .star{
	        	color : #FFD938;
	        }
	        .nstar{
	        	color : #FFD938;
	        	font-size: 0.7em;
	        }
	        .profile{
	        	font-size : 18px !important;
	        }
	        /* .reviewLike :hover{
	        	cursor: pointer;
	        } */
	        .fa-heart{
	        	color : #ff6666;
	        }
	        .heart {
                width: 100px;
                height: 100px;
                position: absolute;
                left: 70%;
                top: 50%;
                transform: translate(-50%, -50%);
                background: url(https://cssanimation.rocks/images/posts/steps/heart.png) no-repeat;
                /* background-position: 0 0; */
                cursor: pointer;
                /* animation: fave-heart 1s steps(28); */
            }
            @keyframes fave-heart {
                0% {
                    background-position: 0 0;
                }
                100% {
                    background-position: -2800px 0;
                }
            }
            .ellip{
				display: -webkit-box;
			  -webkit-line-clamp: 5;
			  -webkit-box-orient: vertical;
			   margin: 0;
			   margin: auto;
			   width: 100%;
			   height: 1.5em;
			   overflow: hidden;
			   text-overflow: ellipsis;
			   white-space: nowrap;
			}
			#showDate{
				font-size: 14px;
			}
		
    	</style>
		
	</head>
	<body class="homepage is-preload">
	
		<div class="overlay"></div>

		<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
		
		<div id="page-wrapper" class="wrapper">
		
			<!-- sidebar -->
			<div id="wrap">
				<div class="sidebar">
					<div class="showContent pl-3 pr-10">
						<div id="title" class="mb-4">
							<h4>${theater.thNm}</h4>
						</div>
						<!-- <div id="seatId" class="mb-5">
							<h5>A구역 4열 8번에 대한 리뷰</h5>
						</div> -->
						<div id="review">
							
							

						</div>
						
					</div>
				</div>
				
			</div>
			
			<%-- 모달 시작 --%>
			<div class="modal fade" id="reviewReportModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content" style="border:0px;">
						<div class="modal-header" style="background-color:rgb(198, 180, 205);">
							<h5 class="modal-title" id="exampleModalLabel">신고하기</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<form method="post" action="insertReviewReport">
							<div class="modal-body">
								<div class="form-group">
									<p>신고사유</p>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="1" checked>
										<label class="form-check-label" for="exampleRadios1">욕설</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="2">
										<label class="form-check-label" for="exampleRadios2">음란성</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios3" value="3">
										<label class="form-check-label" for="exampleRadios3">홍보/불법 정보</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios4" value="4">
										<label class="form-check-label" for="exampleRadios4">도배</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios5" value="5">
										<label class="form-check-label" for="exampleRadios5">기타</label>
									</div>
									<label for="message-text" class="col-form-label">내용</label>
									<textarea disabled class="form-control replyContent" id="reportContent" name="reportContent" maxlength="300" placeholder="기타 선택시 입력 가능합니다. (최대 300자)" style="resize: none;"></textarea>
									<input type="hidden" name="reviewNo" value="">
									<input type="hidden" name="memberSuspector" value="">
									<input type="hidden" name="memberReporter" value="${loginMember.memberNo}">
									<input type="hidden" name="reportCategory" value="">
								</div>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn" onclick="return report();" style="background-color:#FFD938;">신고</button>
								<button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<%-- 모달 끝 --%>
			

			<div class="container container-fluid my-5">
				
		        <%-- <div class="row mb-5">
					<div class="col-md-12 text-center">
						${theater.thNm}
                   </div>
				</div>
		         --%>
		        <div class="row">
		        	<jsp:include page="/WEB-INF/views/review/reviewSideMenu.jsp"/>
		        	
		        	<div class="col-10">
		        	
						<div class="row mb-5">
							<div class="col-md-9 text-center content" id="seat-status">
								<div class="thName text-center mb-3">
									<b>${theater.thNm}</b>
			                   </div>
								<div id="seat-level" style="position:relative; margin: auto;">
									<ul class="list-group-horizontal">
										<li><div>나쁨</div></li>
										<li class="ml-2"><div class="sLevel1"></div></li>
										<li class="ml-2"><div class="sLevel2"></div></li>
										<li class="ml-2"><div class="sLevel3"></div></li>
										<li class="ml-2"><div class="sLevel4"></div></li>
										<li class="ml-2"><div class="sLevel5"></div></li>
										<li class="ml-2"><div>좋음</div></li>
									</ul>
									
									
								</div>
									
								<!-- 좌석 jsp 영역 시작 -->
								
								<!-- 
									FC000402-02 : 두산아트홀 연강홀
									FC000031-01 : 블루스퀘어 인터파크홀
									FC000012-01 : 샤롯데씨어터
									FC000020-03 : 세종문화회관 M씨어터
								 -->
								
								<c:set var="theaterCode" value="${theater.thCode}" />
								
								<c:choose>
									<c:when test="${theaterCode eq 'FC000402-02'}">
										<jsp:include page="/WEB-INF/views/review/seat_dusan_y.jsp"/>
									</c:when>
									<c:when test="${theaterCode eq 'FC000031-01'}">
										<jsp:include page="/WEB-INF/views/review/seat_blue_inter.jsp"/>
										<jsp:include page="/WEB-INF/views/review/seat_blue_inter2.jsp"/>
									</c:when>
									<c:when test="${theaterCode eq 'FC000012-01'}">
										<jsp:include page="/WEB-INF/views/review/seat_lotte.jsp"/>
									</c:when>
									<c:when test="${theaterCode eq 'FC000020-03'}">
										<jsp:include page="/WEB-INF/views/review/seat_sejong_M.jsp"/>
									</c:when>
									<c:when test="${theaterCode eq 'FC000001-02'}">
										<jsp:include page="/WEB-INF/views/review/seat_recital.jsp"/>
									</c:when>
									<%-- <c:when test="${theaterCode eq 'FC000020-01'}">
										<jsp:include page="/WEB-INF/views/review/seat_sejong_big1.jsp"/>
										<jsp:include page="/WEB-INF/views/review/seat_sejong_big2.jsp"/>
										<jsp:include page="/WEB-INF/views/review/seat_sejong_big3.jsp"/>
									</c:when> --%>
									<c:when test="${theaterCode eq 'FC001528-02'}">
										<jsp:include page="/WEB-INF/views/review/seat_dreamart_2.jsp"/>
									</c:when>
									<c:when test="${theaterCode eq 'FC000001-01'}">
										<jsp:include page="/WEB-INF/views/review/seat_cj_towol.jsp"/>
									</c:when>
									<c:when test="${theaterCode eq 'FC000001-03'}">
										<jsp:include page="/WEB-INF/views/review/seat_concerthall_0.jsp"/>
										<jsp:include page="/WEB-INF/views/review/seat_concerthall_1.jsp"/>
										<jsp:include page="/WEB-INF/views/review/seat_concerthall_2.jsp"/>
										<jsp:include page="/WEB-INF/views/review/seat_concerthall_3.jsp"/>
										<jsp:include page="/WEB-INF/views/review/seat_concerthall_4.jsp"/>
										<jsp:include page="/WEB-INF/views/review/seat_concerthall_5.jsp"/>
										<jsp:include page="/WEB-INF/views/review/seat_concerthall_6.jsp"/>
									</c:when>
									<c:when test="${theaterCode eq 'FC000001-05'}">
										<jsp:include page="/WEB-INF/views/review/seat_chamber.jsp"/>
									</c:when>
									<c:when test="${theaterCode eq 'FC000833-02'}">
										<jsp:include page="/WEB-INF/views/review/seat_artone2.jsp"/>
									</c:when>
									<c:when test="${theaterCode eq 'FC000001-06'}">
										<jsp:include page="/WEB-INF/views/review/seat-opera.jsp"/>
										<jsp:include page="/WEB-INF/views/review/seat-opera2.jsp"/>
										<jsp:include page="/WEB-INF/views/review/seat-opera3.jsp"/>
										<jsp:include page="/WEB-INF/views/review/seat-opera4.jsp"/>
									</c:when>
									<c:when test="${theaterCode eq 'FC000020-02'}">
										<jsp:include page="/WEB-INF/views/review/seat_sejong_chamber.jsp"/>
									</c:when>
									<c:otherwise>
										<div>
											<div id="seats" style="width: 682px; height: 352px;">
											    <img src="${contextPath}/resources/images/no_seat.png" style="width: 100%;">
											</div>
										</div>
									</c:otherwise>
								</c:choose>
								
								
							</div>
							<div class="col-md-3 showInfo ">
								<!-- <div class="showHeader">상영 중인 공연</div> -->
								<div class="showHeader"><img src="${contextPath}/resources/images/showing2.png" style="width: 100%;"></div>
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
							<input id="hiddenLogin" type="hidden" value="${loginMember}">
						</div>
						<form id="reviewWrite" action="writeForm" style="display: none" method="post">
							<input id="thNm" name="thNm" type="hidden" value=""/>
							<input id="thCd" name="thCd" type="hidden" value=""/>
							<input id="viewDt" name="viewDt" type="hidden" value=""/>
							<input id="seatVal" name="seatVal" type="hidden" value=""/>
							<input id="showCode" name="showCode" type="hidden" value=""/>
						</form>
						
		        	</div>
		        </div>
		        <!-- 좌석 jsp 영역 종료 -->
				<br>
				<!-- 최신 리뷰 -->
				<div class="row d-flex justify-content-between">
				<c:forEach var="n" items="${nReview}">
				<div class="card" style="width: 340px">    
		             <div class="card-content"> 
		                <div class="row profile">    
		                    <div class="col">
		                    <c:set var="src" value="${contextPath}/resources/images/user.png"></c:set>
		                    <c:if test="${! empty n.profilePath }">
		                    	<c:set var="src" value="${contextPath}/resources/profileImages/${n.profilePath}"></c:set>
		                    </c:if> 
		                       <img class="img-circle profile-photo" src="${src}" style="width: 30px !important">   
		                       <span style="display:none;" name="spanId">${n.memberId }</span>   
		                        <span style="display:none;" name="spanNo">${n.reviewWriter }</span>   
		                        <span>${n.memberNickname}</span>    
		                    </div>   
		                   <div class="col text-right">
		                   <c:choose>
			                   <c:when test="${!empty loginMember && loginMember.memberNo ne n.reviewWriter }">
			                   		<%-- <span class="reviewLike heart" id="${n.reviewNo}" value="${n.likeStatus}">
			                   		<c:choose>
			                   			<c:when test="${n.likeStatus == 1}">
			                   				<i class="fas fa-heart" style="display: none;"></i>
			                   			</c:when>
			                   			<c:otherwise>
			                   				<i class="far fa-heart" style="display: none;"></i>
			                   			</c:otherwise>
			                   		</c:choose>
			                   		</span> --%>
			                   		<c:choose>
			                   			<c:when test="${n.likeStatus == 1}">
			                   				<div class="reviewLike heart" style="background-position:-2800px 0;" id="${n.reviewNo}" value="${n.likeStatus}" onclick="reviewLike(this);"></div>
			                   			</c:when>
			                   			<c:otherwise>
			                   				<div class="reviewLike heart" style="background-position:0 0;" id="${n.reviewNo}" value="${n.likeStatus}" onclick="reviewLike(this);"></div>
			                   			</c:otherwise>
			                   		</c:choose>
			                   </c:when>
			                   <c:otherwise>
			                   		<div class="reviewLike heart"></div>
			                   </c:otherwise>
		                   </c:choose>
		                       <div class="reviewLikeCount" id="likeCount${n.reviewNo}">${n.likeCount }</div>    
		                     </div>    
		                </div>    
		                <c:set var="floor" value="${n.seatFloor}층"/>
		                <c:if test="${empty n.seatFloor}">
		                	<c:set var="floor" value=""/>
		                </c:if>
		                <c:set var="area" value="${n.seatArea}구역"/>
		                <c:if test="${empty n.seatArea}">
		                	<c:set var="area" value=""/>
		                </c:if>
		                <c:set var="row" value="${n.seatRow}열"/>
		                <c:if test="${empty n.seatRow}">
		                	<c:set var="row" value=""/>
		                </c:if>
		                <c:set var="col" value="${n.seatCol}번호"/>
		                <c:if test="${empty n.seatCol}">
		                	<c:set var="col" value=""/>
		                </c:if>
		                <div> ${floor} ${area} ${row} ${col} </div>    
		               
		                <div class="row starValue mb-4 mt-4">   
		                   <div class="col text-center">   
		                      <span>시야</span>
		                      <span class="nstar" style="display: block;">
		                      <c:forEach var="i" begin="0" end="4" step="1">
		                      	<c:choose>
		                      		<c:when test="${i < n.reviewSight }">
		                      			<i class="fas fa-star"></i>
		                      		</c:when>
		                      		<c:otherwise>
		                      			<i class="far fa-star"></i>
		                      		</c:otherwise>
		                      	</c:choose>
		                      </c:forEach>
		                      </span>    
		                   </div>   
		                  
		                   <div class="col text-center">   
		                      <span>간격</span>    
		                      <c:set var="nLegroom" value="${n.reviewLegroom}"/>
		                      <span class="nstar" style="display: block;">
		                      <c:forEach var="i" begin="0" end="4" step="1">
		                      	<c:choose>
		                      		<c:when test="${i < n.reviewLegroom }">
		                      			<i class="fas fa-star"></i>
		                      		</c:when>
		                      		<c:otherwise>
		                      			<i class="far fa-star"></i>
		                      		</c:otherwise>
		                      	</c:choose>
		                      </c:forEach>
		                      </span>    
		                   </div>   
		                  
		                   <div class="col text-center">   
		                      <span>편안함</span>
		                      <c:set var="nComfort" value="${n.reviewComfort}"/>
		                      <span class="nstar" style="display: block;">
		                      <c:forEach var="i" begin="0" end="4" step="1">
		                      	<c:choose>
		                      		<c:when test="${i < n.reviewComfort }">
		                      			<i class="fas fa-star"></i>
		                      		</c:when>
		                      		<c:otherwise>
		                      			<i class="far fa-star"></i>
		                      		</c:otherwise>
		                      	</c:choose>
		                      </c:forEach>
		                      </span>    
		                   </div>   
		                </div>

		              
		                <div class="reviewCont">
		                <c:set var="rImg" value="default_review.png"/>
		                <c:if test="${!empty n.reviewImgPath}">
		                	<c:set var="rImg" value="${n.reviewImgPath}"/>
		                </c:if>
		                   <img class="img-responsive" style="height:244px; width:100%;" src="${contextPath}/resources/reviewImages/${rImg}"/>
		                	
		                   <div class="mt-4 nCont"><p class="ellip">${n.reviewComment}</p></div>
		                   <div style="width:310px;">
		                   <c:set var="viewDt" value="${fn:split(n.reviewViewDt,'-')}"/>
		                   ${viewDt[0]}년 ${viewDt[1]}월 ${viewDt[2]}일 관람
		                   <c:choose>
			                   <c:when test="${loginMember.memberNo eq n.reviewWriter}">
		                   			 <a class="float-right text-muted deleteBtn mr-2 ml-2" href="delete?no=${n.reviewNo }"><i class="far fa-trash-alt"></i></a>
		                   			 <a class="float-right text-muted updateBtn mr-2 ml-2" href="updateForm?no=${n.reviewNo }"><i class="far fa-edit"></i></a>
			                   </c:when>
			                   <c:when test="${empty loginMember }"></c:when>
			                   <c:otherwise>
			                   		<button data-toggle="modal" data-target="#reviewReportModal" class="btn float-right text-muted reportBtn" onclick="test(this);" 
    									name="${n.reviewNo }" value="${n.reviewWriter}">신고</button>
			                   </c:otherwise>
		                   </c:choose>
		                   </div>
		                </div>     
		             </div>   
		          </div>
				</c:forEach>
				</div>
			</div>
			
			<!-- 사이드 메뉴 이름 변경 -->
			<script>
				$(function(){
					$("#sideMenu #clickedPage").attr("href","seats?thCode='${theater.thCode}'").html("좌석 리뷰");
				});
			</script>
			
			<!-- 좌석 평점 표시 -->
			<script>
				rating();
				function rating(){
					<c:forEach var="r" items="${rating}">
						var val = "${r.seatValue}";
						var rating = "${r.rating}";
						$.each($(".s13"), function(index, item){
							if($(item).attr("value") == val){
								$(item).removeClass("s13");
								$(item).removeClass("s2");
								$(item).removeClass("s3");
								$(item).removeClass("s0");
								$(item).removeClass("s5");
								$(item).removeClass("s7");
							}
							if(rating == 1){
								$(item).addClass("s2");
							}
							if(rating == 2){
								$(item).addClass("s3");
							}
							if(rating == 3){
								$(item).addClass("s0");
							}
							if(rating == 4){
								$(item).addClass("s5");
							}
							if(rating == 5){
								$(item).addClass("s7");
							}
							if($(item).attr("value") != val){
								$(item).removeClass("s2");
								$(item).removeClass("s3");
								$(item).removeClass("s0");
								$(item).removeClass("s5");
								$(item).removeClass("s7");
							}
						});
					 </c:forEach>
				}
					$(".sLevel1").hover(function(){
						$("div[name='tk']").not("div[class='s2']").each(function(){
							$(this).removeClass();
							$(this).addClass("s13");
						});
					},function(){
						rating();
					});
					$(".sLevel2").hover(function(){
						$("div[name='tk']").not("div[class='s3']").each(function(){
							$(this).removeClass();
							$(this).addClass("s13");
						});
					},function(){
						rating();
					});
					$(".sLevel3").hover(function(){
						$("div[name='tk']").not("div[class='s0']").each(function(){
							$(this).removeClass();
							$(this).addClass("s13");
						});
					},function(){
						rating();
					});
					$(".sLevel4").hover(function(){
						$("div[name='tk']").not("div[class='s5']").each(function(){
							$(this).removeClass();
							$(this).addClass("s13");
						});
					},function(){
						rating();
					});
					$(".sLevel5").hover(function(){
						$("div[name='tk']").not("div[class='s7']").each(function(){
							$(this).removeClass();
							$(this).addClass("s13");
						});
					},function(){
						rating();
					});
			</script>
			
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
				// popover
				<c:forEach var="seat" items="${sList}">
					
					var seatValue = "${seat.seatValue}";
					
					var seatFloor = "";
					var seatArea = "";
					var seatRow = "";
					var seatCol = "";
					
					if("${seat.seatFloor}" != "") seatFloor = "${seat.seatFloor}" + "층 ";
					if("${seat.seatArea}" != "") seatArea = "${seat.seatArea}" + "구역 ";
					if("${seat.seatRow}" != "") seatRow = "${seat.seatRow}" + "열 ";
					if("${seat.seatCol}" != "") seatCol = "${seat.seatCol}" + "번 ";
					
					$.each($("#seats div[name='tk']"), function(index, item){
						if($(item).attr("value") == seatValue){
							$(item).popover({
								html: true,
								placement: "top",
								trigger: "hover", 
								content: seatFloor + seatArea + seatRow + seatCol
							});
						}
					});
				</c:forEach>
			
			</script>
			
			<script>
			
				$(function(){
					
					// sidebar
					$("#seats div[name='tk']").on({
						
						click : function(){
							
							if($(this).attr("class") != "s13"){
								
								var loginMemberNo = "${loginMember.memberNo}"
									
									seatValue = $(this).attr("value");
									
									$.ajax({
										url : "selectAllReview",
										type : "POST",
										data : {"seatValue" : seatValue, "loginMemberNo" : loginMemberNo},
										success : function(seatReviewList){
											
											$("#review").html("");
											
											if(seatReviewList != ""){
												
												$.each(seatReviewList, function(i){
													
													var profileImg = null;
													var reviewImg = "";
													var reportBtn = "";
													var updateBtn = "";
													var deleteBtn = "";
													var	reviewNo = "<input type='hidden' value='"+seatReviewList[i].reviewNo+"'>"
													
													var floor = "";
													var area = "";
													var seatRow = "";
													var seatCol = "";
													
													if(seatReviewList[i].seatFloor != null) floor = seatReviewList[i].seatFloor + "층 ";
													if(seatReviewList[i].seatArea != null) area = seatReviewList[i].seatArea + "구역 ";
													if(seatReviewList[i].seatRow != null) seatRow = seatReviewList[i].seatRow + "열 ";
													if(seatReviewList[i].seatCol != null) seatCol = seatReviewList[i].seatCol + "번 ";
													if(typeof (seatReviewList[i].reviewComment) == "undefined"){
														seatReviewList[i].reviewComment = "";
													}
													
													// 프로필 사진 유무
													if(seatReviewList[i].profilePath != null){
														profileImg = "${contextPath}/resources/profileImages/"+seatReviewList[i].profilePath;
													}else{
														profileImg = "${contextPath}/resources/images/user.png";
													}
													
													// 리뷰 사진 유무
													if(seatReviewList[i].reviewImgPath != null){
														reviewImg = '<img class="img-responsive" src="${contextPath}/resources/reviewImages/' + seatReviewList[i].reviewImgPath + '">';
													}
													//else{
													//	reviewImg = "${contextPath}/resources/images/no_seat.png";
													//}
													
													// 신고버튼의 name은 리뷰 번호, value는 작성자
													if("${loginMember.memberNo}" != seatReviewList[i].reviewWriter && "${loginMember.memberNo}" != ""){
														reportBtn = '<button data-toggle="modal" data-target="#reviewReportModal" class="btn float-right text-muted reportBtn" onclick="test(this);" name="'+ seatReviewList[i].reviewNo + '" value="' + seatReviewList[i].reviewWriter + '">신고</button>';
													}
													if("${loginMember.memberNo}" == seatReviewList[i].reviewWriter){
														updateBtn = '<a class="float-right text-muted updateBtn mr-2 ml-2" href="updateForm?no='+seatReviewList[i].reviewNo +'"><i class="far fa-edit"></i></a>';
														deleteBtn = '<a class="float-right text-muted deleteBtn mr-2 ml-2" href="delete?no='+seatReviewList[i].reviewNo +'"><i class="far fa-trash-alt"></i></a>';
													}
													
													var sight = "";
													var legroom = "";
													var comfort = "";
													
													for(var j=0; j<5; j++){
														if(j < seatReviewList[i].reviewSight) sight += '<i class="fas fa-star"></i>';
														else sight += '<i class="far fa-star"></i>';
													}
													
													for(var j=0; j<5; j++){
														if(j < seatReviewList[i].reviewLegroom) legroom += '<i class="fas fa-star"></i>';
														else legroom += '<i class="far fa-star"></i>';
													}
													
													for(var j=0; j<5; j++){
														if(j < seatReviewList[i].reviewComfort) comfort += '<i class="fas fa-star"></i>';
														else comfort += '<i class="far fa-star"></i>';
													}
													
													// 좋아요 여부
													//var likeStatus ="";
													//if(seatReviewList[i].likeStatus == 1) likeStatus = '<i class="fas fa-heart"></i>';
													//else likeStatus = '<i class="far fa-heart"></i>';
													
													// 좋아요 버튼
													var likeBtn = "";
													
													// 로그인 안 했을 때, 본인이 작성한 리뷰
													if("${loginMember.memberNo}" != seatReviewList[i].reviewWriter && "${loginMember.memberNo}" != ""){
														//likeBtn = '<span class="reviewLike heart" id="' + seatReviewList[i].reviewNo + '" value="' + seatReviewList[i].likeStatus + '" onclick="reviewLike(this);">' + likeStatus + '</span>';
														if(seatReviewList[i].likeStatus == 1) likeBtn = '<div class="reviewLike heart" style="background-position:-2800px 0;" id="' + seatReviewList[i].reviewNo + '" value="' + seatReviewList[i].likeStatus + '" onclick="reviewLike(this);"></div>';
														else likeBtn = '<div class="reviewLike heart" style="background-position:0 0;" id="' + seatReviewList[i].reviewNo + '" value="' + seatReviewList[i].likeStatus + '" onclick="reviewLike(this);"></div>';
													}else{
														//likeBtn = '<span class="reviewLike heart">' + likeStatus + '</span>';
														likeBtn = '<div class="reviewLike heart"></div>';
													}
													
													
													
													// 카드 폼
													// 좋아요 버튼의 value는 리뷰 번호
				                                   var card = 
				                                    '<div class="card">' + 
				                                       '<div class="card-content">' +
				                                       
				                                          '<div class="row profile">' + 
				                                          	 '<div class="col">' + 
					                                             '<img class="img-circle profile-photo" src="' + profileImg + '">' +
					                                             '<span style="display:none;" name="spanId">'+ seatReviewList[i].memberId +'</span>' +
			                                                      '<span style="display:none;" name="spanNo">'+ seatReviewList[i].reviewWriter +'</span>' +
			                                                      '<span>' + seatReviewList[i].memberNickname + '</span>' + 
			                                                  '</div>' +
					                                         '<div class="col text-right">' + 
					                                             likeBtn + 
					                                             '<div class="reviewLikeCount" id="likeCount' + seatReviewList[i].reviewNo + '">' + seatReviewList[i].likeCount + '</div>' + 
				                                          	 '</div>' + 
					                                      '</div>' + 
					                                      
					                                      '<div>' + floor + area + seatRow + seatCol + '</div>' + 
				                                          
				                                          '<div class="row starValue mb-4 mt-4">' +
				                                             '<div class="col text-center">' +
				                                                '<span>시야</span>' + 
				                                                '<span class="star" style="display: block;">' + sight + '</span>' + 
				                                             '</div>' +
				                                             
				                                             '<div class="col text-center">' +
				                                                '<span>간격</span>' + 
				                                                '<span class="star" style="display: block;">' + legroom + '</span>' + 
				                                             '</div>' +
				                                             
				                                             '<div class="col text-center">' +
				                                                '<span>편안함</span>' + 
				                                                '<span class="star" style="display: block;">' + comfort + '</span>' + 
				                                             '</div>' +
				                                          '</div>' +
				                                          
				                                          '<div class="reviewCont">' + 
				                                             reviewImg +
				                                             
				                                             '<div class="mt-4 mb-4">' + seatReviewList[i].reviewComment + '</div>' +
				                                             '<div>' + seatReviewList[i].reviewViewDt + ' 관람' + reportBtn + deleteBtn + reviewNo + updateBtn + '</div>' + 
				                                          '</div>' +  
				                                       '</div>' +
				                                    '</div>';
				                                    // 카드 폼 종료
					                                 
					                                 $("#review").append(card);
				                                    
												});	
													
												
											}else{
												// 리뷰가 없는 경우
												$("#review").append("작성된 리뷰가 없습니다.");
											}
										}
									});
									
									$(".sidebar").addClass("active");
									$("body").addClass("scrollHidden").on("scroll touchmove mousewheel", function(e){
										e.preventDefault();
									}); // 스크롤 불가능
									$(".overlay").fadeIn();
									
							}else {
								var thNm = "${theater.thNm}";
								var thCd = "${theater.thCode}";
								var showCode = "${show.showCode}";
								var today = new Date();
								var dd = String(today.getDate()).padStart(2, '0');
								var mm = String(today.getMonth() + 1).padStart(2, '0');
								var yyyy = today.getFullYear();
								var seatVal = $(this).attr("value");
								today = yyyy+mm+dd;
								if($("#hiddenLogin").val() != ""){
									if(confirm("해당 좌석에 리뷰를 작성하시겠습니까?")) formChange(thNm,thCd,showCode,today,seatVal);
									
								}
							}
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
				
				function formChange(thNm,thCd,showCode,today,seatVal){
					$("#thNm").val(thNm);
					$("#thCd").val(thCd);
					$("#viewDt").val(today);
					$("#seatVal").val(seatVal);
					$("#showCode").val(showCode);
					$("#reviewWrite").submit();
					
				}
			</script>

			<script>
				$(document).on('click','.deleteBtn', function(){
					var rno = $(this).next().val();
					if(confirm("정말 삭제 하시겠습니까?")) location.href = "delete?no="+rno;
				});
				
			</script>
			
			<!-- 리뷰 신고 -->
			<script>
				function test(obj){
					$("input[name='exampleRadios']").removeAttr('checked');
					$("#exampleRadios1").prop("checked",true);
					$("textarea[name=reportContent]").attr("disabled",true);
					
					$("input[name=reviewNo]").attr("value", obj.name);
		     		$("input[name=memberSuspector]").attr("value", obj.value);
				}
			
		     	$(document).on("click","input:radio[name=exampleRadios]",function(){
					if($("input[name=exampleRadios]:checked").val() == "5"){
						$("textarea[name=reportContent]").attr("disabled",false);
					}else{
						$("textarea[name=reportContent]").attr("disabled",true);
					}
				});
		     
		     	function report(){
		     		
		     		if($("input[name=exampleRadios]:checked").val() == "5" && $('#reportContent').val().length == 0){
		   				alert("내용을 입력하세요.");
		   				$('.reportContent').focus();
		   				return false;
		   			}
		     		var $reportCategory = $("#reviewReportModal").find("input[name=exampleRadios]:checked").val();
		     		$("#reviewReportModal").find("input[name=reportCategory]").val($reportCategory);
		     	}
		     	
	     	</script>
	     	
	     	<!-- 리뷰 좋아요 -->
           <script>
           
            function reviewLike(obj){
               
               var likeStatus = $(obj).attr("value");
               var reviewNo = $(obj).attr("id");
               var likeCount = $("#likeCount"+reviewNo);
               var count = "";
               var Id = $(obj).parent().prev().children("span[name=spanId]").html();
               var alarmUrl = "/review/seats?thCode=${theater.thCode}";
               var alarmContent = "${theater.thNm}";
               var No = $(obj).parent().prev().children("span[name=spanNo]").html();
               var alarmMemberNo = No;
               console.log(Id);
               console.log(alarmUrl);
               console.log(alarmContent);
               console.log(alarmMemberNo);
               
               $.ajax({
                  url : "updateLike",
                  type : "POST",
                  data : {
                        "reviewNo" : reviewNo, 
                        "likeStatus" : likeStatus,
                        "alarmContent" : alarmContent,
                        "alarmUrl" : alarmUrl,
                        "alarmMemberNo" : alarmMemberNo
                     },
                  success : function(status){
                     
                     var statusChange = "";
                     
                     if(status == 1){
                        $(obj).attr("value", 1).css({"background-position" : "-2800px 0", "transition" : "background 1s steps(28)"});
                        //statusChange = '<i class="fas fa-heart"></i>';
                        count = Number(likeCount.text()) + 1;
                        // 웹소켓
                        console.log(socketMsg);
                        
                        var socketMsg = "like" + "," + Id + "," +"${theater.thNm}" + "," + "${theater.thCode}";
                              console.log("socketMsg : " + socketMsg);   
                              socket.send(socketMsg);
                              
                     }else if(status == -1){
                        $(obj).attr("value", 0).css({"background-position" : "0 0", "transition" : "background 1s steps(28)"});
                        //statusChange = '<i class="far fa-heart"></i>';
                        count = Number(likeCount.text()) - 1;
                     }else if(status == 0){
                        console.log("좋아요 ajax 실패");
                     }
                     
                     //$(obj).html(statusChange);
                     likeCount.html(count);
                  }
               });
            }
            
           </script>
	     	
		</div>

		<!-- Footer -->
		<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	</body>
</html>