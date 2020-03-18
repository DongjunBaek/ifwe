<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
$(function(){
   $("#nav-arrowicon").click(function(){
        $("#nav-mypagebox").slideToggle(300);
    });
   
   $("#mypagebutton").click(function(){
   	location.href="${pageContext.request.contextPath }/member/mypage.do";
   });
   
   $(".logo-box").click(function(){
   	location.href="${pageContext.request.contextPath }/main/mainPage.do";
   })
   
   
});

</script>
<header>
        <div class="nav-container">
            <div class="logo-box"></div>
            <div class="nav-content-right">
                <div class="nav-right-icon2">
                    <i class="fas fa-bell" style="font-size:35px;color: white;" ></i>
                </div>
                <div class="nav-right-icon1">
                    <i class="fas fa-sort-down fa-2x" id="nav-arrowicon" style="color: white;"></i>
                </div>
                <div class="nav-clubimg">
                	<img src="${pageContext.request.contextPath }/resources/upload/member/frofileimg/ex2.jpg" alt="" />
                </div>
                <div class="nav-right-leader font-kor">
                    <p style="color: white;">@wingStudy_02</p>
                    <p style="color: white;">스테파니 님</p>
                </div>
            </div>
        </div>
        <div class="nav-myfrofile-box" id="nav-mypagebox">
             <p id="mypagebutton">마이페이지</p>
             <div class="nav-box-line"></div>
             <p id="logoutbutton">로그아웃</p>
         </div>
    </header>
    <nav>    
        <div class="ul-container">
            <div class="ul-background">
                <ul class="ul-tag">
                    <div class="blue-back font-kor">
                        <li class="li-hover">
                            <a href="${pageContext.request.contextPath }/club/clubCreate.do">소모임 생성</a>
                        </li>
                    </div>
                    <div class="blue-back font-kor"><li class="li-hover"><a href="${pageContext.request.contextPath }/club/clubSearch.do">소모임 검색</a> </li></div>
                    <div class="blue-back font-kor"><li class="li-hover"><a href="${pageContext.request.contextPath }/main/mainBoard.do">게시판</a> </li></div>
                    <div class="blue-back font-kor"><li class="li-hover"><a href="#">소개</a> </li></div>
                    <div class="blue-back font-kor"><li class="li-hover"><a href="${pageContext.request.contextPath }/member/membership.do">멤버쉽 구매</a> </li></div>
                </ul>
            </div>
        </div>
    </nav>