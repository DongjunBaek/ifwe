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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/club/clubmngenroll.css">
<script src="https://kit.fontawesome.com/5e1e16b3f4.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Fredoka+One&display=swap" rel="stylesheet">
<script>
	$(function(){
		$(".memberEnrollMessage").click(function(){
			let msgCode = $(this).attr("data-msg_code");
			console.log(msgCode);
			location.href = "${pageContext.request.contextPath}/club/mngenrollend.do?msg_code="+msgCode;
		});
	})
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/clubInclude.jsp"></jsp:include>
     <section class="flotclass">
           <div class="section-block">
               <div class="section-wrapper">
                   <p class="section-boradmenu">소모임 관리</p>
                   <c:if test="${club.premiumCode == null }">
                
                 </c:if>
                 <c:if test="${club.premiumCode == 'premium' }">
                 <div class="shc-premiumbox">
                     <p>프리미엄 사용중</p>
                 </div>
                 </c:if>
                 <c:if test="${club.premiumCode == 'gold' }">
                 <div class="shc-premiumbox">
                     <p>골드 사용중</p>
                 </div>
                 </c:if>
                 <c:if test="${club.premiumCode == 'sliver' }">
                 <div class="shc-premiumbox">
                     <p>골드 사용중</p>
                 </div>
                 </c:if>
               </div>
           </div>

           <div class="shc-section-memberlist-container">
               <p>가입요청</p>
               <div class="shc-section-friendbox">
               	<c:if test="${not empty msgList}">
                   <table class="shc-friendtable">
               	<c:forEach items="${msgList }" var="list">
                       <tr>
                           <td><i class="fas fa-bell"></i></td>
                           <td><p class="memberEnrollMessage" data-msg_code=${list.msgCode }> ${list.memberName } 님에게 가입요청이 왔습니다</p></td>
                       </tr>
               	</c:forEach>
                   </table>            
               	</c:if>
               </div>
           </div>
       </section>




</body>
</html>