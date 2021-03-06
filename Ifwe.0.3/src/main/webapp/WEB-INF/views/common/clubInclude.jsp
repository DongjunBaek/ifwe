<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<style>
#masterIdInclude{
	width: 100%;
}
</style>
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
    	location.href="${pageContext.request.contextPath }/member/mypage.do?memberCode=${memberLoggedIn.memberCode}";
    });
    
    $(".logo-box").click(function(){
    	location.href="${pageContext.request.contextPath }/main/mainPage.do?memberCode=${memberLoggedIn.memberCode}";
    })
    
    $("#enrollbutton").click(function(){
    	location.href="${pageContext.request.contextPath }/club/enroll.do";
    });
	
	$("#managementbutton").click(function(){
		location.href="${pageContext.request.contextPath }/club/management.do";
	});
	$("#logoutbutton").click(function(){
		location.href="${pageContext.request.contextPath }/member/logout.do";
	});
    $(".aside-member-container").click(function(){
    	location.href="${pageContext.request.contextPath }/club/secession.do";
    });
    
    $(".nav-right-icon2").click(function(){
 	   location.href = "${pageContext.request.contextPath}/member/mypage.do?memberCode=${memberLoggedIn.memberCode}";
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
                        <c:if test="${msgCount!=0 }">
                    	<span class="bell-count">${msgCount }</span>
                    </c:if>
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
                    <p class="aside-leader-allias friend-name-profile" id="masterIdInclude" style="margin:0;">${clubMaster.profileName }</p>
                    <p class="aside-leader-id">@ ${clubMaster.memberId }</p>
                </div>

                <c:if test="${clubMaster.memberCode == memberLoggedIn.memberCode}">
                <div class="aside-join" id="managementbutton">
                    <p>관리하기</p>
                </div>
                </c:if>
				
				<c:if test="${clubLoggedIn.clubGrade == null}">
                <div class="aside-join" id="enrollbutton">
                    <p>가입하기</p>
                </div>
				</c:if>
                
                <c:if test="${clubLoggedIn.clubGrade == 'member' || clubLoggedIn.clubGrade == 'nm' }">
                <div class="aside-member-container">
                   	<div class="aside-member-box">
                   	<p>${memberLoggedIn.profileName }</p><i class="fas fa-cog"></i>
                   	<span>${memberLoggedIn.memberId }</span>
                   	</div>
                </div>
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
						<span><a href="${pageContext.request.contextPath }/club/calendar.do">일정캘린더</a></span>
                	
                	</li>
                   	<c:if test="${not empty clubBoardList}">
                   	<c:forEach items="${ clubBoardList}" var="boardList">
	                
	                <li>
                        <i class="fas fa-circle" style="font-size: 10px;color:#ffc862"></i>
						<span><a href="${pageContext.request.contextPath }/clubboard/freeboard.do?clubBoardlistNo=${boardList.clubBoardlistNo}">${boardList.boardName }</a></span>
                   	</li>   	
                   	
                   	</c:forEach>
                   	</c:if>
                   	
                   	
                   	
                   	
                   	
                   	
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
                            <span class="friendname friend-name-profile"><a href="${pageContext.request.contextPath }/member/profile.do?memberCode=${clubMaster.memberCode}">${clubMaster.profileName }</a></span>
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
                            <span class="friendname friend-name-profile"><a href="${pageContext.request.contextPath }/member/profile.do?memberCode=${cmember.memberCode}&clubCode=${club.clubCode}">${cmember.profileName}</a></span>
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
                            <p class="header-title1" style="margin:0;height:48px;">${club.clubTitle}</p>
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
                <form action="${pageContext.request.contextPath }/club/searchBoard.do" method="get">
                <div class="header-search-box">
                    <div class="header-icon">
                        <i class="fas fa-search" style="font-size:35px;"></i>
                    </div>
                    	<input type="hidden" name="clubCode" value="${club.clubCode }" />
                        <input type="text" name="search" id="search" placeholder="검색어를 입력하세요">
                </div>
                </form>
                
            </header>







