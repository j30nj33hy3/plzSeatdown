<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage-프로필</title>
<link rel="stylesheet" href="${contextPath}/resources/css/mypage_alarmSetting.css"/>

</head>
<body class="homepage is-preload">
   <jsp:include page="/WEB-INF/views/common/header.jsp"/>
   <jsp:include page="/WEB-INF/views/common/nav.jsp"/>
   
   <!-- Main -->
         <div class="wrapper style1" style="overflow:auto; height:1000px; scrolle:hidden;">
            <div class="container" >
               <div class="row gtr-200">
               
                  <div class="col-2 col-12-mobile" id="sidebar" style="width: 200px;">
                  <h4><a href="alarmSetting">알림 설정</a></h4>
                     <ul>
                        <li><a href="mypage">프로필</a></li>
                        <li><a href="changePwd">비밀번호 변경</a></li>
                        <li><a href="secession">회원 탈퇴</a></li>
                        <li><a href="myreview">내 리뷰</a></li>
                        <li><a href="myticket">내 티켓</a></li>
                        <li><a href="mycommu">내 커뮤</a></li>
                        <li><a href="ask">문의 내역</a></li>
                        <li><a href="alarmSetting">알림 설정</a></li>
                     </ul>
                  </div>
                  
                  
                  <div class="col-10 col-12-mobile imp-mobile" id="content" >
                  
                   <c:if test="${empty alist}">
                                 <div class="col-10 col-12-mobile imp-mobile" id="content" style="text-align:center;">받은 알림이 없습니다.</div>
                           </c:if>   
                          
                           
                           <div class="container-fluid">
                        <div class="row">
                            <div id="timeline">
                            
                                <div class="row timeline-movement timeline-movement-top">
                                    <div class="timeline-badge timeline-future-movement" style="border:0px;">
                                     <span style="color:#FFD938;"><i class="far fa-bell fa-2x" style="margin-top:20px;"></i></span>
                                    </div>
                                </div>
                                
                                <c:if test="${!empty alist}">
                                   <c:forEach var="alarm" items="${alist}" varStatus="vs">
                                   
                                <c:if test="${alarm.alarmType == 'L'}">
                                <div class="row timeline-movement">
                                    <div class="timeline-badge center-left">
                                    </div>
                                    <div class="col-sm-6  timeline-item">
                                        <div class="row">
                                            <div class="col-sm-11">
                                                <div class="timeline-panel credits  anim animate fadeInLeft">
                                                    <ul class="timeline-panel-ul">
                                                        <div class="lefting-wrap">
                                                            <li class="img-wraping"><a href="#"><img src="${contextPath}/resources/images/like3.png" class="img-responsive" alt="user-image" /></a></li>
                                                        </div>
                                                        <div class="righting-wrap">
                                                    <a href="${contextPath}/${alarm.alarmUrl}">
                                                            <li><span class="causale">${alarm.alarmContent}</span> </li>
                                                            <li><p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>${alarm.alarmDate}</small></p> </li>
                                                        </a>
                                                        </div>
                                                        <div class="clear"></div>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </c:if>
                    			
                    			<c:if test="${alarm.alarmType == 'R'}">
                                <div class="row timeline-movement">
                                    <div class="timeline-badge center-right">
                                    </div>
                                    <div class="offset-sm-6 col-sm-6  timeline-item">
                                        <div class="row">
                                            <div class="offset-sm-1 col-sm-11">
                                                <div class="timeline-panel debits  anim animate  fadeInRight">
                                                    <ul class="timeline-panel-ul">
                                                        <div class="lefting-wrap">
                                                            <li class="img-wraping"><a href="#"><img src="${contextPath}/resources/images/chat.png" class="img-responsive"/></a></li>
                                                        </div>
                                                        <div class="righting-wrap">
                                                            <li><span class="causale">${alarm.alarmContent}</span></li>
                                                            <li><p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>${alarm.alarmDate}</small></p> </li>
                                                        </div>
                                                        <div class="clear"></div>
                                                    </ul>
                                                </div>
                    
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </c:if>
                               
                           </c:forEach>
                           </c:if>
                            </div>
                        </div>
                    </div>

                  </div>

               </div>
            </div>
         </div>
         
         
         
      <script>
      
      // 게시글 상세보기 기능 (jquery를 통해 작업)
      $(function(){
               
         $(document).on("click",".updatebtn", function(){
            
            var communityNo = $(this).parent().parent().children().eq(0).text()
            // 쿼리스트링을 이용하여 get 방식으로 글 번호를 server로 전달
            <c:url var="detailUrl" value="detail"> // 주소창의 detail
                    <c:param name="currentPage" value="${pInf.currentPage}"/>
                  </c:url>
            //location.href="${detailUrl}&no="+communityNo;
            location.href="${contextPath}/community/"+"${detailUrl}&no="+communityNo;
         }).mouseenter(function(){
            $(this).parent().css("cursor", "pointer");
         });
      });
       
      
   </script>
   
            
         <script>
         
         
         /**********************Scroll Animation "START"************************************/
         $(document).ready(function(){
         var $animation_elements = $('.anim');
         var $window = $(".wrapper");
         var $window2 = $(window);
         
         function check_if_in_view() {
         var window_height = $window.height();
         var window_top_position = $window.scrollTop();
         var window_bottom_position = (window_top_position + window_height);
         
         $.each($animation_elements, function() {
         var $element = $(this);
         var element_height = $element.outerHeight();
         var element_top_position = $element.offset().top;
         var element_bottom_position = (element_top_position + element_height);
         
         //check to see if this current container is within viewport
         if ((element_bottom_position >= window_top_position) &&
         (element_top_position <= window_bottom_position)) {
         $element.addClass('animated');
         } else {
         $element.removeClass('animated');
         }
         });
         }
         
         
         $window.on('scroll resize', check_if_in_view);
         $window.trigger('scroll');
         });
         /**********************Scroll Animation "END"************************************/
         
         /**********************Change color of center aligned animated content small Circle  "START"************************************/
         $(document).ready(function(){
             $(" .debits").hover(function(){
                 $(" .center-right").css("background-color", "rgb(0,219,114)");
                 }, function(){
                 $(" .center-right").css("background-color", "#fff");
             }); 
         });
         $(document).ready(function(){
             $(".credits").hover(function(){
                 $(".center-left").css("background-color", "rgb(240,0,0)");
                 }, function(){
                 $(".center-left").css("background-color", "#fff");
             }); 
         });
         /**********************Change color of center aligned animated content small Circle  "END"************************************/
         
         
         </script>
   
   
   
   <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>