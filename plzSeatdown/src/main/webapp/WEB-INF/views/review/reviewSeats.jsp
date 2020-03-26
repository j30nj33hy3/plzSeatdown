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
							<h4>${theater.thNm}</h4>
						</div>
						<!-- <div id="seatId" class="mb-5">
							<h5>A구역 4열 8번에 대한 리뷰</h5>
						</div> -->
						<div id="review">
							
							

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
							<c:otherwise>
								<div>
									<div id="seats" style="width: 817px; height: 352px;">
									    <img src="${contextPath}/resources/images/no_seat.png" style="width: 100%;">
									</div>
								</div>
							</c:otherwise>
						</c:choose>
						
						<!-- 좌석 jsp 영역 종료 -->
						
							
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
			<!-- 좌석 평점 표시 -->
			<script>
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
					});
				 </c:forEach>
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
				$(function(){
					
					/* $("#seats > div").popover({
						html:true,
						placement:"top",
						trigger:"hover",
						content : '<img class="popoverContent" src="${contextPath}/resources/images/no_seat.png" style="width: 100%;">'
					}); */
					
					$("#seats > div").popover({
						html:true,
						placement:"top",
						trigger:"manual",
						content : '<img class="popoverContent" src="${contextPath}/resources/images/no_seat.png" style="width: 100%;">'
					}).on("mouseenter", function(){
						self = $(this);
						
						self.popover("show");
						$(".popover").on("mouseleave", function(){
							self.popover("hide");
						});
						
					}).on("mouseleave", function(){
						self = $(this);
						
						if(!$(".popover:hover").length){
							self.popover("hide");
						}
					});
					
					/* $("#seats > div").popover({
						html:true,
						placement:"top",
						trigger:"hover",
						content : '<img src="${contextPath}/resources/images/no_seat.png" style="width: 100%;">'
					}); */
				});
				
			</script>

			<script>
			
				$(function(){
					
					// sidebar
					$("#seats > div").on({
						click : function(){
							
							seatValue = $(this).attr("value");
							
							$.ajax({
								url : "selectAllReview",
								type : "POST",
								data : {"seatValue" : seatValue},
								success : function(seatReviewList){
									
									$("#review").html("");
									
									if(seatReviewList != ""){
										
										$.each(seatReviewList, function(i){
											
											var profileImg = null;
											var reviewImg = null;
											var reportBtn = "";
											var updateBtn = "";
											
											// 프로필 사진 유무
											if(seatReviewList[i].profilePath != null){
												profileImg = "${contextPath}/resources/profileImages/"+seatReviewList[i].profilePath;
											}else{
												profileImg = "${contextPath}/resources/images/user.png";
											}
											
											// 리뷰 사진 유무
											if(seatReviewList[i].reviewImgPath != null){
												reviewImg = "${contextPath}/resources/reviewImages/"+seatReviewList[i].reviewImgPath;
											}else{
												reviewImg = "${contextPath}/resources/images/no_seat.png";
											}
											
											// 신고버튼의 id는 리뷰 번호
											if("${loginMember.memberNo}" != seatReviewList[i].reviewWriter && "${loginMember.memberNo}" != ""){
												reportBtn = '<button data-toggle="modal" data-target="#reviewReportModal" class="btn float-right text-muted reportBtn" onclick="test(this);" name="'+ seatReviewList[i].reviewNo + '" value="' + seatReviewList[i].reviewWriter + '">신고</button>';
											}
											if("${loginMember.memberNo}" == seatReviewList[i].reviewWriter){
												/* updateBtn = '<button class="btn float-right text-muted updateBtn" onclick="test(this);" name="'+ seatReviewList[i].reviewNo + '" value="' + seatReviewList[i].reviewWriter + '">수정</button>'; */
												updateBtn = '<a class="btn float-right text-muted updateBtn" href="updateForm?no='+seatReviewList[i].reviewNo +'">수정</a>';
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
											
											
											
											// 카드 폼
		                                   var card = 
		                                    '<div class="card">' + 
		                                       '<div class="card-content">' +
		                                       
		                                          '<div class="profile">' + 
		                                             '<img class="img-circle profile-photo" src="' + profileImg + '">' +
		                                             '<div>' + seatReviewList[i].memberNickname + '</div>' + 
		                                          '</div>' + 
		                                          
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
		                                             '<img class="img-responsive" src="' + reviewImg + '">' +
		                                             '<div class="mt-4 mb-4">' + seatReviewList[i].reviewComment + '</div>' +
	                                                  reportBtn + updateBtn +
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
	     	
	     	<!-- 별점 변환 -->
	     	<!-- <script>
	     		$.fn.generateStars = function() {
	            	return this.each(function(i,e){$(e).html($('<span/>').width($(e).text()*16));});
	           };

	           // 숫자 평점을 별로 변환하도록 호출하는 함수
	           $('.star-prototype').generateStars();
	     	</script> -->

			<!-- Footer -->
			<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

		</div>

	</body>
</html>