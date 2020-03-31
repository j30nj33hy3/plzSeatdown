<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${contextPath}/resources/css/reviewCommon.css" />
</head>
<body>
	<div class="col-2 col-12-mobile" id="sideMenu" style="width: 200px;">
		<h4><a id="clickedPage" href=""></a></h4>
		<ul>
			<li><a href="theater">공연장별</a></li>
			<li><a href="show">공연별</a></li>
			<c:if test="${! empty sessionScope.loginMember}">
				<li><a href="writeForm">리뷰 작성</a></li>
			</c:if>
		</ul>
	</div>
		
</body>
</html>