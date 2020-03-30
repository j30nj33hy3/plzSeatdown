<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>관리자 게시판 - 공연장 관리</title>

    <style>
        #logoutBtn{
            color : white; 
            background-color: #7460ee;
        }
        #searchBtn{
            background-color: #917EC6;
        }
        #addBtn{
            background-color: #917EC6;
        }
        .logoArea:hover{
        	cursor: pointer;
        }
    </style>
</head>

<body>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper">

        <!-- header -->
        <jsp:include page="/WEB-INF/views/admin/common/header.jsp"/>

        <!-- nav -->
        <jsp:include page="/WEB-INF/views/admin/common/nav.jsp"/>


        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h3 class="page-title mt-3 ml-3">공연장 관리</h3>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row mb-4">    
                    <div class="col-md-12 text-right">
                        <button type="button" class="btn btn-default" id="tmp2" onclick="location.href='${contextPath}/API/theaterAPI'">
                            	공연장 API(임시)
                        </button>
                        <!-- <button type="button" class="btn btn-default" id="addBtn">
                            	공연장 추가
                        </button> -->
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                    
                    	<c:if test="${empty list }">
                    		<div class="row" style="justify-content: center;">
                    			<h5>등록된 공연장이 없습니다.</h5>
                    		</div>
                    	</c:if>
                    	
                    	<c:if test="${!empty list }">
                    		<div class="row">
                    			<c:forEach var="theater" items="${list}" varStatus="vs">
                    				<div class="col-md-4">
                    					<div class="card">
                   							<form id="${theater.thCode}Form">
												<div class="logoArea text-center" id="${theater.thCode}" style="height: 100px;" >
											  		<c:set var="src" value="${contextPath}/resources/images/theater_logo.png"/>
							                        <c:if test="${!empty theater.thLogoPath}">
							                        	<c:set var ="src" value="${contextPath}/resources/theaterLogo/${theater.thLogoPath}"/>
							                        </c:if>
							                        <img id="${theater.thCode}Img" src="${src}" style="width: 100%; height: 100%;">
												</div>
												<div id="fileArea" class="fileArea">
													<input type="file" id="${theater.thCode}File" name="image">
												</div>
											</form>
                    						<div class="card-block mt-3 ml-3 mr-3">
                    							<h5 class="card-title">
                    								${theater.thNm}
                    							</h5>
                    							<p class="text-right">
		                                            <button id="delete?thCode=${theater.thCode}" class="btn btn-primary deleteBtn">로고 삭제</button> 
		                                            <a class="btn btn-primary" href="thDetail?thCode=${theater.thCode}&thNm=${theater.thNm}">좌석 관리</a> 
		                                        </p>
                    						</div>
                    					</div>
                    				</div>
                    			</c:forEach>
                    		</div>
                    	</c:if>
                    	
                    </div>
                </div>
                
                
                <!---------------------------------- 페이징 바 ---------------------------------->
				<!-- 페이징바 -->
				<div class="col-md-12 d-flex justify-content-center">
					<ul class="pagination pagination-info" style="justify-content: center;">
						<c:if test="${pInf.currentPage > 1}">
							<li class="page-item">
								<!-- 맨 처음으로(<<) --> <!-- 
                                   c:url 태그에 var 속성이 존재하지 않으면
                                  	 변수처럼 사용되는 것이 아닌, 작성된 자리에 바로 URL 형식으로 표기됨
                               --> <a class="page-link"
								href=" 
                                   <c:url value="list">
                                       <c:if test="${!empty param.searchTheater }">
                                           <c:param name="searchTheater" value="${param.searchTheater}"/>
                                       </c:if>
                                       <c:param name="currentPage" value="1"/>
                                   </c:url>
                               ">
									&lt;&lt; </a>
							</li>

							<li class="page-item">
								<!-- 이전으로(<) --> <a class="page-link"
								href=" 
                                   <c:url value="list">
                                       <c:if test="${!empty param.searchTheater }">
                                           <c:param name="searchTheater" value="${param.searchTheater}"/>
                                       </c:if>
                                       <c:param name="currentPage" value="${pInf.currentPage-1}"/>
                                   </c:url>
                               ">
									&lt; </a>
							</li>
						</c:if>

						<!-- 10개의 페이지 목록 -->
						<c:forEach var="p" begin="${pInf.startPage}"
							end="${pInf.endPage}">


							<c:if test="${p == pInf.currentPage}">
								<li class="active page-item"><a class="page-link">${p}</a></li>
							</c:if>

							<c:if test="${p != pInf.currentPage}">
								<li class="page-item"><a class="page-link"
									href=" 
                                       <c:url value="list">
                                           <c:if test="${!empty param.searchTheater }">
                                           	<c:param name="searchTheater" value="${param.searchTheater}"/>
                                      		</c:if>
                                           <c:param name="currentPage" value="${p}"/>
                                       </c:url>
                                   ">
										${p} </a></li>
							</c:if>

						</c:forEach>

						<!-- 다음 페이지로(>) -->
						<c:if test="${pInf.currentPage < pInf.maxPage }">
							<li class="page-item"><a class="page-link"
								href=" 
                                   <c:url value="list">
                                       <c:if test="${!empty param.searchTheater }">
                                           <c:param name="searchTheater" value="${param.searchTheater}"/>
                                       </c:if>
                                       <c:param name="currentPage" value="${pInf.currentPage+1}"/>
                                   </c:url>
                               ">
									&gt; </a></li>

							<!-- 맨 끝으로(>>) -->
							<li class="page-item"><a class="page-link"
								href=" 
                                   <c:url value="list">
                                       <c:if test="${!empty param.searchTheater }">
                                           <c:param name="searchTheater" value="${param.searchTheater}"/>
                                       </c:if>
                                       <c:param name="currentPage" value="${pInf.maxPage}"/>
                                   </c:url>
                               ">
									&gt;&gt; </a></li>

						</c:if>
					</ul>
				</div>
				
				
				<!-- 검색 -->
				<div class="row" style="justify-content: center;">
					<form action="list" method="GET" id="searchForm">
						<div class="input-group">
	                        <input type="text" class="form-control" name="searchTheater" placeholder="공연장명을 입력하세요">
	                        <button class="btn btn-default" id="searchBtn">검색</button>
	                    </div>
					</form>
                </div>
                
                <!-- 페이지 이동 후에도 검색 결과가 검색창 input 태그에 표시되도록 하는 script -->
                <script>
                	$(function(){
                		var searchTheater = "${param.searchTheater}";
                		
                		if(searchTheater != "null"){
                			$("input[name=searchTheater]").val(searchTheater);
                		}
                		
                		$(".card-title").each(function(i,e){
               	  			if($(this).text().length >= 12){
               	  				var sub = $(this).text().substr(0, 
               	  					$(this).text().length-6);
               	  				$(this).text(sub);
               	  			}
               	  		});
                	});
                </script>
                
                <!-- 공연장 로고 업로드 관련 -->
                <script>
                 
           	  		// 이미지 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
	                $(function () {
						// 파일 선택 버튼이 있는 영역을 보이지 않게함
						$(".fileArea").hide();
						
						// 이미지 영역 클릭 시 파일 첨부 창 띄우기
						$(".logoArea").click(function(){
							
							fileId = $(this).prop("id");
							
							// 숨겨놓은 파일버튼 누르게함
							$("#"+fileId+"File").click();
							
							// 파일이 변경되면 ajax 실행
							$("#"+fileId+"File").change(function () {
								
								console.log($(this).prop("id"));
								
								var form = $("#"+fileId+"Form")[0];
								
								formdata = new FormData(form);
								// FormData : form 태그 내부 값 전송을 위한  k:v 쌍을 쉽게 생성할 수 있는 객체
								
								formdata.append("uploadFile", $("#"+fileId+"File")[0].files[0]);
								formdata.append("theaterCode", fileId);
								// FormData 객체에 새로운 K, V 를 추가
								
								//console.log(formdata.get("uploadFile"));
								
								$.ajax({
									url : "insertLogo",
									type : "post",
									data : formdata,
									dataType: "text",
									enctype: "multipart/form-data",
									cache : false,
							        contentType : false,
							        // contentType : 서버로 전송되는 데이터의 형식 설정
							        // 기본값  : application/x-www-form-urlencoded; charset=UTF-8
							        // 파일 전송 시 multipart/form-data 형식으로 데이터를 전송해야 하므로
							        // 데이터의 형식이 변경되지 않도록 false로 지정.
							        
							        processData : false,
							        // processData : 서버로 전달되는 값을 쿼리스트링으로 보낼경우 true(기본값), 아니면 false
							        //				파일 전송 시 false로 지정 해야 함.
							        
									success : function(logo){
										
										var obj = JSON.parse(logo);
										
										$("#"+obj.theaterCode+"Img").prop("src", "${contextPath}/resources/theaterLogo/"+obj.logoPath);
									}
									
								});
				            });
							
						});
	                }); 
           	  
           	  		$(".deleteBtn").click(function(){
           	  			
           	  			theaterCode = $(this).prop("id").substring(6); // 공연장 코드 추출해서 저장
           	  			
						$.ajax({
							url : "deleteLogo",
							type : "GET",
							data : {"theaterCode" : theaterCode},
							success : function(result){
								
								if(result > 0){
									$("#"+theaterCode+"Img").prop("src", "${contextPath}/resources/images/theater_logo.png");
								}else{
									console.log("로고 삭제 실패");
								}
							}
						});
           	  			
           	  		});
           	 
				</script>
                    
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->

            <!-- footer -->
            <%-- <jsp:include page="/WEB-INF/views/admin/common/nav.jsp"/> --%>

        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
</body>

</html>