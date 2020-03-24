<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<link rel="stylesheet" href="resources/css/main/index.css">
<script src="https://kit.fontawesome.com/226b55f414.js" crossorigin="anonymous"></script>

<c:if test="${not empty msg }">
<script>
	$(()=>{
		alert("${msg}");
	});
</script>
</c:if>
    
<c:if test="${not empty mav }">
<script>
	$(function(){
		console.log("!23123123");
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
	
	$(".searchId-result").css('display','none');
	$(".searchPwd-result").css('display','none');
	$("#uncorrect-pwd").css('display','none');
	
	$("#loginbutton").click(function(){
		$(".back").css("display","inline-block");
		$("#search-id-pwd-container").css('display','none');
		$("#search-number-container-pwd").css('display','none');
		$("#search-number-container-id").css('display','none');
	});
	
	$("#startbutton").click(function(){
		$(".back").css("display","inline-block");
		$("#search-number-container-pwd").css('display','none');
		$("#search-number-container-id").css('display','none');
		$("#search-id-pwd-container").css('display','none');
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
		$("[name=searchIdForm]").css('display','');
	});
	
	$("#li-pwd-search").click(function(){
		$(".searchPwd-result").css('display','none');
		$(".searchId-result").css('display','none');
		$("#search-pwd-div").css('display','block');
		$("#search-id-div").css('display','none');
		$("[name=searchPwdFrm]").css('display','');
		$("#search-number-container-id").css('display','none');
	});
	
	
	$("#li-id-search").click(function(){
		$(".searchPwd-result").css('display','none');
		$("[name=searchIdForm]").css('display','');
		$("#search-pwd-div").css('display','none');
		$("#search-id-div").css('display','block');
		$("#search-number-container-pwd").css('display','none');
		$(".searchId-result").css('display','none');
	});
	
	$("#search-id-btn-num").click(function(){
		$("#search-number-container-id").css('display','');
	});
	$("#search-pwd-btn-num").click(function(){
		$("#search-number-container-pwd").css('display','');
	});
	
	
	
	
	$("#search-btn-check-id").click(function(){
		if($("#memberName").val()==''){
			alert('이름을 입력해주세요.');
		}
		if($("#birthday").val()==''){
			alert('생년월일을 입력해주세요.');
		}
		if($("#phone").val()==''){
			alert('핸드폰 번호을 입력해주세요. ');
		}
		console.log("123");
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/member/searchId",
			data: $("[name=searchIdForm]").serialize(),
			success:data => {
				console.log(data);
				console.log(data.memberId);
				$("[name=searchIdForm]").css('display','none');
				$(".searchId-result-content").text(data.memberId);
				$(".searchId-result").css('display','');
				$("#memberName").val('');
				$("#phone").val('');
				$("#birthday").val('');
			
			},
			error:(xhr,status,error) =>{
				console.log(xhr,status,error);
			}
		});
	});
	
	
	
	$("#search-btn-check-pwd").click(function(){
		if($("#memberName_").val()==''){
			alert('이름을 입력해주세요.');
		}
		if($("#birthday_").val()==''){
			alert('생년월일을 입력해주세요.');
		}
		if($("#phone_").val()==''){
			alert('핸드폰 번호을 입력해주세요. ');
		}
		if($("#memberId").val()==''){
			alert('아이디 입력해주세요.');
		}
		if($("#memberName_").val()!='' && $("#birthday_").val()!='' && $("#phone_").val()!='' && $("#memberId").val()!=''){
			
		
		console.log("5845835803245");
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/member/searchPwd.do",
			data: $("[name=searchPwdFrm]").serialize(),
			success:data => {
				if(data == "") {
					alert('틀림');
					$("[name=searchPwdFrm]").css('display','');
					$(".searchPwd-result").css('display','none');
					$("#search-number-container-pwd").css('display','none');
					$("memberName_").val('');
					$("birthday_").val('');
					$("phone").val('');
					$("#memberId").val('');
				}
				else{
					console.log(data);
					console.log(data.memberId);
					console.log(data.memberPwd);
					$("#searchPwdAfterMemberId").val(data.memberId);
					$("[name=searchPwdFrm]").css('display','none');
					$(".searchPwd-result").css('display','');
					$("memberName_").val('');
					$("#memberId").val('');
					$("birthday_").val('');
					$("phone").val('');
				}
			
			},
			error:(xhr,status,error) =>{
				console.log(xhr,status,error);
				
			}
		});
	}
});
	
	
	
	$("#searchId-login-btn").click(function(){
		$(".searchId-result").css('display','none');
		$("#login-container-first").css('display','');
	});
	
	$("#password_chk").blur(function(){
		if($("#new-password").val() != $("#new-password_chk").val()){
			$("#uncorrect-pwd").css('display','');
		}
		else{
			$("#uncorrect-pwd").css('display','none');
		}
	});
	
	
	
});



