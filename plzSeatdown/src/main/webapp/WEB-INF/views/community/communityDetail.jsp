<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${contextPath}/resources/css/boardcss.css" />
        
<style>
tbody > tr:last-child{
	border-bottom : none;
}
</style>
<title>게시글 상세</title>
</head>
<body id="page-top">
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
        <!-- Main -->
		
        <div class="container py-5 mb-5">
	        <a style="display:none; position:fixed; bottom:25px; right:30px; z-index:5;" href="#page-top" id="top-btn">
		    	<i class="fa fa-angle-up fa-2x" aria-hidden="true" style="color:#FFD938;"></i>
		    </a>
            <div>
            	<button id="pre" class="btn btn-sm btn-outline-secondary">이전글</button>
                
                <button id="next" class="btn btn-sm btn-outline-secondary">다음글</button>
                
                <c:if test="${loginMember.memberNo == community.communityWriter}">
                	<button id="deleteBtn" class="btn btn-sm btn-outline-secondary float-right">삭제</button>
                </c:if>
                &nbsp;
                <c:if test="${loginMember.memberNo == community.communityWriter}">
                	<a href="updateForm?no=${community.communityNo}" class="btn btn-sm btn-outline-secondary float-right mr-1">수정</a>
                </c:if>
                &nbsp;
                <a class="btn btn-sm btn-outline-secondary float-right mr-1" type="button"
						href="
						<c:url value="list">
	                   		<c:if test="${!empty param.searchKey }">
				        		<c:param name="searchKey" value="${param.searchKey}"/>
				        	</c:if>
				        	
				        	<c:if test="${!empty param.searchValue }">
				        		<c:param name="searchValue" value="${param.searchValue}"/>
				        	</c:if>
				        	
				        	<c:if test="${!empty param.searchCategory}">
	        					<c:param name = "searchCategory" value="${param.searchCategory}"/>
	        				</c:if>
	                   		<c:param name="currentPage" value="${param.currentPage}"/>
	                   	</c:url>" >목록
	             </a>
            </div>

            <div>
                <hr>
                <div class="pb-3" style="border-bottom: 1px dashed rgba(0,0,0,.1);">
                    <span class="text-muted">[${community.categoryName}]</span>&nbsp;&nbsp;&nbsp;
                    <span>${community.communityTitle}</span>
                </div>
                <div class="pt-3">
                	<c:if test="${empty community.profilePath}">
	                    <img class="rounded-circle" style="width:20px; height:20px;"src="${contextPath}/resources/images/user.png">
                	</c:if>
                	<c:if test="${!empty community.profilePath}">
                		<img class="rounded-circle" style="width:20px; height:20px;"src="${contextPath}/resources/profileImages/${community.profilePath}">
                	</c:if>
                    <p style="display: inline-block;">${community.memberNickname}</p>
                    <p class="float-right text-muted" style="display: inline-block;">${community.communityModifyDate}</p>
                    <p class="float-right text-muted mr-4" style="display: inline-block;">조회수 &nbsp;${community.communityCount}</p>
                </div>
                
                <div class="my-4 py-5">
                    <p>${community.communityContent}</p>
                </div>
            </div>
            <div>
                <div>
                    <span>댓글</span>&nbsp;&nbsp;
                    <span id="replyCount"></span>
                    <c:if test="${loginMember.memberNo != community.communityWriter}">
                   		<button data-toggle="modal" data-target="#communityModal" class="btn float-right text-muted report" id="communityReportBtn">신고</button>
                    </c:if>
                </div>
                
                     <%-- 모달 시작 --%>
                     <div class="modal fade" id="communityModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                         <div class="modal-dialog modal-dialog-centered" role="document">
                           <div class="modal-content" style="border:0px;">
                             <div class="modal-header" style="background-color:rgb(198, 180, 205);">
                               <h5 class="modal-title" id="exampleModalLabel">신고하기</h5>
                               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                 <span aria-hidden="true">&times;</span>
                               </button>
                             </div>
                              <form method="post" action="communityReport">
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
                                       <textarea disabled class="form-control replyContent" id="communityReportContent" name="communityReportContent" maxlength="300" placeholder="기타 선택시 입력 가능합니다. (최대 300자)" style="resize: none;"></textarea>
                                       <input type="hidden" name="communityNo" value="${community.communityNo}">
                                       <input type="hidden" name="communityWriter" value="${community.communityWriter}">
                                       <input type="hidden" name="memberReporter" value="${loginMember.memberNo}">
                                       <input type="hidden" name="reportCategory" value="">
                                     </div>
                                </div>
                                <div class="modal-footer">
                                  <button type="submit" class="btn" onclick="return report1();" style="background-color:#FFD938;">신고</button>
                                  <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
                                </div>
                             </form>
                           </div>
                         </div>
                       </div>
                  <%-- 모달 끝 --%>
                
                <!-- 댓글 -->
                <div class="my-3 pt-2 pb-5 px-4 " style="background-color: #f7f7f9;" id="reply-area ">
                    <!-- 댓글 출력 부분 -->
                    <div class="replyList">
                        <ul class="comments-list" id="replyListArea">

                        </ul>
                      </div>
      
                      <!-- 댓글 작성 영역 -->
                      <div>
                          <table class="replyWrite">
                              <tr>
                                  <td id="replyContentArea">
                                      <div class="comm_write_wrap">
                                          <textArea rows="2" cols="50" class="tcol" id="replyContent" maxlength="300"></textArea>
                                      </div>
                                  </td>
                                  <td id="replyBtnArea">
                                        <div class="u_cbox_btn_upload">
                                            <button class="btn" id="addReply">댓글등록</button>
                                        </div>
                                  </td>
                              </tr>
                          </table>
                          <input type="checkbox" class="" id="replySecret">
                          <label class="time text-muted" for="replySecret" style="font-size:11px;">비밀댓글</label>
                      </div>
                </div>
            </div>
            <hr>
            <div class="col-md-12 text-center">
                <a class="btn btn-sm btn-outline-secondary float-right" type="button"
						href="
						<c:url value="list">
	                   		<c:if test="${!empty param.searchKey }">
				        		<c:param name="searchKey" value="${param.searchKey}"/>
				        	</c:if>
				        	
				        	<c:if test="${!empty param.searchValue }">
				        		<c:param name="searchValue" value="${param.searchValue}"/>
				        	</c:if>
	                   		<c:param name="currentPage" value="${param.currentPage}"/>
	                   	</c:url>" >목록
	             </a>
            </div>
        </div>
	<jsp:include page="../common/footer.jsp"/>
	<script>
	
		// 이전
		$("#pre").on("click", function(){
			var preCommNo = ${community.preCommunityNo};
			<c:url var="detailUrl" value="detail">
          		<c:if test="${!empty param.searchKey }">
        			<c:param name="searchKey" value="${param.searchKey}"/>
	        	</c:if>
	        	<c:if test="${!empty param.searchValue }">
	        		<c:param name="searchValue" value="${param.searchValue}"/>
	        	</c:if>
	        	
	        	<c:if test="${!empty param.searchCategory}">
	        		<c:param name = "searchCategory" value="${param.searchCategory}"/>
	        	</c:if>
             	<c:param name="currentPage" value="${pInf.currentPage}"/>
           	</c:url>
           	if(preCommNo == 0){
           		alert("마지막 글 입니다.");
           	}else{
		        location.href="${detailUrl}&no="+preCommNo;
           	}
		});
		
		// 다음
		$("#next").on("click", function(){
			var nextCommNo = ${community.nextCommunityNo};
			// 쿼리스트링을 이용하여 get 방식으로 글 번호를 server로 전달
			<c:url var="detailUrl" value="detail">
          		<c:if test="${!empty param.searchKey }">
        			<c:param name="searchKey" value="${param.searchKey}"/>
	        	</c:if>
	        	<c:if test="${!empty param.searchValue }">
	        		<c:param name="searchValue" value="${param.searchValue}"/>
	        	</c:if>
	        	
	        	<c:if test="${!empty param.searchCategory}">
	        		<c:param name = "searchCategory" value="${param.searchCategory}"/>
	        	</c:if>
             	<c:param name="currentPage" value="${pInf.currentPage}"/>
           	</c:url>
           	if(nextCommNo == 0){
           		alert("가장 최신글 입니다.");
           	}else{
		        location.href="${detailUrl}&no="+nextCommNo;
           	}
		});
		
		// 삭제
		$("#deleteBtn").on("click",function(){
			if(confirm("정말 삭제 하시겠습니까?")) location.href = "delete?no=${param.no}";
		});
		
		// 부모 댓글 등록 이벤트
		$("#addReply").on("click",function(){
			if($("#replyContent").val().trim() == ""){
				alert("내용을 입력하세요.");
				$("#replyContent").focus();
				return false;
			}
			
			var replyContent = $("#replyContent").val().replace("\n", "<br>");
			var replySecret = "N";
			
			// 비밀댓글 체크 여부
			if($("#replySecret").is(":checked")){
				replySecret = "Y";
			}
			
			var replyNo;
			//var socketMsg ="메세지 확인";
			$.ajax({
				url : "insertReply",
				dataType : "json",
				type : "POST",
				data : {
					replyContent : replyContent,
					replySecret : replySecret,
					depth : "0",
					parentNo : "0",
					communityNo : ${community.communityNo},
					replyWriter : ${loginMember.memberNo}
					},
				success : function(result){
					var msg;
					$("#replySecret").prop('checked', false );
					switch(result){
					case 1 : $("#replyContent").val("");
						selectRlist();
						alert(socket);	
					var socketMsg = "reply," + "${loginMember.memberNickname}" +","+ "${community.memberNickname}" + "," + "${community.communityTitle}" + "," + "${community.communityNo}";
						console.log("socketMsg : " + socketMsg);
						/* 맵핑된 핸들러 객체의 handleTextMessage매소드가 실행 */
						socket.send(socketMsg);
						
						break;
					case 0 : alert("댓글 등록 실패"); break;
					case -1 : alert("댓글 등록 오류 발생"); break;
					}
				},
				error: function(){
					console.log("ajax 통신 실패");
				}
			});
		});
		
		// 댓글 목록 조회 함수
		function selectRlist(){
			var communityNo = "${community.communityNo}";
			var rCount = 0;
			$.ajax({
				url : "selectReplyList",
				type : "POST",
				data : {"communityNo":communityNo},
				dataType : "json",
				success : function(rList){
					//console.log(rList);
					
					var $rArea = $("#replyListArea");

					if(rList == ""){
						$rArea.html("<li><p>등록된 댓글이 없습니다.</p></li>");
						$("#replyCount").html(0);
					}else{
						$rArea.html("");
						var rGroup = 0;
						var rPrint = 0;
						var v_rereply = 0;
						
						$.each(rList, function(i){
							if(rList[i].replyStatus=='Y'){
								rCount ++
							}
							//console.log(rCount);
							$("#replyCount").html(rCount);
							/* 공통  */
							var $li = $("<li>").prop("class","comment");
							var $rLi = $("<li>").prop("class","comment");
							var $div = $("<div>").prop("class", "float-left");
							var $img = $("<img>").addClass(['rounded-circle','avatar']);
							var $divB = $("<div>").prop("class", "comment-body");
							var $divB2 = $("<div>").addClass(['comment-body','comment-body-r']);
							var $divH = $("<div>").prop("class","comment-heading");
							var $rWriter = $("<h4>").prop("class","user").html(rList[i].memberNickname);
							var $rDate = $("<h5>").prop("class","time").html(rList[i].replyModifyDate);
							var $rDelete = $("<button>").addClass(['time', 'rbtn', 'pr-2','float-right']).prop("name","replyDelete").html("삭제");
							var $rReport = $("<button data-toggle='modal' data-target='#replyModal'>").addClass(['time', 'rbtn', 'pr-2','float-right']).prop("name","replyReport").html("신고");
							var $rContent = $("<p>").html(rList[i].replyContent);
							var $rUpdate = $("<button>").addClass(['time', 'rbtn', 'pr-2','float-right']).prop("name","replyUpdate").html("수정");
							var $rNo = $("<input>").prop({"type":"hidden","name":"rNo"}).val(rList[i].replyNo);
							var $rSecret = $("<input>").prop({"type":"hidden","name":"rSecret"}).val(rList[i].replySecret);
							var $depth = $("<input>").prop({"type":"hidden","name":"depth"}).val(rList[i].depth);
							var $writerNo = $("<input>").prop({"type":"hidden","name":"writerNo"}).val(rList[i].replyWriter);
							var $lock = $("<i>").addClass(['fa', 'fa-lock','text-muted', "ml-1"]).prop("aria-hidden","true").css("font-size","11px");
							/* 부모  */
							var $rrp = $("<button>").addClass(['time', 'rbtn', 'pr-2','float-right']).prop("name","replyReply").html("답글");
							/* 자식  */
							var $ul = $("<ul>").prop("class","comments-list");
							var $i = $("<i>").addClass(['fa', 'fa-reply','fa-rotate-180','text-muted']).prop("aria-hidden","true");
							/* 비밀댓글 */
							var $p = $("<p>");
							
							// 삭제
							if(${loginMember.memberNo} == rList[i].replyWriter){
								$divH.append($rDelete);
							}
							// 신고
							if(${loginMember.memberNo} != rList[i].replyWriter){
								$divH.append($rReport);
							}
							// 수정
							if(${loginMember.memberNo} == rList[i].replyWriter && rList[i].replyStatus=='Y'){
								$divH.append($rUpdate);
							}
							
							// 댓글 내용
							// rPrint 0 : 부모댓글 출력
							// rPrint 1 : 부모댓글 비밀출력
							// rPrint 2 : 자식댓글 출력
							// rPrint 3 : 자식댓글 비밀출력
							// v_rereply : 대댓글 보여줄지 말지 1:보여줌 0:숨김
							if(rList[i].replyStatus != 'W'){
								if(${loginMember.memberNo} == ${community.communityWriter} || ${loginMember.memberGrade == 'A'}){
									if(rList[i].depth==0) rPrint = 0;
									else rPrint = 2;
								}else if(${loginMember.memberNo} == rList[i].replyWriter){
									if(rList[i].depth==0){
										rPrint = 0;
										v_rereply = 1;
									}
									else rPrint = 2;
									rGroup = rList[i].replyGroup;
								}else if(rGroup == rList[i].replyGroup){
									if(v_rereply == 1){
										rPrint = 2;
									}else if(${loginMember.memberNo} != rList[i].replyWriter && rList[i].replySecret == 'Y'){
										rPrint = 3;
									}
									else{
										if(rList[i].depth==0) rPrint = 0;
										else rPrint = 2;
									}
								}else{
									v_rereply = 0;
									if(rList[i].replySecret == 'N'){
										if(rList[i].depth==0) rPrint = 0;
										else rPrint = 2;
									}else{
										if(rList[i].depth==0) rPrint = 1;
										else rPrint = 3;
									}
								}
							}else{
								rPrint = 4;
							}
							
							//console.log("replyStatus : " + rList[i].replyStatus);
							//console.log("rPrint : " + rPrint);
							if(rPrint == 0){
								$li.append($div);
								$div.append($img);
								if(rList[i].profilePath == null){
									$img.prop("src","${contextPath}/resources/images/user.png");
								}else if(rList[i].profilePath != null){
									$img.prop("src","${contextPath}/resources/profileImages/"+rList[i].profilePath);
								}
								$li.append($rNo);
								$li.append($rSecret);
								$li.append($depth);
								$li.append($writerNo);
								$li.append($divB);
								$divB.append($divH);
								$divH.append($rWriter);
								$divH.append($rDate);
								if(rList[i].replySecret == 'Y'){
									$divH.append($lock);
								}
								$divH.append($rrp);
								$divB.append($rContent);
								$rArea.append($li);
								
							}else if(rPrint == 1){
								$li.append($div);
								$div.append($img);
								$img.prop("src","${contextPath}/resources/images/lock.png");
								$li.append($rNo);
								$li.append($rSecret);
								$li.append($depth);
								$li.append($writerNo);
								$li.append($divB);
								$divB.append($divH);
								$divH.append($rWriter);
								$divH.append($rDate);
								$divH.append($rrp);
								$divB.append($p).html("비밀 댓글 입니다.");
								
								$rArea.append($li);
							}else if(rPrint == 2){
								$rLi.append($ul);
								$ul.append($li);
								$li.append($div);
								$li.append($rNo);
								$li.append($rSecret);
								$li.append($depth);
								$li.append($writerNo);
								$div.append($i);
								$div.append($img);
								if(rList[i].profilePath == null){
									$img.prop("src","${contextPath}/resources/images/user.png");
								}else if(rList[i].profilePath != null){
									$img.prop("src","${contextPath}/resources/profileImages/"+rList[i].profilePath);
								}
								$li.append($divB2);
								$divB2.append($divH);
								$divH.append($rWriter);
								$divH.append($rDate);
								if(rList[i].replySecret == 'Y'){
									$divH.append($lock);
								}
								$divB2.append($rContent);
								
								$rArea.append($rLi);
							}else if(rPrint == 3){
								$rLi.append($ul);
								$ul.append($li);
								$li.append($div);
								$li.append($rNo);
								$li.append($rSecret);
								$li.append($depth);
								$li.append($writerNo);
								$div.append($i);
								$div.append($img);
								$img.prop("src","${contextPath}/resources/images/lock.png");
								$li.append($divB2);
								$divB2.append($divH);
								$divH.append($rWriter);
								$divH.append($rDate);
								$divB2.append($p).html("비밀 댓글 입니다.");
								
								$rArea.append($rLi);
							}else{
								$li.append($div);
								$div.append($img);
								$img.prop("src","${contextPath}/resources/images/user.png");
								$li.append($rNo);
								$li.append($rSecret);
								$li.append($depth);
								$li.append($divB);
								$divB.append($divH);
								$divB.append($p).html("삭제된 글입니다.");
								$rArea.append($li);
							}
							
						});
						
					}
				},
				error : function(){
					console.log("댓글 목록 조회 ajax 호출 실패");
				}
			});
		}
		
		$(document).ready(function(){
			selectRlist();
		});
		
		
		// 댓글 수정 입력창
		$(document).on("click","button[name='replyUpdate']",function(){
			var replyPrevContent = $(this).parent().parent().children("p").text();
			
			// 수정폼
			var updateArea = 
			'<div>'+
            '<table class="replyWrite">'+
            '    <tr>'+
            '        <td id="replyContentArea">'+
            '            <div class="comm_write_wrap">'+
            '                <textArea rows="2" cols="50" class="tcol" id="updateContent" maxlength="300">'+replyPrevContent+'</textArea>'+
            '            </div>'+
            '        </td>'+
            '        <td id="replyBtnArea">'+
            '              <div class="u_cbox_btn_upload">'+
            '                  <button class="btn" id="updateReply">댓글수정</button>'+
            '              </div>'+
            '        </td>'+
            '    </tr>'+
            '</table>'+
            '<input type="checkbox" class="" id="replySecret">'+
            '<label class="time text-muted" for="replySecret" style="font-size:11px;">비밀댓글</label>'+
        	'</div>';
        	var prevP = $(this).parent().parent().children("p");
        	prevP.after(updateArea);
        	
        	// 비밀글체크
        	var prevSecret = $(this).parent().parent().parent().children("input[name=rSecret]").val();
        	if(prevSecret == 'Y'){
        		$("#replySecret").prop("checked","true");
        	}
        	
        	$(this).parent().parent().children("p").remove();
        	
        	var updateCancel = '<button class="time rbtn pr-2 float-right cancelBtn" name="cancelBtn" style="font-size:12px;">수정취소</button>';
        	$(this).parent().append(updateCancel);
        	$(this).parent().children("button").not(".cancelBtn").remove();
		});
		
		// 댓글수정, 답댓글 취소
		$(document).on("click","button[name='cancelBtn']",function(){
			selectRlist();
		});
		
		// 댓글 수정
		$(document).on("click","button[id='updateReply']",function(){
			var replyContent = $("#updateContent").val();
			var replyNo = $(this).parent().parent().parent().parent().parent().parent().parent().parent().children("input").val();
			
			var replySecret = "N";
			
			// 비밀댓글 체크 여부
			if($("#replySecret").is(":checked")){
				replySecret = "Y";
			}
			
			$.ajax({
				url : "updateReply",
				type : "POST",
				data : {"replyContent":replyContent,
						"replyNo":replyNo,
						"replySecret":replySecret},
				success : function(result){
					var msg;
					switch(result){
					case 1 : selectRlist(); break;
					case 0 : alert("댓글 수정 실패"); break;
					case -1 : alert("댓글 수정 오류 발생"); break;
					}
				},
				error: function(){
					console.log("ajax 통신 실패");
				}
			});
		});
		
		// 답글 입력창
		$(document).on("click","button[name='replyReply']",function(){
			var reReplyArea = 
				'<div class="ml-5">'+
	            '<table class="replyWrite">'+
	            '    <tr>'+
	            '        <td id="replyContentArea">'+
	            '            <div class="comm_write_wrap">'+
	            '                <textArea rows="2" cols="50" class="tcol" id="reContent" maxlength="300"></textArea>'+
	            '            </div>'+
	            '        </td>'+
	            '        <td id="replyBtnArea">'+
	            '              <div class="u_cbox_btn_upload">'+
	            '                  <button class="btn" id="reReply">댓글등록</button>'+
	            '              </div>'+
	            '        </td>'+
	            '    </tr>'+
	            '</table>'+
	            '<input type="checkbox" class="" id="replySecret">'+
	            '<label class="time text-muted" for="replySecret" style="font-size:11px;">비밀댓글</label>'+
	        	'</div>';
	        	
			var prevP = $(this).parent().parent().parent();
        	prevP.after(reReplyArea);
        	
        	var reCancel = '<button class="time rbtn pr-2 float-right cancelBtn" name="cancelBtn" style="font-size:12px;">댓글 취소</button>';
        	$(this).parent().parent().append(reCancel);
        	$(this).parent().children("button").not(".cancelBtn").remove();
		});
		
		// 답댓글 등록
		$(document).on("click","button[id='reReply']",function(){
			var replyNo = $(this).parent().parent().parent().parent().parent().parent().prev().children("input[name=rNo]").val();
			var replyWriter = ${loginMember.memberNo};
			var replyContent = $("#reContent").val();
			var communityNo = ${community.communityNo};
			var depth = "1";
			var replySecret = "N";
			
			// 비밀댓글 체크 여부
			if($("#replySecret").is(":checked")){
				replySecret = "Y";
			}
			
			$.ajax({
				url : "insertReReply",
				type : "POST",
				data : {"replyNo" : replyNo,
						"replyWriter" : replyWriter,
						"replyContent" : replyContent,
						"communityNo" : communityNo,
						"depth" : depth,
						"replySecret" : replySecret},
				success : function(result){
					var msg;
					switch(result){
					case 1 : selectRlist(); 
						var socketMsgRR = "reply," + "${loginMember.memberNickname}" +","+ "${community.memberNickname}" + "," + "${community.communityTitle}" + "," + "${community.communityNo}";
							console.log("socketMsg : " + socketMsgRR);
							/* 맵핑된 핸들러 객체의 handleTextMessage매소드가 실행 */
							socket.send(socketMsgRR);					
							break;
					case 0 : alert("답댓글 등록 실패"); break;
					case -1 : alert("답댓글 등록 오류 발생"); break;
					}
				},
				error : function(){
					console.log("ajax 통신 실패");
				}
			});
			
		});
		
		// 댓글 삭제
		$(document).on("click","button[name='replyDelete']",function(){
			var con = confirm('댓글을 삭제하시겠습니까?');	
			if(con){
				var replyNo =$(this).parent().parent().parent().children("input[name=rNo]").val();
				var communityNo = ${community.communityNo};
				var depth = $(this).parent().parent().parent().children("input[name=depth]").val();
				
				$.ajax({
					url : "deleteReply",
					type : "POST",
					data : {"replyNo" : replyNo,
							"communityNo" : communityNo,
							"depth" : depth},
					success : function(result){
						var msg;
						switch(result){
						case 1 : selectRlist(); break;
						case 0 : alert("댓글 삭제 실패"); break;
						case -1 : alert("댓글 삭제 오류 발생"); break;
						}
					},
					error : function(){
						console.log("ajax 통신 실패");
					}
				});
				
			}else{
				selectRlist();
			}
		});
		
		// 댓글 신고
		$(document).on("click","button[name='replyReport']",function(){
			$("input[name='exampleRadios']").removeAttr('checked');
			$("#example1").prop("checked",true);
			$("textarea[name=replyReportContent]").attr("disabled",true);
			var $reportReplyNo = $(this).parent().parent().parent().children("input[name=rNo]").val();
			var $suspector = $(this).parent().parent().parent().children("input[name=writerNo]").val();
			$("#reportReplyNo").val($reportReplyNo);
			$("#replySuspector").val($suspector);
		});
	</script>

