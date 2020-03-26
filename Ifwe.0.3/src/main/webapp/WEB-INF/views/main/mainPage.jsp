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
		});
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
                                        <p style="font-size: 40px;">나와 관심사가 같은 친구,</p>
                                        <p style="font-size:50px;font-weight: 3000;" class="font-eng">ifwe에서 만나보세요</p>
                                    </div>
                                    <div class="search-content font-kor">
                                        <p class="p-class">회원님의 관심사 어쩌고</p>
                                        <p class="p-class">회원님의 관심사 어쩌고</p>
                                        <p class="p-class">회원님의 관심사 어쩌고</p>
                                    </div>
                                    <div class="search-btn font-kor" style="margin-top: 10%;">
                                        <button class="font-kor" id="search-somoim">소모임 검색하기</button>
                                    </div>
                                 </div>
                            </div>
                          </div>
                        </li>
                      <li>
                        <div class="li-content">
                            <img src="${pageContext.request.contextPath }/resources/images/main/banner.png" alt="">
                        </div>
                      </li>
                      <li>
                        <div class="li-content">
                            <img src="${pageContext.request.contextPath }/resources/images/main/banner.png" alt="">
                        </div>
                      </li>
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
                            <ul class="font-kor list-ul" style="margin-left: 20%;padding:0;">
                                <li style="margin:0"><p>윙스터디 모임</p> </li>
                                <li style="margin:0"><p>윙스터디 모임</p></li>
                                <li style="margin:0"><p>윙스터디 모임</p></li>
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
                        <p style="color: white; margin-left:5%; font-size: 20px;padding: 4%;">주간 베스트글 </p>
                    </div>
                    <div class="two-content font-kor">
                        <div class="post-container">
                            <div class="number font-kor">01</div>
                                <div class="posts">
                                    <p class="post1">망고스터디</p>
                                    <p class="post2">스터디 카페추천드려요</p>
                                </div>
                        </div>
                        <hr class="two-hr" noshade>
                        <div class="post-container">
                            <div class="number font-kor">02</div>
                                <div class="posts">
                                    <p class="post1">망고스터디</p>
                                    <p class="post2">스터디 카페 추천드려요</p>
                                </div>
                        </div>
                        <hr class="two-hr" noshade>
                        <div class="post-container">
                            <div class="number font-kor">03</div>
                                <div class="posts">
                                    <p class="post1">망고스터디</p>
                                    <p class="post2">스터디 카페 추천드려요</p>
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
                            <div class="three-div">
                                <div class="three-img">
                                    <img src="${pageContext.request.contextPath }/resources/images/club/ex2.jpg" alt="" width="120px" height="120px" style="border-radius: 75px;">
                                </div>
                                <div class="three-posts">
                                    <div class="three-post1">@english_4965</div>
                                    <div class="three-post2">기초 영어회화반</div>
                                    <div class="three-post3"><i class="fas fa-map-marker-alt"></i>&nbsp;&nbsp;서울/경기</div>
                                </div>
                                <div class="three-btn">
                                    <input type="button" value="자세히 보기" class="font-kor">
                                </div>
                            </div>
                            <div class="three-div">
                                <div class="three-img">
                                    <img src="${pageContext.request.contextPath }/resources/images/club/ex2.jpg" alt="" width="120px" height="120px" style="border-radius: 75px;">
                                </div>
                                <div class="three-posts">
                                    <div class="three-post1">@english_4965</div>
                                    <div class="three-post2">기초 영어회화반</div>
                                    <div class="three-post3"><i class="fas fa-map-marker-alt"></i>&nbsp;&nbsp;서울/경기</div>
                                </div>
                                <div class="three-btn">
                                    <input type="button" value="자세히 보기" class="font-kor">
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </article>
        </div>
    </section>
</body>
</html>