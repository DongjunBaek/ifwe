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
<style>
html{
	width:1920px;
	height:1280px;
	margin:0 auto;
}
</style>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/club/clubinclude.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/club/clubmain.css">
<script src="https://kit.fontawesome.com/5e1e16b3f4.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Fredoka+One&display=swap" rel="stylesheet">
<script>
let num = 0;


                      	$(function(){
                      		 $(".heart").click(function(){
                      		    if($(this).hasClass("liked")){
                      		      console.log($(this),000);
                      		      $(this).html('<i class="fa fa-heart-o" aria-hidden="true"></i>');
                      		      $(this).removeClass("liked");
                      		      deleteHeart($(this).prev().val());
                      		      $(this).next().html("좋아요 "+num);
                      		    }else{
                      		    	console.log($(this),111);
                      		      $(this).html('<i class="fa fa-heart" aria-hidden="true"></i>');
                      		      $(this).addClass("liked");
                      		      updateHeart($(this).prev().val());
                      		    $(this).next().html("좋아요 "+num);
                      		    }
                      		  });
                      	});
                      	
                      	function updateHeart(boardNo){
                      		let memberCode = $("[name=memberCode]").val();
                      		/*let boardNo = $("[name=boardNo]").val();*/
                      		var data = {"memberCode" :memberCode, "boardNo":boardNo}
                      		console.log(boardNo);
                     		$.ajax({
                      		    	  url:"${pageContext.request.contextPath}/clubboard/heart.do",
                      		    	  data : data,
                      		    	  async: false,
                      		    	  success : function(data){
                      		    		  console.log(data);
                      		    		  num = data;
                      		    	  },
                      		    	  error:function(x,s,e){
                      		    		  console.log(x,s,e);
                      		    	  }
                      		     });
                      	}
                      	function deleteHeart(boardNo){
                      		let memberCode = $("[name=memberCode]").val();
                      		/* let boardNo = $("[name=boardNo]").val(); */
                      		var data = {"memberCode" :memberCode, "boardNo":boardNo}
                      		console.log(boardNo);
                      		$.ajax({
                		    	  url:"${pageContext.request.contextPath}/clubboard/heartMinus.do",
                		    	  data : data,
                		    	  async: false,
                		    	  success : function(data){
                		    		  console.log(data);
                		    		  num = data;
                		    	  },
                		    	  error:function(x,s,e){
                		    		  console.log(x,s,e);
                		    	  }
                		     });
                      	}

