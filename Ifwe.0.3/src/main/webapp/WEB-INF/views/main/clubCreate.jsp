<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/mainInclude.jsp">
	<jsp:param value="소모임 생성" name="pageTitle"/>
</jsp:include>
<script>
$(function(){
	
	$('[name=category]').click(function () {
        var radioVal = $('input[name="category"]:checked').val();
        console.log(radioVal);
      });
	
	$(".yellow-label-span").click(function(){
		$(this).css('background-color','#ffc862');
		$(this).children().css('color','white');
		$(this).next().css('background-color','');
		$(this).next().children().css('color','');
		$(this).next().next().css('background-color','');
		$(this).next().next().children().css('color','');
		$(this).prev().css('background-color','');
		$(this).prev().children().css('color','');
		$(this).prev().prev().css('background-color','');
		$(this).prev().prev().children().css('color','');
	
	});
	
	
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
     $("#tag-form").on("submit", function (e) {
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
	
 	$("[name=upFile]").on("change",e=>{
		let $file = $(e.target);
		
		//취소한경우
		if($file.prop('files')[0] === undefined){
			$("#upFileLabel").val("파일을 선택하세요");
		}else{
			$("#upFileLabel").val($file.prop('files')[0].name);
		}
		
	});
	
    
});


function clubDuplicate(){
	let radio = $("input[type=radio]").val();
	let hash = $("#rdTag").val();
	let title = $("#clubtitle").val();
	let content = $("#clubContent").val();
	let location = $("#search1").val();
	let peopleMax = $("#search2").val();
	let file = $("#upFileLabel").val();
	
	
	if(radio.trim() == ""){
		$("input[type=radio]").focus();
		return false;
	}
	if(hash.trim() == ""){
		$("#rdTag").focus();
		return false;
	}
	if(title.trim() == ""){
		$("#clubtitle").focus();
		return false;	
	}
	if(content.trim() == ""){
		$("#clubContent").focus();
		return false;
	}
	if(location.trim() == ""){
		$("#search1").focus();
		return false;
	}
	if(peopleMax.trim() == "" ){
		$("#search2").focus();
		return false;
	}
	if(file == "파일을 선택하세요"){
		$("#upFileLabel").focus();
		return false;
	}
		
	
	return true;
};

</script>
<style>
	.select-boxs{
		width:200px;
		float:left;
	}
    .thin-font{
        font-weight: 100;
    }
    #container{ 
        margin: 6%;
        height: 1160px;
    }
    .number-createclub{
        font-size: 35px;
        display: inline;
        margin-right: 4%;
    }
    .title{
        font-size: 25px;
        display: inline;
        font-weight: 100;
    }
    .inputs{
        margin-left: 6%;
        margin-top: 2%;
        list-style: none;
    }
    .inputs .buttons{
        border: 1px solid #ffc862;
        background-color: #ffc862;
        color: white;
        font-size: 20px;
        border-radius: 20px;
        outline: 0;
        width: 195px;
        height: 45px;
        margin: 0 2% 0 0 ;
    }
    .info-container{
        margin-bottom:5%
    }
    .span-post{
        color:rgb(235, 42, 14); 
        margin-left: 5%;
        font-size: 25px;
    }
    .span-people{
        color:rgb(56, 209, 9);; 
        margin-left: 5%;
        font-size: 25px
    }
    .input-text{
        width: 970px;
        height: 60px;
        font-size: 20px;
        border-radius: 20px;
        outline: 0;
        border: 0;
        background-color: #ebebeb;;
    }
    .input-file{
        width: 700px;
        height: 60px;
        font-size: 20px;
        border-radius: 20px;
        outline: 0;
        border: 0;
        background-color: #ebebeb;;
    }

    .upload-hidden{
        width: 0;
        height: 0;
        padding: 0;
        overflow: hidden;
        border: 0;
    }
    .file-label{
        margin-left: 3%;
        padding:1.5%;
        font-size: 25px;
        vertical-align: middle;
        background-color: #ffc862;;
        cursor: pointer;
        color: white;
        border-radius: 5px;
    }
    .c-btn{
        width: 400px;
        height: 65px;
        background-color: rgb(50, 87, 161);
        color: white;
        font-size: 25px;
        border-radius: 20px;
        border: 1px solid rgb(50, 87, 161);
        outline: 0;
        margin-bottom:2%;
    }
    .yellow-lable{
        margin-left: 25%;
    }
   	.yellow-label-span{
    	line-height:2;
        display: inline-block;
        width: 200px;
        border: 1px solid #ffc862;
        font-size: 20px;
        border-radius: 20px;
        outline: 0;
        margin-right:3%;
    }
    .radio-hidden{
    	display:none;
    }
    
     ul {
         padding: 16px 0;
     }
 
     ul li.tag-item{
         display: inline-block;
         margin: 0 5px;
         font-size: 14px;
         letter-spacing: -.5px;
     }
     
     form {
         padding-top: 16px;
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
     }
 
     .del-btn {
        font-size: 17px;
        font-weight: bold;
        cursor: pointer;
        margin-left: 20px;
        vertical-align: 12%;
        color:black;
     }
    input{
    	padding-left : 30px;
    }
    
</style>
	<section class="clubcreate-section">
		<div id="container" >
            <form action="${pageContext.request.contextPath }/club/clubCreate.do" method="post" id="tag-form" 
            	  autocomplete="off" enctype="multipart/form-data" onsubmit="return clubDuplicate();">
            	  <input type="hidden" name="clubMaster" value="${memberLoggedIn.memberCode }" />
                <div id="first" class="info-container">
                    <div class="number-createclub font-kor">01</div>
                    <div class="font-kor title thin-font">어떤 소모임을 만드실건가요?</div>
                    <div class="inputs">
                 	<div class="yellow-label-span">		
   			 			<label for="concert" class="yellow-lable">공연/전시</label>
					</div>
			
				    <div class="yellow-label-span">
				        <label for="study" class="yellow-lable">&nbsp;&nbsp;&nbsp;스터디</label>
				    </div>
			
				    <div class="yellow-label-span">
				        <label for="music" class="yellow-lable">음악/댄스</label>
				    </div>
                   		
                   	<div class="radio-hidden">
                 		<input type="radio" name="clubCatecode" id="music" value="음악댄스"/>
                    	<input type="radio" name="clubCatecode" id="study" value="스터디"/>
                    	<input type="radio" name="clubCatecode" id="concert"  value="공연전시"/>
                   	</div>
                        <!-- <input type="button" value="공연/전시" name="concert" class="font-kor buttons">
                        <input type="button" value="스터디" name="study" class="font-kor buttons">
                        <input type="button" value="음악/댄스" name="music" class="font-kor buttons"> -->
                    </div>
                </div>
                <div id="second" class="info-container">
                    <div class="number-createclub font-kor">02</div>
                    <div class="font-kor title thin-font">소모임 키워드를 4개이하로 입력해주세요</div>
                    <span class="font-kor span-post thin-font">단어입력후 Enter쳐주세요</span>
                    <div class="inputs">
                    	<input type="hidden" value="" name="cateCode" id="rdTag" />
                    
                        <input type="text" name="keywords" class="font-kor input-text thin-font" 
                        	   id="tag" size="6">
                        
                        <ul id="tag-list">
       				    </ul>
                        
                    </div>
                </div>
                <div id="third" class="info-container">
                    <div class="number-createclub font-kor">03</div>
                    <div class="font-kor title thin-font">소모임명을 정해주세요</div>
                    <div class="inputs">
                        <input type="text" id="clubtitle" name="clubTitle" class="font-kor input-text thin-font">
                    </div>
                </div>
                <div id="fourth" class="info-container">
                    <div class="number-createclub font-kor">04</div>
                    <div class="font-kor title thin-font">소모임 소개글을 입력하세요</div>
                    <div class="inputs">
                        <input type="text" id="clubContent" name="clubContent" class="font-kor input-text thin-font" >
                    </div>
                </div>
                <div id="fifth" class="info-container">
                    <div class="number-createclub font-kor">05</div>
                    <div class="font-kor title thin-font">소모임 주 활동지역을 설정해주세요</div>
                      <div class="inputs">
                        <div class="select-boxs">
                     <select name="clubLocation" id="search1">
                         <option value="전체" disabled selected>전체</option>
                         <option value="서울">서울시</option>
                         <option value="경기">경기도</option>
                         <option value="강원">강원도</option>
                         <option value="충북">충청북도</option>
                         <option value="충남">충청남도</option>
                         <option value="경북">경상북도</option>
                         <option value="경남">경상남도</option>
                         <option value="전북">전라북도</option>
                         <option value="전남">전라남도</option>
                         <option value="제주특별자치도">제주도</option>
                     </select>
                	</div>
                        <span class="font-kor thin-font span-people"></span>
                    </div>
                </div>
                <div id="sixth" class="info-container">
                    <div class="number-createclub font-kor">06</div>
                    <div class="font-kor title thin-font">소모임 인원수를 정해주세요</div>
                    <div class="inputs">
                        <div class="select-boxs">
                     <select name="clubMax" id="search2">
                         <option value="전체" disabled selected>전체</option>
                         <option value="10">10</option>
                         <option value="15">15</option>
                         <option value="20">20</option>
                         <option value="25">25</option>
                     </select>
                	</div>
                        <span class="font-kor thin-font span-people">최대 25명</span>
                    </div>
                </div>
                <div id="seventh" class="info-container">
                    <div class="number-createclub font-kor">07</div>
                    <div class="font-kor title thin-font">소모임 배너에 들어갈 대표이미지를 지정해주세요</div>
                    <div class="inputs">
                        <input name="fileName" id="upFileLabel" class="font-kor input-file thin-font" 
                        	   value="파일을 선택하세요" readonly>
                        <label for="input-file" class="file-label font-kor">파일첨부</label>
                        <input type="file" id="input-file" name="upFile" class="upload-hidden">
                    </div>
                </div>
                <div id="create-btn" class="inputs">
                    <input type="submit" value="소모임 생성" class="font-kor c-btn">
                </div>
            </form>
        </div>
	</section>
<script>
$(function(){
	  $("#search1").selectric();
	  $("#search2").selectric();
	
});


</script>
</body>
</html>