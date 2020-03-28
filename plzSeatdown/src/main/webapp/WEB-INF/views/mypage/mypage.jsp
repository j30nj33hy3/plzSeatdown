<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage-프로필</title>
<link rel="stylesheet" href="${contextPath}/resources/css/mypage_profile.css"/>
</head>
<body class="homepage is-preload">
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
	
	<!-- Main -->
			<div class="wrapper style1">
				<div class="container">
					<div class="row gtr-200">
					
						<div class="col-2 col-12-mobile" id="sidebar" style="width: 200px;">
						<h4><a href="mypage">프로필</a></h4>
							<ul>
								<li><a href="mypage">프로필</a></li>
								<li><a href="changePwd">비밀번호 변경</a></li>
								<li><a href="secession">회원 탈퇴</a></li>
								<li><a href="myreview">내 리뷰</a></li>
								<li><a href="myticket">내 티켓</a></li>
								<li><a href="mycommu">내 커뮤</a></li>
								<li><a href="ask">문의 내역</a></li>
							</ul>
						</div>

						<div class="col-10 col-12-mobile imp-mobile" id="content">
							<form id="profile" action="updateprofile" enctype="multipart/form-data" method="POST" >
								<div id="ImgArea">
								  <c:set var="src" value="${contextPath}/resources/images/user.png"/>
				                        <c:if test="${loginMember.profilePath != null}">
				                        	<c:set var ="src" value="${contextPath}/resources/profileImages/${loginMember.profilePath}"/>
				                        </c:if>
				                        <img id="img1" src="${src}" style="border-radius: 5em;">
								</div>
								<div id="fileArea">
									<input type="file" id="file1" name="image">
								</div>
								<div id="fileArea2">
									<a id="filedelete" type="button"  class="btn btn-outline-secondary">이미지 삭제</a>
									<input type="hidden" name="deleteCheck" id="deleteCheck" value="0">
								</div>
								<div class="form-group col-8 mb-0">
									<label for="userId" class="user">아이디</label>
									<input type="text" class="form-control" id="userId" name="memberId" value="${loginMember.memberId}" readonly style="border-radius: 1em;">
								</div>
								<div class="form-group col-8 mb-0">
									<label for="userName" class="user">이름</label>
									<input type="text" class="form-control" id="userName" name="memberName" value="${loginMember.memberName}" readonly style="border-radius: 1em;">
								</div>
								<div class="form-group col-8 mb-0">
									<label for="userEmail" class="user">이메일</label>
									<input type="email" class="form-control" id="userEmail" name="memberEmail" value="${loginMember.memberEmail}" readonly style="border-radius: 1em;">
								</div>
								<div class="form-group col-8 mb-0">
									<label for="userNickname" class="user">닉네임</label>
									<input type="text" class="form-control" id="userNickname" name="memberNickname" value="${loginMember.memberNickname}" style="border-radius: 1em;">
									<button id="updatebtn" type="submit" class="btn btn-outline-secondary">수정</button>
								</div>
							</form>
						</div>

					</div>
				</div>
			</div>
	
	
              <script type="text/javascript">
              // 이미지 업로드 jQuery
                function readURL(input) {
                  if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                      $('#img1').prop('src', e.target.result);
                    }
                    reader.readAsDataURL(input.files[0]);
                  }  
                }

                $("#file1").change(function () {
                  readURL(this);
                });
                
                 
           	  // 이미지 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
                $(function () {
                  // 파일 선택 버튼이 있는 영역을 보이지 않게함
                   $("#fileArea").hide();
                  
                  // 이미지 영역 클릭 시 파일 첨부 창 띄우기
                  $("#img1").click(function(){
                     // 숨겨놓은 파일버튼 누르게함
                     $("#file1").click();
                  });
                  
                }); 
           	  
           	  
           	  // 이미지 삭제 버튼 클릭시 이미지 삭제
           	 $("#filedelete").click(function(){
           		 $("#deleteCheck").val("1");
           	     $("#file1").val("");
           		 $("#img1").attr("src","${contextPath}/resources/images/user.png");
           	 });
           	  
              </script>
              
              
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>