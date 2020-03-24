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

           <div class="shc-section-memberlist-container">
               <p>가입요청</p>
               <div class="shc-section-friendbox">
                   <table class="shc-friendtable">
                       <tr>
                           <td><i class="fas fa-bell"></i></td>
                           <td><a href="#">김원재 님에게 가입요청이 왔습니다</a></td>
                       </tr>
                       <tr>
                           <td><i class="fas fa-bell"></i></td>
                           <td><a href="#">김원재 님에게 가입요청이 왔습니다</a></td>
                       </tr>
                       <tr>
                           <td><i class="fas fa-bell"></i></td>
                           <td><a href="#">김원재 님에게 가입요청이 왔습니다</a></td>
                       </tr>
                       <tr>
                           <td><i class="fas fa-bell"></i></td>
                           <td><a href="#">김원재 님에게 가입요청이 왔습니다</a></td>
                       </tr>
                       <tr>
                           <td><i class="fas fa-bell"></i></td>
                           <td><a href="#">김원재 님에게 가입요청이 왔습니다</a></td>
                       </tr>
                   </table>
               </div>
           </div>
       </section>




</body>
</html>