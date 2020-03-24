<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ClubEnrollSuccess</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/club/clubinclude.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/club/clubenrollsuccess.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/selectric.css">
<script src="https://kit.fontawesome.com/5e1e16b3f4.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery.selectric.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery.selectric.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Fredoka+One&display=swap" rel="stylesheet">

<script>
$(function(){
	$("#mainpagebutton").click(function(){
		location.href="${pageContext.request.contextPath }/club/clubMain.do";
	});
	
	$("#searchLocation").selectric();
});


</script>
<style>
.club-manage-section{
	float: left;
}
.club-manage-div-first{	
	width: 100%;
	height: 60px;
	font-size: 18px;
	position: relative;
}

.manage-div-first-1{
	width : 135px;
	height: 24px;
	margin : 0;
	position: relative;
	font-size : 24px;
	float: left;
	line-height: 64px;
}
.manage-div-first-2 span{
	display : block;
	width : 100%;
	height: 100%;
	background-color: #ffc862;
	border-radius: 20px;
	text-align: center;
	line-height: 55px;
	color: #ebebeb;
}
.manage-div-first-2{
	width: 210px;
	height: 55px;
	margin : 0;
	position: relative;
	font-size : 20px;
	float: right;
}

.club-manage-div-second{	
	width: 100%;
	height: 35px;
	margin-top:4%;
}
.club-manage-div-second span{
	display: block;
	height: 35px;
	line-height: 35px;
	font-size : 35px;
}
.club-manage-div-third{
	border: 1px solid #ee5253;
	width: 100%;
	height: 600px;
	margin-top:2.7%;
}
.club-manage-div-third-wrapper{
	border: 1px solid #5f27cd;
	position : relative;
	top : 50%;
	left :50%;
	transform : translateX(-50%) translateY(-50%); 	
	width: 95%;
	height: 83%;
	
}
.club-manage-div-third-header{
	width: 200px;
	height: 60px;
	border : 1px solid #0abde3; 
}
.club-manage-div-third-header i{
	margin-right : 5%;
	line-height: 65px;
	color: #ffc862;
}
.club-manage-div-third-header span{
	font-size: 26px;
}
.club-manage-div-third-body{
	width : 1280px;
	height: 100px;
}
.club-manage-div-third-body input[type=text]{
    width: 98%;
    height: 100%;
    background-color: #ebebeb;
    font-size: 24px;
    padding-left: 2%;
}
.selectric{
	margin-top:1.5%;
	width: 16%;
}
</style>

</head>
<body>
<jsp:include page="/WEB-INF/views/common/clubInclude.jsp"></jsp:include>
    <section class="club-manage-section">
		<div class="club-manage-div-first">
			<div class="manage-div-first-1">
				<span>소모임 관리</span>
			</div>
			<div class="manage-div-first-2">
				<span>프리미엄 사용중</span>
			</div>
		</div>
		<div class="club-manage-div-second">
			<div>
				<span>소모임 정보 수정</span>
			</div>
		</div>
		<div class="club-manage-div-third">
			<div class="club-manage-div-third-wrapper">
				<form action="" enctype="multipart/form-data">
					<div class="club-manage-div-third-header">
						<i class="fas fa-circle"></i> <span>소개글</span>
					</div>
					<div class="club-manage-div-third-body">
						<input type="text" placeholder="소개글을 입력해 주세요!"/>
					</div>
					<div class="club-manage-div-third-header">
						<i class="fas fa-circle"></i> <span>지역</span>
					</div>
					<div class="club-manage-div-third-body">
						<div class="inputs">
	                        <div class="select-boxs">
			                     <select name="clubLocation" id="searchLocation">
			                         <option value="전체" disabled selected>전체</option>
			                         <option value="서울">서울시</option>
			                         <option value="경기">경기도</option>
			                         <option value="강원">강원도</option>
			                         <option value="충북">충청북도</option>
			                         <option value="충남">충청남도</option>
			                         <option value="경북">경상북도</option>
			                         <option value="경남">경상남도</option>
			                         <option value="전북">전라북도</option>
			                         <option value="전남">전라남도</option>
			                         <option value="제주특별자치도">제주도</option>
			                     </select>
			                </div>
		                </div>
					</div>
					<div class="club-manage-div-third-header">
						<i class="fas fa-circle"></i> <span>배너 이미지</span>
					</div>
					<div class="club-manage-div-third-body">
						<input type="file"/>
					</div>
				</form>
			</div>
		</div>

    </section>


</body>
</html>