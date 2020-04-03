<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/mainInclude.jsp">
	<jsp:param value="마이페이지" name="pageTitle"/>
</jsp:include>
<style>
p{
margin:0;
}
.friend-btn{
margin-left:24%;
}
.msglist-container{
background-color:white;
}
.add-msglist{
background-color:white;
margin:0 auto;
text-align:center;
font-size:1.5em;
border-top:1px solid #2b2b2b;
height:24px;
width:720px;

}

</style>
<script >
	$(function(){
		
		$(".add-msglist").click(function(){
			console.log("작동")
			var height = $(".contents").css("height");			
			console.log(height);
			if(height == "200px"){
				$(".contents").css("height","1000px");
				$(".notice-container").css("min-height","1000px");
				$(".board-div").css("display","none")
				$(".fa-arrow-down").css("display","none")
				$(".fa-arrow-up").css("display","block")
			}else{
				$(".contents").css("height","200px");
				$(".notice-container").css("height","300px")
									.css("min-height",0);
				$(".board-div").css("display","block")
				$(".fa-arrow-down").css("display","block")
				$(".fa-arrow-up").css("display","none")
			}
			
		});
		
	})
</script>

<!-- 문보라 수정 03.20  -->
	<section class="mypage-section">
        <article class="mypage-first">
            <div class="intro-div">
                <div class="img-div">
              	  <img src="${pageContext.request.contextPath }/resources/upload/profile/${memberLoggedIn.profileImgRe!=null?memberLoggedIn.profileImgRe:'' }" width="100px"/>
                </div>
                <div class="myname-div font-kor">
                    <div style="font-size: 25px;margin:0 auto;max-width: fit-content;">@${memberLoggedIn.memberId }</div>
                    <div style="margin:0 auto;font-size:30px;font-weight: 900;max-width: fit-content;" >${memberLoggedIn.memberName }</div>
                </div>
            </div>
            <div class="btn-div">
                <input type="button" value="회원정보 수정" class="update-btn font-kor"
                		onclick="location.href='${pageContext.request.contextPath}/member/update.do'">
                <input type="button" value="프로필 카드" class="update-btn font-kor" 
                		onclick="location.href='${pageContext.request.contextPath}/member/profileUpdate.do?memberCode='+${memberLoggedIn.memberCode }">
            </div>
            <div class="list-div">
                <div class="list-title">
                    <p style="color: white;font-size: 20px;font-weight: bold; padding: 6%;" class="font-kor">소모임 목록</p>
                    <div class="list-ul-container">
                        <ul class="font-kor mypage-list-ul" style="padding: 0;">
                            <c:if test="${not empty clubList }">
                        	<c:forEach items="${clubList }" var="list">
                                <li class="clubListLi" data-clubCode=${list.clubCode }><p class="mypage-p-class">${list.clubTitle }</p> </li>
                        	</c:forEach>
                        	</c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </article>

        <article class="mypage-second">
            <div class="notice-container">
                <div class="notice-title font-kor">
                    <i class="fas fa-bell" style="font-size:25px;color: #2756a6;margin:5% 5% 2% 0;"></i><span style="font-size:25px;">알림</span></div>
                <div class="contents" style="overflow:auto;">
                    <div class="content font-kor">
                        <p class="mypage-p-content">윙 스터디에 가입신청이 승인되었습니다.</p>
                        <c:if test="${not empty friendList }">
                        	<c:forEach items="${friendList }" var="fl" varStatus="vs" >
                        		
                        		<c:if test="${fl.msgView == 'n' }">
                        		<p class="mypage-p-content"><span class="friend-name-profile"></span>${fl.memberName }님에게 친구신청이 왔습니다.
	                        	<input type="button" value="수락" class="friend-btn font-kor" style="padding:0" 
			                        onclick="location.href='${pageContext.request.contextPath}/member/friendYes.do?memberFrom=${fl.memberFrom }&memberCode=${memberLoggedIn.memberCode }'">
			                    <input type="button" value="거부" class="friend-nobtn font-kor" style="padding:0"> 
			                    </p>
	                        	</c:if> 
	                        	<c:if test="${fl.msgView == 'y' }">
	                        	<p class="mypage-p-content"><span class="friend-name-profile"></span>${fl.memberName }님에게 친구신청이 왔습니다.
	                        	<input type="button" value="수락완료"class="friend-btn font-kor" style="padding:0;"></p>	
	                        	</c:if>
	                        	
	                        </c:forEach>
                        </c:if>
                    </div>
                </div>
            </div>
           		<div class="msglist-container">
		            <div class="add-msglist">
		            	<i class="fas fa-arrow-down" style="color:#2756a6;"></i>
		            	<i class="fas fa-arrow-up" style="color:#2756a6; display:none;"></i>
		            </div>
	            </div>
            <div class="board-div">
                <div class="board-title">
                    <i class="fas fa-pencil-alt" style="font-size:25px;color: #2756a6;margin:5% 4% 2% 0;"></i><span class="font-kor" style="font-size:25px;">내가 쓴 게시글</span>
                </div>
                <div class="board-contents font-kor">
                    <ul style="font-size: 30px;margin-left: 9%;">
                        <li style="color: #2756a6;">
                            <div class="board-content">
                                <div class="board-con">
                                    <p class="p-board" style="color: #2756a6; font-weight: bolder;">윙스터디 모임</p>
                                    <p class="p-board bold-font" >이번주 금요일 스터디 일정입니다.</p>
                                    <p class="p-board" style="font-size: 15px; padding-top: 2%;">작성일 : 2020-20-20</p>
                                </div>
                                <div class="board-btn">
                                    <input type="button" value="댓글보기" class="reply-btn font-kor" style="padding:0">
                                </div>
                            </div>
                        </li>
                        <li style="color: #2756a6;">
                            <div class="board-content">
                                <div class="board-con">
                                    <p class="p-board" style="color: #2756a6; font-weight: bolder;">윙스터디 모임</p>
                                    <p class="p-board bold-font" >이번주 금요일 스터디 일정입니다.</p>
                                    <p class="p-board" style="font-size: 15px; padding-top: 2%;">작성일 : 2020-20-20</p>
                                </div>
                                <div class="board-btn">
                                    <input type="button" value="댓글보기" class="reply-btn font-kor" style="padding:0">
                                </div>
                            </div>
                        </li>
                        <li style="color: #2756a6;">
                            <div class="board-content">
                                <div class="board-con">
                                    <p class="p-board" style="color: #2756a6; font-weight: bolder;">윙스터디 모임</p>
                                    <p class="p-board bold-font">이번주 금요일 스터디 일정입니다.</p>
                                    <p class="p-board" style="font-size: 15px; padding-top: 2%;">작성일 : 2020-20-20</p>
                                </div>
                                <div class="board-btn">
                                    <input type="button" value="댓글보기" class="reply-btn font-kor" style="padding:0">
                                </div>
                            </div>
                        </li>
                        <li style="color: #2756a6;">
                            <div class="board-content">
                                <div class="board-con">
                                    <p class="p-board" style="color: #2756a6; font-weight: bolder;">윙스터디 모임</p>
                                    <p class="p-board bold-font" >이번주 금요일 스터디 일정입니다.</p>
                                    <p class="p-board" style="font-size: 15px; padding-top: 2%;">작성일 : 2020-20-20</p>
                                </div>
                                <div class="board-btn">
                                    <input type="button" value="댓글보기" class="reply-btn font-kor" style="padding:0">
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </article>

        <article class="mypage-third">
            <div class="friend-container">
                <div class="friend-title font-kor"><p style="color: white;font-size: 20px;font-weight: bold;padding: 6%;">친구 목록</p></div>
                <div class="friend-lists">
                	<c:if test="${not empty friends }">
                	<c:forEach items="${friends }" var="fr">
                    <div class="friend-list">
                        <div class="friend-img">
                        	<img src="${pageContext.request.contextPath }/resources/upload/profile/${fr.profileImgRe!=null?fr.profileImgRe:''}" alt="" />
                        </div>
                        <div class="friend-name font-kor friend-name-profile"><a href="${pageContext.request.contextPath }/member/profile.do?memberCode=${fr.friendCode}">${fr.memberPname }</a></div>
                    </div>
                    </c:forEach>
                    </c:if>
					                  
                </div>
            </div>
        </article>
    </section>
    <script >
    
	</script>
</body>
