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
<title>관리자페이지 - 공연 추가</title>
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
	<div id=main-wrapper>
		<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />
		<jsp:include page="/WEB-INF/views/admin/common/nav.jsp" />
		<div class="page-wrapper">
			<div class="page-breadcrumb">
				<div class="row">
					<div class="col-12 d-flex no-block align-items-center">
						<h3 class="page-title mt-3 ml-3 mb-3">공연장 추가</h3>
						<div class="ml-auto text-right">
							<nav aria-label="breadcrumb"></nav>
						</div>
					</div>
				</div>
			</div>
			
			<div class="container-fluid">
				<label for="rowCount" class="col-form-label">행 크기 : </label> <input type="number" id="rowCount" class = "seatval">&nbsp; 
				<label for="pCol" class="col-form-label">열 크기 : </label> <input type="number" id="pCol" class = "seatval">&nbsp;&nbsp;
				<button id="create-seat-chart" class="btn btn-primary">객석 추가</button>&nbsp;
				<button id="create-seat-floor" class="btn btn-primary">층 추가</button>&nbsp;
				<button id="seat-clear" class="btn btn-primary">초기화</button><br><br>
				
				<input type="number" id="colDelete" class = "seatval"><label for="pCol" class="col-form-label">열 </label>
				<button id="col-clear" class="btn btn-primary">삭제</button><br><br>
				<div class="card">
					<div id="area"></div>
				</div>
		<script>
        var seatArr = {};

        // 좌석 생성 함수
        function createSeat(){
            var rowCount = $("#rowCount").val();
            var pCol = $("#pCol").val();

            var $area = $("#area");
            $area.html("");  // 기존 좌석 배치 영역 초기화
            seatArr = {};    // 좌석 정보 객체 초기화

            // 좌석 생성 수 "seat" class 부여
            var $seat = $("<span>").addClass("seat");

            // 좌석 객체 생성
            if(Object.keys(seatArr).length == 0){ // seatArr이 비어있을 경우(처음 좌석 생성 시)
                for (var i = 0; i < rowCount; i++) {
                    seatArr[i] ="";
                    for (var j = 0; j < pCol; j++) {
                        seatArr[i] += "e";
                    }
                }
            }

            for (var i = 0; i < Object.keys(seatArr).length; i++) {
                // Object.keys(seatArr).length // 객체 길이를 구함.

                // 행(row) 생성 + id 부여
                var $row = $("<div>");
                $row.prop("id", "row_" + (i+1));

                // 열(좌석, col) 생성 + id 부여
                var pCol = 1;
                for (var j = 0; j < seatArr[i].length; j++) {
                    var $seat = $("<span>").addClass("seat");

                    $seat.prop("id", (i+1) + "_" + (pCol++));
                    $seat.addClass("available");                    
                    $row.append($seat);
                }
                $area.append($row);
            }
        }


        $("#create-seat-chart").on("click", function () {
            createSeat();
        });
        
        // 초기화 버튼 클릭 시 행,열 입력값과 좌석 정보 객체 초기화
        $("#seat-clear").on("click", function () {
            var $area = $("#area");
            $area.html("");
            seatArr = {};
        	$(".seatval").val('');
        });
        
        
        // 열 삭제시 해당 열 모두 삭제 
        $("#col-clear").on("click", function(){  
        	var $area = $("#area");
        	var $seat = $(".seat");   
        	var colDelete = $("#colDelete").val();
        	var rowVal = $("#rowCount").val();
        	var colVal = $("#pCol").val();
        	
        	var eqVal = colDelete-1;   	
        	var rowx = Number(rowVal)+1; 
        	
        	for(var i = 1 ; i <rowx ; i++){
	        	var value = i * colVal-(colVal-eqVal);
	        	
	        	var cols = $seat.eq(value);
	        	cols.removeClass("available");
	        	cols.addClass("unavailable"); 	                	
        	}     	
	        	
				console.log($("[class*=unavailable]"));
				console.log(seatArr);
        });
        
        

   //----------------------------------------------------------------------     
        
        
        
        
        
        
        $(document).on("click", ".seat", function(){
            //if($(this).is(".available")){ // 선택한 좌석에 available클래스가 있을 경우

            // 현재 선택한 좌석이 해당 행의 몇번째 인덱스인지 검사.
            var index = $(this).index();
            //console.log("현재 선택한 좌석이 해당 행의 몇번째 인덱스 인가? : " + index);
            //console.log("$(this).parent().index() : " + $(this).parent().index());

            // 현재 선택한 좌석의 row 구하기
            var rowNum = $(this).parent().index();       

            // 현재 선택한 좌석이 포함된 행의 정보를 좌석 정보 객체에서 얻어옴
            var row = seatArr[rowNum]; // ex) eeeee, eee_e
            

            var changeSeat;
            // 선택한 좌석에 available클래스가 있을 경우(활성화된 좌석이라면)
            if($(this).is(".available"))    changeSeat = "_"; // 비활성으로 변경
            else                            changeSeat = "e";


            // 좌석 정보 객체에서 변경된 정보를 반영
            var chageRow ="";
            for(var i=0 ; i<row.length ; i++){
                if(i == index){
                    if($(this).is(".available"))    chageRow += "_";
                    else                            chageRow += "e";
                }  
                else            chageRow += seatArr[rowNum].charAt(i);
            }
            seatArr[rowNum] = chageRow;

            
            // 이미 좌석 배치 영역에 작성된 요소들의 속성값 변경
            var $area = $("#area");

            var pRow = 1;
            for (var i = 0; i < Object.keys(seatArr).length; i++) {
                // Object.keys(seatArr).length // 객체 길이(== 행의 길이)를 구함.

                // 행(row) 선택
                var $row = $area.children("div").eq(i);

                // 현재 접근한 행에 활성화된 좌석이 있을 경우 행 id 지정
                if(seatArr[i].indexOf("e") != -1){
                    $row.prop("id", "row_"+pRow);
                }else{
                    $row.removeAttr("id");
                }

                
                // 행 번호 생성용 변수
                var pCol = 1;
                for (var j = 0; j < seatArr[i].length; j++) {
                    var $col = $row.children("span").eq(j);

                    if(seatArr[i].charAt(j) == "e"){
                        //console.log("e : " + (pRow) + "_" + (pCol));
                        $col.prop("id", (pRow) + "_" + (pCol++));
                        $col.removeClass("unavailable");
                        $col.addClass("available");
                        
                    }else{
                        $col.removeAttr("id");
                        $col.removeClass("available");
                        $col.addClass("unavailable");
                    }
                }

                // 현재 접근한 행에 활성화된 좌석이 있을 경우 행 번호 증가
                if(seatArr[i].indexOf("e") != -1){
                    pRow++;
                }
            }          
        });
        
        // 열 삭제 버튼 클릭 시 해당 열 좌석 삭제 
            // 테스트 하던 것
             /*$("#create-seat-chart").on("click",function(){
            var rowCount = $("#rowCount").val();
            var colCount = $("#colCount").val();
            
            var $area = $("#area");

            $area.html("");

            var $seat = $("<span>").addClass("seat");

            for(var i=1 ; i <= rowCount ; i++){

                var $row = $("<div>");
                $row.prop("id", "row_" + i);

                for(var j=1 ; j <= colCount ; j++){
                    console.log(i + "_" + j);

                    var $seat = $("<span>").addClass("seat");
                    $seat.prop("id",i + "_" + j);
                    $row.append($seat);
                }
                $area.append($row);
            }
        });*/

    </script>
			</div>
		</div>
	</div>
</body>
</html>