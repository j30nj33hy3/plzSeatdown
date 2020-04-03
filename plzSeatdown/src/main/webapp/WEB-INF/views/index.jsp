<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<script>!function(e){"undefined"==typeof module?this.charming=e:module.exports=e}(function(e,n){"use strict";n=n||{};var t=n.tagName||"span",o=null!=n.classPrefix?n.classPrefix:"char",r=1,a=function(e){for(var n=e.parentNode,a=e.nodeValue,c=a.length,l=-1;++l<c;){var d=document.createElement(t);o&&(d.className=o+r,r++),d.appendChild(document.createTextNode(a[l])),n.insertBefore(d,e)}n.removeChild(e)};return function c(e){for(var n=[].slice.call(e.childNodes),t=n.length,o=-1;++o<t;)c(n[o]);e.nodeType===Node.TEXT_NODE&&a(e)}(e),e});</script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/css/swiper.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" 
	integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Oswald:500" rel="stylesheet">
<link rel="stylesheet" href="${contextPath}/resources/css/main.css" />
<link rel="stylesheet" href="${contextPath}/resources/css/review_seats.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.2/TweenMax.min.js"></script>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script> -->
<title>PLEASE SEATDOWN</title>
</head>
<body class="homepage is-preload">
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
<!------ Include the above in your HEAD tag ---------->
<section id=sec>
  <div class="swiper-container slideshow">
    <div class="swiper-wrapper">
      <div class="swiper-slide slide">
        <div class="slide-image" style="background-image: url(https://img.sbs.co.kr/newsnet/etv/upload/2018/06/28/30000605978.jpg)"></div>
        <span class="slide-title">PLEASE SEATDOWN</span>
      </div>
      <div class="swiper-slide slide">
        <div class="slide-image" style="background-image: url(https://img.seoul.co.kr//img/upload/2018/07/13/SSI_20180713180319.jpg)"></div>
        <span class="slide-title">MEET MUSICAL</span>
      </div>

      <div class="swiper-slide slide">
        <div class="slide-image" style="background-image: url(http://auditorium.kr/wp-content/uploads/2019/01/18_%EB%AE%A4%EC%A7%80%EC%BB%AC-%E2%80%98%EB%9D%BC%EC%9D%B4%EC%98%A8-%ED%82%B9%E2%80%99-%ED%8F%AC%ED%9A%A8%ED%95%98%EB%8A%94-%EC%82%AC%EC%9E%90%EB%8A%94-%EB%8F%99%EB%AC%BC%EC%9D%B8%EA%B0%80-%EC%9D%B8%EA%B0%84%EC%9D%B8%EA%B0%80-1.jpg)"></div>
        <span class="slide-title">Around the world</span>
      </div>
    </div>
    <div class="slideshow-pagination"></div>
    <div class="slideshow-navigation">
      <div class="slideshow-navigation-button prev"><span class="fas fa-chevron-left"></span></div>
      <div class="slideshow-navigation-button next"><span class="fas fa-chevron-right"></span></div>
    </div>
  </div>
</section>

<!-- ------------------------------------------------------------------------------------------------------------------------- -->
	<div id="page-wrapper">
		<div class="mt-5 pt-3 ml-5 pl-5" style="text-align: center;">
			<img src="${contextPath}/resources/images/showing3.PNG"
				style="height: 30px;">
		</div>
		<!-- Carousel -->
		<section class="carousel">
			<div class="reel">
				<c:if test="${!empty showList}">
					<c:forEach var="show" items="${showList}" varStatus="vs">
						<article>
							<a href="review/seats?thCode=${show.thCode}" class="image featured"><img style="width: 218px; height: 280px;" src="${show.posterPath}" alt="" /></a>
						</article>
					</c:forEach>
				</c:if>
			</div>
		</section>
		
		<!--카드 시작-->
