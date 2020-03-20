<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/jquery.seat-charts.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js" type="text/javascript"></script>
	<script src="${contextPath}/resources/js/admin/jquery.gridly.js" type="text/javascript"></script>
	<link href="${contextPath}/resources/css/jquery.gridly.css" rel="stylesheet" type="text/css"/>
<meta charset="UTF-8">
<title>관리자페이지 - 공연장 추가</title>
<style>		
		.wrapper {
			width: 100%;
			text-align: center;
			margin-top: 150px;
		}
		div.seatCharts-cell {
			color: #182C4E;
			height: 20px;
			width: 20px;
			line-height: 25px;
			font-size: 0px;
        }
        div.container{
            width : 1120px;
            max-width: none !important;
        }
		div.seatCharts-seat {
			color: #FFFFFF;
			cursor: pointer;
		}
		div.seatCharts-row {
			height: 50px;
		}
		div.seatCharts-seat.available {
			background-color: black;
		}
		div.seatCharts-seat.focused {
			background-color: #7460ee;
		}
		div.seatCharts-seat.selected {
			background-color: #7460ee;
		}
		div.seatCharts-seat.unavailable {
			background-color: red;
        }
        .btnrow{
            position : relative;
            margin: auto;
            left : 940px;
        }
        .btnfloor{
            position : relative;
            margin: auto;
            left : 940px;
        }
</style>
</head>

<body>
    <div id="main-wrapper">
    		<jsp:include page="/WEB-INF/views/admin/common/header.jsp"/>
			<jsp:include page="/WEB-INF/views/admin/common/nav.jsp"/>	
        <div class="page-wrapper">
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h3 class="page-title mt-3 ml-3 mb-3">공연장추가</h3>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="container">
                    <div class="btnArea">
                        <button type="button" class="btn btn-primary btnrow disabled">열추가</button>&nbsp;
                        <button type="button" class="btn btn-primary btnfloor disabled">층추가</button>
                    </div>
                    <div id="seat-map">
                    
                    </div>
                </div>
            </div>
        </div>
        
        <script>
		var firstSeatLabel = 1;

		$(document).ready(function () {
			var $cart = $('#selected-seats'),
				$counter = $('#counter'),
				sc = $('#seat-map').seatCharts({
					map: [ // 12 15 12 
						'eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee',
						'eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee',
					],

					click: function () {
						if (this.status() == 'available') {	
							return 'selected';
						} else {
							return this.style();
						}
					}
				});
		});
        </script>
        <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
        <script src="${contextPath}/resources/js/admin/jquery.seat-charts.js"></script>
    </div>
</body>
</html>