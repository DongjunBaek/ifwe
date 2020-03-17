<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Club Enroll</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/club/clubinclude.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/club/clubenroll.css">
<script src="https://kit.fontawesome.com/5e1e16b3f4.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Fredoka+One&display=swap" rel="stylesheet">
<script>
$(function(){
	
	$(".enrollbutton").click(function(){
		location.href="${pageContext.request.contextPath }/club/insert.do";		
		
		
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
        <div class="section-container-inputbox">
            <p>닉네임</p>
            <input type="text" name="memberallias" id="memberallias" value="스테파니" readonly>
            <p>가입 이유</p>
            <input type="text" name="enrollreason" id="enrollreason">
        </div>
        <div class="section-container-enrollbutton enrollbutton" id="enrollbutton">가입하기</div>

    </div>
</section>




</body>
</html>