<!-- 		<div class="container mb-5">
			<div class="row"></div>
		</div> -->
		<!-- 카드 끝 -->
		<div class="mt-5 pt-3 ml-5 pl-5" style="text-align: center;">
			<img src="${contextPath}/resources/images/recent_review.PNG"
				style="height: 37px; left: 5px;">
		</div><br><br>
		
		<!-- 최신 리뷰 -->
			<div class="container-fluid">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<div class="row container-col-md-4 d-flex justify-content-between">
						<c:forEach var="n" items="${nReview}">
							<div class="card" style="width: 340px;">
								<div class="card-content">
									<div class="row profile">
										<div class="col">
											<c:set var="src"
												value="${contextPath}/resources/images/user.png"></c:set>
											<c:if test="${! empty n.profilePath }">
												<c:set var="src"
													value="${contextPath}/resources/profileImages/${n.profilePath}"></c:set>
											</c:if>
											<img class="img-circle profile-photo" src="${src}" style="width: 30px !important; height:30px !important; border-radius: 5em;"> 
											<span style="display: none;" name="spanId">${n.memberId }</span> 
											<span style="display: none;" name="spanNo">${n.reviewWriter }</span>
											<span>${n.memberNickname}</span>
										</div>
										<div class="col text-right">
											<c:choose>
												<c:when
													test="${!empty loginMember && loginMember.memberNo ne n.reviewWriter }">
													<c:choose>
														<c:when test="${n.likeStatus == 1}">
															<div class="reviewLike heart"
																style="background-position: -2800px 0;"
																id="${n.reviewNo}" value="${n.likeStatus}"
																onclick="reviewLike(this);"></div>
														</c:when>
														<c:otherwise>
															<div class="reviewLike heart"
																style="background-position: 0 0;" id="${n.reviewNo}"
																value="${n.likeStatus}" onclick="reviewLike(this);"></div>
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
									<div style="text-align: center;">${n.thName}</div>
									<c:set var="floor" value="${n.seatFloor}층" />
									<c:if test="${empty n.seatFloor}">
										<c:set var="floor" value="" />
									</c:if>
									<c:set var="area" value="${n.seatArea}구역" />
									<c:if test="${empty n.seatArea}">
										<c:set var="area" value="" />
									</c:if>
									<c:set var="row" value="${n.seatRow}열" />
									<c:if test="${empty n.seatRow}">
										<c:set var="row" value="" />
									</c:if>
									<c:set var="col" value="${n.seatCol}번" />
									<c:if test="${empty n.seatCol}">
										<c:set var="col" value="" />
									</c:if>
									<div style="text-align: center;">${floor} ${area} ${row}
										${col}</div>

									<div class="row starValue mb-4 mt-4">
										<div class="col text-center">
											<span>시야</span> <span class="nstar" style="display: block;">
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
											<c:set var="nLegroom" value="${n.reviewLegroom}" />
											<span class="nstar" style="display: block;"> <c:forEach
													var="i" begin="0" end="4" step="1">
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
											<c:set var="nComfort" value="${n.reviewComfort}" />
											<span class="nstar" style="display: block;"> <c:forEach
													var="i" begin="0" end="4" step="1">
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
										<c:set var="rImg" value="default_review.png" />
										<c:if test="${!empty n.reviewImgPath}">
											<c:set var="rImg" value="${n.reviewImgPath}" />
										</c:if>
										<img id="${n.thCode}" class="img-responsive move"
											style="height: 244px; width: 100%;"
											src="${contextPath}/resources/reviewImages/${rImg}"
											onclick="location.href='review/seats?thCode=${n.thCode}'" />

										<div class="mt-4 mb-3 nCont">${n.reviewComment}</div>
										<div style="width: 310px;">
											<c:set var="viewDt" value="${fn:split(n.reviewViewDt,'-')}" />
											${viewDt[0]}년 ${viewDt[1]}월 ${viewDt[2]}일 관람
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-2"></div>
		
		<!-- 수정하려고했으나 실패  -->
