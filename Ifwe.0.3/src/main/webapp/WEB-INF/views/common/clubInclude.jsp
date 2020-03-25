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
    	location.href="${pageContext.request.contextPath }/member/mypage.do";
    });
    
    $(".logo-box").click(function(){
    	location.href="${pageContext.request.contextPath }/main/mainPage.do";
    })
    
    $("#enrollbutton").click(function(){
    	location.href="${pageContext.request.contextPath }/club/enroll.do";
    });
    
    $("#calendarbutton").click(function(){
    	location.href="${pageContext.request.contextPath }/club/calendar.do";
    });
    
    $("#freeboardbutton").click(function(){
    	location.href="${pageContext.request.contextPath }/club/freeboard.do";
    });
    
    $("#noticebutton").click(function(){
    	location.href="${pageContext.request.contextPath }/club/notice.do";
    });
    
	$(".friend-name-profile").click(function(){
		location.href="${pageContext.request.contextPath }/member/profile.do";
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
						<img src="${pageContext.request.contextPath }/resources/upload/member/frofileimg/ex2.jpg" alt="" />
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
                        <i class="fas fa-arrow-left" style="font-size:40px;"></i>
                </div>
                <div class="aside-leader-img">
                	<img src="${pageContext.request.contextPath }/resources/upload/member/frofileimg/ex2.jpg" alt="" />
                </div>
                <div class="aside-leader-information">
                    <p class="aside-leader-allias friend-name-profile">${clubMaster.memberName }</p>
                    <i class="fas fa-crown" style="font-size:20pt;"></i>
                    <p class="aside-leader-id">@ ${clubMaster.memberId }</p>
                </div>
                <c:if test="${clubMaster.memberCode != memberLoggedIn.memberCode}">
                <div class="aside-join" id="enrollbutton">
                    <p>가입하기</p>
                </div>
                </c:if>
                <c:if test="${clubMaster.memberCode == memberLoggedIn.memberCode}">
                <div class="aside-join" id="managementbutton">
                    <p>관리하기</p>
                </div>
                </c:if>
                
         <div class="aside-scroll-box">
          	<div id="aside-scroll">
                <div class="aside-boardmenu">
                        <p id="noticebutton"><i class="fas fa-circle" style="font-size: 10px;color:#ffc862"></i>&nbsp;&nbsp;&nbsp;공지사항</p>
                        <p id="calendarbutton"><i class="fas fa-circle" style="font-size: 10px;color:#ffc862"></i>&nbsp;&nbsp;&nbsp;일정캘린더</p>
                        <p id="freeboardbutton"><i class="fas fa-circle" style="font-size: 10px;color:#ffc862"></i>&nbsp;&nbsp;&nbsp;자유게시판</p>
                </div>
                <div class="aside-friend-box">
                    <div class="aside-friend-title">
                        <p>회원 목록</p>
                        <div class="aside-friend-count"><p>${club.clubCurrent}명</p></div>
                    </div>
                    <div class="aside-friend-list">
                        <div class="aside-friend">
                            <div class="fried-profileimg">
                            	<img src="${pageContext.request.contextPath }/resources/upload/member/frofileimg/ex2.jpg" alt="" />
                            </div>
                            <p class="friendname friend-name-profile">김원재</p>
                        </div>
                        <div class="aside-friend">
                            <div class="fried-profileimg">
                            	<img src="${pageContext.request.contextPath }/resources/upload/member/frofileimg/ex2.jpg" alt="" />
                            </div>
                            <p class="friendname friend-name-profile">김원재</p>
                        </div>
                        <div class="aside-friend">
                            <div class="fried-profileimg">
                            	<img src="${pageContext.request.contextPath }/resources/upload/member/frofileimg/ex2.jpg" alt="" />
                            </div>
                            <p class="friendname friend-name-profile">김원재</p>
                        </div>
                        <div class="aside-friend">
                            <div class="fried-profileimg">
                            	<img src="${pageContext.request.contextPath }/resources/upload/member/frofileimg/ex2.jpg" alt="" />
                            </div>
                            <p class="friendname friend-name-profile">김원재</p>
                        </div>
                        <div class="aside-friend">
                            <div class="fried-profileimg">
                            	<img src="${pageContext.request.contextPath }/resources/upload/member/frofileimg/ex2.jpg" alt="" />
                            </div>
                            <p class="friendname friend-name-profile">김원재</p>
                        </div>
                        <div class="aside-friend">
                            <div class="fried-profileimg">
                            	<img src="${pageContext.request.contextPath }/resources/upload/member/frofileimg/ex2.jpg" alt="" />
                            </div>
                            <p class="friendname friend-name-profile">김원재</p>
                        </div>
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







