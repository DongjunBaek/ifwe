<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/mainInclude.jsp">
	<jsp:param value="회원정보수정" name="pageTitle"/>
</jsp:include>
    <script>
    $(function(){
    	$(".update-li-p-class").next().css('display','none');
    	
    	$(".update-list-div li").hover(function(){
    		console.log($(this));
    		console.log($(this).children().next());
    		$(this).children().next().css('display','');
    	},function(){
    		$(this).children().next().css('display','none');
    	});
    	
    	$("#profile-update-btn").click(function(){
    		location.href = "${pageContext.request.contextPath}/member/updateProfile.do";
    	});
    
    	$(".update-password-span").click(function(){
    		location.href = "${pageContext.request.contextPath}/member/updatePassword.do";
    	});
    	
    	$("#phone-email-update-btn").click(function(){
    		location.href = "${pageContext.request.contextPath}/member/updateEmailPhone.do";
    	});
    });
    
    </script>
    
    

<section style="margin:0;">
 <!-- 왼쪽 2개 div 시작 -->
   <article class="update-first">
   		<div class="profile-update-div">
   			<div class="profile-update-div-in bold-kor">
   				<p>ifwe 프로필</p>
   			</div>
   			<div class="profile-img-div">
   				<img src="${pageContext.request.contextPath }/resources/images/club/ex2.jpg" alt=""/>
   			</div>
   			<div class="profile-nickname-div">
   				<div class="profile-nickname-div-title bold-kor">닉네임:</div>
   				<div class="profile-nickname-div-content">얄라얄라얄라셩</div>
   			</div>
   			<div class="profile-update-btn">
	   			<input type="button" value="프로필 수정" id="profile-update-btn" class="profile-update-btn-class" />
   			</div>
   		</div>	
   
   <div class="profile-update-div-list">
   		<div class="profile-update-div-in bold-kor">
   			<p>내 소모임 목록</p>
   		</div>
   		<div class="update-list-div">
   			<ul class="mypage-p-class" style="color:#2756a6">
   				<li><span class="update-li-p-class">윙스터디 모임1</span><i class="far fa-times-circle update-li-i-class"></i></li>
   				<li><span class="update-li-p-class">윙스터디 모임2</span><i class="far fa-times-circle update-li-i-class" style="color:#cbcbcb"></i></li>
   				<li><span class="update-li-p-class">윙스터디 모임3</span><i class="far fa-times-circle update-li-i-class" style="color:#cbcbcb"></i></li>
   			</ul>
   		</div>

   		
   		</div>	
    <!-- 왼쪽  2개 div  끝 -->
        
    </article>
    
    <!-- 오른쪽 2개 div 시작-->

    <article class="update-second">
   		<div class="profile-update-div">
   			<div class="profile-update-div-in bold-kor">
   				<p>연락처</p>
   			</div>
   			<div class="phone-email-container">
   				<div class="update-titles">
		   			<div class="phone-number-title bold-kor">휴대전화</div>
		   			<div class="email-title bold-kor">이메일</div>
   				</div>
	   			<div class="update-contents">
		   			<div class="phone-number-content"><%-- ${memberLoggedIn.memberPhone } --%> 010-3594-4957</div>
		   			<div class="email-content"> ${memberLoggedIn.memberEmail }</div>
	   			</div>
	   			
   			</div>
	   			<div class="profile-update-btn">
	   			<input type="button" value="수정" id="phone-email-update-btn" class="profile-update-btn-class" />
   			</div>
   		</div>	
   
   <div class="profile-update-div" style="height:400px;margin-bottom:0;">
		<div class="profile-update-div-in bold-kor">
   			<p>비밀번호</p>
   		</div>
   		<div class="update-password-info">
   			<span>
   				ifwe 로그인 시 사용하는 <span style="color:red">비밀번호를 변경</span>할 수 있습니다. <br />
   				주기적인 비밀번호 변경을 통해 개인정보를 안전하게 보호하세요. 
   			</span>
   		</div>
   		<div class="phone-email-container">
   			<div class="update-titles">
   				<div class="email-title bold-kor">비밀번호</div>
   			</div>
   			<div class="update-contents">
		   		<div class="email-content"> <span class="bold-kor update-password-span" style="color:black;">변경하기</span> </div>
	   		</div>
   		</div>
   	</div>	
   	
   	<div class="delete-member bold-kor">
   		<span>ifwe를 더이상 이용하지 않는다면 </span><a href="${pageContext.request.contextPath }/member/deleteMember.do" style="color:red;">회원탈퇴 바로가기 ></a>
   	</div>
   	
    </article>
    <style>
    .delete-member{height:30px;font-size:16px;margin-top:3%;margin-left:38%;}
    </style>
     <!-- 오른쪽 2개 div 끝-->
</section>
</body>
</html>