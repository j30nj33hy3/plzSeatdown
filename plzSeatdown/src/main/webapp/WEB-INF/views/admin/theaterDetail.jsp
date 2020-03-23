<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/jquery.seat-charts.css">
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
	/* number 태그 화살표 제거 */
	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
		-webkit-appearance: none;
		margin: 0;
	}
</style>
<title>관리자페이지 - 좌석 관리</title>
<style>
#area {
	text-align: center;
}

.seat {
	display: inline-block;
	width: 15px;
	height: 15px;
	/* background-color: dodgerblue; */
	border-radius: 50%;
	margin: 0 3px;
}

.seatval{
	width : 50px;
}

.available {
	background-color: #917EC6;
}

.unavailable {
	background-color: white;
}
</style>
</head>
<body>
	<div id="main-wrapper">
		<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />
		<jsp:include page="/WEB-INF/views/admin/common/nav.jsp" />
		<div class="page-wrapper">
			<div class="page-breadcrumb">
	        	<div class="row">
	            	<div class="col-12 d-flex no-block align-items-center">
	                	<h3 class="page-title mt-3 ml-3">좌석 관리 - ${param.thNm}</h3>
	                </div>
	           	</div>
	        </div>
	         <div class="container-fluid">
	                <!-- ============================================================== -->
	                <!-- Start Page Content -->
	                <!-- ============================================================== -->
	         	<div class="row mb-4">    
	            	<div class="col-md-12 text-right">
	            		<form action="seat/insertSeat" method="get">
	            		<c:set var="thCode" value="${param.thCode }"></c:set>
		            		<label for="idtime">공연 ID</label>
		            		<input type="number" id="idtime" name="idtime" size="10">
		            		<label for="block">블록</label>
		            		<input type="number" id="block" name="block" size="2">
		                    <input type="hidden" id="thCode" name="thCode" value="${thCode}">
		                    <button type="submit" class="btn btn-default" id="seatBtn">
		                        	좌석 추가
		                	</button>
	            		</form>
	               	</div>
	            </div>
			</div>
		</div>
	</div>
</body>
</html>