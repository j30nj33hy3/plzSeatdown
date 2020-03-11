<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />

<%-- <link rel="stylesheet" href="${contextPath}/resources/css/main.css" /> --%>
<title>Insert title here</title>
    <style>
        .list-btn{
            border:solid 1px;
            border-color:rgb(198, 180, 205);
            color:rgb(145, 126, 198);
        }
        .list-btn:hover{
            border:solid 1px;
            border-color:rgb(198, 180, 205);
            background-color:rgb(145, 126, 198);
        }
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/nav.jsp"/>
<div class="container py-5">
    <section>
        <header class="mb-5">
            <h3 class="text-center">${notice.noticeTitle}</h3>
        </header>
        <div class="d-flex justify-content-between">
            <p style="display: inline-block;">${notice.noticeModifyDate}</p>
            <p style="display: inline-block;">조회수 &nbsp;${notice.noticeCount}</p>
        </div>
    </section>
    <hr>
    <section class="my-5 py-5">
        <p>${notice.noticeContent}</p>
    </section>
    <hr>

    <div class="col-md-12 text-center mt-5 pt-5">
        <a class="btn btn-default list-btn" type="button" href="
        	<c:url value="list">
        		<c:if test="${!empty param.searchKey}">
        			<c:param name="searchKey" value="${param.searchKey}"/>
        		</c:if>
        		<c:if test="${!empty param.searchValue}">
        			<c:param name="searchValue" value="${param.searchValue}"/>
        		</c:if>
        		<c:param name="currentPage" value="${param.currentPage}"/>
        	</c:url>">목록
        </a>
    </div>
</div>

<%-- <jsp:include page="../common/footer.jsp"/> --%>


</body>
</html>