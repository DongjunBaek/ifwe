<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/mainInclude.jsp"></jsp:include>
<section>
  <article class="mypage-first">
      <div class="intro-div">
          <div class="img-div">
          	<img src="${pageContext.request.contextPath }/resources/upload/member/frofileimg/ex2.jpg" alt="">
          </div>
          <div class="myname-div font-kor">
              <div style="font-size: 25px;margin:0 10% ">@wingStudy_02</div>
              <div style="font-size:30px;font-weight: 900;margin:5% 20% 0 30%" >스테파니</div>
          </div>
      </div>
      <div class="btn-div">
          <input type="button" value="회원정보 수정" class="update-btn font-kor">
      </div>
      <div class="list-div">
          <div class="list-title">
              <p style="color: white;font-size: 20px;font-weight: bold; padding: 6%;" class="font-kor">소모임 목록</p>
              <div class="list-ul-container">
                  <ul class="font-kor mypage-list-ul" style="padding: 0;">
                      <li><p class="mypage-p-class">윙스터디 모임</p></li>
                      <li><p class="mypage-p-class">윙스터디</p></li>
                      <li><p class="mypage-p-class">윙</p></li>
                  </ul>
              </div>
          </div>
      </div>
  </article>

  <article class="makeProfile-article font-kor">
      <div class="makeProfile-article-title font-kor">
          <p>소개글</p>
      </div>
      <div class="makeProfile-article-contents font-kor">
          <input type="text" class="makeProfile-infotext1 font-kor">
          <input type="text" class="makeProfile-infotext2 font-kor" placeholder="    #관심사 입력">
      </div>
      <div class="makeProfile-article-inputImg font-kor">
          <p>프로필 이미지 등록</p>
          <div class="uploadImg-div">
              <div>
                  <span></span>
              </div>
              <div>
                  <label for="upFile" >파일 첨부</label>
                  <input type="file" name="upFile" id="upFile" style="display: none;">
                </div>
            </div>
        </div>
        <div class="makeProfile-article-button font-kor">
            <input type="button" value="프로필 카드 등록" class="makeProfile-btn-insert font-kor">
        </div>
    </article>
   
</section>



</body>
</html>