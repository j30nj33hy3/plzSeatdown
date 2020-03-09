<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>PLEASE SEATDOWN</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/review_show.css" />
	</head>
	<body class="homepage is-preload">
		<div id="page-wrapper">

			<jsp:include page="/WEB-INF/views/common/header.jsp"/>
			<jsp:include page="/WEB-INF/views/common/nav.jsp"/>

			<div class="container container-fluid">
				<div class="mt-5 mb-5 pt-3 page-title">
					<h3>리뷰 작성</h3>
				</div>

				<div class="row">
					<div class="col-md-12">
						<form role="form">
							<div class="form-group form-inline mb-7">
								<label for="showDate">관람일</label>
								<input type="date" id="showDate">
							</div>

							<div class="form-group form-inline mb-7">
								<label for="show">공연</label>
								<select id="theater" name="show">
									<option value="선택">선택1</option>
									<option value="선택">선택1</option>
									<option value="선택">선택1</option>
									<option value="선택">선택1</option>
									<option value="선택">선택1</option>
								</select>
							</div>
							
							<div class="form-group form-inline mb-7">
								<label for="theater">공연장</label>
								<select id="theater" name="theater">
									<option value="선택">선택1</option>
									<option value="선택">선택1</option>
									<option value="선택">선택1</option>
									<option value="선택">선택1</option>
									<option value="선택">선택1</option>
								</select>
							</div>

							<div class="form-group form-inline mb-7">
								<label for="section">층</label>
								<select id="section" name="theater">
									<option value="선택">선택1</option>
									<option value="선택">선택1</option>
									<option value="선택">선택1</option>
									<option value="선택">선택1</option>
									<option value="선택">선택1</option>
								</select>
							</div>

							<div class="form-group form-inline mb-7">
								<label for="column">열</label>
								<select id="column" name="theater">
									<option value="선택">선택1</option>
									<option value="선택">선택1</option>
									<option value="선택">선택1</option>
									<option value="선택">선택1</option>
									<option value="선택">선택1</option>
								</select>
							</div>

							<div class="form-group form-inline mb-7">
								<label for="num">번호</label>
								<select id="num" name="theater">
									<option value="선택">선택1</option>
									<option value="선택">선택1</option>
									<option value="선택">선택1</option>
									<option value="선택">선택1</option>
									<option value="선택">선택1</option>
								</select>
							</div>

							<div class="form-group form-inline mb-7">
								<label for="view">시야</label>
								<div id="view" class="star-rating">
									<i class="fas fa-star" id="view1" onclick="add1(this,1)"></i>
									<i class="fas fa-star" id="view2" onclick="add1(this,2)"></i>
									<i class="fas fa-star" id="view3" onclick="add1(this,3)"></i>
									<i class="far fa-star" id="view4" onclick="add1(this,4)"></i>
									<i class="far fa-star" id="view5" onclick="add1(this,5)"></i>
								</div>
							</div>

							<div class="form-group form-inline mb-7">
								<label for="comfort">편안함</label>
								<div id="comfort" class="star-rating">
									<i class="fas fa-star" id="com1" onclick="add2(this,1)"></i>
									<i class="fas fa-star" id="com2" onclick="add2(this,2)"></i>
									<i class="fas fa-star" id="com3" onclick="add2(this,3)"></i>
									<i class="far fa-star" id="com4" onclick="add2(this,4)"></i>
									<i class="far fa-star" id="com5" onclick="add2(this,5)"></i>
								</div>
							</div>

							<div class="form-group form-inline mb-7">
								<label for="legroom">좌석 간격</label>
								<div id="legroom" class="star-rating">
									<i class="fas fa-star" id="room1" onclick="add3(this,1)"></i>
									<i class="fas fa-star" id="room2" onclick="add3(this,2)"></i>
									<i class="fas fa-star" id="room3" onclick="add3(this,3)"></i>
									<i class="far fa-star" id="room4" onclick="add3(this,4)"></i>
									<i class="far fa-star" id="room5" onclick="add3(this,5)"></i>
								</div>
							</div>

							<div class="form-group form-inline mb-7">
								<label for="review">좌석 후기(선택)</label>
								<textarea></textarea>
							</div>
							
							<div class="form-group form-inline mb-7">
								<label for="exampleInputFile">
									좌석 사진(선택)
								</label>
								<div class="Img">
									<img id="seatImg">
								</div>
							</div>

							<div class="form-group form-inline mb-7">
								<label for="exampleInputFile">
									티켓 사진(선택)
								</label>
								<div class="Img">
									<img id="ticketImg">
								</div>
							</div>
							<!-- 파일 업로드 하는 부분 -->
							<div id="fileArea" style="display: none;">
								<input type="file" id="seatFile" name="seatFile" onchange="LoadSeat(this)"> 
								<input type="file" id="ticketFile" name="ticketFile" onchange="LoadTicket(this)"> 
							</div>
							
							
							<div class="form-group text-center pt-20">
								<button type="cancel" class="btn btn-primary">
									취소
								</button>
								<button type="submit" class="btn btn-primary">
									확인
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>

			<script>
				// STAR RATING
				function add1(ths, sno) {
					for (var i = 1; i <= 5; i++) {
						var cur = document.getElementById("view" + i)
						cur.className = "far fa-star"
					}
					for (var i = 1; i <= sno; i++) {
						var cur = document.getElementById("view" + i)
						if (cur.className == "far fa-star") {
							cur.className = "fas fa-star"
						}
					}
				}

				function add2(ths, sno) {
					for (var i = 1; i <= 5; i++) {
						var cur = document.getElementById("com" + i)
						cur.className = "far fa-star"
					}
					for (var i = 1; i <= sno; i++) {
						var cur = document.getElementById("com" + i)
						if (cur.className == "far fa-star") {
							cur.className = "fas fa-star"
						}
					}
				}

				function add3(ths, sno) {
					for (var i = 1; i <= 5; i++) {
						var cur = document.getElementById("room" + i)
						cur.className = "far fa-star"
					}
					for (var i = 1; i <= sno; i++) {
						var cur = document.getElementById("room" + i)
						if (cur.className == "far fa-star") {
							cur.className = "fas fa-star"
						}
					}
				}

				// 이미지 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
				$(function () {
					// 파일 선택 버튼이 있는 영역을 보이지 않게 함
					$("#fileArea").hide();
					
					// 이미지 영역 클릭 시 파일 첨부창 띄우기
					$("#seatImg").click(function(){
						$("#seatFile").click();
					});
					
					$("#ticketImg").click(function(){
						$("#ticketFile").click();
					});
				});

				// 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
				function LoadTicket(value) {
					
					if(value.files && value.files[0]){
						
						var reader = new FileReader(); 
						
						reader.onload = function(e){
							$("#ticketImg").prop("src", e.target.result);
						} 
						
						reader.readAsDataURL(value.files[0]);
					}
				}

				// 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
				function LoadSeat(value) {
					
					if(value.files && value.files[0]){
						
						var reader = new FileReader(); 
						
						reader.onload = function(e){
							$("#seatImg").prop("src", e.target.result);
						} 
						
						reader.readAsDataURL(value.files[0]);
					}
				}
			</script>

			<!-- Footer -->
			<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

			</div>

	</body>
</html>