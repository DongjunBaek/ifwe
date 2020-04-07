<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Club Management</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/club/clubinclude.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/club/clubmanagement.css">
<script src="https://kit.fontawesome.com/5e1e16b3f4.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Fredoka+One&display=swap" rel="stylesheet">
<script>
$(function(){
	$("#mng-enroll").click(function(){
		$("[name=mngEnrollFrm]").submit();
		
	});
	$("#mng-member").click(function(){
		location.href="${pageContext.request.contextPath}/club/mngmember.do";
	});
	$("#mng-clubinfo").click(function(){
		location.href="${pageContext.request.contextPath}/club/mngclubinfo.do?clubCode=${club.clubCode}";
	});
	$("#mng-board").click(function(){
		location.href="${pageContext.request.contextPath}/club/mngboard.do";
	});
	
	$("#mng-report").click(function(){
		location.href="${pageContext.request.contextPath}/club/mngreport.do?clubCode=${club.clubCode}";
	});
	
	
	
	
	
});

</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/clubInclude.jsp"></jsp:include>
	<section class="flotclass">
         <div class="section-block">
             <div class="section-wrapper">
                 <p class="section-boradmenu">소모임 관리</p>
                 <div class="shc-premiumbox">
                     <p>프리미엄 사용중</p>
                 </div>
             </div>
         </div>
         
         <div class="shc-section-container">
         	<form action="${pageContext.request.contextPath}/club/mngenroll.do" method="POST" name="mngEnrollFrm">
         		<input type="hidden" name="clubMasterCode" value="${clubMaster.memberCode }"/>
         		<input type="hidden" name="clubCode" value= "${club.clubCode }"/>
             <div class="shc-section-leftbox shcbox" id="mng-enroll" data-clubMasterCode=${clubMaster.memberCode }>
                 <div class="shc-section-centerbox">
                     <div class="shc-section-boxline"></div>
                     <p class="shc-centerboxp1">가입요청</p>
                     <p class="shc-centerboxp2">내 소모임 가입요청 보러가기</p>
                     <i class="fas fa-chevron-right" style="font-size: 50px;"></i>
                 </div>
             </div>
         	</form>
             
             <div class="shc-section-rightbox shcbox" id="mng-member">
                 <div class="shc-section-centerbox">
                     <div class="shc-section-boxline"></div>
                     <p class="shc-centerboxp1">멤버 관리</p>
                     <p class="shc-centerboxp2">내 소모임 멤버 관리/조회</p>
                     <i class="fas fa-chevron-right" style="font-size: 50px;"></i>
                 </div>
                 
             </div>
             <div class="shc-section-leftbox shcbox" id="mng-clubinfo">
                 <div class="shc-section-centerbox">
                     <div class="shc-section-boxline"></div>
                     <p class="shc-centerboxp1">소모임 정보 수정</p>
                     <p class="shc-centerboxp2">내 소모임 배너 / 정보 변경</p>
                     <i class="fas fa-chevron-right" style="font-size: 50px;"></i>
                 </div>
             </div>
             
             <div class="shc-section-rightbox shcbox" id="mng-board">
                 <div class="shc-section-centerbox">
                     <div class="shc-section-boxline"></div>
                     <p class="shc-centerboxp1">게시판 관리</p>
                     <p class="shc-centerboxp2">내 소모임 게시판 추가/수정</p>
                     <i class="fas fa-chevron-right" style="font-size: 50px;"></i>
                 </div>
             </div>
             
               <div class="shc-section-leftbox shcbox" id="mng-report">
                 <div class="shc-section-centerbox">
                     <div class="shc-section-boxline"></div>
                     <p class="shc-centerboxp1">신고된 게시글 관리</p>
                     <p class="shc-centerboxp2">신고된 게시글 삭제 / 수정</p>
                     <i class="fas fa-chevron-right" style="font-size: 50px;"></i>
                 </div>
             </div>
             
         </div>
     </section>





</body>
</html>