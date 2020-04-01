<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PLEASE SEATDOWN</title>
<style>
.search_list {
	color: black;
	text-decoration: none;
}

.rcomment {
	color: #3E5569;
	text-decoration: none;
}

.trash {
	color: black;
}

#searchTitle {
	width: 110px;
	display: inline-block;
}

#searchInput {
	width: 25%;
	display: inline-block;
}

#searchBtn {
	width: 100px;
	background-color: #917EC6;
	border: #917EC6;
	display: inline-block;
}

.table-responsive {
	text-align: center;
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
						<h3 class="page-title mt-3 ml-3 mb-3">커뮤니티 댓글 신고</h3>
						<div class="ml-auto text-right">
							<nav aria-label="breadcrumb"></nav>
						</div>
					</div>
				</div>
			</div>
			<div class="container-fluid">
				<div class="card">
					<div class="table-responsive">
						<table class="table">
							<thead class="thead-light">
								<tr>
									<th scope="col">신고 번호</th>
									<th scope="col">신고 분류</th>
									<th scope="col">신고 내용</th>
									<th scope="col">댓글 번호</th>
									<th scope="col">피신고자</th>
									<th scope="col">신고자</th>
									<th scope="col">처리</th>
									<th scope="col">처리상태</th>
								</tr>
							</thead>
							<tbody class="customtable">
								<c:if test="${empty list}">
									<tr>
										<td colspan="8">존재하는 신고글이 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${!empty list}">
									<c:forEach var="rereport" items="${list}" varStatus="vs">
										<tr>
											<td>${rereport.replyReportNo}</td>
											<td>${rereport.reportCategoryName}</td>
											<td>${rereport.replyReportContent}</td>
											<td>${rereport.replyNo}</td>
											<td>${rereport.suspectorId}</td>
											<td>${rereport.reporterId}</td>
											<td><a class="report"
													onclick="locationReport('${rereport.memberSuspector}', '${rereport.replyReportNo}', this)";>												
												<i class="fas fa-exclamation-triangle"></i></a></td>
											<td>${rereport.reportStatus}</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
				<!---------------------------------- 페이징 바 ---------------------------------->
								<!-- 페이징바 -->
				<div class="col-md-12 d-flex justify-content-center">
					<ul class="pagination pagination-info">
						<c:if test="${pInf.currentPage > 1}">
							<li class="page-item"><a class="page-link"
								href=" 
			                    	<c:url value="list">
			                    		<c:if test="${!empty param.searchKey }">
							        		<c:param name="searchKey" value="${param.searchKey}"/>
							        	</c:if>
							        	
							        	<c:if test="${!empty param.searchValue }">
							        		<c:param name="searchValue" value="${param.searchValue}"/>
							        	</c:if>
			                    		<c:param name="currentPage" value="1"/>
			                    	</c:url>
		                    	">
									&lt;&lt; </a></li>
							<li class="page-item">
								<!-- 이전으로 --> <a class="page-link"
								href=" 
		                    	<c:url value="list">
		                    		<c:if test="${!empty param.searchKey }">
						        		<c:param name="searchKey" value="${param.searchKey}"/>
						        	</c:if>
						        	
						        	<c:if test="${!empty param.searchValue }">
                                            <c:param name="searchValue" value="${param.searchValue}"/>
                                    </c:if>
		                    		<c:param name="currentPage" value="${pInf.currentPage-1}"/>
		                    	</c:url>
	                    	">&lt;</a>
							</li>
						</c:if>

						<c:forEach var="p" begin="${pInf.startPage}" end="${pInf.endPage}">

							<c:if test="${p == pInf.currentPage}">
								<li class="active page-item"><a class="page-link">${p}</a>
								</li>
							</c:if>

							<c:if test="${p != pInf.currentPage}">
								<li class="page-item"><a class="page-link"
									href=" 
                                        <c:url value="list">
                                            <c:if test="${!empty param.searchKey }">
                                                <c:param name="searchKey" value="${param.searchKey}"/>
                                            </c:if>
                                            
                                            <c:if test="${!empty param.searchValue }">
                                                <c:param name="searchValue" value="${param.searchValue}"/>
                                            </c:if>
                                            <c:param name="currentPage" value="${p}"/>
                                        </c:url>
                                    ">${p}</a>
								</li>
							</c:if>
						</c:forEach>

						<!-- 다음 -->
						<c:if test="${pInf.currentPage < pInf.maxPage}">
							<li class="page-item"><a class="page-link"
								href="
                    			<c:url value="list">
                    				<c:if test="${!empty param.searchKey }">
                    					<c:param name="searchKey" value="${param.searchKey}"/>
                    				</c:if>
                    				<c:if test="${!empty param.searchValue }">
						        		<c:param name="searchValue" value="${param.searchValue}"/>
						        	</c:if>
		                    		<c:param name="currentPage" value="${pInf.currentPage+1}"/>
                    			</c:url>
                    			">&gt;</a>
							</li>

							<!-- 맨 끝으로(>>) -->
							<li class="page-item"><a class="page-link"
								href=" 
		                    	<c:url value="list">
		                    		<c:if test="${!empty param.searchKey }">
						        		<c:param name="searchKey" value="${param.searchKey}"/>
						        	</c:if>
						        	<c:if test="${!empty param.searchValue }">
						        		<c:param name="searchValue" value="${param.searchValue}"/>
						        	</c:if>
		                    		<c:param name="currentPage" value="${pInf.maxPage}"/>
		                    	</c:url>
	                    	">
									&gt;&gt; </a></li>
						</c:if>
					</ul>
				</div>
				<div>
					<form action="list" method="GET" class="text-center"
						id="searchForm">
						<select id=searchTitle name="searchKey" class="form-control">
							<!-- <option value="title" selected>글제목</option> -->
							<option value="reportNo">신고 번호</option>
							<option value="content">신고 내용</option>
						</select> <input type="text" id=searchInput name="searchValue"
							class="form-control" placeholder="검색어를 입력해주세요.">
						<button id=searchBtn class="form-control btn btn-primary">검색</button>
					</form>

					<!-- 페이지 이동 후에도 검색 결과가 검색창 input 태그에 표시되도록 하는 script -->
					<script>
                        $(function(){
                            var searchKey = "${param.searchKey}";
                            var searchValue = "${param.searchValue}";
                            
                            if(searchKey != "null" && searchValue != "null"){
                                $.each($("select[name=searchKey] > option"), function(index, item){
                                    if($(item).val() == searchKey){
                                        $(item).prop("selected","true");
                                    } 
                                });
                                
                                $("input[name=searchValue]").val(searchValue);
                            }
                                
                        });
/* 				        $(document).ready(function(){
					        $(".report").click(function(){
					        	$(this).attr('onclick', 'return false') 
					        	var status = $(this).parent().next().text();					        	
					        	if(status == "Y"){
					        		alert('이미 신고처리가 된 댓글입니다.');
					        		location.replace('list');
					        	}else{
					            	alert('신고처리가 완료되었습니다.');		            
					            	location.replace('list');
					            }
				        	})
				        }); */
				        
 				        function locationReport(memberSuspector, replyReportNo, obj){
 				        	//console.log(memberSuspector);
 				        	//console.log(replyReportNo);
 				        	//console.log(obj.parentNode.nextSibling.nextSibling.innerText);
 				        	var status = obj.parentNode.nextSibling.nextSibling.innerText; 
 				        	if(status == "Y"){
				        		alert('이미 신고처리가 된 댓글입니다.');
				        		return false;
				        	}else{
				            	alert('신고처리가 완료되었습니다.');		            
				            	location.replace("${contextPath}"+"/admin/reply_report/updateRpCnt?no="+memberSuspector+"&reportNo="+replyReportNo);
				            }
 				        }
					</script>
				</div>
			</div>
		</div>
	</div>
	<script>
        /****************************************
         *       Basic Table                   *
         ****************************************/
        $('#zero_config').DataTable();
    </script>
</body>
</html>