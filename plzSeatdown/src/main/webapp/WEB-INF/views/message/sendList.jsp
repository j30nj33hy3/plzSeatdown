<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지함</title>
<link rel="stylesheet" href="${contextPath}/resources/css/mypage_mycommu.css"/>
<link rel="stylesheet" href="${contextPath}/resources/css/multicheck_msg.css"/>
<link rel="stylesheet" href="${contextPath}/resources/js/datatable-checkbox-init.js"/>
<link rel="stylesheet" href="${contextPath}/resources/js/jquery.multicheck.js"/>
<style>

.ellip{
   margin: 0;
   margin: auto;
   width: 200px;
   height: 1.5em;
   overflow: hidden;
   text-overflow: ellipsis;
   white-space: nowrap;
}

#checkHead{
	vertical-align : super;
}

#allDel{
	position : absolute;
	left: 35px;
	top : -10px;
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
						<h4><a href="#">쪽지함</a></h4>
							<ul>
								<li><a href="${contextPath}/message/receiveList">받은 쪽지</a></li>
								<li><a href="${contextPath}/message/sendList">보낸 쪽지</a></li>
							</ul>
						</div>
						
						
						<div class="col-10 col-12-mobile imp-mobile" id="content">
							<div class="mb-2 ml-2">
							<span class="mr-2"></span>
							<span></span>
							</div>
						
							<table id="list-table" class="table" style="margin-left:20px;">
								<thead style="   padding : 0.5em; font-weight: bold; color:rgb(163, 99, 189); border-color: rgb(198, 180, 205); border-bottom: 0px;">
								  <tr>
								  	<th scope="col" style="border-bottom:0px;">  
                                         <label class="customcheckbox">
                                             <input type="checkbox" class="listCheckbox" />
                                             <span class="checkmark"></span>
                                         </label>
                                   </th>
								  	<th scope="col" style="border-bottom:0px;">받는사람</th>
									<th scope="col" style="border-bottom:0px;">내용</th>
									<!-- <th scope="col" style="border-bottom:0px;">내용</th> -->
									<th scope="col" style="border-bottom:0px;">날짜</th>
								  </tr>
								</thead>
								<tbody>
								<c:if test="${empty sList}">
										<tr>
											<td colspan="5">보낸 쪽지가 없습니다.</td>
										</tr>
								</c:if>
								<c:if test="${!empty sList}">
									<c:forEach var="msg" items="${sList}" varStatus="vs">
										<tr>
											<input type="hidden" name="messageNo"
												value="${msg.messageNo}" />
											<td style="border-top: 0px; padding-top: 22px;">
											 <label class="customcheckbox m-b-20">
                                                 <input type="checkbox" id="mainCheckbox" />
                                                  <span class="checkmark"></span>
                                             </label>										
											</td>
											<%-- <td style="border-top:0px; padding-top:22px;">${msg.messageNo}</td> --%>
											<td style="border-top:0px; padding-top:22px;">${msg.receiverNickname }</td>
											<td class="msgContent" id="${msg.messageNo}"
											style="border-top: 0px; padding-top: 22px;">
											<p class="ellip" id="ellip1">${msg.messageContent}</p>
										</td>


											<%-- <td class="contentwrap" style="border-top:0px;  height:40px; padding-top:17px;">${community.communityContent}</td> --%>
											<td style="border-top:0px; padding-top:22px;">${msg.messageDate}</td>
										</tr>
									</c:forEach>
								</c:if>
								</tbody>
							  </table>
							   <!-- 페이징바 -->
           					 <div class="col-md-12 d-flex justify-content-center">
	         				   <ul class="pagination pagination-info">
	            				<c:if test="${pInf.currentPage > 1}">
	                			<li class="page-item">
	                				<!-- 맨 처음으로(<<) -->
	                    			<a class="page-link" href="
	                    			<c:url value="reply"> 
	                    				<c:param name="currentPage" value="1"/>
	                    			</c:url>
	                    			">&lt;&lt;</a>
	                			</li>
	                
	                			<li class="page-item">
	                				<!-- 이전으로(<) -->
                   					<a class="page-link" href="
                   					<c:url value="reply">
                   					<c:param name="currentPage" value="${pInf.currentPage-1}"/>
                   					</c:url>
                   					">&lt;</a>
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
	                    					<c:url value="reply">
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
	                			    	<c:url value="reply">
	                			    		<c:param name="currentPage" value="${pInf.currentPage+1}"/>
	                			    	</c:url>
	                			    ">&gt;</a>
	                			</li>
	                
	               			 <!-- 맨 끝으로(>>) -->
	              			  <li class="page-item">
	                   			 <a class="page-link" href="
	                   			 	<c:url value="reply">
	                   			 		<c:param name="currentPage" value="${pInf.maxPage}"/>
	                   			 	</c:url>
	                   			 ">&gt;&gt;</a>
	               			 </li>
	               			 </c:if>
	        			    </ul>
							  </div>
						</div>
					</div>
				</div>
			</div>			
		<script>
		// 쪽지 보기 
 		$(function() {
			$(".msgContent").click(function() {
				var messageNo = $(this).prop("id");
				<c:url var="detailUrl" value="sendDetail">
				<c:param name="currentPage" value="${pInf.currentPage}"/>
				</c:url>
				window.open("${detailUrl}&no=" + messageNo, "쪽지 확인하기", "width=500, height=600, toolbar=no, menubar=no, scrollbars=no, resizable=no");
			});
		});  
		</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>