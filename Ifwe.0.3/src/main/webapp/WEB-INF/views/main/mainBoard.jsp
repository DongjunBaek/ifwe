<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/mainInclude.jsp">
	<jsp:param value="게시판" name="pageTitle"/>
</jsp:include>

<script>
     $(function(){
         $(".section-boardcate-button").click(function(){
             $(".section-boardcate-button").css("background-color","#beceea");
             $(this).css("background-color","#2756a6");
         });
         
         $(".section-block-right").click(function(){
        	 location.href="${pageContext.request.contextPath }/board/insertBoard.do";
         });
         
         
         $("#notice").trigger("click");
     });
 </script>
 
<section style="margin:0;">
        <div class="section-container-box">
            <div class="section-title-box">
                <p>게시판</p>
                <p>ifwe를 사용하시면서 궁금한 점이나 신고사항을 적어주세요</p>
            </div>
            <div class="writing-button-box">
                <div class="section-block-right">
                    <p>글쓰기</p>
                <i class="fas fa-pencil-alt"></i>
                </div>
            </div>
            <div class="section-boardcate-box">
                <div class="section-boardcate-button" id="notice">
                    <p>공지사항</p>
                </div>
                <div class="section-boardcate-button">
                    <p>문의게시판</p>
                </div>
                <div class="section-boardcate-button">
                    <p>신고게시판</p>
                </div>
            </div>
            <div class="section-board-container">
                <div class="sction-board-center">
                    <div class="section-board-line"></div>

                    <div class="section-boardtitle-box">
                        <p>공지</p>
                        <div class="section-boardtitle">
                            안녕하세요.공지사항입니다.
                        </div>
                        <p>2020-03-10</p>
                    </div>
                    <div class="section-boardtitle-box">
                        <p>공지</p>
                        <div class="section-boardtitle">
                            안녕하세요.공지사항입니다.
                        </div>
                        <p>2020-03-10</p>
                    </div>
                    <div class="section-boardtitle-box">
                        <p>공지</p>
                        <div class="section-boardtitle">
                            안녕하세요.공지사항입니다.
                        </div>
                        <p>2020-03-10</p>
                    </div>
                    <div class="section-boardtitle-box">
                        <p>공지</p>
                        <div class="section-boardtitle">
                            안녕하세요.공지사항입니다.
                        </div>
                        <p>2020-03-10</p>
                    </div>
                    <div class="section-boardtitle-box">
                        <p>공지</p>
                        <div class="section-boardtitle">
                            안녕하세요.공지사항입니다.
                        </div>
                        <p>2020-03-10</p>
                    </div>

                </div>
            </div>
        </div>
    </section>




</body>
</html>