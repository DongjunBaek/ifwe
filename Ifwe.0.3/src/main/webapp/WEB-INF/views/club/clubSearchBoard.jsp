<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Club SearchBoard</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/club/clubinclude.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/club/clubmain.css">
<script src="https://kit.fontawesome.com/5e1e16b3f4.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Fredoka+One&display=swap" rel="stylesheet">
<script>
$(function(){
	
	
	
	$(".comment-sliderbutton").click(function(){
		console.log($(this).parent().next()[0]);
		$(this).parent().next().slideToggle(300);
		
	});
	

	
    
	$(".comment-hiddenbox").each(function(idx,item){
		
		var cnt = $(item).children().length;
		$(item).prev().children().append("<span>댓글 "+cnt+"개</span>");
	});
    
	
	var count = $(".article-board-notice").length;
    console.log("테스트",count);
	if(count<1){
		$(".search-zero").css("display","block");
	}
    
    
	$(".friend-name-profile").click(function(){
		location.href="${pageContext.request.contextPath }/member/profile.do"
	});
    
    $(".section-block-right").click(function(){
    	location.href = "${pageContext.request.contextPath}/club/clubInsertBoard"
    });
    
    $(".article1-imgbox").click(function(e){
        $(".filter-container-container").css("display","inline-block");
        var boardNo = $(this).children("#boardNohide").val();
        
        $.ajax({
        	data : {boardNo:boardNo},
			type : 'GET',
			url : '${pageContext.request.contextPath}/clubboard/selectBoardImg.do',
			success : function(data){
				
			    var imgcontainerstart = '<div class="filter-container">';				
				
			    var imgcontainermideum='<a class="prev" onclick="plusSlides(-1)">&#10094;</a>'+
								       '<a class="next" onclick="plusSlides(1)">&#10095;</a>'+
								       '<div class="row">';
				
			    var imgcontainerend='</div>'+
		    						'</div>';
		    	var bigimg = "";
		    	var smallimg= "";
		    	
		    	for(var i=0; i<data.length; i++){
				
					bigimg +='<div class="mySlides">'+
				             '<div class="numbertext">'+(i+1)+' / '+data.length+'</div>'+
				             '<img src="${pageContext.request.contextPath}/resources/upload/club/boardImg/'+data[i].imgRe+'" style="width:100%;max-height:600px;">'+
				             '</div>';
						
					smallimg +=	'<div class="column">'+
					            '<img class="demo cursor" src="${pageContext.request.contextPath}/resources/upload/club/boardImg/'+data[i].imgRe+'" style="width:100%;height:140px;" onclick="currentSlide('+(i+1)+')">'+
						      	'</div>';
		    	};
		    	
		    	var length = 6-data.length;
		    	
		    	if(data.length <6){
		    		for(var i=0; i<length; i++){
		    			smallimg += '<div class="column">'+
						            '<img class="demo" src="${pageContext.request.contextPath}/resources/images/club/basicimg.jpg" style="width:100%;height:140px;">'+
							      	'</div>';
		    		}
		    	}
				
		    	$(".scroll-container").empty();
				$(".scroll-container").append(imgcontainerstart+bigimg+imgcontainermideum+smallimg+imgcontainerend);
				
				var slid = $(".mySlides")
				slid.eq(0).css("display","block");

				
				
			},error : function(x,h,r){
				console.log(x,h,r);
			}
        	
        });
        
        
        jQuery(".scroll-container").css("position", "absolute").css("position", "absolute")
        .css("top",jQuery(window).scrollTop()+100+"px")
        .css("left","50%").css("transform","translate(-50%)");
        
       
        
    });
    	
    
    
    $(".filter-container-container").click(function(e){
        if($(e.target).is(".filter-container-container")){
            $(".filter-container-container").css("display","none");
        }

    })


    $(window).scroll(function(event){
        if(jQuery(window).scrollTop() > jQuery(".filter-container-container").offset().top) {
        
            jQuery(".scroll-container").css("position", "absolute").css("top",jQuery(window).scrollTop()+100+"px");
            jQuery(".scroll-container").css("left","50%").css("transform","translate(-50%)");
        }
    }); 
    

	var imgcontainer=$(".article-board-notice").find(".article1-imgbox");
    
    for(var i=0; i<imgcontainer.length; i++){
    	
	    var imgCnt = imgcontainer[i].childElementCount-1;
    	
    	if(imgCnt>4){
    		imgCnt = imgCnt-4;
    		
			var imgfilter = "<div class='article-imgfilter'><p>+  "+imgCnt+"장</p></div>";
    		imgcontainer[i].append($(imgfilter)[0]);
    	}
    	
    }
    
    
    
    
    var height = 0;
    
    $(".article1-bard-content").each(function(index,item){
    	
    	height = $(item).height();
    	
    	if(height>90){
    		$(item).siblings('label').css("display","inline-block");
    		$(item).css("overflow","hidden");
    		$(item).css("max-height","100px");
    	}
    	
    	var checkbox = $(item).siblings('input[type=checkbox]');
    	var chkid = "#"+checkbox.attr('id');
    	
    	$(chkid).change(function(){
    		
    		
    		if($(checkbox).is(":checked")){
                 $(item).css("max-height",height+"px");
            }else{
                 $(item).css("max-height","100px");
                 
            }
    		
        })
    	
    });
    
    
    
    
    
    
    
    
    
    
    
    
    
});

var slideIndex = 1;
showSlides(slideIndex);

// Next/previous controls
function plusSlides(n) {
  showSlides(slideIndex += n);
	 }

// Thumbnail image controls
function currentSlide(n) {
  showSlides(slideIndex = n);
}



