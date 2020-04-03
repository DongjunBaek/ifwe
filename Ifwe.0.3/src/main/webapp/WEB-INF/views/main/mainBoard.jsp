<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/mainInclude.jsp">
	<jsp:param value="게시판" name="pageTitle"/>
</jsp:include>
<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.6.0/moment.min.js"></script>
<script>
     $(function(){
         $(".section-boardcate-button").click(function(){
             $(".section-boardcate-button").css("background-color","#beceea");
             $(this).css("background-color","#2756a6");
             var boardCategory = $(this).attr("id");   
             $.ajax({
            	url : "${pageContext.request.contextPath}/board/mainBoardList.do",
            	data : {boardCategory : boardCategory},
            	success : data =>{
            		 $parentDiv = $(".sction-board-center");
            		 $parentDiv.empty();
            		 $.each(data, function(idx, value){
            			 /*
            			 console.log(idx);
            			 console.log(value); 
            			 console.log(value.boardCate);
            			 console.log(value.boardTitle);
            			 console.log(moment("/Date("+value.boardDate+")/").format("YYYY-MM-DD").toString());
            			 */
            			 
            			 $children1 = $("<div class='section-boardtitle-box'>").append("<p>"+(value.boardCate == "notice"?"공지" : value.boardCate == "qna"?"문의":"신고")+"</p>");
            			 $children2 = $children1.append("<div class='section-boardtitle'><a href='${pageContext.request.contextPath}/board/boardDetail?boardNo="+value.boardNo+"'>"+value.boardTitle+"</a></div>");
            			 $children3 = $children2.append("<p>"+moment("/Date("+value.boardDate+")/").format("YYYY-MM-DD").toString()+"</p></div>");
            			 console.log(value.boardNo);
 	                     $parentDiv.append($children1);
 	                     $parentDiv.append($children2);
 	                     $parentDiv.append($children3);
						
 	                     
            		 });            		 
            	 },
            	 error : function(x,h,r){
            		 console.log(x,h,r);
            	 }
             });
             
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
                <div class="section-boardcate-button" id="qna">
                    <p>문의게시판</p>
                </div>
                <div class="section-boardcate-button" id="report">
                    <p>신고게시판</p>
                </div>
            </div>
            <div class="section-board-container">
                <div class="sction-board-center">
                    <div class="section-board-line"></div>
                </div>
            </div>
        </div>
    </section>




</body>
</html>