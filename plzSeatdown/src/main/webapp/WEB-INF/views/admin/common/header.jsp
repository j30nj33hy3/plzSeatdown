<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
    <link rel="icon" type="image/png" sizes="16x16" href="${contextPath}/resources/css/images/logo.png">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/multicheck.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/dataTables.bootstrap4.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/style.min.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/multicheck.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/noscript.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/admin.css">
</head>
<body>
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/>
    <div id="main-wrapper">
        <header class="topbar" data-navbarbg="skin5">
            <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                <div class="navbar-header" data-logobg="skin5">
                    <a class="nav-toggler waves-effect waves-light d-block d-md-none" href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
                    <a class="navbar-brand" href="index.html">
                        <span class="logo-text">
                             <img src="${contextPath}/resources/images/logo.png" alt="homepage" class="light-logo" style="width : 95%"/>                            
                        </span>
                    </a>
                    <a class="topbartoggler d-block d-md-none waves-effect waves-light" href="javascript:void(0)" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><i class="ti-more"></i></a>
                </div>
                <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">
                    <ul class="navbar-nav float-left mr-auto">
                    </ul>
                    <ul class="navbar-nav float-right">
                        <li class="nav-item dropdown">
                            <button class="btn btn" id="logoutBtn" href="${contextPath}/member/logout"><i class="fa fa-power-off m-r-5 m-l-5"></i> Logout</button>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>        
    </div>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"
    integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" 
   integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" 
   integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
   
    <script src="${contextPath}/resources/js/admin/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/admin/popper.min.js"></script>
    <script src="${contextPath}/resources/js/admin/bootstrap.min.js"></script>
    <script src="${contextPath}/resources/js/admin/perfect-scrollbar.jquery.min.js"></script>
    <script src="${contextPath}/resources/js/admin/sparkline.js"></script>
    <script src="${contextPath}/resources/js/admin/waves.js"></script>
    <script src="${contextPath}/resources/js/admin/sidebarmenu.js"></script>
    <script src="${contextPath}/resources/js/admin/custom.min.js"></script>
</body>
</html>