function showSlides(n) {
	  var i;
	  var slides = document.getElementsByClassName("mySlides");
	  var dots = document.getElementsByClassName("demo");
	  var captionText = document.getElementById("caption");
	  if (n > slides.length) {slideIndex = 1}
	  if (n < 1) {slideIndex = slides.length}
	  for (i = 0; i < slides.length; i++) {
	    slides[i].style.display = "none";
	  }
	  for (i = 0; i < dots.length; i++) {
	    dots[i].className = dots[i].className.replace(" active", "");
	  }
	  slides[slideIndex-1].style.display = "block";
	  dots[slideIndex-1].className += " active";
	  captionText.innerHTML = dots[slideIndex-1].alt;
	}

</script>


</head>
<body>
<jsp:include page="/WEB-INF/views/common/clubInclude.jsp"></jsp:include>
  <section class="flotclass">
      <div class="section-block">
          <div class="section-wrapper">
              <p class="section-boradall">검색게시판</p>
          </div>
          
      </div>
       <div class="search-zero">
			 <i class="far fa-file-excel"></i>
			 <p>해당 해쉬태그의 게시물이 없습니다.</p>
		  </div>
      <article class="article1 flotclass">
		
		<c:if test="${not empty clubBoardProfileList }">
		<c:forEach items="${clubBoardProfileList }" var = "cbl" varStatus="vs">
          <div class="article-board-notice">
          	  <p><i class="fas fa-chevron-left"></i>${cbl.boardName }<i class="fas fa-chevron-right"></i></p>
              <div class="article-board-wrapper">
                  <div class="article1-board-frofile">
                      <div class="article1-frofile-img">
                      	<img src="${pageContext.request.contextPath }/resources/upload/member/frofileimg/${cbl.profileImgRe}" alt="" />
                      </div>
                          <div class="article1-frofile-name">
                              <p class="article1-leader-name">${cbl.profileName }</p>
                          </div>
                          <div class="article1-curcle-box">
                              <div class="article1-curcle"></div>
                              <div class="article1-curcle"></div>
                              <div class="article1-curcle"></div>
                          </div>
                      </div>
                      <p class="article1-boardmenu">${cbl.boardTitle }</p>
                      <input type="checkbox" id="readmore${vs.index }"/>
                      <div class="article1-bard-content">
			                  ${cbl.boardContent }
                      </div>
                      
                      <label for="readmore${vs.index }"></label>
                      <div class="article1-hashtag-container">
                          <ul>
                      	<c:forEach items="${cbl.boardCateCode }" var="tag">
                          	<li class="article1-hashtag-box"># ${tag }</li>
                      	</c:forEach>
                          </ul>
                      </div>
                      <c:if test="${not empty boardImg && cbl.boardImgyn=='y'}">
	                     <div class="article1-imgbox" id="imgbox">
	                     	  <input type="hidden" id="boardNohide" value="${cbl.boardNo }" />
		                      <c:forEach items="${boardImg }" var="img">
		                      <c:if test='${cbl.boardNo == img.boardNo  }'>
		                            <div class="article1-imgcontainer" id="imgcontainer">
		                                <img src="${pageContext.request.contextPath }/resources/upload/club/boardImg/${img.imgRe}" alt="">
		                            </div>
		                      </c:if>
		                      </c:forEach>
	                     </div>
                      </c:if>
                      
                      <div class="article1-line"></div>
                      <form action="${pageContext.request.contextPath }/clubboard/insertmainComment.do" method="post" >
                      <div class="article1-comment-box">
                      	  <input type="hidden" name="boardRef" value="${cbl.boardNo }" />
                      	  <input type="hidden" name="clubCode" value="${club.clubCode }" />
                      	  <input type="hidden" name="memberCode" value="${clubLoggedIn.memberCode }" />
                          <input type="text" name="commentContent" placeholder="댓글입력">
                          <input type="submit" value="입력" />
                      </div>
                      </form>
                      
                      <c:if test="${cbl.boardCommentYn =='y'}">
                      
                      <div class="article1-comment-count">
                          <div class="comment-sliderbutton">
                              	<i class="fas fa-sort-down" style="font-size: 18px;"></i>
                          </div>
                      </div>
                      
                      <div class="comment-hiddenbox">
					  
                      <c:forEach items="${clubBoardComment }" var="comment">
                      <c:if test='${comment.boardRef == cbl.boardNo }'>
                          <div class="article1-commnet-container">
                           	  <div class="comment-frofile-img">
                              	<img src="${pageContext.request.contextPath }/resources/upload/profile/${comment.profileImgRe}" alt="" />
                              </div>
                              <div class="comment-block"></div>
	                          <div class="comment-frofile-name">${comment.profileName }</div>
	                          <p class="comment-content">
		                          ${comment.commentContent }
	                          </p>
	                          <div class="comment-right-box">
	                              <p>신고</p>
	                          </div>
                     		</div>
                      </c:if>
               		</c:forEach> 
                     </div>
                    </c:if> 
                      
                  </div>
              </div>
          </c:forEach>
         </c:if>
         </article>
          <!-- 게시물카드끝-->
         
  </section>
  
<div class="filter-container-container">
	<div class="scroll-container">


	
	</div>
</div>  



<style>
.search-zero{
	width:100%;
	height:400px;
	border-radius:20px;
	margin:0 auto;
	margin-top:50px;
	padding-top:200px;
	text-align: center;
	display:none; 
	background-color:white;
}
.search-zero>p{
	font-size:40px;
	color:#7d7d7d;
	font-weight: bold;
}
.fa-file-excel{
	font-size:90px;
	color:#7d7d7d;
}


</style>



</body>
</html>