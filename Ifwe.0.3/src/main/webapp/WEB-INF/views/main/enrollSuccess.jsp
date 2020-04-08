<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Enroll Success</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/enrollsuccess.css">
<script src="https://kit.fontawesome.com/5e1e16b3f4.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Fredoka+One&display=swap" rel="stylesheet">
</head>
<body>
	<div class="esc-allwrapper">
        <div class="esc-centerwrapper">
            <div class="esc-logobox">
                <img src="${pageContext.request.contextPath }/resources/images/main/logo.png" alt="">
            </div>
            <div class="esc-line"></div>
            <div class="esc-number">
                04
            </div>
            <p>마이프로필 등록하기</p>
            <div class="esc-centerimgbox">
                <div class="esc-center-img">
                    <img src="${pageContext.request.contextPath }/resources/images/main/pj.png" alt="">
                </div>
                <p class="firstp">회원가입에 성공하였습니다</p>
                <p class="secondp">마이프로필 등록 후 ifwe를 이용하세요</p>
                <button class="myprofilebtn" onclick="location.href='${pageContext.request.contextPath}/member/profileUpdate.do?memberCode=${memberLoggedIn.memberCode }'">마이프로필 등록하기</button>
            </div>
        </div>
    </div>






</body>
</html>