<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>PLEASE SEATDOWN</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${contextPath}/resources/css/review_write.css" />
		<style>
			.ui-datepicker-trigger{cursor: pointer;}
			.hasDatepicker{cursor: pointer;}
		</style>
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
						<form role="form" action="writeReview" enctype="multipart/form-data" method="POST" onsubmit="return validate();">
							<div class="form-group form-inline mb-7">
								<label for="showDate">관람일</label>
								<input type="text" id="showDate" name="reviewViewDate" class="reviewText" autocomplete="off" required>
							</div>
							<div class="form-group form-inline mb-7">
								<label for="theater">공연장</label>
								<input type="text" id="theater" class="reviewText" name="thName" list="theaterList" placeholder="공연장을 선택해주세요." size="40" autocomplete="off" required/>
								<c:if test="${!empty tList}">
									<datalist id="theaterList">
											<c:forEach var="th" items="${tList}" varStatus="vs">
												<option value="${th.thNm}">${th.thNm}</option>
											</c:forEach>
									</datalist>
								</c:if>
							</div>
							<div class="form-group form-inline mb-7">
								<label for="showList">공연</label>
								<select id="showList" name="showCode">
									<option value="0" disabled>관람일과 공연장을 먼저 선택해주세요.</option>
								</select>
							</div>

							<div class="form-group form-inline mb-7">
								<label for="floorList">층</label>
								<select id="floorList" name="seatFloor">
									<option value="0" disabled selected>공연장을 먼저 선택해주세요.</option>
								</select>
							</div>

							<div class="form-group form-inline mb-7">
								<label for="areaList">구역</label>
								<select id="areaList" name="seatArea">
									<option value="0" disabled selected>구역 선택</option>
								</select>
							</div>
							
							<div class="form-group form-inline mb-7">
								<label for="rowList">열</label>
								<select id="rowList" name="seatRow">
									<option value="0" disabled selected>열 선택</option>
								</select>
							</div>

							<div class="form-group form-inline mb-7">
								<label for="colList">번호</label>
								<select id="colList" name="seatCol">
									<option value="0" disabled selected>번호 선택</option>
								</select>
							</div>
							<input type="hidden" id="seatCode" name="seatCode">
							
							<div class="form-group form-inline mb-7">
								<label for="view">시야</label>
								<div id="view" class="star-rating">
									<i class="fas fa-star" id="view1" onclick="add1(this,1)"></i>
									<i class="far fa-star" id="view2" onclick="add1(this,2)"></i>
									<i class="far fa-star" id="view3" onclick="add1(this,3)"></i>
									<i class="far fa-star" id="view4" onclick="add1(this,4)"></i>
									<i class="far fa-star" id="view5" onclick="add1(this,5)"></i>
								</div>
							</div>
							<input type="hidden" id="rView" name="reviewSight" value="1" required>

							<div class="form-group form-inline mb-7">
								<label for="comfort">편안함</label>
								<div id="comfort" class="star-rating">
									<i class="fas fa-star" id="com1" onclick="add2(this,1)"></i>
									<i class="far fa-star" id="com2" onclick="add2(this,2)"></i>
									<i class="far fa-star" id="com3" onclick="add2(this,3)"></i>
									<i class="far fa-star" id="com4" onclick="add2(this,4)"></i>
									<i class="far fa-star" id="com5" onclick="add2(this,5)"></i>
								</div>
							</div>
							<input type="hidden" id="rComfort" name="reviewComfort" value="1" required>

							<div class="form-group form-inline mb-7">
								<label for="legroom">좌석 간격</label>
								<div id="legroom" class="star-rating">
									<i class="fas fa-star" id="room1" onclick="add3(this,1)"></i>
									<i class="far fa-star" id="room2" onclick="add3(this,2)"></i>
									<i class="far fa-star" id="room3" onclick="add3(this,3)"></i>
									<i class="far fa-star" id="room4" onclick="add3(this,4)"></i>
									<i class="far fa-star" id="room5" onclick="add3(this,5)"></i>
								</div>
							</div>
							<input type="hidden" id="rLegroom" name="reviewLegroom" value="1" required>
							<div class="form-group form-inline mb-7">
								<label for="review">좌석 후기(선택)</label>
								<textarea id="reviewComment" name="reviewComment"></textarea>
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
								<a id="cancelBtn" href="${header.referer}" class="btn btn-primary">
									취소
								</a>
								<button type="submit" class="btn btn-primary">
									확인
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>

			<script>
				var reviewCheck = {
					"seatFloor":false,
					"seatArea":false,
					"seatRow":false,
					"seatCol":false
				}
				
				function validate(){
					for(var key in reviewCheck){
						if(!reviewCheck[key]){
							alert("필수 입력 정보를 작성해주세요");
							var id = "#"+key;
							$(id).focus();
							return false;
						}
					}
				}
				
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
					var count = $("#view i[class='fas fa-star']").length;
					$("#rView").val(count);
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
					var count = $("#comfort i[class='fas fa-star']").length;
					$("#rComfort").val(count);
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
					var count = $("#legroom i[class='fas fa-star']").length;
					$("#rLegroom").val(count);
				}

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
					
					// 관람일, 공연장 선택 시 공연 목록 조회
					$("#showDate").change(function(){
			        	var dt = $("#showDate").val();
						var th = $("#theater").val();
						var sh = $("#showList");
						var op = $("<option>")
						sh.children("option").remove();
						if(dt != null && th != null){
							$.ajax({
								url: "selectShowList",
								type: "POST",
								data: {
									"showDt" : dt,
									"theater" : th
								},
								dataType:"json",
								success: function(sList){
									if(sList == ""){
										op.prop("disabled", true).prop("selected", true).html("선택 가능한 공연이 없습니다.");
										sh.append(op);
									}else{
										$.each(sList, function(i){
											op.val(sList[i].showCode).html(sList[i].showTitle);
											sh.append(op);
										});
									}
								},
								error: function(e){
									console.log("ajax 통신 실패");
									console.log(e);
								}
							});
						}
					});
					$("#theater").change(function(){
			        	var dt = $("#showDate").val();
						var th = $("#theater").val();
						var op = $("<option>");
						var sh = $("#showList");
						sh.children("option").remove();
						if(dt != null && th != null){
							$.ajax({
								url: "selectShowList",
								type: "POST",
								data: {
									"showDt" : dt,
									"theater" : th
								},
								dataType:"json",
								success: function(sList){
									if(sList == ""){
										op.prop("disabled", true).prop("selected", true).html("선택 가능한 공연이 없습니다.");
										sh.append(op);
									}else{
										$.each(sList, function(i){
											var option = "<option value="+sList[i].showCode+">"+sList[i].showTitle+"</option>"
											sh.append(option);
										});
									}
								},
								error: function(e){
									console.log("ajax 통신 실패");
									console.log(e);
								}
							});
						}
					});
					
					$("#theater").change(function(){
						var th = $("#theater").val();
						var op = $("<option>");
						
						/* 좌석 관련 변수 */
						var fl = $("#floorList");
						$.ajax({
							url: "selectSeatFloor",
							type: "POST",
							data: {
								"theater": th
							},
							dataType:"json",
							success: function(fList){
								fl.children("option").remove();
								if(fList == ""){
									op.prop("disabled", true).prop("selected", true).html("선택 가능한 층이 없습니다.");
									fl.append(op);
								}else{
									op.prop("disabled", true).prop("selected", true).html("층을 선택해주세요.");
									fl.append(op);
									$.each(fList, function(i){
										var option = "<option value="+fList[i].seatFloor+">"+fList[i].seatFloor+"층</option>";
										fl.append(option);
									});
								}
							},
							error: function(e){
								console.log("ajax 통신 실패");
								console.log(e);
							}
						});
					});
					
					$("#floorList").change(function(){
						var th = $("#theater").val();
						var ar = $("#areaList");
						var row = $("#rowList");
						var fl = $("#floorList option:selected").val();
						var op = $("<option>");
						var rop = $("<option>");
						if(fl != "0"){
							reviewCheck.seatFloor = true;
						}
						$.ajax({
							url: "selectSeatArea",
							type: "POST",
							data:{
								"theater": th,
								"seatFloor": fl
							},
							dataType: "json",
							success: function(aList){
								ar.children("option").remove();
								if(aList != ""){
									op.prop("disabled", true).prop("selected", true).html("구역을 선택해주세요.").val("0");
									ar.append(op);
									$.each(aList, function(i){
										var option = "<option value="+aList[i].seatArea+">"+aList[i].seatArea+"구역</option>";
										ar.append(option);
									});
								}else{
									op.prop("disabled", true).prop("selected", true).html("선택 가능한 구역이 없습니다.").val("-1");
									ar.append(op);
								}
								
								if($("#areaList option:selected").val() < 0){
									reviewCheck.seatArea = true;
									$.ajax({
										url: "selectSeatRow1",
										type: "POST",
										data:{
											"theater": th,
											"seatFloor": fl
										},
										dataType: "json",
										success: function(rList){
											row.children("option").remove();
											if(rList == ""){
												rop.prop("disabled", true).prop("selected", true).html("선택 가능한 열이 없습니다.");
												row.append(rop);
											}else{
												rop.prop("disabled", true).prop("selected", true).html("열을 선택해주세요.");
												row.append(rop);
												$.each(rList, function(i){
													var roption = "<option value="+rList[i].seatRow+">"+rList[i].seatRow+"열</option>";
													row.append(roption);
												});
											}
										},
										error: function(e){
											console.log("ajax 통신 실패");
											console.log(e);
										}
									});
								}
							},
							error: function(e){
								console.log("ajax 통신 실패");
								console.log(e);
							}
						});
					});
					
					$("#areaList").change(function(){
						var th = $("#theater").val();
						var fl = $("#floorList option:selected").val();
						var al = $("#areaList option:selected").val();
						var row = $("#rowList");
						var op = $("<option>");
						if(al != "0"){
							reviewCheck.seatArea = true;
						}
						$.ajax({
							url: "selectSeatRow2",
							type: "POST",
							data:{
								"theater": th,
								"seatFloor": fl,
								"seatArea": al
							},
							dataType: "json",
							success: function(rList){
								row.children("option").remove();
								if(rList == ""){
									op.prop("disabled", true).prop("selected", true).html("선택 가능한 열이 없습니다.");
									row.append(op);
								}else{
									op.prop("disabled", true).prop("selected", true).html("열을 선택해주세요.");
									row.append(op);
									$.each(rList, function(i){
										var option = "<option value="+rList[i].seatRow+">"+rList[i].seatRow+"열</option>";
										row.append(option);
									});
								}
							},
							error: function(e){
								console.log("ajax 통신 실패");
								console.log(e);
							}
						});
					});
					
					$("#rowList").change(function(){
						var th = $("#theater").val();
						var op = $("<option>");
						var col = $("#colList");
						var fl = $("#floorList option:selected").val();
						var al = $("#areaList option:selected").val();
						var rl = $("#rowList option:selected").val();
						if(rl != "0"){
							reviewCheck.seatRow = true;
						}
						$.ajax({
							url: "selectSeatCol",
							type: "POST",
							data:{
								"theater": th,
								"seatFloor": fl,
								"seatArea": al,
								"seatRow": rl
							},
							dataType:"json",
							success: function(cList){
								col.children("option").remove();
								if(cList == ""){
									op.prop("disabled", true).prop("selected", true).html("선택 가능한 번호가 없습니다.");
									col.append(op);
								}else{
									op.prop("disabled", true).prop("selected", true).html("번호를 선택해주세요.");
									col.append(op);
									$.each(cList, function(i){
										var option = "<option value="+cList[i].seatCol+">"+cList[i].seatCol+"번</option>";
										col.append(option);
									});
								}
								
							},
							error: function(e){
								console.log("ajax 통신 실패");
								console.log(e);
							}
						});
					});
					
					$("#colList").change(function(){
						var th = $("#theater").val();
						var op = $("<option>");
						var col = $("#colList");
						var fl = $("#floorList option:selected").val();
						var al = $("#areaList option:selected").val();
						var rl = $("#rowList option:selected").val();
						var cl = $("#colList option:selected").val();
						if(cl != "0"){
							reviewCheck.seatCol = true;
						}
						var seatCode = $("#seatCode");
						$.ajax({
							url: "selectSeatCode",
							type: "POST",
							data:{
								"theater": th,
								"seatFloor": fl,
								"seatArea": al,
								"seatRow": rl,
								"seatCol": cl
							},
							dataType:"json",
							success: function(result){
								seatCode.val(result);
								console.log(seatCode.val());
							},
							error: function(e){
								console.log("ajax 통신 실패");
								console.log(e);
							}
						});
					});
					
					
					// 관람일 달력 datepicker
					$("#showDate").datepicker({
			            dateFormat: 'yy-mm-dd' //Input Display Format 변경
			            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
			            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
			            ,changeYear: true //콤보박스에서 년 선택 가능
			            ,changeMonth: true //콤보박스에서 월 선택 가능                
			            ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
			            ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
			            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
			            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
			            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
			            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
			            ,minDate: "-9Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
			        	,maxDate: "today" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
			    	});
					 
					//초기값을 오늘 날짜로 설정
			        $('#datepicker').datepicker('setDate', 'today');
				});
				
			</script>
			<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
			<!-- Footer -->
			<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

			</div>
			
	</body>
</html>