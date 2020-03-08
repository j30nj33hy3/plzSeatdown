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
	                <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="${contextPath}/admin/index" aria-expanded="false"><i class="fas fa-home"></i><span class="hide-menu">Dashboard</span></a></li>
	                <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-face"></i><span class="hide-menu">회원 관리</span></a>
	                    <ul aria-expanded="false" class="collapse first-level">                               
	                        <li class="sidebar-item"><a href="${contextPath}/admin/member_list" class="sidebar-link"><i class="mdi mdi-note-outline"></i><span class="hide-menu"> 회원 목록 </span></a></li>
	                        <li class="sidebar-item"><a href="${contextPath}/admin/member_qna" class="sidebar-link"><i class="mdi mdi-note-plus"></i><span class="hide-menu"> 회원 문의 </span></a></li>
	                    </ul>
	                </li>
	                <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="${contextPath}/admin/theater" aria-expanded="false"><i class="mdi mdi-theater"></i><span class="hide-menu">공연장 관리</span></a></li>
	                <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="${contextPath}/admin/show" aria-expanded="false"><i class="fas fa-ticket-alt"></i><span class="hide-menu">공연 관리</span></a></li>
	                <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="${contextPath}/admin/review" aria-expanded="false"><i class="fas fa-pencil-alt"></i><span class="hide-menu">리뷰 관리</span></a></li>
	                <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="${contextPath}/admin/community" aria-expanded="false"><i class="fas fa-users"></i><span class="hide-menu">커뮤니티 관리</span></a></li>
	                <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="${contextPath}/admin/notice" aria-expanded="false"><i class="fas fa-bell"></i><span class="hide-menu">공지사항 관리</span></a></li>
	                <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false">
	                    <i class="fas fa-exclamation-triangle"></i><span class="hide-menu"> 신고 관리 </span></a>
	                    <ul aria-expanded="false" class="collapse  first-level">
	                        <li class="sidebar-item"><a href="${contextPath}/admin/review_report" class="sidebar-link"><i class="mdi mdi-emoticon"></i><span class="hide-menu"> 리뷰 신고 </span></a></li>
	                        <li class="sidebar-item"><a href="${contextPath}/admin/com_report" class="sidebar-link"><i class="mdi mdi-emoticon-cool"></i><span class="hide-menu"> 커뮤니티 글 신고 </span></a></li>
	                        <li class="sidebar-item"><a href="${contextPath}/admin/reply_report" class="sidebar-link"><i class="mdi mdi-emoticon-cool"></i><span class="hide-menu"> 커뮤니티 댓글 신고 </span></a></li>
	                    </ul>
	                </li>
	            </ul>
	        </nav>
	    </div>
	</aside>
</body>
</html>