<%--  		<section class="carousel">
 			<div class="reel">
				<div class="container d-flex justify-content-between">
					<c:if test="${!empty showList}">
							<c:forEach var="n" items="${nReview}">
								<div class="card" style="width: 340px;">
									<div class="card-content">
										<div class="row profile">
											<div class="col">
												<c:set var="src"
													value="${contextPath}/resources/images/user.png"></c:set>
												<c:if test="${! empty n.profilePath }">
													<c:set var="src"
														value="${contextPath}/resources/profileImages/${n.profilePath}"></c:set>
												</c:if>
												<img class="img-circle profile-photo" src="${src}" style="width: 30px !important; height:30px !important; border-radius: 5em;"> 
												<span style="display: none;" name="spanId">${n.memberId }</span> 
												<span style="display: none;" name="spanNo">${n.reviewWriter }</span>
												<span>${n.memberNickname}</span>
											</div>
											<div class="col text-right">
												<c:choose>
													<c:when
														test="${!empty loginMember && loginMember.memberNo ne n.reviewWriter }">
														<c:choose>
															<c:when test="${n.likeStatus == 1}">
																<div class="reviewLike heart"
																	style="background-position: -2800px 0;"
																	id="${n.reviewNo}" value="${n.likeStatus}"
																	onclick="reviewLike(this);"></div>
															</c:when>
															<c:otherwise>
																<div class="reviewLike heart"
																	style="background-position: 0 0;" id="${n.reviewNo}"
																	value="${n.likeStatus}" onclick="reviewLike(this);"></div>
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
										<div style="text-align: center;">${n.thName}</div>
										<c:set var="floor" value="${n.seatFloor}층" />
										<c:if test="${empty n.seatFloor}">
											<c:set var="floor" value="" />
										</c:if>
										<c:set var="area" value="${n.seatArea}구역" />
										<c:if test="${empty n.seatArea}">
											<c:set var="area" value="" />
										</c:if>
										<c:set var="row" value="${n.seatRow}열" />
										<c:if test="${empty n.seatRow}">
											<c:set var="row" value="" />
										</c:if>
										<c:set var="col" value="${n.seatCol}번" />
										<c:if test="${empty n.seatCol}">
											<c:set var="col" value="" />
										</c:if>
										<div style="text-align: center;">${floor} ${area} ${row}
											${col}</div>
	
										<div class="row starValue mb-4 mt-4">
											<div class="col text-center">
												<span>시야</span> <span class="nstar" style="display: block;">
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
												<c:set var="nLegroom" value="${n.reviewLegroom}" />
												<span class="nstar" style="display: block;"> <c:forEach
														var="i" begin="0" end="4" step="1">
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
												<c:set var="nComfort" value="${n.reviewComfort}" />
												<span class="nstar" style="display: block;"> <c:forEach
														var="i" begin="0" end="4" step="1">
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
											<c:set var="rImg" value="default_review.png" />
											<c:if test="${!empty n.reviewImgPath}">
												<c:set var="rImg" value="${n.reviewImgPath}" />
											</c:if>
											<img id="${n.thCode}" class="img-responsive move"
												style="height: 244px; width: 100%;"
												src="${contextPath}/resources/reviewImages/${rImg}"
												onclick="location.href='review/seats?thCode=${n.thCode}'" />
	
											<div class="mt-4 mb-3 nCont">${n.reviewComment}</div>
											<div style="width: 310px;">
												<c:set var="viewDt" value="${fn:split(n.reviewViewDt,'-')}" />
												${viewDt[0]}년 ${viewDt[1]}월 ${viewDt[2]}일 관람
											</div>
										</div>
									</div>
								</div>
						</c:forEach>
					</c:if>
				</div>
			</div>
		</section> --%>						
	</div>
	<script type="text/javascript" src="${contextPath}/resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/jquery.dropotron.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/jquery.scrolly.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/jquery.scrollex.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/browser.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/breakpoints.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/util.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/main.js"></script>
	<script>
		$(function(){
			$(".image.featured").css("margin-bottom","0");
		});
	</script>
	<script>
    // The Slideshow class.
	class Slideshow {
    constructor(el) {
        
        this.DOM = {el: el};
      
        this.config = {
          slideshow: {
            delay: 3000,
            pagination: {
              duration: 3,
            }
          }
        };
        
        // Set the slideshow
        this.init();
      
    }
    init() {
      
      var self = this;
      
      // Charmed title
      this.DOM.slideTitle = this.DOM.el.querySelectorAll('.slide-title');
      this.DOM.slideTitle.forEach((slideTitle) => {
        charming(slideTitle);
      });
      
      // Set the slider
      this.slideshow = new Swiper (this.DOM.el, {
          
          loop: true,
          autoplay: {
            delay: this.config.slideshow.delay,
            disableOnInteraction: false,
          },
          speed: 500,
          preloadImages: true,
          updateOnImagesReady: true,
          
          // lazy: true,
          // preloadImages: false,

          pagination: {
            el: '.slideshow-pagination',
            clickable: true,
            bulletClass: 'slideshow-pagination-item',
            bulletActiveClass: 'active',
            clickableClass: 'slideshow-pagination-clickable',
            modifierClass: 'slideshow-pagination-',
            renderBullet: function (index, className) {
              
              var slideIndex = index,
                  number = (index <= 8) ? '0' + (slideIndex + 1) : (slideIndex + 1);
              
              var paginationItem = '<span class="slideshow-pagination-item">';
              paginationItem += '<span class="pagination-number">' + number + '</span>';
              paginationItem = (index <= 8) ? paginationItem + '<span class="pagination-separator"><span class="pagination-separator-loader"></span></span>' : paginationItem;
              paginationItem += '</span>';
            
              return paginationItem;
              
            },
          },

          // Navigation arrows
          navigation: {
            nextEl: '.slideshow-navigation-button.next',
            prevEl: '.slideshow-navigation-button.prev',
          },

          // And if we need scrollbar
          scrollbar: {
            el: '.swiper-scrollbar',
          },
        
          on: {
            init: function() {
              self.animate('next');
            },
          }
        
        });
      
        // Init/Bind events.
        this.initEvents();
        
    }
    initEvents() {
        
        this.slideshow.on('paginationUpdate', (swiper, paginationEl) => this.animatePagination(swiper, paginationEl));
        //this.slideshow.on('paginationRender', (swiper, paginationEl) => this.animatePagination());

        this.slideshow.on('slideNextTransitionStart', () => this.animate('next'));
        
        this.slideshow.on('slidePrevTransitionStart', () => this.animate('prev'));
            
    }
    animate(direction = 'next') {
      
        // Get the active slide
        this.DOM.activeSlide = this.DOM.el.querySelector('.swiper-slide-active'),
        this.DOM.activeSlideImg = this.DOM.activeSlide.querySelector('.slide-image'),
        this.DOM.activeSlideTitle = this.DOM.activeSlide.querySelector('.slide-title'),
        this.DOM.activeSlideTitleLetters = this.DOM.activeSlideTitle.querySelectorAll('span');
      
        // Reverse if prev  
        this.DOM.activeSlideTitleLetters = direction === "next" ? this.DOM.activeSlideTitleLetters : [].slice.call(this.DOM.activeSlideTitleLetters).reverse();
      
        // Get old slide
        this.DOM.oldSlide = direction === "next" ? this.DOM.el.querySelector('.swiper-slide-prev') : this.DOM.el.querySelector('.swiper-slide-next');
        if (this.DOM.oldSlide) {
          // Get parts
          this.DOM.oldSlideTitle = this.DOM.oldSlide.querySelector('.slide-title'),
          this.DOM.oldSlideTitleLetters = this.DOM.oldSlideTitle.querySelectorAll('span'); 
          // Animate
          this.DOM.oldSlideTitleLetters.forEach((letter,pos) => {
            TweenMax.to(letter, .3, {
              ease: Quart.easeIn,
              delay: (this.DOM.oldSlideTitleLetters.length-pos-1)*.04,
              y: '50%',
              opacity: 0
            });
          });
        }
      
        // Animate title
        this.DOM.activeSlideTitleLetters.forEach((letter,pos) => {
					TweenMax.to(letter, .6, {
						ease: Back.easeOut,
						delay: pos*.05,
						startAt: {y: '50%', opacity: 0},
						y: '0%',
						opacity: 1
					});
				});
      
        // Animate background
        TweenMax.to(this.DOM.activeSlideImg, 1.5, {
            ease: Expo.easeOut,
            startAt: {x: direction === 'next' ? 200 : -200},
            x: 0,
        });
      
        //this.animatePagination()
    
    }
    animatePagination(swiper, paginationEl) {
            
      // Animate pagination
      this.DOM.paginationItemsLoader = paginationEl.querySelectorAll('.pagination-separator-loader');
      this.DOM.activePaginationItem = paginationEl.querySelector('.slideshow-pagination-item.active');
      this.DOM.activePaginationItemLoader = this.DOM.activePaginationItem.querySelector('.pagination-separator-loader');
      
      //console.log(swiper.pagination);
      // console.log(swiper.activeIndex);
      
      // Reset and animate
        TweenMax.set(this.DOM.paginationItemsLoader, {scaleX: 0});
        TweenMax.to(this.DOM.activePaginationItemLoader, this.config.slideshow.pagination.duration, {
          startAt: {scaleX: 0},
          scaleX: 1,
        });
      
      
    }
    
}

