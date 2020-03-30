<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${contextPath}/resources/css/boardcss.css" />
    
<style>
#insertBtn{
    background-color:#FFD938;
    border-color:#FFD938;
    color:#555;
}
input:focus{
	outline:0 !important;
	box-shadow:none !important;
}
select:focus{
	outline:0 !important;
	box-shadow:none !important;
}
</style>
<title>커뮤니티 게시판 글 등록</title>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>
	<jsp:include page="../common/nav.jsp"/>

    <!-- Main -->
    <div class="container py-5 my-5">
        
        <form action="insert" enctype="multipart/form-data" role="form" name="insertForm" id="insertForm" method="post" onsubmit="return validate();">
            <div class="row">
                <div class="col-lg-1">
                    <span>카테고리</span>
                </div>
                <select name="categoryCode" class="form-control ml-3" style="width:150px; display: inline-block;">
                    <option value="1">자유</option>
                    <option value="2">양도</option>
                    <option value="3">질문</option>
                    <option value="4">공연 후기</option>
                </select>
            </div>
            <div class="row py-3">
                <div class="col-lg-1">
                    <span>제목</span>
                </div>
                <div class="col-lg-8">
                    <input type="text" id="title" name="communityTitle" class="form-control" size="35" maxlength="30" placeholder="제목을 입력하세요.(최대 30글자)" required>
                </div>
            </div>
            <textarea id="summernote" name="communityContent" class="form-control" required></textarea>
            <!-- 등록된 이미지 목록 -->
            <input type="hidden" name="imgList" value="" class="form-control">
            
            <div class="py-5 text-center">
                <button id="insertBtn" type="submit" class="btn px-5 mr-3">등록</button>
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
    

    <%-- <jsp:include page="../common/footer.jsp"/> --%>
</body>
</html>