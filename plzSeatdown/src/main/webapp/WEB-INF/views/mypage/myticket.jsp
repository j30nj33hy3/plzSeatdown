<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage-프로필</title>
<link rel="stylesheet" href="${contextPath}/resources/css/mypage_myticket.css"/>

<link rel="stylesheet" href="${contextPath}/resources/fullCalendar/core/main.css"/>
<script src="${contextPath}/resources/fullCalendar/core/main.js"></script>

<link rel="stylesheet" href="${contextPath}/resources/fullCalendar/grid/main.css"/>
<script src="${contextPath}/resources/fullCalendar/grid/main.js"></script>

<style>
	.style1{
		height: 700px;
	}
	.fc-today {
	    background: #FFF !important;
	    border: none !important;
	    border-top: 1px solid #ddd !important;
	    font-weight: bold;
	    font-size: 120%;
	}
	.fancyImg{
		max-height: auto;
	}
</style>

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
								<c:set var="snslogin" value="${loginMember.memberId }"/>
                        		<c:if test="${!fn:startsWith(snslogin,'_')}">
									<li><a href="changePwd">비밀번호 변경</a></li>
									<li><a href="secession">회원 탈퇴</a></li>
                        		</c:if>
								<li><a href="myreview">내 리뷰</a></li>
								<li><a href="myticket">내 티켓</a></li>
								<li><a href="mycommu">내 커뮤</a></li>
								<li><a href="ask">문의 내역</a></li>
								<li><a href="alarmSetting">알림 설정</a></li>
							</ul>
						</div>
						
						<!-- 캘린더 생성 공간 -->
						<div id="calendar" class="col-10"></div>						
						
						<%-- <div class="col-10 col-12-mobile imp-mobile" id="content">
							<div class="container">
								<div class="grid">
									<div class="row gallery">
									
									 <c:if test="${empty rimgList}">
                                   		<div id="nolistdiv" class="col-md-12">
                                      		<span id="nolist">존재하는 게시글이 없습니다</span>
                                  		</div>
                             		</c:if>
									
									<c:if test="${!empty rimgList}">
                             			<c:forEach var="reviewimg" items="${rimgList}" varStatus="vs">
									  	
          							  <div class='col-md-3'>
          							  	<div style="display:none;">${reviewimg.reviewNo}</div>
          							  	
          							  		<c:if test="${reviewimg.reviewWriter == loginMember.memberNo}">
                                         		<c:set var="src" value="${contextPath}/resources/reviewImages/${reviewimg.reviewImagePath}"/>
                                        	</c:if>
                                      
                							<a class="thumbnail fancybox" rel="ligthbox" href="${src}">
                    							<img class="img-responsive" src="${src}" style="width: 200px; height: 175px;" />
              								</a>
           							  </div> 
           							  
           							  	</c:forEach>
           							 </c:if>
            

									   </div>

									     <!-- 페이징바 -->
           					 <div class="col-md-12 d-flex justify-content-center" style="margin-top: 175px;">
	         				   <ul class="pagination pagination-info">
	            				<c:if test="${pInf.currentPage > 1}">
	                			<li class="page-item">
	                				<!-- 맨 처음으로(<<) -->
	                    			<a class="page-link" href="
	                    			<c:url value="myticket"> 
	                    				<c:param name="currentPage" value="1"/>
	                    			</c:url>
	                    			">&lt;&lt;</a>
	                			</li>
	                
	                			<li class="page-item">
	                				<!-- 이전으로(<) -->
                   					<a class="page-link" href="
                   					<c:url value="myticket">
                   					<c:param name="currentPage" value="${pInf.currentPage-1}"/>
                   					</c:url>
                   					">PREV</a>
	                			</li>
	                			</c:if>
	                
	              			  <!-- 10개의 페이지 목록 -->
	               			 	 <c:forEach var="p" begin="${pInf.startPage}" end="${pInf.endPage}">
	                				<c:if test="${p == pInf.currentPage}">
		              			  		<li class="active page-item">
		               			   	  		<a class="page-link">${p}</a>
		               					 </li>
	                				</c:if>
	                				<c:if test="${p != pInf.currentPage}">
                						<li class="page-item">
	                    					<a class="page-link" href="
	                    					<c:url value="myticket">
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
	                			    	<c:url value="myticket">
	                			    		<c:param name="currentPage" value="${pInf.currentPage+1}"/>
	                			    	</c:url>
	                			    ">NEXT</a>
	                			</li>
	                
	               			 <!-- 맨 끝으로(>>) -->
	              			  <li class="page-item">
	                   			 <a class="page-link" href="
	                   			 	<c:url value="myticket">
	                   			 		<c:param name="currentPage" value="${pInf.maxPage}"/>
	                   			 	</c:url>
	                   			 ">&gt;&gt;</a>
	               			 </li>
	               			 </c:if>
	        			    </ul>
							  </div>

										</div>
									</div>
									</div> --%>

					</div>
				</div>
			</div>
			
			
			
			
			<!-- 달력용 script -->
			<script>
			
				var calEvent = new Array();
				
				<c:forEach var="r" items="${ticketList}">
				
					calEvent.push({id: "${r.thName}",
										title: "${r.showTitle}",
										start: "${r.reviewViewDt}", 
										imageurl: "${r.reviewImgPath}", 
										color: "#FF8A9D",
										textColor:"#FFFFFF"});
					
				</c:forEach>
				
				
				document.addEventListener('DOMContentLoaded', function() {
					
					var calendarEl = document.getElementById('calendar');
					
					var calendar = new FullCalendar.Calendar(calendarEl, {
						locale: "ko",
						plugins: [ "dayGrid" ],
						defaultView: 'dayGridMonth',
						header: {
							left: "today",
							center: "title",
							right: "prev,next"
						},
						fixedWeekCount: false,
						columnFormat: {
						       month: 'ddd',
						       week: 'ddd d/M',
						       day: 'dddd d/M'
						},
						events: calEvent, 
		                eventRender:function(info) {
		                	
							var ticketImg = info.event.extendedProps.imageurl;
		                    
		                    var ticketPath = null;
		                    
		                    if(ticketImg != null) ticketPath = '${contextPath}/resources/reviewImages/' + ticketImg;
		                	
		                	var tag2 = '<img style="width:15px; height:15px;" class="img-responsive" alt="" src="' + ticketPath + '">&nbsp;';
		                	
		                    if(info.event.extendedProps.imageurl) {
		                    	
		                    	$(info.el).find("span.fc-title").prepend(tag2);
		                    }
		                    
		                    var showTitle = info.event.title;
		                    var theaterNm = info.event.id;
		                    var ticketImg = info.event.extendedProps.imageurl;
		                    
		                    var ticketPath = null;
		                    
		                    if(ticketImg != null) ticketPath = '<img alt="" src="${contextPath}/resources/reviewImages/' + ticketImg + '">';
		                    
		                    
		                    $(info.el).popover({
		                    	html: true,
		                        placement:'top',
		                        trigger : 'hover',
		                        content: "<b>" + theaterNm + "</b>에서 <b>" + showTitle + "</b> 관람<br>"
		                    }).popover('show');
		                },
						eventClick: function(info) {
		                    var eventObj = info.event;
		                    
		                    var showTitle = info.event.title;
		                    var theaterNm = info.event.id;
		                    var ticketImg = info.event.extendedProps.imageurl;
		                    
		                    var ticketPath = null;
		                    
		                    if(ticketImg != "") {
		                    	ticketPath = '${contextPath}/resources/reviewImages/' + ticketImg;
		                    	ticketPath2 = '${contextPath}/resources/reviewImages/200326174956_620616.png';
		                    	
		                    	 $.fancybox({
		                             'type': 'iframe',
		                             'href': ticketPath,
		                             //'autoSize' : false,
		                             'maxWidth' : '500px',
		                             'maxHeight' : '500px',
		                             'scrolling' : 'no',
		                             'content': '<img rel="' + showTitle + '" style="width:100%;" class="img-responsive fancyImg" alt="" src="' + ticketPath + '">'
		                         })
		                         
		                    }
		                    
		                    var tag = '<a class="thumbnail fancybox" rel="lightbox" href="' + ticketPath + '"><img class="img-responsive" alt="" src="' + ticketPath + '"></a>';
		                    var tag2 = '<img style="height:20px; width:20px;" class="img-responsive" alt="" src="' + ticketPath + '">';
		                    var tag3 = '<a class="thumbnail fancybox" rel="lightbox" href="' + ticketPath + '"></a>';
		                    
		                    //console.log($(info.el).html());
		                    
		                    //$(info.el).append(tag);
		                    
		                   	//$(info.el).find("span.fc-title").wrap(tag3);
		                    //$(info.el).find("span.fc-title").prepend(tag2);
		                    //$(info.el).find("span.fc-title").wrap(tag);

		                },
						editable: true,
						droppable: false
					});
					
					calendar.render();
			    });
				
				
				
				/* $(function(){
					$(".fc-day-grid-event").hover(function(){
						//console.log($(this));
						
						$(this).popover({
							placement: "top",
							trigger: "hover",
							title: "111111111",
							content: $(this).attr("id")
						});
						
					});
				}); */
				
			
			</script>
			
			
			<!-- <script>
			
			$(document).ready(function(){
			    //FANCYBOX
			    //https://github.com/fancyapps/fancyBox
			    $(".fancybox").fancybox({
			        openEffect: "none",
			        closeEffect: "none"
			    });
			});
			   
			</script> -->
		
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>