const slideshow = new Slideshow(document.querySelector('.slideshow'));
</script>
<!-- 리뷰 좋아요 -->
<script>       
	function reviewLike(obj){
		
		// 중복 방지 불가
		var click = true;
          	
		//console.log("11111111111 : " + click);
             
		if(click){
			var likeStatus = $(obj).attr("value");
			var reviewNo = $(obj).attr("id");
			var likeCount = $("#likeCount"+reviewNo);
			var count = "";
			var Id = $(obj).parent().prev().children("span[name=spanId]").html();
			var alarmUrl = "/review/seats?thCode=${theater.thCode}";
			var alarmContent = "${theater.thNm}";
			var No = $(obj).parent().prev().children("span[name=spanNo]").html();
			var alarmMemberNo = No;
			//console.log(Id);
			//console.log(alarmUrl);
			//console.log(alarmContent);
			//console.log(alarmMemberNo);
              
			$.ajax({
				url : "review/updateLike",
				type : "POST",
				data : {
						"reviewNo" : reviewNo, 
						"likeStatus" : likeStatus,
						"alarmContent" : alarmContent,
						"alarmUrl" : alarmUrl,
						"alarmMemberNo" : alarmMemberNo
				},
				success : function(rl){
					status = rl.memberNo; // memberNo에 status 저장함
					count = rl.reviewNo; // reviewNo에 likeCount 저장함
                    
					var statusChange = "";
                    
					if(status == 1){
						
						$(obj).attr("value", 1).css({"background-position" : "-2800px 0", "transition" : "background 0.4s steps(28)"});
						//statusChange = '<i class="fas fa-heart"></i>';
						//count = Number(likeCount.text()) + 1;
						// 웹소켓
						//console.log(socketMsg);
                       
						var socketMsg = "like" + "," + Id + "," +"${theater.thNm}" + "," + "${theater.thCode}";
						//console.log("socketMsg : " + socketMsg);   
						socket.send(socketMsg);
                             
					}else if(status == -1){
                        $(obj).attr("value", 0).css({"background-position" : "0 0", "transition" : "background 0.4s steps(28)"});
                        //statusChange = '<i class="far fa-heart"></i>';
                        //count = Number(likeCount.text()) - 1;
					}else if(status == 0){
						console.log("좋아요 ajax 실패");
					}
                    
					//$(obj).html(statusChange);
					likeCount.html(count);
					
					click = false;
					//console.log("222222222222222 : " + click);
                    
					setTimeout(function(){
						click = true;
						//console.log("333333333333333333 : " + click);
					}, 500);
				}
			});
		}
	}
</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>