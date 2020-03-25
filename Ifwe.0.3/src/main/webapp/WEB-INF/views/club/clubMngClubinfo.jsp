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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/club/clubmngclubinfo.css">
<script src="https://kit.fontawesome.com/5e1e16b3f4.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Fredoka+One&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery.selectric.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/selectric.css">


<script>
$(function(){
	$("#locationselect").selectric();
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
        <form action="">
            <div class="shc-section-memberlist-container">
                <p>소모임 정보 수정</p>
                <div class="shc-section-clubinfobox">
                    <i class="fas fa-circle"></i>
                    <span>모임명</span><br>
                    <input type="text" name="" id="" class="clubnameinput">
                    <br>
                    
                    <i class="fas fa-circle"></i>
                    <span>소개글</span><br>
                    <input type="text" name="" id="" class="clubcontentinput">
                    <br>    
                    
                    <i class="fas fa-circle"></i>
                    <span>지역</span><br>
                    <div class="shc-selectbox">
                        <select name="" id="locationselect">
                            <option value="서울">서울시</option>
                            <option value="경기">경기도</option>
                            <option value="강원">강원도</option>
                            <option value="충북">충청북도</option>
                            <option value="충남">충청남도</option>
                            <option value="경북">경상북도</option>
                            <option value="경남">경상남도</option>
                            <option value="전북">전라북도</option>
                            <option value="전남">전라남도</option>
                            <option value="제주특별자치도">제주도</option>
                        </select>
                    </div>
                    <i class="fas fa-circle"></i>
                    <span>배너 이미지</span><br>
                    <input type="text" name="" id="" class="upfilename" readonly>
                    <input type="file" name="" id="upfile" class="upfileinput">
                    <label for="upfile" class="upfilelabel">파일첨부</label>
                    
                </div>
                
                <button type="button" class="clubinfo-savebutton">저장하기</button>
            </div>
            
        </form>
    </section>

</body>
</html>