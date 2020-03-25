<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${contextPath}/resources/css/boardcss.css" />

<title>QNA</title>
</head>
<body id="page-top">
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/nav.jsp"/>

    <!-- Main -->
    <div class="container pb-5 mb-5" >
	
		<a style="display:none; position:fixed; bottom:25px; right:30px; z-index:5;" href="#page-top" id="top-btn">
	    	<i class="fa fa-angle-up fa-2x" aria-hidden="true" style="color:#FFD938;"></i>
	    </a>
        <nav id="frequent" class="py-5">
            <ul id="frequentul" class="d-flex justify-content-center">
                <li><a href="#frequent" class="active">자주 묻는 질문</a></li>
                <li><a href="#faq">고객 센터</a></li>
            </ul>
        </nav>

        <div>
            <h4 class="font-weight-bold" style="color:#917EC6;">자주 묻는 질문</h4>
            <h5 class="text-muted">Frequently Asked Question</h5>
        </div>

        <div class="accordion py-5" id="accordionExample">
            <div class="card mb-3">
                <div class="cheader account py-2 pr-1" id="headingOne" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                    <h2 class="mb-0 d-flex justify-content-between">
                        <a class="btn btn-link collapsed" type="button">Q [계정관리] 이름을 수정하고 싶어요</a>
                        <i class="fas fa-angle-down" style="color:white;"></i>
                    </h2>
                </div>
                <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                    <div class="card-body">
                        이름 수정은 개명을 한 경우에만 수정이 가능하며
                        고객센터로 문의 시 변경가능합니다.
                    </div>
                </div>
            </div>

            <div class="card mb-3">
                <div class="cheader account py-2 pr-1" id="headingTwo" data-toggle="collapse"
                data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                    <h2 class="mb-0 d-flex justify-content-between">
                        <a class="btn btn-link collapsed" type="button" >
                            Q [계정관리] 이메일 수정은 어떻게 하나요?
                        </a>
                        <i class="fas fa-angle-down" style="color:white;"></i>
                    </h2>
                </div>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                    <div class="card-body">
                        고객 센터로 문의 바랍니다.
                    </div>
                </div>
            </div>

            <div class="card mb-3">
                <div class="cheader inform py-2 pr-1" id="headingThree" data-toggle="collapse"
                data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                    <h2 class="mb-0 d-flex justify-content-between">
                        <a class="btn btn-link collapsed" type="button" >
                            Q [공연정보] 공연장이 없어요
                        </a>
                        <i class="fas fa-angle-down" style="color:white;"></i>
                    </h2>
                </div>
                <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                    <div class="card-body">
                        현재 일부 공연장만 서비스 중에 있으며 그 외 공연장을 점차 추가 제공할 예정입니다.
                    </div>
                </div>
            </div>

            <div class="card mb-3">
                <div class="cheader inform py-2 pr-1" id="headingFour" data-toggle="collapse"
                data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                    <h2 class="mb-0 d-flex justify-content-between">
                        <a class="btn btn-link collapsed" type="button" >
                            Q [공연정보] 공연 정보가 잘못되었어요.
                        </a>
                        <i class="fas fa-angle-down" style="color:white;"></i>
                    </h2>
                </div>
                <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordionExample">
                    <div class="card-body">
                        저희 사이트는 KOPIS 공연예술 통합전산망 www.kopis.or.kr 데이터를 이용하고 있으며
                        잘못된 정보는 고객센터로 문의하면 확인 후 수정하겠습니다.
                    </div>
                </div>
            </div>

            <div class="card mb-3">
                <div class="cheader review py-2 pr-1" id="headingFive" data-toggle="collapse"
                data-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                    <h2 class="mb-0 d-flex justify-content-between">
                        <a class="btn btn-link collapsed" type="button">
                            Q [좌석리뷰] 공연장과 실제 좌석 배치가 달라요
                        </a>
                        <i class="fas fa-angle-down" style="color:white;"></i>
                    </h2>
                </div>
                <div id="collapseFive" class="collapse" aria-labelledby="headingFive" data-parent="#accordionExample">
                    <div class="card-body">
                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid.
                        3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt
                        laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin
                        coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes
                        anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings
                        occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard
                        of them accusamus labore sustainable VHS.
                    </div>
                </div>
            </div>

            <div class="card mb-3">
                <div class="cheader review py-2 pr-1" id="headingSix" data-toggle="collapse"
                data-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
                    <h2 class="mb-0 d-flex justify-content-between">
                        <a class="btn btn-link collapsed" type="button">
                            Q [좌석리뷰] 공연과 상관없는 이미지로 리뷰를 올린 경우
                        </a>
                        <i class="fas fa-angle-down" style="color:white;"></i>
                    </h2>
                </div>
                <div id="collapseSix" class="collapse" aria-labelledby="headingSix" data-parent="#accordionExample">
                    <div class="card-body">
                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid.
                        3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt
                        laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin
                        coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes
                        anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings
                        occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard
                        of them accusamus labore sustainable VHS.
                    </div>
                </div>
            </div>

            <div class="card mb-3">
                <div class="cheader commu py-2 pr-1" id="headingSeven" data-toggle="collapse"
                data-target="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
                    <h2 class="mb-0 d-flex justify-content-between">
                        <a class="btn btn-link collapsed" type="button">
                            Q [커뮤니티] 사이트 내 공연 티켓 양도 및 거래 
                        </a>
                        <i class="fas fa-angle-down" style="color:white;"></i>
                    </h2>
                </div>
                <div id="collapseSeven" class="collapse" aria-labelledby="headingSeven" data-parent="#accordionExample">
                    <div class="card-body">
                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid.
                        3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt
                        laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin
                        coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes
                        anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings
                        occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard
                        of them accusamus labore sustainable VHS.
                    </div>
                </div>
            </div>

            <div class="card mb-3">
                <div class="cheader commu py-2 pr-1" id="headingEight" data-toggle="collapse"
                data-target="#collapseEight" aria-expanded="false" aria-controls="collapseEight">
                    <h2 class="mb-0 d-flex justify-content-between">
                        <a class="btn btn-link collapsed" type="button">
                            Q [커뮤니티] 커뮤니티 게시판 내 분쟁 발생 시
                        </a>
                        <i class="fas fa-angle-down" style="color:white;"></i>
                    </h2>
                </div>
                <div id="collapseEight" class="collapse" aria-labelledby="headingEight" data-parent="#accordionExample">
                    <div class="card-body">
                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid.
                        3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt
                        laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin
                        coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes
                        anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings
                        occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard
                        of them accusamus labore sustainable VHS.
                    </div>
                </div>
            </div>
        </div>

        <hr>

        <!-- 고객 센터 -->
        <div id="faq" class="py-5">

            <div class="pb-5">
                <h4 class="font-weight-bold" style="color:#917EC6;">고객 센터</h4>
                <h5 class="text-muted">Service Center</h5>
            </div>
            <form method="POST" action="insert" role="form" onsubmit="return validate();">
                <div>
                	<input type="hidden" name="writer" value="${loginMember.memberNo}">
                    <textarea class="form-control" rows="5" id="content" name="qnaContent" placeholder="문의 내용을 입력해주세요"
                        style="resize: none"></textarea>
                </div>
                <div class="float-right pt-3 pb-5">
	                <c:if test="${!empty loginMember && loginMember.memberStatus == 'Y'}">
	                    <button type="submit" class="btn btn-outline-secondary">문의하기</button>
	                </c:if>
                </div>
            </form>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"/>
    
	<script>
		// 유효성 검사
		function validate(){
			if($("#content").val().trim().length == 0){
				alert("내용을 입력해 주세요.");
				$("#content").focus();
				return false;
			}
		}
		$(function(){
			$(window).scroll(function(){
				  if ($(this).scrollTop()>100){
				    $('#top-btn').fadeIn();
				  } else {
				    $('#top-btn').fadeOut();
				  }
			});
		});
	</script>
	
</body>
</html>