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
let cPage = 1;
let boardCategory;
     $(function(){
         $(".section-boardcate-button").click(function(){
             $(".section-boardcate-button").css("background-color","#beceea");
             $(this).css("background-color","#2756a6");
             	boardCategory = $(this).attr("id");   
             $.ajax({
            	url : "${pageContext.request.contextPath}/board/mainBoardList.do",
            	data : {boardCategory : boardCategory},
            	asyn:false,
            	success : data =>{
            		console.log(data[0]);
	
             		 $parentDiv = $(".sction-board-center");
            		 $parentDiv.empty();
            		 $.each(data[2], function(idx, value){

            			 
            			 $children1 = $("<div class='section-boardtitle-box'>").append("<p>"+(value.boardCate == "notice"?"공지" : value.boardCate == "qna"?"문의":"신고")+"</p>");
            			 $children2 = $children1.append("<div class='section-boardtitle'><a href='${pageContext.request.contextPath}/board/boardDetail?boardNo="+value.boardNo+"'>"+value.boardTitle+"</a></div>");
            			 $children3 = $children2.append("<p>"+moment("/Date("+value.boardDate+")/").format("YYYY-MM-DD").toString()+"</p></div>");
 	                     $parentDiv.append($children1);
 	                     $parentDiv.append($children2);
 	                     $parentDiv.append($children3);
 	                     
 	                     
            		 });
            		 
            		cPage = data[0];
         			var tPage = data[1];
         			var pageBarSize = 5;
         			var pageStart = (Math.floor((cPage-1)/pageBarSize))*pageBarSize+1;  
         			var pageEnd = pageStart+pageBarSize-1;
         			var pageNo = pageStart;
         			console.log(pageStart);
   			
           			$children4 = $("<div class='section-boardfooter-box'></div>");
           			if(cPage <= 1){
           				$children4.append($("<button class='listForBoard' onclick='reloadFunctionToAjax("+(1)+")' value="+(1)+">Back</button>"));
           			}else{
           				$children4.append($("<button class='listForBoard' onclick='reloadFunctionToAjax("+(cPage-1)+")' value="+(cPage-1)+">Back</button>"));
           			}
           			console.log(pageStart);
           			for( var i = pageStart; i <= pageEnd;i++){
           				
           				if(i == cPage){
           					$children4.append($("<button class='listForBoard' onclick='reloadFunctionToAjax("+(i)+")' value="+(i)+"><strong>"+i+"</strong></button>"));
           				}else{
           					$children4.append($("<button class='listForBoard' onclick='reloadFunctionToAjax("+(i)+")' value="+(i)+">"+i+"</button>"));
           				}
           				
           				if(i == tPage){
           					break;
           				}

           			}
           			
           			if(cPage == tPage){
           				$children4.append($("<button class='listForBoard' onclick='reloadFunctionToAjax("+(tPage)+")' value="+(tPage)+">Next</button>"));
           			}else{
           				$children4.append($("<button class='listForBoard' onclick='reloadFunctionToAjax("+(cPage+1)+")' value="+(cPage+1)+">Next</button>"));
           			}
           			$parentDiv.append($children4);
                 				
                 				
             			
             			$parentDiv.append($children4);
             			
            		 
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

<script>
function reloadFunctionToAjax(no){
		/* console.log("버튼클릭"); */
		cPage = no;
		
		$.ajax({
        	url : "${pageContext.request.contextPath}/board/mainBoardList.do",
        	data : {boardCategory : boardCategory,
        			cPage : cPage},
        	asyn:false,
        	success : data =>{
        		console.log(data[0]);
         		 $parentDiv = $(".sction-board-center");
        		 $parentDiv.empty();
        		 $.each(data[2], function(idx, value){
					
        			 
        			 $children1 = $("<div class='section-boardtitle-box'>").append("<p>"+(value.boardCate == "notice"?"공지" : value.boardCate == "qna"?"문의":"신고")+"</p>");
        			 $children2 = $children1.append("<div class='section-boardtitle'><a href='${pageContext.request.contextPath}/board/boardDetail?boardNo="+value.boardNo+"'>"+value.boardTitle+"</a></div>");
        			 $children3 = $children2.append("<p>"+moment("/Date("+value.boardDate+")/").format("YYYY-MM-DD").toString()+"</p></div>");
	                     $parentDiv.append($children1);
	                     $parentDiv.append($children2);
	                     $parentDiv.append($children3);
	                     
	                     
        		 });
     		 	cPage = data[0];
     			var tPage = data[1];
     			var pageBarSize = 5;
     			var pageStart = Math.floor((cPage-1)/pageBarSize)*pageBarSize+1; 
     			var pageEnd = pageStart+pageBarSize-1;
     			var pageNo = pageStart;
     			console.log(pageStart);
      			$children4 = $("<div class='section-boardfooter-box'></div>");
       			if(cPage <= 1){
       				$children4.append($("<button class='listForBoard' onclick='reloadFunctionToAjax("+(1)+")' value="+(1)+">Back</button>"));
       			}else{
       				$children4.append($("<button class='listForBoard' onclick='reloadFunctionToAjax("+(cPage-1)+")' value="+(cPage-1)+">Back</button>"));
       			}
       			
       			for( var i = pageStart; i <= pageEnd;i++){
       				if(i == cPage){
       					$children4.append($("<button class='listForBoard' onclick='reloadFunctionToAjax("+(i)+")' value="+(i)+"><strong>"+i+"</strong></button>"));
       				}else{
       					$children4.append($("<button class='listForBoard' onclick='reloadFunctionToAjax("+(i)+")' value="+(i)+">"+i+"</button>"));
       				}
       				if(i == tPage){
       					break;
       				}
       			}
       			
       			if(cPage == tPage){
       				$children4.append($("<button class='listForBoard' onclick='reloadFunctionToAjax("+(tPage)+")' value="+(tPage)+">Next</button>"));
       			}else{
       				$children4.append($("<button class='listForBoard' onclick='reloadFunctionToAjax("+(cPage+1)+")' value="+(cPage+1)+">Next</button>"));
       			}
      				
       			$parentDiv.append($children4);
         			
        		 
        	 },
        	 error : function(x,h,r){
        		 console.log(x,h,r);
        	 }
         });
				
};
	
</script>
<style>
/* 0404 mainboard css add dongjun */
.section-boardfooter-box{
	display: flex;
	width : 40%;
	border-radius: 50px;
	height : 100px;
  	justify-content: center;
	align-content: center;
	border: 1.5px solid #0288D1;
	margin : 0 auto;
	
}

.listForBoard{
	display : block;
	border: none;
	outline : none;
	background-color: white;
	align-content: center;
	font-size: 20px;
	margin-right: 4%;
	height: 60px;
	border-radius: 50px;
	line-height: 97px;
}

</style>
</html>