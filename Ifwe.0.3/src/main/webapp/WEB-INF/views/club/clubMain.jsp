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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/club/clubmain.css">
<script src="https://kit.fontawesome.com/5e1e16b3f4.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Fredoka+One&display=swap" rel="stylesheet">
<script>
$(function(){
    $(".comment-sliderbutton").click(function(){
        $(this).parent().nextAll(".comment-hiddenbox").slideToggle(300);
    })
    
	$(".friend-name-profile").click(function(){
		location.href="${pageContext.request.contextPath }/member/profile.do"
	});
    
    $(".section-block-right").click(function(){
    	location.href = "${pageContext.request.contextPath}/club/clubInsertBoard"
    });
    
    $(".article1-imgbox").click(function(e){
        $(".filter-container-container").css("display","inline-block");
        var boardNo = $(this).children("#boardNohide").val();
        
        
        console.log("boardNo"+boardNo);
        
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
    console.log("imgcontainer1",imgcontainer);
    
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
		console.log(chkid);    	
    	
    	$(chkid).change(function(){
    		
    		console.log("야야야");
    		
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
              <p class="section-boradall">전체보기</p>
              <div class="section-block-right">
                  <p>글쓰기</p>
                  <i class="fas fa-pencil-alt"></i>
              </div>
          </div>
          
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
  
<div class="filter-container-container">
	<div class="scroll-container">


	
	</div>
</div>  


</body>
</html>