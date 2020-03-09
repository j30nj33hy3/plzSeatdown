<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage-프로필</title>
<link href="mypage-askDetail.css" rel="stylesheet">
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
							<div class= "toptext">
								<p class="titleQ">문의내역<img src="images/question.png"></p>
								<div class="form-group col-10">
									<p>${qna.qnaContent}</p>
								</div>
							</div>
							<div class= "toptext">
								<p class="titleA">답변<img src="images/answer.png"></p>
								<div class="form-group col-10">
									<p>${qna.qnaAnswer}</p>
								</div>
							</div>
							<div class="btndiv">
								<a href="boardList?currentPage=${currentPage}" class="btn btn-primary m-3">목록으로</a>
							</div>	
						</div>

					</div>
				</div>
			</div>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>