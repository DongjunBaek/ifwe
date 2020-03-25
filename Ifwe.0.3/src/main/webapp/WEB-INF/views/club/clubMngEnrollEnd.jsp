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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/club/clubmngenrollend.css">
<script src="https://kit.fontawesome.com/5e1e16b3f4.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Fredoka+One&display=swap" rel="stylesheet">

</head>
<body>
<jsp:include page="/WEB-INF/views/common/clubInclude.jsp"></jsp:include>
     <section class="flotclass">
         <div class="section-block">
             <div class="section-wrapper">
                 <p class="section-boradmenu">가입요청</p>
             </div>
         </div>

         <div class="shc-section-container">
             <div class="shc-section-centerbox">
                 <div class="shc-enrollmemberimg">
                     <img src="#" alt="">
                 </div>
                 <div class="shc-enrollmemberinfo">
                     <p class="enroll-date">2020-03-11</p>
                     <p class="enroll-name">스테파니</p>
                     <p class="enroll-id">@wingStudy_02</p>
                 </div>

                 <p>가입 메세지</p>
                 <div class="shc-enroll-content"></div>
             </div>
         </div>
         <div class="enrollbtn-div">
             <input type="button" value="가입수락" class="enrollbtn">
         </div>
     </section>

</body>
</html>