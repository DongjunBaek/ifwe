<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<jsp:include page="/WEB-INF/views/common/mainInclude.jsp">
		<jsp:param value="메인페이지" name="pageTitle"/>
	</jsp:include>
<script>
		$(function(){
			
			$("#search-somoim").click(function(){
				location.href="${pageContext.request.contextPath }/club/clubSearch.do";
			});
			$("#create-somoim").click(function(){
				location.href="${pageContext.request.contextPath }/club/clubCreate.do";
			});
			
			$(".clubMainBtn").click(function(){
				let clubCode = $(this).attr("data-clubCode");
				location.href="${pageContext.request.contextPath}/club/clubMain.do?clubCode="+clubCode;
			});
			
			$(".clubListLi").click(function(){
				let clubCode = $(this).attr("data-clubCode");
				location.href="${pageContext.request.contextPath}/club/clubMain.do?clubCode="+clubCode;
			});
		});
function eventView(eventCode){
	location.href="${pageContext.request.contextPath}/board/mainEvent.do?eventCode="+eventCode;
} 
var cnt = 1;
setInterval(function(){
	if(cnt == 4){
		cnt = 1;
	}
	$('[for="pos'+cnt+'"]').trigger("click");
	cnt++;
}, 4000);

</script>
	  <section style="margin:0;">
        <div class="container">
            <article class="mainpage-first">
                <div class="slide">
                    <input type="radio" name="pos" id="pos1" checked>
                    <input type="radio" name="pos" id="pos2">
                    <input type="radio" name="pos" id="pos3">
                    <input type="radio" name="arrow" id="next" checked>
                    <input type="radio" name="arrow" id="down">
                    <ul>
                      <li>
                          <div class="li-content">
                            <div class="li-img">
                                <img src="${pageContext.request.contextPath }/resources/images/main/banner.png" alt="">
                                <div class="search font-kor">
                                    <div class="search-title">
                                        <p style="font-size: 40px;">새로운 사람을 만나다.</p>
                                        <p style="font-size:50px;font-weight: 3000;" class="font-eng">ifwe에서 만나보세요</p>
                                    </div>
                                    <div class="search-content font-kor">
                                        <p class="p-class">뮤지컬보고 영화도 보고</p>
                                        <p class="p-class">맛있는 저녁식사와 여유를</p>
                                        <p class="p-class">ifwe에서 만나보세요</p>
                                    </div>
                                    <div class="search-btn font-kor" style="margin-top: 10%;">
                                        <button class="font-kor" id="search-somoim">소모임 검색하기</button>
                                    </div>
                                 </div>
                            </div>
                          </div>
                        </li>
                   <c:forEach items="${eventList }" var="List">
                      <li>
                        <div class="li-content" id="eventBanner" onclick="eventView(${List.eventCode})">
                            <img src="${pageContext.request.contextPath }/resources/upload/admin/event/${List.eventImgRe}" alt="">
                        </div>
                      </li>
                   </c:forEach> 
                    </ul>
                    <p class="bullet">
                      <label for="pos1">1</label>
                      <label for="pos2">2</label>
                      <label for="pos3">3</label>
                    </p>
                  </div>
            </article>
    
            <article class="mainpage-second"> 
                <div class="one">
                    <div class="one-one">
                        <div class="card font-kor">
                            <p style="padding: 7%;margin-left: 10%; color: white;">내 소모임</p> 
                        </div>
                        <div class="list">
                            <ul class="font-kor list-ul" style="margin-left: 20%;">
                        	<c:if test="${not empty clubList }">
                        	<c:forEach items="${clubList }" var="list" varStatus="vs">
                                <c:if test="${vs.count < 4 }">
	                                <li style="margin:0" class="clubListLi" data-clubCode=${list.clubCode }><p>${list.clubTitle }</p> </li>
                                </c:if>
                        	</c:forEach>
                        	</c:if>
                            </ul>
                        </div>
                    </div>
                    <div class="one-two">
                       <div class="linebar"></div>
                       <div class="post"><p class="font-kor"><span style="font-weight: bolder;">소모임</span>을</p> <p class="font-kor">직접 만들어 보세요!</p></div>
                       <div class="make-btn">
                           <input type="button" value="소모임 만들기" class="font-kor" id="create-somoim">
                       </div>
                    </div>
                </div>
                <div class="two">
                    <div class="two-title font-kor">
                        <p style="color: white; margin-left:5%; font-size: 20px;padding: 4%;">공지 사항 </p>
                    </div>
                    <div class="two-content font-kor">
                        <div class="post-container">
                            <div class="number font-kor">01</div>
                                <div class="posts">
                                    <p class="post1"><a href="${pageContext.request.contextPath }/board/boardDetail?boardNo=${boardListNoice[0].boardNo}">${boardListNoice[0].boardTitle }</a></p>
                                    <p class="post2">${boardListNoice[0].boardDate }</p>
                                </div>
                        </div>
                        <hr class="two-hr" noshade>
                        <div class="post-container">
                            <div class="number font-kor">02</div>
                                <div class="posts">
                                    <p class="post1"><a href="${pageContext.request.contextPath }/board/boardDetail?boardNo=${boardListNoice[1].boardNo}">${boardListNoice[1].boardTitle }</a></p>
                                    <p class="post2">${boardListNoice[1].boardDate }</p>
                                </div>
                        </div>
                        <hr class="two-hr" noshade>
                        <div class="post-container">
                            <div class="number font-kor">03</div>
                                <div class="posts">
                                    <p class="post1"><a href="${pageContext.request.contextPath }/board/boardDetail?boardNo=${boardListNoice[2].boardNo}">${boardListNoice[2].boardTitle }</a></p>
                                    <p class="post2">${boardListNoice[2].boardDate }</p>
                                </div>
                        </div>
                    </div>
                    
                </div>
                <div class="three">
                    <div class="three-title font-kor">
                        <p style="color: white; font-size: 20px; margin-left: 5%;padding: 3%;">이런 모임은 어때요? </p>
                    </div>
                    <div class="three-content font-kor">
                        <div class="three-container">
                        	<c:if test="${not empty interClub && not empty clubmasterProfile}">
	                        	<c:forEach items="${interClub }" var = "list" varStatus="vs">
	                        	
	                            <div class="three-div">
	                                <div class="three-img">
	                                    <img src="${pageContext.request.contextPath }/resources/upload/profile/${clubmasterProfile[vs.index].profileImgRe}" alt="" width="120px" height="120px" style="border-radius: 75px;">
	                                </div>
	                                <div class="three-posts">
	                                    <div class="three-post1">@${list.memberId }</div>
	                                    <div class="three-post2">${list.clubTitle }</div>
	                                    <div class="three-post3"><i class="fas fa-map-marker-alt"></i>&nbsp;&nbsp;${list.clubLocation }</div>
	                                </div>
	                                <div class="three-btn">
	                                    <input type="button" value="자세히 보기" class="font-kor clubMainBtn" data-clubCode=${list.clubCode }>
	                                </div>
	                            </div>
	                        	</c:forEach>
                        	</c:if>
                           
                            
                        </div>
                    </div>
                </div>
            </article>
        </div>
    </section>
</body>
<style>
.list-ul li{
	cursor: pointer;
}
.list{
	height: 225px;
}
.three-content, .three-container{
	overflow: hidden;
}
.li-content{
	overflow: hidden;
}
</style>
</html>