</script>
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
 		<form name="searchIdForm" method="POST">
               <div class="search-id-div" id="search-id-div">
	                <div class="login-input">
	                	<i class="far fa-user"></i> 
	                	<input class="input-box" type="text" name="memberName" id="memberName" placeholder="이름입력">
	                </div>
	                <div class="login-input">
	                	<i class="fas fa-birthday-cake index-i-class"></i>
	                	<input class="input-box" type="text" name="birthday" id="birthday" placeholder="생년월일">
	                </div>
	                <div class="login-input">
	                	<i class="fas fa-phone-alt index-i-class"></i>
	                	<input class="input-box" type="text" name="phone" id="phone" placeholder="전화번호">
	                	<input type="button" value="인증번호받기" class="index-search-btn" id="search-id-btn-num"/>
	                </div>
	                 <div class="search-number-container" id="search-number-container-id" >
		                 <div class="search-title">
		                    <p>인증번호</p>
		                 </div>
		                 <div class="number-input">
		                 	<i class="fas fa-mobile-alt index-i-class"></i>
		                 	<input class="input-box" type="text" name="id-number" id="pd-number" placeholder="인증번호">	
		                 	<input type="button" value="확인" class="index-search-btn" id="search-btn-check-id"/>	
		                 </div>
	                 </div>
               </div>
 		</form>
 		<div class="searchId-result">
 			<div class="searchId-result-title">내 아이디는</div>
 			<div class="searchId-result-content bold-kor"> </div>
 			<span class="font-kor" style="font-size:25px;"> 입니다.</span>
 			<input type="button" value="로그인하러가기" class="loginbutton" id="searchId-login-btn" style="margin-top: 32%;"/>
 			
 		</div>
 <!-- 아이디 찾기 div 끝 -->
 
 <!-- 비밀번호 찾기 div 시작 -->
 	<form name="searchPwdFrm" method="POST">
 				<div class="search-id-div" id="search-pwd-div">
	                <div class="login-input pwd-input">
	                	<i class="fas fa-id-card index-i-class"></i> 
	                	<input class="input-box" type="text" name="memberId" id="memberId" placeholder="아이디입력">
	                </div>
	                <div class="login-input pwd-input">
	                	<i class="far fa-user"></i> 
	                	<input class="input-box" type="text" name="memberName_" id="memberName_" placeholder="이름입력">
	                </div>
	                <div class="login-input pwd-input">
	                	<i class="fas fa-birthday-cake index-i-class"></i>
	                	<input class="input-box" type="text" name="birthday_" id="birthday_" placeholder="생년월일">
	                </div>
	                <div class="login-input pwd-input">
	                	<i class="fas fa-phone-alt index-i-class"></i>
	                	<input class="input-box" type="text" name="phone_" id="phone_" placeholder="전화번호">
	                	<input type="button" value="인증번호받기" class="index-search-btn" id="search-pwd-btn-num"/>
	                </div>
	                
	                 <div class="search-number-container" id="search-number-container-pwd">
		                 <div class="search-title">
		                    <p>인증번호</p>
		                 </div>
		                 <div class="number-input">
		                 	<i class="fas fa-mobile-alt index-i-class" ></i>
		                 	<input class="input-box" type="text" name="pwd-number" id="pwd-number" placeholder="인증번호">	
		                 	<input type="button" value="확인" class="index-search-btn" id="search-btn-check-pwd"/>	
		                 </div>
	                 </div>
               </div>
 	</form>
 	
 	<form action="${pageContext.request.contextPath }/member/searchPwdAfter" method="POST">
 		<input type="hidden" name="memberId" id="searchPwdAfterMemberId"/>
	 	<div class="searchPwd-result font-kor">
	 		<div class="searchId-result-title">변경하실 비밀번호를 입력해주세요.</div>
	 		<div class="login-input">
	           	<i class="fas fa-lock"></i> <input class="input-box" type="password" name="new-password" id="new-password" placeholder="새 비밀번호" >
	        </div>
	        <div class="login-input">
	            <i class="fas fa-lock"></i> <input class="input-box" type="password" name="new-password_chk" id="new-password_chk" placeholder="새 비밀번호 확인" >
	            <p id="uncorrect-pwd">비밀번호와 비밀번호 확인이 다릅니다.</p>
	        </div>
	        
	        <input type="submit" value="확인" id="searchPwd-btn" class="loginbutton"/>
	        
	 	</div>
 	</form>
 	
 	<style>
 		.searchPwd-result{height:300px;margin-top:20%;}
 		#uncorrect-pwd{color:red;margin-top:7%;}
 	</style>
  <!-- 비밀번호 찾기 div 끝 -->

 
            </div> 
        </div>
        
  <!-- 아이디 비번 찾기 div 끝 -->
        
    </div>
	
	

</body>
</html>
