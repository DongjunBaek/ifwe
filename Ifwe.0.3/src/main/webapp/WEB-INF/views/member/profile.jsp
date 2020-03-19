<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/mainInclude.jsp">
	<jsp:param value="프로필카드" name="pageTitle"/>
</jsp:include>
	<section class="profile-section">
        <div class="section-frofile-title">프로필</div>
        <div class="section-frofilecard-box">
            <div class="section-frofileimg">
                <img src="${pageContext.request.contextPath }/resources/upload/member/frofileimg/ex2.jpg" alt="">
            </div>
            <p class="frofile-id">@wingStudy_02</p>
            <p class="frofile-name">스테파니</p>
            <div class="section-friendbutton">친구요청</div>
        </div>
        <div class="section-frofileinfo-box">
            <div class="section-frofileinfo-wrapper">
                <ul>
                    <li><p>회원정보</p></li>
                    <p>생년월일:1999년1월20일</p>
                    <p>거주지:경기도 남양주시</p>
                    <p>성별:여</p>
                    <li><p>소개글</p></li>
                    <p>
		                        안녕하세요! 윙스터디 모임을 관리하고있는 스테파니입니다. <br>
		                        저랑같이 영어공부해요!
		                        안녕하세요! 윙스터디 모임을 관리하고있는 스테파니입니다. <br>
		                        저랑같이 영어공부해요!
		                        안녕하세요! 윙스터디 모임을 관리하고있는 스테파니입니다. <br>
		                        저랑같이 영어공부해요!
                    </p>
                    <li><p>관심키워드</p></li>
                    <div class="hashtag-wrapper">
                        <div class="hashtag-box">#영어공부</div>
                        <div class="hashtag-box">#영어공부</div>
                        <div class="hashtag-box">#영어공부</div>
                        <div class="hashtag-box">#영어공부</div>
                    </div>
                </ul>
            </div>
        </div>
    </section>


</body>
</html>