<%-- 댓글 신고 모달 --%>
            <div class="modal fade" id="replyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                  <div class="modal-content" style="border:0px;">
                    <div class="modal-header" style="background-color:rgb(198, 180, 205);">
                      <h5 class="modal-title" id="exampleModalLabel">신고하기</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                     <form action="replyReport" method="post">
                       <div class="modal-body">
                            <div class="form-group">
                              <p>신고사유</p>
                              <div class="form-check">
								  <input class="form-check-input" type="radio" name="exampleRadios" id="example1" value="1" checked>
								  <label class="form-check-label" for="example1">욕설</label>
								</div>
								<div class="form-check">
								  <input class="form-check-input" type="radio" name="exampleRadios" id="example2" value="2">
								  <label class="form-check-label" for="example2">음란성</label>
								</div>
								<div class="form-check">
								  <input class="form-check-input" type="radio" name="exampleRadios" id="example3" value="3">
								  <label class="form-check-label" for="example3">홍보/불법 정보</label>
								</div>
								<div class="form-check">
								  <input class="form-check-input" type="radio" name="exampleRadios" id="example4" value="4">
								  <label class="form-check-label" for="example4">도배</label>
								</div>
								<div class="form-check">
								  <input class="form-check-input" type="radio" name="exampleRadios" id="example5" value="5">
								  <label class="form-check-label" for="example5">기타</label>
							   </div>
                              <label for="message-text" class="col-form-label">내용</label>
                              <textarea disabled class="form-control replyContent" id="replyReportContent" name="replyReportContent" maxlength="300" placeholder="기타 선택시 입력 가능합니다. (최대 300자)" style="resize: none;"></textarea>
                            </div>
                             <input type="hidden" name="replyNo" id="reportReplyNo" value="">
                             <input type="hidden" name="replyWriter" id="replySuspector" value="">
                             <input type="hidden" name="memberReporter" value="${loginMember.memberNo}">
                             <input type="hidden" name="reportCategory" value="">
                       </div>
                       <div class="modal-footer">
                         <button type="submit" class="btn" onclick="return report2();" style="background-color:#FFD938;">신고</button>
                         <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
                       </div>
                    </form>
                  </div>
                </div>
              </div>
     <%-- 댓글 신고 모달 끝  --%>
     
     <script>
	     $(function(){
			$(window).scroll(function(){
				  if ($(this).scrollTop()>100){
				    $('#top-btn').fadeIn();
				  } else {
				    $('#top-btn').fadeOut();
				  }
			});
		});
     	$("#communityReportBtn").click(function(){
			$("input[name='exampleRadios']").removeAttr('checked');
			$("#exampleRadios1").prop("checked",true);
			$("textarea[name=communityReportContent]").attr("disabled",true);
		});
     
     	$(document).on("click","input:radio[name=exampleRadios]",function(){
			if($("input[name=exampleRadios]:checked").val() == "5"){
				$("textarea[name=replyReportContent]").attr("disabled",false);
				$("textarea[name=communityReportContent]").attr("disabled",false);
			}else{
				$("textarea[name=replyReportContent]").attr("disabled",true);
				$("textarea[name=communityReportContent]").attr("disabled",true);
			}
		});
     
     	function report1(){
     		if($("input[name=exampleRadios]:checked").val() == "5" && $('#communityReportContent').val().length == 0){
   				alert("내용을 입력하세요.");
   				$('.reportContent').focus();
   				return false;
   			}
     		var $reportCategory = $("#communityModal").find("input[name=exampleRadios]:checked").val();
     		$("#communityModal").find("input[name=reportCategory]").val($reportCategory);
     	}
     	
     	function report2(){
     		if($("input[name=exampleRadios]:checked").val() == "5" && $('#replyReportContent').val().length == 0){
   				alert("내용을 입력하세요.");
   				$('.reportContent').focus();
   				return false;
   			}
     		var $reportCategory = $("#replyModal").find("input[name=exampleRadios]:checked").val();
     		$("#replyModal").find("input[name=reportCategory]").val($reportCategory);
     	}
     </script>
     
</body>
</html>