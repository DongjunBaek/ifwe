<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${param.pageTitle }</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery.selectric.min.js"></script>
<script src="https://kit.fontawesome.com/5e1e16b3f4.js"></script>
<link href="https://fonts.googleapis.com/css?family=Fredoka+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Fredoka+One&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/selectric.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/categori.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/mainboard.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/membership.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/mypage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/afterLoginCommon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/afterLogin-css.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/boardForm.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/profile.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/makeProfile.css">
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.js"></script>
<script>
$(function(){
   $("#nav-arrowicon").click(function(){
        $("#nav-mypagebox").slideToggle(300);
    });
   
   $("#mypagebutton").click(function(){
   	location.href="${pageContext.request.contextPath }/member/mypage.do";
   });
   
   $(".logo-box").click(function(){
   	location.href="${pageContext.request.contextPath }/main/mainPage.do";
   })
   
   $("#somoim-create").click(function(){
	   location.href = "${pageContext.request.contextPath}/club/clubCreate.do";
   });
   $("#somoim-search").click(function(){
	   location.href = "${pageContext.request.contextPath}/club/clubSearch.do";
   });
   $("#main-board").click(function(){
	   location.href = "${pageContext.request.contextPath}/main/mainBoard.do";
   });
   $("#information").click(function(){
   });
   
   $("#buy-membership").click(function(){
	   location.href = "${pageContext.request.contextPath}/member/membership.do";
   });
   
});
</script>
<style>
.font-black{
color:black;}
</style>
</head>
<body>
<header>
        <div class="nav-container">
            <div class="logo-box"></div>
            <div class="nav-content-right">
                <div class="nav-right-icon2">
                    <i class="fas fa-bell" style="font-size:35px;color: white;" ></i>
                </div>
                <div class="nav-right-icon1">
                    <i class="fas fa-sort-down fa-2x" id="nav-arrowicon" style="color: white;"></i>
                </div>
                <div class="nav-clubimg">
                	<img src="${pageContext.request.contextPath }/resources/upload/member/frofileimg/ex2.jpg" alt="" />
                </div>
                <div class="nav-right-leader font-kor">
                    <p style="color: white; margin:0;">@wingStudy_02</p>
                    <p style="color: white;margin:0;">스테파니 님</p>
                </div>
            </div>
        </div>
        <div class="nav-myfrofile-box" id="nav-mypagebox">
             <p id="mypagebutton">마이페이지</p>
             <div class="nav-box-line"></div>
             <p id="logoutbutton">로그아웃</p>
         </div>
    </header>
    <nav>    
        <div class="ul-container">
            <div class="ul-background">
                <ul class="ul-tag bold-kor">
                    <div class="blue-back" id="somoim-create">
                        <li><a href="${pageContext.request.contextPath }/club/clubCreate.do" class="font-black">소모임 생성</a></li>
                    </div>
                    <div class="blue-back" id="somoim-search">
                    	<li>
                    	<a href="${pageContext.request.contextPath }/club/clubSearch.do" class="font-black">소모임 검색</a>
                    	</li>
                    </div>
                    <div class="blue-back" id="main-board">
                    	<li><a href="${pageContext.request.contextPath }/main/mainBoard.do" class="font-black">게시판</a></li>
                    </div>
                    <div class="blue-back" id="information">
                    	<li><a href="#" class="font-black">소개</a> </li>
                    </div>
                    <div class="blue-back" id="buy-membership">
                    	<li><a href="${pageContext.request.contextPath }/member/membership.do" class="font-black">멤버쉽 구매</a></li>
                    </div>
                </ul>
            </div>
        </div>
    </nav>