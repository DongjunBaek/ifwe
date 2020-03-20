﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>if we</title>
<script src="resources/js/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="resources/css/index/login.css">
<script src="https://kit.fontawesome.com/226b55f414.js" crossorigin="anonymous"></script>

<c:if test="${not empty msg }">
<script>
	$(()=>{
		alert("${msg}");
	});
</script>
</c:if>
    
</head>
<!-- 한글 폰트 -->
<style>
    @font-face { font-family: 'GmarketSansLight'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff') format('woff'); font-weight: normal; font-style: normal; }
</style>

<!-- 영문폰트 -->
<link href="https://fonts.googleapis.com/css?family=Fredoka+One&display=swap" rel="stylesheet">
<script>
	

$(function(){
	
	
	
	$("#loginbutton").click(function(){
		$(".back").css("display","inline-block");
		$("#search-id-pwd-container").css('display','none');
		$("#search-number-container-pwd").css('display','none');
		$("#search-number-container-id").css('display','none');
	});
	
	$("#startbutton").click(function(){
		$(".back").css("display","inline-block");
	});
	
	$(".back").click(function(e){
		if($(e.target).is(".back")){
			$(".back").css("display","none");
			$("#login-container-first").css('display','');
			$("#search-id-div").css('display','');
			
		}
	});
	
	$("#joinbutton").click(function(){
		location.href="${pageContext.request.contextPath }/member/enroll.do";
		
	});
	
	$("#search-id-pwd-button").click(function(){
		$("#login-container-first").css('display','none');
		$("#search-pwd-div").css('display','none');
		$("#search-id-pwd-container").css('display','block');
	});
	
	$("#li-pwd-search").click(function(){
		$("#search-pwd-div").css('display','block');
		$("#search-id-div").css('display','none');
		$("#search-number-container-id").css('display','none');
	});
	
	$("#li-id-search").click(function(){
		$("#search-pwd-div").css('display','none');
		$("#search-id-div").css('display','block');
		$("#search-number-container-pwd").css('display','none');
	});
	
	$("#search-id-btn-num").click(function(){
		$("#search-number-container-id").css('display','');
	});
	$("#search-pwd-btn-num").click(function(){
		$("#search-number-container-pwd").css('display','');
	});
	
});



</script>
<style>
.main-kor{
    font-family: 'GmarketSansLight';
}
.main-eng{
    font-family: 'Fredoka One';
}


    
/* body */
*{
    padding: 0px;
    margin: 0px;    
    color:#3b3b3b;
    outline: none;
}
.main-body{    
    width: 1920px;
    height: 1280px;
    margin: 0 auto;
    /* border: 1px solid #61d4b3;     */
    overflow: hidden;
    position:absolute;
    left:50%;
    transform: translate(-50%);
}

/* wrapper main div */
.wrapper-main{
    position: relative;
    width: 1660px;
    height: 1040px;
    margin: 0 auto;
    transform: translateY(-50%);
    top: 50%;
    /* border: 1px solid #fdd365; */
}



/* background circle */

.main-div-bg{
    position: absolute;
    z-index: -1;
    left: -25%;
    top: -35%;
    width:1210px;
    height:1250px;
    border-radius: 50%;
}
.main-div-bg img{
    width: 100%;
    height: 100%;    
    border-radius: 50%;
}

/* header */
.wrapper-main header{
    width: 100%;
    height: 35px;
    /* border: 1px solid #fb8d62; */
    z-index: 10;
}
.main-header-ul{    
    width: 100%;
    height: 35px;
    list-style: none;
    /* border: 1px solid #fd2eb3; */
}
.main-header-ul li{    
    width: 65px;
    height: 100%;    
    /* border: 1px solid black; */
}
.main-header-ul li:nth-child(1){    
     float: left;
}
.main-header-ul li:not(:nth-child(1)){    
     float: right;
     text-align: center;
     font-size: 27px;
}
.main-header-ul li:not(:nth-child(2n-1)){
    cursor: pointer;
}
.main-header-ul li .fa-circle{
    font-size: 8px;
}
.main-header-ul li img{
    width: 80px;
    height: 35px;
}

/* section */
.main-section{
    width: 100%;
    height: 94%;
    /* border: 1px solid red; */
    display: flex;
}

/* article box left*/
.main-section article{
    flex: 1;    
    height: 100%;
    /* border: 1px solid #413c69; */
}
.main-section article:first-child{
    position: relative;
    width: 500px;
    height: 51%;
    top: 51%;
    transform: translateY(-50%);        
}
.main-section article:first-child div{    
    width: 100%;
    text-align: left;
    /* border: 1px red solid; */
}

.main-section article:first-child div:first-child p:nth-child(1){
    font-size: 30px;
}
.main-section article:first-child div:nth-child(2) {    
    margin-top: 5.2%;
}
.main-section article:first-child div:nth-child(2) p{    
    font-size: 40px;
    font-weight: bold;
}
.main-section article:first-child div:nth-child(3){
    margin-top: 5.2%;
}
.main-section article:first-child div:nth-child(3) p{
    margin-top: 2%;
    font-size: 16px;
    opacity: 0.65;    
}
.main-section article:first-child div:nth-child(4){
    margin-top: 6.5%;
}

/* 시작하기 button */
.main-btn-start{
    width: 320px;
    height: 82px;
    border-radius: 20px;
    background: #ffc862;
    color: white;
    font-size: 25px;
    border: none;
    font-weight: bold;    
    cursor: pointer;
}

/* article box right*/
.main-section article:last-child img{
    position: relative;
    top: 22%;
    z-index: -2;
    
}
/* main footer */
.main-footer{
    width: 100%;
    height: 2%;
    /* border: 1px solid #eab9c9; */
}
.main-footer p{
    color: #3b3b3b;
    opacity: 0.65;
}


</style>
<body>
    <div class="main-body main-kor">
        <div class="wrapper-main">    
            <div class="main-div-bg">
                <img src="resources/images/index/main_circle.png" alt="circle-grad">
            </div>
            <header>
                <ul class="main-header-ul main-eng">
                    <li><img src="resources/images/index/logo_black.png" alt=""></li>
                    <li id="joinbutton">join</li>
                    <li><i class="fas fa-circle"></i></li>
                    <li id="loginbutton">login</li>
                </ul>
            </header>
            <section class="main-section">
                <article>
                    <div><p>나와 관심사가 같은 친구,</p></div>                    
                    <div><p><img src="resources/images/index/logo_black.png" 
                    		style="width:115px; height:50px;" alt=""> 에서 만나보세요</p></div>                    
                    <div>
                    	<a href="${pageContext.request.contextPath }/main/mainPage.do">메인페이지</a>
                    	<a href="${pageContext.request.contextPath }/admin/adminPage.do">관리자페이지</a>
                        <p>회원님의 관심사에 맞는 친구모임을</p>
                        <p>찾아보세요. 나와 같은 취미의 친구들과</p>
                        <p>즐거운 시간을 if we에서 보내보세요.</p>
                    </div>                    
                    <div><button type="button" class="main-btn-start" id="startbutton">시작하기</button></div>                                                                                
                </article>
                <article>
                    <img src="resources/images/index/main_img_03.png" alt="">                    
                </article>
            </section>
            <footer class="main-footer">
                <p>if we us</p>
            </footer>
        </div>
    </div>
	
	<div class="back">
        <div class="login-container" id="login-container-first">
            <div class="login-container-box">
				<form action="${pageContext.request.contextPath }/member/login.do" method="post">
                <div class="login-title">
                    <p>로그인</p>
                </div>
                <div class="login-input">
                    <i class="far fa-user"></i> <input class="input-box" type="text" name="memberId" id="userid" placeholder="아이디" value="<c:if test='${not empty cookie.storedCookie.value }'>${cookie.storedCookie.value}</c:if>"><!-- 아이디 저장 코드 구현 0320-->
                </div>
                <div class="login-input">
                    <i class="fas fa-lock"></i> <input class="input-box" type="password" name="password" id="password" placeholder="비밀번호" >
                </div>
                <div class="login-extra">
                    <span id="search-id-pwd-button">아이디 | 비밀번호 찾기</span> <div class="saveid-container"><input type="checkbox" name="saveid" id="saveid" <c:if test='${not empty cookie.storedCookie.value }'>checked</c:if> ><label for="saveid">아이디 저장</label></div>
                </div>
                  <input type="submit" class="loginbutton" value="로그인" />
                <div class="login-naver-box">
                    <button id="naver"></button>
                </div>
				</form>
                <div class="login-register">
                    <p>아직 회원이 아니신가요?</p> <button id="register" onclick="location.href='${pageContext.request.contextPath}/member/enroll.do'">회원가입</button> 
                </div>
            </div> 
            
        </div>
        
 <!-- 아이디 비번 찾기 div 시작 -->
 
        <div class="login-container" id="search-id-pwd-container" >
            <div class="login-container-box" id="search-id-pwd-container-box">
                <div class="search-title">
                	<ul>
                		<li id="li-id-search" style="margin-right:20%;margin-left:5%;">아이디찾기</li>
                		<li id="li-pwd-search" style="margin-left:10%;">비밀번호찾기</li>
                	</ul>
                </div>
                <hr />
 
 <!-- 아이디 찾기 div 시작-->
               <div class="search-id-div" id="search-id-div">
	                <div class="login-input">
	                	<i class="far fa-user"></i> 
	                	<input class="input-box" type="text" name="memberName" id="userid" placeholder="이름입력">
	                </div>
	                <div class="login-input">
	                	<i class="fas fa-birthday-cake index-i-class"></i>
	                	<input class="input-box" type="text" name="birthday" id="userid" placeholder="생년월일">
	                </div>
	                <div class="login-input">
	                	<i class="fas fa-phone-alt index-i-class"></i>
	                	<input class="input-box" type="text" name="birthday" id="userid" placeholder="전화번호">
	                	<input type="button" value="인증번호받기" class="index-search-btn" id="search-id-btn-num"/>
	                </div>
	                 <div class="search-number-container" id="search-number-container-id" >
		                 <div class="search-title">
		                    <p>인증번호</p>
		                 </div>
		                 <div class="number-input">
		                 	<i class="fas fa-mobile-alt index-i-class"></i>
		                 	<input class="input-box" type="text" name="birthday" id="userid" placeholder="인증번호">	
		                 	<input type="button" value="확인" class="index-search-btn" id="search-btn-check"/>	
		                 </div>
	                 </div>
               </div>
 <!-- 아이디 찾기 div 끝 -->
 
 
 <!-- 비밀번호 찾기 div 시작 -->
 				<div class="search-id-div" id="search-pwd-div">
	                <div class="login-input pwd-input">
	                	<i class="fas fa-id-card index-i-class"></i> 
	                	<input class="input-box" type="text" name="memberName" id="userid" placeholder="아이디입력">
	                </div>
	                <div class="login-input pwd-input">
	                	<i class="far fa-user"></i> 
	                	<input class="input-box" type="text" name="memberName" id="userid" placeholder="이름입력">
	                </div>
	                <div class="login-input pwd-input">
	                	<i class="fas fa-birthday-cake index-i-class"></i>
	                	<input class="input-box" type="text" name="birthday" id="userid" placeholder="생년월일">
	                </div>
	                <div class="login-input pwd-input">
	                	<i class="fas fa-phone-alt index-i-class"></i>
	                	<input class="input-box" type="text" name="birthday" id="userid" placeholder="전화번호">
	                	<input type="button" value="인증번호받기" class="index-search-btn" id="search-pwd-btn-num"/>
	                </div>
	                
	                 <div class="search-number-container" id="search-number-container-pwd">
		                 <div class="search-title">
		                    <p>인증번호</p>
		                 </div>
		                 <div class="number-input">
		                 	<i class="fas fa-mobile-alt index-i-class" ></i>
		                 	<input class="input-box" type="text" name="birthday" id="userid" placeholder="인증번호">	
		                 	<input type="button" value="확인" class="index-search-btn" id="search-btn-check"/>	
		                 </div>
	                 </div>
               </div>
  <!-- 비밀번호 찾기 div 끝 -->

 
            </div> 
        </div>
        
  <!-- 아이디 비번 찾기 div 끝 -->
        
    </div>
	<style>
	.index-i-class{
		color:#cecece;font-size:25px;padding:2%;
	}
	.pwd-input{
		margin-top:60px;
	}
		.search-title li{
			display:inline-block;
			font-size:20px;
			margin-top:10%;
			margin-bottom:4%;
			
		}
		.index-search-btn{
			width:100px;height:40px;	
			background-color:#ebebeb;
			border:0;
			border-radius:20px;
			position:absolute;cursor:pointer;left:56%;
		}
		.search-title{
			font-size:20px;
			margin-top:10%;
		}
		.number-input{
			width: 100%;
		    height: 50px;
		    margin-top: 5%;
		    margin-bottom: 10px;
		    font-size: 14pt;
		    border-bottom: 1px solid #ebebeb;	
		}
	</style>
	

</body>
</html>
