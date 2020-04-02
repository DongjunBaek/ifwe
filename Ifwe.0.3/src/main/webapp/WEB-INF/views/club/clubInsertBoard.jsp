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
<script src="${pageContext.request.contextPath }/resources/js/jquery.selectric.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/selectric.css">
<script src="https://kit.fontawesome.com/5e1e16b3f4.js" crossorigin="anonymous"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.js"></script>
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
    
    $(function(){
		 
		//*****************해쉬태그 생성 **********************
		 var tag = {};
	     var counter = 0;

	     // 태그를 추가한다.
	     function addTag (value) {
	         tag[counter] = value; // 태그를 Object 안에 추가
	         counter++; // counter 증가 삭제를 위한 del-btn 의 고유 id 가 된다.
	     }

	     // 최종적으로 서버에 넘길때 tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
	     function marginTag () {
	         return Object.values(tag).filter(function (word) {
	             return word !== "";
	         });
	     }
	 
	     // 서버에 넘기기
	     $("#clubtag-form").on("submit", function (e) {
	         var value = marginTag(); // return array
	         $("#rdTag").val(value); 

	         $(this).submit();
	     });

	     $("#tag").on("keypress", function (e) {
	         var self = $(this);

	         // input 에 focus 되있을 때 엔터 및 스페이스바 입력시 구동
	         if (e.key === "Enter" || e.keyCode == 32) {

	             var tagValue = self.val(); // 값 가져오기
				 var reg = /^[가-힣]{1,8}$/;
	             // 값이 없으면 동작 ㄴㄴ
	             if (tagValue !== "" && reg.test(tagValue)) {
						
	                 // 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
	                 var result = Object.values(tag).filter(function (word) {
	                     return word === tagValue;
	                 })
	             
	                 // 태그 중복 검사
	                 if (result.length == 0) { 
	                     $("#tag-list").append("<li class='tag-item'>#"+tagValue+"<span class='del-btn' idx='"+counter+"'>x</span></li>");
	                     addTag(tagValue);
	                     self.val("");
	                 } else {
	                     alert("태그값이 중복됩니다.");
	                 }
	             }else{
	            	$("#tag").val('');
	             }
	             e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
	         }
	     });

	     // 삭제 버튼 
	     // 삭제 버튼은 비동기적 생성이므로 document 최초 생성시가 아닌 검색을 통해 이벤트를 구현시킨다.
	     $(document).on("click", ".del-btn", function (e) {
	         var index = $(this).attr("idx");
	         tag[index] = "";
	         $(this).parent().remove();
	     });
		
		//****************해쉬태그 끝 ********************

	});
    
});





</script>
<style>
.aside-leader-img{width:190px;height:190px;}
ul,p{margin:0;}
.article-insertboard-notice{
 background-color: white;

    margin-top:4%;
    width: 1300px;
    min-height: 500px;
    margin-bottom: 50px;
}
.article-insertboard-notice-title{
height:50px;clear:both;padding-left: 2%;font-size:20px;}
/* .select-boxssss{
		width:200px;
		float:left;
		    margin-left: 2%;
} */
.insertboard-writer{
	width:200px;height:50px;float:right;}
.input-text{
	width: 900px;
    height: 40px;
    background-color: #f1f2f2;
    border-radius: 20px;
    outline: none;
  /*   margin-left: 30px;
    padding-left: 20px;
    margin-top: 30px */}
    .insertboard-content{
    font-size:20px;padding-left:2%;    padding-right: 2%;}
    .btnClass{
    width: 150px;
    height: 40px;
    background-color: #ffc862;
    color: #3b3b3b;
    border-radius: 20px;
    margin:0 auto;
    outline: none;
    cursor: pointer;
    margin-left:45%;
    font-size: 16px;
    font-family: 'Noto Sans KR', sans-serif;
    }
     /* ul {
         padding: 16px 0;
     } */
 
     ul li.tag-item{
         display: inline-block;
         margin: 0 5px;
         font-size: 14px;
         letter-spacing: -.5px;
     }
      ul li.tag-item {
         padding: 10px 15px;
         padding-right:20px;
         background-color: #ffc862;
         color: white;
         border-radius: 20px;
         font-size:20px;
     }
     .tag-item:hover {
         background-color: #feba3b;
         color: #fff;
     }.aside-boardmenu{height:244px;}.aside-boardmenu li{height:26px;}.friend-name-profile{height:46px;}.aside-leader-id{height:23px;}.aside-friend-list{margin-top:50px;}
