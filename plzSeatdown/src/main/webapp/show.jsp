<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>관리자 게시판</title>
    <style>
        #logoutBtn{
            color : white; 
            background-color: #7460ee;
        }
        #searchBtn{
            background-color: #917EC6;
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
                        <h3 class="page-title mt-3 ml-3 mb-3">공연 관리</h3>
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
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="card">
                                    <img class="card-img-top" alt="Bootstrap Thumbnail First" src="https://www.layoutit.com/img/people-q-c-600-200-1.jpg" />
                                    <div class="card-block mt-3 ml-3 mr-3">
                                        <h5 class="card-title">
                                            공연
                                        </h5>
                                        <p class="text-right">
                                            <a class="btn btn-primary" href="#">수정</a> 
                                            <a class="btn btn-secondary" href="#">삭제</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card">
                                    <img class="card-img-top" alt="Bootstrap Thumbnail Second" src="https://www.layoutit.com/img/city-q-c-600-200-1.jpg" />
                                    <div class="card-block mt-3 ml-3 mr-3">
                                        <h5 class="card-title">
                                            공연
                                        </h5>
                                        <p class="text-right">
                                            <a class="btn btn-primary" href="#">수정</a> 
                                            <a class="btn btn-secondary" href="#">삭제</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card">
                                    <img class="card-img-top" alt="Bootstrap Thumbnail Third" src="https://www.layoutit.com/img/sports-q-c-600-200-1.jpg" />
                                    <div class="card-block mt-3 ml-3 mr-3">
                                        <h5 class="card-title">
                                            공연
                                        </h5>
                                        <p class="text-right">
                                            <a class="btn btn-primary" href="#">수정</a> 
                                            <a class="btn btn-secondary" href="#">삭제</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="card">
                                    <img class="card-img-top" alt="Bootstrap Thumbnail First" src="https://www.layoutit.com/img/people-q-c-600-200-1.jpg" />
                                    <div class="card-block mt-3 ml-3 mr-3">
                                        <h5 class="card-title">
                                            공연
                                        </h5>
                                        <p class="text-right">
                                            <a class="btn btn-primary" href="#">수정</a> 
                                            <a class="btn btn-secondary" href="#">삭제</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card">
                                    <img class="card-img-top" alt="Bootstrap Thumbnail Second" src="https://www.layoutit.com/img/city-q-c-600-200-1.jpg" />
                                    <div class="card-block mt-3 ml-3 mr-3">
                                        <h5 class="card-title">
                                            공연
                                        </h5>
                                        <p class="text-right">
                                            <a class="btn btn-primary" href="#">수정</a> 
                                            <a class="btn btn-secondary" href="#">삭제</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card">
                                    <img class="card-img-top" alt="Bootstrap Thumbnail Third" src="https://www.layoutit.com/img/sports-q-c-600-200-1.jpg" />
                                    <div class="card-block mt-3 ml-3 mr-3">
                                        <h5 class="card-title">
                                            공연
                                        </h5>
                                        <p class="text-right">
                                            <a class="btn btn-primary" href="#">수정</a> 
                                            <a class="btn btn-secondary" href="#">삭제</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row mb-3" style="justify-content: center;">
                    <div class="input-group" style="width: 30%;">
                        <input type="text" class="form-control" id="searchInput" placeholder="공연명을 입력하세요">
                        <button id="searchBtn" class="btn btn-default" type="button"><i class="fas fa-search"></i></button>
                    </div>
                </div>
                <nav aria-label="Page navigation example">
                    <ul class="pagination" style="justify-content: center;">
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                                <span class="sr-only">Previous</span>
                            </a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                        <li class="page-item"><a class="page-link" href="#">5</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                                <span class="sr-only">Next</span>
                            </a>
                        </li>
                    </ul>
                </nav>
                    
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
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
</body>

</html>