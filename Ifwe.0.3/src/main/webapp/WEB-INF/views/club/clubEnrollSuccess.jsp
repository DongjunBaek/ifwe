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
<script src="https://kit.fontawesome.com/5e1e16b3f4.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Fredoka+One&display=swap" rel="stylesheet">
<script>
$(function(){
	$("#mainpagebutton").click(function(){
		
		location.href="${pageContext.request.contextPath }/club/clubMain.do?clubCode="+${club.clubCode};
	});
	
	
	
	
});


</script>

</head>
<body>
<jsp:include page="/WEB-INF/views/common/clubInclude.jsp"></jsp:include>
    <section class="flotclass">
          <div class="section-block">
              <div class="section-wrapper">
                  <p class="section-boradmenu">가입하기</p>
              </div>
          </div>
          <div class="section-container">
              <div class="section-container-content">
                  <p>가입신청이 완료되었습니다</p>
                  <p>관리자 승인 후에 이용하실 수 있습니다</p>
                  <div class="section-homebutton" id="mainpagebutton">홈으로 가기</div>
              </div>
          </div>
      </section>


</body>
</html>