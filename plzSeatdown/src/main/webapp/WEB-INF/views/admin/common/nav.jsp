<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<aside class="left-sidebar" data-sidebarbg="skin5">
	    <div class="scroll-sidebar">       
	        <nav class="sidebar-nav">
	            <ul id="sidebarnav" class="p-t-30">
	                <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="fas fa-user"></i><span class="hide-menu pl-3">회원 관리</span></a>
	                    <ul aria-expanded="false" class="collapse first-level">                               
   	                        <li class="sidebar-item"><a href="${contextPath}/admin/member/list" class="sidebar-link"><i class="far fa-address-book"></i><span class="hide-menu"> 회원 목록 </span></a></li>
	                        <li class="sidebar-item"><a href="${contextPath}/admin/qna/list" class="sidebar-link"><i class="far fa-question-circle"></i><span class="hide-menu"> 회원 문의 </span></a></li>
						</ul>
	                </li>
	                <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="${contextPath}/admin/theater/list" aria-expanded="false"><i class="fas fa-map-marked-alt"></i><span class="hide-menu pl-3">공연장 관리</span></a></li>
	                <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="${contextPath}/admin/show/list" aria-expanded="false"><i class="fas fa-ticket-alt"></i><span class="hide-menu pl-3">공연 관리</span></a></li>
	                <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="${contextPath}/admin/review/list" aria-expanded="false"><i class="fas fa-pencil-alt"></i><span class="hide-menu pl-3">리뷰 관리</span></a></li>
	                <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="${contextPath}/admin/community/list" aria-expanded="false"><i class="fas fa-users"></i><span class="hide-menu pl-3">커뮤니티 관리</span></a></li>
   	                <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="${contextPath}/admin/notice/list" aria-expanded="false"><i class="fas fa-bell"></i><span class="hide-menu pl-3">공지사항 관리</span></a></li>
   	                <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false">
	                    <i class="fas fa-exclamation-triangle"></i><span class="hide-menu pl-3"> 신고 관리 </span></a>
	                    <ul aria-expanded="false" class="collapse  first-level">
	                        <li class="sidebar-item"><a href="${contextPath}/admin/review_report/list" class="sidebar-link"><i class="fas fa-flag"></i><span class="hide-menu"> 리뷰 신고 </span></a></li>
	                        <li class="sidebar-item"><a href="${contextPath}/admin/comm_report/list" class="sidebar-link"><i class="fas fa-flag"></i><span class="hide-menu"> 커뮤니티 글 신고 </span></a></li>
	                        <li class="sidebar-item"><a href="${contextPath}/admin/reply_report/list" class="sidebar-link"><i class="fas fa-flag"></i><span class="hide-menu"> 커뮤니티 댓글 신고 </span></a></li>
	                    </ul>
	                </li>
	            </ul>
	        </nav>
	    </div>
	</aside>
</body>
</html>