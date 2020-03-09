<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${contextPath}/resources/css/boardcss.css" />
<link rel="stylesheet" href="${contextPath}/resources/css/main.css" />
        

<title>게시글 상세</title>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
        <!-- Main -->
		
        <div class="container">
            <div>
            	<!-- 가장 최신글은 이전글이 안뜸 -->
            	<c:if test="">
            	</c:if>
                <button id="prev" class="btn btn-sm btn-outline-secondary">이전글</button>
                <!-- 가장 마지막글은 다음글이 안뜸 -->
                <button id="next" class="btn btn-sm btn-outline-secondary">다음글</button>
                <a href="${header.referer}" class="btn btn-sm btn-outline-secondary float-right">목록</a>
            </div>

            <div>
                <hr>
                <div class="pb-3" style="border-bottom: 1px dashed rgba(0,0,0,.1);">
                    <span>${comm.commTitle}</span>&nbsp;&nbsp;&nbsp;
                    <span class="text-muted">[카테고리]</span>
                </div>
                <div class="pt-3">
                    <img class="rounded-circle" style="width:20px; height:20;"src="images/pic01.jpg">
                    <p style="display: inline-block;">${comm.commNickNm}</p>
                    <p class="float-right text-muted" style="display: inline-block;">${comm.commModifyDate}</p>
                    <p class="float-right text-muted mr-4" style="display: inline-block;">조회수 &nbsp;${comm.commCount}</p>
                </div>
                
                <div class="my-4 py-5">
                    <p>${comm.commContent}</p>
                </div>
            </div>
            <div>
                <div>
                    <span>댓글</span>&nbsp;&nbsp;
                    <span>${comm.commReplyCount}</span>
                    <a href="#" class="float-right text-muted">신고</a>
                </div>
                <!-- 댓글 -->
                <div class="my-3 pt-2 pb-5 px-4 " style="background-color: #f7f7f9;" id="reply-area ">
                    <!-- 댓글 출력 부분 -->
                    <div class="replyList">
                        <ul class="comments-list">

                            <!-- 기본 댓글 출력 -->
                            <li class="comment">
                                <a class="float-left" href="#">
                                    <img class="rounded-circle avatar" src="http://bootdey.com/img/Content/user_1.jpg" alt="avatar">
                                </a>
                                <div class="comment-body">
                                    <div class="comment-heading">
                                        <h4 class="user">Gavino Free</h4>
                                        <h5 class="time">2020.02.24. 18:08</h5>
                                        <a href="#" class="time pr-2 float-right">신고</a>
                                        <a href="#" class="time pr-2 float-right">답글</a>
                                    </div>
                                    <p>Sure, oooooooooooooooohhhhhhhhhhhhhhhh</p>
                                </div>
                            </li>
                            
                            <!-- 답댓글 출력 -->
                            <li class="comment">
                                <ul class="comments-list">
                                    <li class="comment">
                                        <a class="float-left" href="#">
                                            <i class="fa fa-reply fa-rotate-180 text-muted" aria-hidden="true"></i>
                                            <img class="rounded-circle avatar" src="http://bootdey.com/img/Content/user_3.jpg" alt="avatar">
                                        </a>
                                        <div class="comment-body">
                                            <div class="comment-heading">
                                                <h4 class="user">Ryan Haywood</h4>
                                                <h5 class="time">2020.02.24. 18:08</h5>
                                                <a href="#" class="time pr-2 float-right">수정</a>
                                                <!-- <a href="#" class="time pr-2 float-right">답글</a> -->
                                            </div>
                                            <p>Relax my friend</p>
                                        </div>
                                    </li> 
                                </ul>
                            </li>
                            <li class="comment">
                                <ul class="comments-list">
                                    <li class="comment">
                                        <a class="float-left" href="#">
                                            <i class="fa fa-reply fa-rotate-180 text-muted" aria-hidden="true"></i>
                                            <img class="rounded-circle avatar" src="http://bootdey.com/img/Content/user_2.jpg" alt="avatar">
                                        </a>
                                        <div class="comment-body">
                                            <div class="comment-heading">
                                                <h4 class="user">Gavino Free</h4>
                                                <h5 class="time">2020.02.24. 18:22</h5>
                                                <a href="#" class="time pr-2 float-right">신고</a>
                                                <!-- <a href="#" class="time pr-2 float-right">답글</a> -->
                                            </div>
                                            <p>Ok, cool.</p>
                                        </div>
                                    </li> 
                                </ul>
                            </li>

                            <!-- 답글 클릭 시 댓글 작성 영역 -->
                            <li class="ml-5">
                                <table class="replyWrite">
                                    <tr>
                                        <td id="replyContentArea">
                                            <div class="comm_write_wrap">
                                                <textArea rows="2" cols="50" class="tcol" id="replyContent" maxlength="6000"></textArea>
                                            </div>
                                        </td>
                                        <td id="replyBtnArea">
                                            <div class="u_cbox_btn_upload">
                                                <button class="btn" id="addReply">댓글등록</button>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </li>

                            <li class="comment">
                                <a class="float-left" href="#">
                                    <img class="rounded-circle avatar" src="http://bootdey.com/img/Content/user_1.jpg" alt="avatar">
                                </a>
                                <div class="comment-body">
                                    <div class="comment-heading">
                                        <h4 class="user">Gavino Free</h4>
                                        <h5 class="time">2020.02.24. 18:08</h5>
                                        <a href="#" class="time pr-2 float-right">신고</a>
                                        <a href="#" class="time pr-2 float-right">답글</a>
                                    </div>
                                    <p>Sure, oooooooooooooooohhhhhhhhhhhhhhhh</p>
                                </div>
                            </li>
                            <li class="comment">
                                <ul class="comments-list">
                                    <li class="comment">
                                        <a class="float-left" href="#">
                                            <i class="fa fa-reply fa-rotate-180 text-muted" aria-hidden="true"></i>
                                            <img class="rounded-circle avatar" src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSIsw4ein7zmQ0GWZq60NBLKwzJ3MkhtkTzEooVnO2jkWGHHcHx" alt="avatar">
                                        </a>
                                        <div class="comment-body">
                                            <div class="comment-heading">
                                                <h5 class="time">2020.02.24. 18:08</h5>
                                                <!-- <a href="#" class="time float-right">신고</a> -->
                                                <!-- <a href="#" class="time pr-2 float-right">답글</a> -->
                                            </div>
                                            <p>비밀 댓글 입니다</p>
                                        </div>
                                    </li> 
                                </ul>
                            </li>

                        </ul>
                      </div>
      
                      <!-- 댓글 작성 영역 -->
                      <div>
                          <table class="replyWrite">
                              <tr>
                                  <td id="replyContentArea">
                                      <div class="comm_write_wrap">
                                          <textArea rows="2" cols="50" class="tcol" id="replyContent" maxlength="6000"></textArea>
                                      </div>
                                  </td>
                                  <td id="replyBtnArea">
                                        <div class="u_cbox_btn_upload">
                                            <button class="btn" id="addReply">댓글등록</button>
                                        </div>
                                  </td>
                              </tr>
                          </table>
                      </div>
                </div>
            </div>
            <hr>
            <div class="col-md-12 text-center">
                <button class="btn btn-sm btn-outline-secondary float-right" type="button">목록</button>
            </div>
        </div>


        
</body>
</html>