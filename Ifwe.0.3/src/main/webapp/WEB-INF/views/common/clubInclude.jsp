<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<script>
$(function(){
    $("#nav-arrowicon").click(function(){
        $("#nav-mypagebox").slideToggle(300);
    });

    $(window).scroll(function(event){
    if(jQuery(window).scrollTop() > jQuery(".aside-scroll-box").offset().top) {
    jQuery("#aside-scroll").css("position", "absolute").css("top",jQuery(window).scrollTop());
    }
    else if((jQuery(window).scrollTop() < jQuery(".aside-scroll-box").offset().top)) {
    jQuery("#aside-scroll").css("position", "static");
    }
    });
    
    $("#mypagebutton").click(function(){
    	location.href="${pageContext.request.contextPath }/member/mypage.do?memberId=${memberLoggedIn.memberId}";
    });
    
    $(".logo-box").click(function(){
    	location.href="${pageContext.request.contextPath }/main/mainPage.do";
    })
    
    $("#enrollbutton").click(function(){
    	location.href="${pageContext.request.contextPath }/club/enroll.do";
    });
	
	$("#managementbutton").click(function(){
		location.href="${pageContext.request.contextPath }/club/management.do";
	});
    
	
})

</script>

 <div class="wrapper">
        <nav>
            <div class="nav-container">
                <div class="logo-box"></div>
                <div class="nav-content-right">
                    <div class="nav-right-icon2">
                        <i class="fas fa-bell" style="font-size:35px;"></i>
                    </div>
                    <div class="nav-right-icon1" id="nav-arrowicon">
                        <i class="fas fa-sort-down fa-2x"></i>
                    </div>
                    <div class="nav-clubimg">
						<img src="${pageContext.request.contextPath }/resources/upload/profile/${memberLoggedIn.profileImgRe}" alt="" />
                    </div>
                        <div class="nav-right-leader">

                            <p>@ ${memberLoggedIn.memberId }</p>
                            <p>${memberLoggedIn.memberName} 님</p>
                        </div>
                </div>
            </div>
            <div class="nav-myfrofile-box" id="nav-mypagebox">
                <p id="mypagebutton">마이페이지</p>
                <div class="nav-box-line"></div>
                <p id="logoutbutton">로그아웃</p>
            </div>
        </nav>
        <div class="wrapper-content">
            <aside class="flotclass">
                <div class="aside-icon-arrow">
                </div>
                <div class="aside-leader-img">
                	<img src="${pageContext.request.contextPath }/resources/upload/profile/${clubMaster.profileImgRe}" alt="" />
                </div>
                <div class="aside-leader-information">
                    <i class="fas fa-crown" style="font-size:20pt;"></i>
                    <p class="aside-leader-allias friend-name-profile">${clubMaster.profileName }</p>
                    <p class="aside-leader-id">@ ${clubMaster.memberId }</p>
                </div>

                <c:if test="${clubMaster.memberCode == memberLoggedIn.memberCode}">
                <div class="aside-join" id="managementbutton">
                    <p>관리하기</p>
                </div>
                </c:if>

                <c:if test="${clubMaster.memberCode != memberLoggedIn.memberCode}">
                <c:forEach items="${clubMember }" var="var">
                <c:if test="${var.memberCode != memberLoggedIn.memberCode }">
                <div class="aside-join" id="enrollbutton">
                    <p>가입하기</p>
                </div>
                </c:if>
                
                <c:if test="${var.memberCode == memberLoggedIn.memberCode }">
                <div class="aside-member-container">
                	<c:if test="${memberLoggedIn.memberGender=='F' }">
                   	<i class="fas fa-female" style="color:#fe4646"></i>
                   	</c:if>
                   	<c:if test="${memberLoggedIn.memberGender=='M' }">
                   	<i class="fas fa-male" style="color:#2756a6 "></i>
                   	</c:if>
                   	<div class="aside-member-box">
                   	<p>${memberLoggedIn.profileName }</p><i class="fas fa-cog"></i>
                   	<span>${memberLoggedIn.memberId }</span>
                   	</div>
                </div>
                </c:if>
                
                </c:forEach>
                </c:if>
                
                
         <div class="aside-scroll-box">
          	<div id="aside-scroll">
                <div class="aside-boardmenu">
                <ul>
                	<li>
                		<i class="fas fa-circle" style="font-size: 10px;color:#ffc862"></i>
						<span><a href="${pageContext.request.contextPath }/club/clubMain.do?clubCode=${club.clubCode}">전체보기</a></span>
                	</li>
                	<li>
                      <i class="fas fa-circle" style="font-size: 10px;color:#ffc862"></i>
						<span><a href="${pageContext.request.contextPath }/club/notice.do">공지사항</a></span>
                	</li>
                	<li>
                        <i class="fas fa-circle" style="font-size: 10px;color:#ffc862"></i>
						<span><a href="${pageContext.request.contextPath }/club/calendar.do">일정캘린더</a></span>
                	
                	</li>
                   	<li>
                        <i class="fas fa-circle" style="font-size: 10px;color:#ffc862"></i>
						<span><a href="${pageContext.request.contextPath }/club/freeboard.do">자유게시판</a></span>
                   	</li>
                </ul>
                </div>
                <div class="aside-friend-box">
                    <div class="aside-friend-title">
                        <p>회원 목록</p><i class="fas fa-users"></i>
                    </div>
                    <div class="aside-friend-list">
                        <div class="aside-friend">
                        	<c:if test="${clubMaster.memberGender=='f' }">
                        	<i class="fas fa-female"></i>
                        	</c:if>
                        	<c:if test="${clubMaster.memberGender=='m' }">
                        	<i class="fas fa-male"></i>
                        	</c:if>
                            <span class="friendname friend-name-profile"><a href="${pageContext.request.contextPath }/profile/profileview.do?memberCode=${clubMaster.memberCode}">${clubMaster.profileName }</a></span>
                        </div>
                        <c:if test="${not empty clubMember }">
                        <c:forEach items="${clubMember }" var="cmember">
                        <div class="aside-friend">
                        	<c:if test="${cmember.memberGender=='f' }">
                        	<i class="fas fa-female"></i>
                        	</c:if>
                        	<c:if test="${cmember.memberGender=='m' }">
                        	<i class="fas fa-male"></i>
                        	</c:if>
                            <span class="friendname friend-name-profile"><a href="${pageContext.request.contextPath }/profile/profileview.do?memberCode=${cmember.memberCode}">${cmember.profileName}</a></span>
                        </div>
                        
                        </c:forEach>
                        </c:if>
                        
                        
                        
                        
                   </div>
              </div>
         </div>
     </div>



            </aside>
            <header class="flotclass">
                <div class="header-titleimg" style="background-image: url('${pageContext.request.contextPath }/resources/upload/club/maintitleimg/${club.clubImgRe}');">
                    <div class="header-titleimg-cover">
                        <div class="header-title-left">
                            <p class="header-title1">${club.clubTitle}</p>
                            <p class="header-title2">${club.clubContent }</p>
                        </div>
                        <div class="header-title-right">
                            <p>${club.clubLocation }</p>
                            <div class="header-location-icon">
                                <i class="fas fa-map-marker-alt" style="font-size: 30px;"></i>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="header-search-box">
                    <div class="header-icon">
                        <i class="fas fa-search" style="font-size:35px;"></i>
                    </div>
                        <input type="text" name="search" id="search" placeholder="검색어를 입력하세요">
                </div>
                
                
            </header>







