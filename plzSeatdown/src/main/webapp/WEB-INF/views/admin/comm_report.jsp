<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 - 커뮤니티 게시글 신고</title>
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
						<h3 class="page-title mt-3 ml-3 mb-3">커뮤니티 게시글 신고</h3>
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
									<th scope="col">글 번호</th>
									<th scope="col">피신고자</th>
									<th scope="col">신고자</th>
									<th scope="col">처리</th>
									<th scope="col">처리상태</th>
								</tr>
							</thead>
							<tbody class="customtable">
								<c:if test="${empty crlist}">
									<tr>
										<td colspan="8">존재하는 신고글이 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${!empty crlist}">
									<c:forEach var="commreport" items="${crlist}" varStatus="vs">
										<tr>
											<td>${commreport.commReportNo}</td>
											<td>${commreport.reportCategoryName}</td>
											<td>${commreport.commReportContent}</td>
											<td><a class="rcomment" href="">${commreport.commNo}</a></td>
											<td>${commreport.memberId}</td>
											<td>${commreport.memberId}</td>
											<td><a class="report" 
												onclick="location.href='${contextPath}/admin/comm_report/updateRpCnt?no=${commreport.memberSuspector}&reportNo=${commreport.commReportNo}'">
												<i class="fas fa-exclamation-triangle"></i></a></td>
											<td>${commreport.reportStatus}</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
				<!---------------------------------- 페이징 바 ---------------------------------->
				<div style="clear: both;">
					<nav aria-label="Page navigation example">
						<ul class="pagination" style="justify-content: center;">
							<c:if test="${pInf.currentPage > 1}">
								<li>
									<!-- 맨 처음으로(<<) --> <!-- 
                                    c:url 태그에 var 속성이 존재하지 않으면
                                   	 변수처럼 사용되는 것이 아닌, 작성된 자리에 바로 URL 형식으로 표기됨
                                --> <a class="page-link"
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
										&lt;&lt; </a>
								</li>

								<li>
									<!-- 이전으로(<) --> <a class="page-link"
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
                                ">
										&lt; </a>
								</li>
							</c:if>

							<!-- 10개의 페이지 목록 -->
							<c:forEach var="p" begin="${pInf.startPage}"
								end="${pInf.endPage}">


								<c:if test="${p == pInf.currentPage}">
									<li><a class="page-link">${p}</a></li>
								</c:if>

								<c:if test="${p != pInf.currentPage}">
									<li><a class="page-link"
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
                                    ">
											${p} </a></li>
								</c:if>

							</c:forEach>

							<!-- 다음 페이지로(>) -->
							<c:if test="${pInf.currentPage < pInf.maxPage }">
								<li><a class="page-link"
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
                                ">
										&gt; </a></li>

								<!-- 맨 끝으로(>>) -->
								<li><a class="page-link"
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
					</nav>
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
                    </script>
					<br>
						<script>
					        $(document).ready(function(){
					        $(".report").click(function(){
					            var result = alert('신고처리가 완료되었습니다.');
					    
					            if(result){
					            	location.replace('list');
					            // 확인 버튼을 누르면 'admin/comm_report/list'페이지로 이동
					            }else{
					            // 취소
					            }
					        })
					        });
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