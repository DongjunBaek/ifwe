<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/mainInclude.jsp">
	<jsp:param value="소모임 검색" name="pageTitle"/>
</jsp:include>
<style>
/* section{
	width:1580px;
} */
.classify-menu{
	color:white;
}
</style>
<script>
$(function(){
    $("#search").selectric();

    $("#cate-Classify div").click(function(){

        $("#cate-Classify div").css("background-color","#beceea");
        $(this).css("background-color","#2756a6");

    });
    
    $("#goclub").click(function(){
    	location.href="${pageContext.request.contextPath }/club/clubMain.do";
    });
    
	$(".friend-name-profile").click(function(){
		location.href="${pageContext.request.contextPath }/member/profile.do"
	});
    
    
});

</script>
	    <section>
            <div class="wrapper-right container-clubsearch">
                <div class="search-box">
                    <div class="select-box">
                        <select name="search" id="search">
                            <option value="">전체</option>
                            <option value="">지역별</option>
                            <option value="">모임명</option>
                        </select>
                    </div>
                    <div class="searh-icon">
                        <i class="fas fa-search"></i>
                    </div>
                        <input type="text" name="club-search" id="club-search"
                                placeholder="검색어를 입력하세요">
    
                </div>
                <p class="cate-title font-hk">스터디</p>
                <div class="cate-Classify" id="cate-Classify">
                    <div class="classify-menu-box"><p class="classify-menu font-hk">#영어모임</p></div>
                    <div class="classify-menu-box"><p class="classify-menu font-hk">#영어모임</p></div>
                    <div class="classify-menu-box"><p class="classify-menu font-hk">#영어모임</p></div>
                    <div class="classify-menu-box"><p class="classify-menu font-hk">#영어모임</p></div>
    
                </div>
                <div class="card-wrapper">
                    <div class="card-container">
                        <div class="club-img">
                        	<img src="${pageContext.request.contextPath }/resources/upload/club/maintitleimg/ex1.jpg" alt="" />
                        </div>
                        <div class="club-leader">
                        	<img src="${pageContext.request.contextPath }/resources/upload/member/frofileimg/ex2.jpg" alt="" />
                        </div>
                        <div class="information-container">
                            <p class="club-leader-name font-hk friend-name-profile">@wingStudy_02</p>
                            <p class="club-name-search font-hk">윙스터디 모임</p>
                            <p class="club-location font-hk"><i class="fas fa-map-marker-alt"></i> 서울,경기</p>
    
                            <div class="information-box">
                                <br>
                                <p class="people-title font-hk">정원수</p>
                                <span class="information-fontsize">23</span>/25
                            </div>
                            <div class="information-box">
                                    <br>
                                    <p class="people-title font-hk">남여비율</p>
                                    <span class="information-fontsize">23</span>
                                    <span class="information-fontsize2">:</span>
                                    <span class="information-fontsize3">4</span>
                            </div>
                            <div class="information-box lastbox">
                                    <br>
                                    <p class="people-title font-hk">평균나이</p>
                                    <span class="information-fontsize">28세</span>
                            </div>
                            <button class="information-botton font-hk" id="goclub">자세히 보기</button>
                        </div>
                    </div>
                    <div class="card-container">
                    </div>
                    <div class="card-container">
                        
    
                    </div>
    
                </div>
    
            </div>
    </section>

</body>
</html>