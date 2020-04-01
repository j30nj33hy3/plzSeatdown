<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${contextPath}/resources/css/boardcss.css" />

<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
    integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
    integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
    crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
    integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
    crossorigin="anonymous"></script>
    
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-bs4.min.js"></script> -->

<style>
    #insertBtn{
        background-color:#FFD938;
        border-color:#FFD938;
        color:#555;
    }
</style>
<title>PLEASE SEATDOWN</title>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>
	<jsp:include page="../common/nav.jsp"/>

    <!-- Main -->
    <div class="container py-5 my-5">
        
        <form action="update?no=${community.communityNo}" name="insertForm" method="post" enctype="multipart/form-data" onsubmit="return validate();">
            <div class="row">
                <div class="col-lg-1">
                    <span>카테고리</span>
                </div>
                <select name="categoryCode" id="category" class="form-control ml-3" style="width:150px; display: inline-block;">
                    <option value="1">자유</option>
                    <option value="2">양도</option>
                    <option value="3">질문</option>
                    <option value="4">공연 후기</option>
                </select>
            </div>
            <script>
            	$.each($("#category>option"), function(index, item){
            		if($(item).val() == "${community.categoryCode}"){
            			$(item).prop("selected", "true");
            		}
            	})
            </script>
            <div class="row py-3">
                <div class="col-lg-1">
                    <span>제목</span>
                </div>
                <div class="col-lg-8">
                    <input type="text" id="title" name="communityTitle" class="form-control" size="35" maxlength="30" value="${community.communityTitle}" required>
                </div>
            </div>
            <input type="hidden" name="communityWriter" value="${community.communityWriter}">
            <textarea id="summernote" name="communityContent" required>${community.communityContent}</textarea>
            <!-- 등록된 이미지 목록 -->
            <input type="hidden" name="imgList" value="">
            
            <div class="py-5 text-center">
                <button id="insertBtn" type="submit" class="btn px-5 mr-3">수정</button>
                <a href="${header.referer}" type="button" class="btn px-5 btn-outline-secondary">취소</a>
            </div>
        </form>
        
    </div>

    <script>
        $('#summernote').summernote({
            tabsize: 2,
            minHeight: 500
        });

     	// 유효성 검사
		function validate(){
			if($("#summernote").val().trim().length == 0){
				alert("내용을 입력해 주세요.");
				$("#summernote").focus();
				return false;
			}
			
			if($("#title").val().trim().length == 0){
				alert("제목을 입력해 주세요.");
				$("#title").focus();
				return false;
			}
		}
    </script>
    
    <jsp:include page="../common/footer.jsp"/> 
</body>
</html>