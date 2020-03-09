<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage-프로필</title>
<link href="mypage-ask.css" rel="stylesheet">
</head>
<body class="homepage is-preload">
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
	
	<!-- Main -->
			<div class="wrapper style1">
				<div class="container">
					<div class="row gtr-200">
					
						<jsp:include page="/WEB-INF/views/mypage/sideMenu.jsp"/>

						<div class="col-10 col-12-mobile imp-mobile" id="content">
							<table class="table">
								<thead>
								  <tr>
								  	<th scope="col">글번호</th>
									<th scope="col">내용</th>
									<th scope="col">날짜</th>
									<th scope="col">답장 여부</th>
								  </tr>
								</thead>
								<tbody>
								<c:if test="${empty list}">
										<tr>
											<td colspan="4">존재하는 리뷰가 없습니다.</td>
										</tr>
								</c:if>
								<c:if test="${!empty list}">
									<c:forEach var="qna" items="${list}" varStatus="vs">
										<tr>
											<td>${qna.qnaNo}</td>
											<td>${qna.qnaContent}</td>
											<td>${qna.qnaCreateDate}</td>
											<td>${qna.qnaStatus}</td>
										</tr>
									</c:forEach>
								</c:if>
								</tbody>
							  </table>

							  <div class="form-group col-9">
								<ul class="pagination">
								  <li class="page-item disabled">
									<a class="page-link" href="#">◀</a>
								  </li>
								  <li class="page-item active">
									<a class="page-link" href="#">1</a>
								  </li>
								  <li class="page-item">
									<a class="page-link" href="#">2</a>
								  </li>
								  <li class="page-item">
									<a class="page-link" href="#">3</a>
								  </li>
								  <li class="page-item">
									<a class="page-link" href="#">4</a>
								  </li>
								  <li class="page-item">
									<a class="page-link" href="#">5</a>
								  </li>
								  <li class="page-item">
									<a class="page-link" href="#">▶</a>
								  </li>
								</ul>
							  </div>
						</div>

					</div>
				</div>
			</div>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>