$(function(){
	
	
	
	$(".comment-sliderbutton").click(function(){
		console.log($(this).parent().next()[0]);
		$(this).parent().next().slideToggle(300);
		
	});
	

	
    
	$(".comment-hiddenbox").each(function(idx,item){
		
		var cnt = $(item).children().length;
		$(item).prev().children().append("<span>댓글 "+cnt+"개</span>");
	});
    
    
    
    
    
	$(".friend-name-profile").click(function(){
		location.href="${pageContext.request.contextPath }/member/profile.do?memberCode="+${clubMaster.memberCode};
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
    
    
    
    $(".three-dots").click(function(){
    	console.log("신고신고신고");
    	$(".click-three-dots").css("display","none");
    	$(this).next().css("display","block");
    });
    
    
    $("[name=board-report]").click(function(){
    	$('#myModal').show();
    })
    
    $(".click-three-dots").css("display","none");
    
    
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

function close_pop(flag) {
    $('#myModal').hide();
    $("[name=reportFrm]").submit();
};
</script>
<style>
.click-three-dots{width:200px;max-height: max-content;border:3px solid #cbcbcb;float:right; position: relative;top: 50px;}
.under-click-three-dots{width:200px;max-height: max-content;}
.under-click-three-dots p{max-width:max-content; margin:12px auto;font-size:20px;}
 /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 20% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 30%; /* Could be more or less, depending on screen size */                          
        }
[name=reportReason]{
width: 550px;
    height: 40px;
    font-size: 15px;
    padding-left: 3%;
    border-radius: 20px;
    background-color: #ebebeb;
    outline: none;
}

</style>

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
                       <div class="article1-curcle-box three-dots" >
                          <div class="article1-curcle"></div>
                          <div class="article1-curcle"></div>
                          <div class="article1-curcle"></div>
                      </div>
                      <div class="click-three-dots">
                      <c:if test="${cbl.memberCode == memberLoggedIn.memberCode }">
                      	<div class="under-click-three-dots"><p><i class="far fa-edit"></i>수정</p></div>
                      	<div class="under-click-three-dots"><p><i class="far fa-trash-alt"></i>삭제</p></div>
                      </c:if>
                     <c:if test="${cbl.memberCode != memberLoggedIn.memberCode }">
                      	<div class="under-click-three-dots" name="board-report"><p><i class="far fa-angry"></i>신고</p></div>
                     </c:if>
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
                           <!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;"><i class="far fa-frown"></i> 게시글 신고</span></b></span></p>
                <p style="text-align: center; line-height: 1.5;"><br />이 게시글을 신고하시는 이유는 무엇인가요?</p>
                <form name="reportFrm" action="${pageContext.request.contextPath }/clubboard/report.do" method="POST">
                <p><br /></p>
                <p style="text-align: center; line-height: 1.5;"><br /><input type="text" name="reportReason" id="board-reason" /></p>
                <input type="hidden" name="boardNo" value="${cbl.boardNo }" />
                <input type="hidden" name="memberCode" value="${memberLoggedIn.memberCode }" />
                <input type="hidden" name="clubCode" value="${cbl.clubCode}" />
                <input type="hidden" name="clubBoardListNo" value="${cb.clubBoardlistNo}" />
                </form>
                <p><br /></p>
                <p><br /></p>
                <p><br /></p>
            <div style="cursor:pointer;background-color:#ED0000 ;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
                <span class="pop_bt" style="font-size: 13pt; color:white;" >
                     신고하기
                </span>
            </div>
      </div>
 
    </div>
        <!--End Modal-->
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
                     
                      
                      <style>
                      .fa-heart-o {
  						color: red;
  						cursor: pointer;
						}			

						.fa-heart {
						  color: red;
						  cursor: pointer;
						}
					</style>
                      
                      <div class="article1-line"></div>
                      <form action="${pageContext.request.contextPath }/clubboard/insertmainComment.do" method="post" >
                      <div class="article1-comment-box">
                      
                      	  <input type="hidden" name="boardRef" value="${cbl.boardNo }" />
                      	  <input type="hidden" name="clubCode" value="${club.clubCode }" />
                      	  <input type="hidden" name="memberCode" value="${clubLoggedIn.memberCode }" />
                      	  <input type="hidden" name="boardNo" value="${cbl.boardNo }"/>
                      	  <c:if test="${not empty heartMember }">
                      	  <c:forEach items="${heartMember }" var="h">
                      	 	<c:if test="${h.boardNo == cbl.boardNo }">
	                      	 	<c:if test="${h.memberCode == memberLoggedIn.memberCode }">
		                      	  <span class="heart" style="font-size:30px;margin-bottom:10px;">
		                      	  	<i class="fa fa-heart" aria-hidden="true" ></i> 
		                      	  </span>
		               			<span style="font-size:16px;" id="count">좋아요 ${cbl.boardHeart }</span>
	                      	 	</c:if>
	                      	 	<c:if test="${h.memberCode != memberLoggedIn.memberCode }">
	                      	 	 <span class="heart" style="font-size:30px;margin-bottom:10px;">
		                      	  	<i class="fa fa-heart-o" aria-hidden="true" ></i> 
		                      	  </span>
	                      	  	<span style="font-size:16px;" id="count">좋아요 ${cbl.boardHeart }</span>
	                      	 	</c:if>
	                     
                      	 	</c:if>
                      	</c:forEach>
                      	  </c:if>
                      	  
                      	  <c:if test="${empty heartMember }">
                      	  <span class="heart" style="font-size:30px;margin-bottom:10px;">
		                      	  	<i class="fa fa-heart-o" aria-hidden="true" ></i> 
		                      	  </span>
		               			<span style="font-size:16px;" id="count">좋아요 ${cbl.boardHeart }</span>
                      	  </c:if>
                      	
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