</style>
<script>
$(document).ready(function() {
	
	$("#searchBoard").selectric();
	$(document).ready(function() {
		$('#summernote').summernote({
			placeholder : 'content',
			minHeight : 400,
			maxHeight : null,
			focus : true,
			lang : 'ko-KR',
			callbacks : {
				onImageUpload : function(files, editor){
					sendUpLoadImgFile(files[0], this);
				}
			}
		});
		
	});
});
	
function sendUpLoadImgFile(file, el){
	console.log("이미지 로드 함수");
	var Frmdata = new FormData();
	console.log("이미지 로드 변수 생성");
	Frmdata.append('file',file);
	console.log("이미지 로드 변수 초기화");
	$.ajax({
		data : Frmdata,
		type : 'POST',
		url : '${pageContext.request.contextPath}/clubboard/insertBoardImg.do',
		cache : false,
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		success : function(data) {
			console.log("img up load success");
			
			/*
			console.log("url originalFileName",data[0]);
			console.log("url renamedFileName",data[1]);
			console.log("el", data[1]); 
			*/
			$("#boardImgOri").val(data[0]);
			$("#boardImgRe").val(data[1]);
			//$(el).summernote('editor.insertImage', data[2]);
			$('.summernote-images').append('<img src="'+data[2]+'" width = "200", height = "100px" />');
			console.log(data[1]);
			console.log(data[2]);
			$('.summernote-images').append('<input type="hidden" value='+'"'+data[0]+'"'+ ' name = "summernote-images" />');
			$('.summernote-images').append('<input type="hidden" value='+'"'+data[1]+'"'+ ' name = "summernote-images-re" />');
			
			
		},
		error : function(x,h,r){
			console.log(x,h,r);
		}
	});
}
	
	
	function boardValidate(){
		/* 게시글 등록 유효성 검사 */
		return true;
	}
</script>
</head>
<body style="background-color:rgba(246,246,246,0.5);;">
<jsp:include page="/WEB-INF/views/common/clubInclude.jsp"></jsp:include>
  <section class="flotclass">
      <article class=" flotclass">
      
      
          <div class="article-insertboard-notice">
     
          
    <form action="${pageContext.request.contextPath }/clubboard/clubInsertBoardFrm" id="clubtag-form" method="POST">
			<div class="select-boxssss">
	              <select name="clubBoardlistNo" id="searchBoard">
	              	<c:if test="${not empty clubBoardList }">
	              	<c:forEach items="${clubBoardList }" var="list">
	                    <option value="${list.clubBoardlistNo }" >${list.boardName }</option>
	              	</c:forEach>
	                    
	              	</c:if>
	               </select>
	      </div>
	         <br />
              	<div class="article-insertboard-notice-title">
              		제목 : <input type="text" class="input-text" name="boardTitle"/>
              		<div class="insertboard-writer font-kor">작성자 :${memberLoggedIn.memberId }
              		<input type="hidden" name="memberCode" value="${memberLoggedIn.memberCode }" /></div>
              		<input type="hidden" name="clubCode" value="${club.clubCode }" />
              
              		
              	</div>
              <br />
              
              	<div class="insertboard-content">
              	<input type="hidden" value="" name="boardCateCode" id="rdTag" />
             	내용 &nbsp; <input type="text" class="input-text" placeholder="해시태그입력" id="tag" name="clubtag" style="padding-left:1%;"/>
				<ul id="tag-list" style="padding-left:5%;margin-bottom:2%;">
       				    </ul><br />
       				    
				<textarea name="boardContent" id="summernote" cols="30" rows="10"></textarea>	
              	</div>
              	<div class="summernote-images"></div>
              	
              	<input type="submit" value="등록" class="btnClass" />
               </form>
          </div>
          
          
          
          
      </article>
      
  </section>


</body>
</html>