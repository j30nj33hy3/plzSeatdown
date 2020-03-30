<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PleaseSeatDown</title>
</head>
<body class="homepage is-preload">
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
		<div id="page-wrapper">
			<div class="mt-5 pt-3 ml-5 pl-5"><p class="ml-5 pl-5" style="font-size : 30px;">상영중인 공연</p></div>
			<!-- Carousel -->
			<section class="carousel">
				<div class="reel">
					<c:if test="${!empty showList}">
						<c:forEach var="show" items="${showList}" varStatus="vs">
							<article>
								<a href="review/seats?thCode=${show.thCode}" class="image featured"><img style="width:218px; height: 280px;"src="${show.posterPath}" alt="" /></a>
							</article>
						</c:forEach>
					</c:if>
				</div>
			</section>
			<!--카드 시작-->
			<div class="container mb-5">
				<div class="row">
					
				</div>
			</div>
			<!-- 카드 끝 -->	
		</div>
	
	<script type="text/javascript" src="${contextPath}/resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/jquery.dropotron.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/jquery.scrolly.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/jquery.scrollex.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/browser.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/breakpoints.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/util.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/main.js"></script>
	<script>
		$(function(){
			$(".image.featured").css("margin-bottom","0");
		});
	</script>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>