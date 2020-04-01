<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Club Main</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/club/clubinclude.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/club/clubfreeboard.css">
<script src="https://kit.fontawesome.com/5e1e16b3f4.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Fredoka+One&display=swap" rel="stylesheet">
<script>
$(function(){
    $(".comment-sliderbutton").click(function(){
        $(this).parent().nextAll(".comment-hiddenbox").slideToggle(300);
    })

    $(".section-block-right").click(function(){
    	location.href = "${pageContext.request.contextPath}/club/clubInsertBoardFree"
    })
    
});

</script>

<style>
.section-boradall{
	font-family: 'GmarketSansMedium';
	font-weight: bold;
}

</style>

</head>
<body>
<jsp:include page="/WEB-INF/views/common/clubInclude.jsp"></jsp:include>
  <section class="flotclass">
      <div class="section-block">
          <div class="section-wrapper">
              <p class="section-boradall">${cb.boardName }</p>
              <div class="section-block-right">
                  <p>글쓰기</p>
                  <i class="fas fa-pencil-alt"></i>
              </div>
          </div>
          
      </div>
      <article class="article1 flotclass">
		
		<!-- 게시물카드시작 -->
		<c:if test="${not empty clubBoardListboard }">
		<c:forEach items="${clubBoardListboard }" var = "cl">
		
	
          <div class="article-board-notice">
              <div class="article-board-wrapper">
                  <div class="article1-board-frofile">
                      <div class="article1-frofile-img">
                      	<img src="${pageContext.request.contextPath }/resources/upload/member/frofileimg/${cl.profileImgRe}" alt="" />
                      </div>
                          <div class="article1-frofile-name">
                              <p class="article1-leader-name">${cl.profileName }</p>
                          </div>
                          <div class="article1-curcle-box">
                              <div class="article1-curcle"></div>
                              <div class="article1-curcle"></div>
                              <div class="article1-curcle"></div>
                          </div>
                      </div>
                      <p class="article1-boardmenu">${cl.boardTitle }</p>
                      <div class="article1-bard-content">
			                  ${cl.boardContent }
                      </div>
                      <div class="article1-hashtag-container">
                      	<c:forEach items="${cl.boardCateCode }" var="tag">
                          <div class="article1-hashtag-box"># ${tag }</div>
                      	</c:forEach>
                      </div>
                      <div class="article1-line"></div>
                      <div class="article1-comment-box">
                          <input type="text" name="comment" id="commnet" placeholder="댓글입력">
                          <div class="comment-input">입력</div>
                      </div>
                      <div class="article1-comment-count">
                          <div class="comment-sliderbutton">
                              	댓글 2개&nbsp;&nbsp;<i class="fas fa-sort-down" style="font-size: 18px;"></i>
                          </div>
                      </div>
                      <div class="comment-hiddenbox">

                          <div class="article1-commnet-container">
                              <div class="comment-frofile-img">
                              	<img src="${pageContext.request.contextPath }/resources/upload/member/frofileimg/ex2.jpg" alt="" />
                              </div>
                              <div class="comment-block"></div>
                          <div class="comment-frofile-name">신형철</div>
                          <p>확인했습니다!</p>
                          <div class="comment-right-box">
                              <p>신고</p>
                              <p>|</p>
                              <p>답글</p>
                          </div>

                      </div>
                      <div class="article1-commnet-container">
                          <div class="comment-frofile-img">
                          	<img src="${pageContext.request.contextPath }/resources/upload/member/frofileimg/ex2.jpg" alt="" />
                          </div>
                          <div class="comment-block"></div>
                          <div class="comment-frofile-name">백동준</div>
                          <p>확인했습니다!</p>
                          <div class="comment-right-box">
                              <p>신고</p>
                              <p>|</p>
                              <p>답글</p>
                          </div>
                          
                      </div>
                      <div class="article1-commnet-container">
                          <div class="comment-frofile-img">
                          	<img src="${pageContext.request.contextPath }/resources/upload/member/frofileimg/ex2.jpg" alt="" />
                          </div>
                          <div class="comment-block"></div>
                          <div class="comment-frofile-name">문보라</div>
                          <p>확인했습니다!</p>
                          <div class="comment-right-box">
                              <p>신고</p>
                              <p>|</p>
                              <p>답글</p>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
          </c:forEach>
         </c:if>
          <!-- 게시물카드끝-->
 
      </article>
      <article class="article2 flotclass">
              <div class="article2-title">
                  <p>이런건 어때요?</p>
              </div>

              <div class="article2-container">
                  <div class="article2-box">
                      <p>망고스터디</p>
                      <p>스터디 카페 추천해드려요</p>
                      <div class="article2-line"></div>
                  </div>
              </div>
              <div class="article2-container">
                  <div class="article2-box">
                      <p>망고스터디</p>
                      <p>스터디 카페 추천해드려요</p>
                      <div class="article2-line"></div>
                  </div>
              </div>
              <div class="article2-container">
                  <div class="article2-box">
                      <p>망고스터디</p>
                      <p>스터디 카페 추천해드려요</p>
                      <div class="article2-line"></div>
                  </div>
              </div>
              <div class="article2-container">
                  <div class="article2-box">
                      <p>망고스터디</p>
                      <p>스터디 카페 추천해드려요</p>
                      <div class="article2-line"></div>
                  </div>
              </div>
              <div class="article2-container">
                  <div class="article2-box">
                      <p>망고스터디</p>
                      <p>스터디 카페 추천해드려요</p>
                      <div class="article2-line"></div>
                  </div>
              </div>

      </article>
      
  </section>


</body>
</html>