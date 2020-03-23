<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile Update</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/main/afterLoginCommon.css">
<script src="https://kit.fontawesome.com/5e1e16b3f4.js"
	crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/748cfe3a61.js"
	crossorigin="anonymous"></script>
<link
	href="https://fonts.googleapis.com/css?family=Fredoka+One&display=swap"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/main/mypage.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/member/makeProfile.css">
<script>

/* 파일 등록 취소시 취소되는구문	  */
$(()=>{
	
	$("[name=upFile]").on("change", e => {
		let $file = $(e.target); //사용자가 작성한 file input 태그
		
		//취소한 경우
		if($file.prop('files')[0] === undefined){
			$file.next(".custom-file-label").html("파일을 선택하세요.");
		}
		else{
			let fileName = $file.prop('files')[0].name;
			$file.next(".custom-file-label").html(fileName);
		}
	});
	
	
});





$(()=>{
	
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
	                $("#tag-list").append("<li class='tag-item' >#"+tagValue+"<span class='del-btn' idx='"+counter+"'>x</span></li>");
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








</script>

</head>


<body>
	<jsp:include page="/WEB-INF/views/common/mainInclude.jsp"></jsp:include>
	<section>
		


		<article class="first">
			<div class="intro-div">
				<div class="img-div">
					<img
						src="${pageContext.request.contextPath }/resources/upload/member/frofileimg/ex2.jpg"
						alt="">
				</div>
				<div class="myname-div font-kor">
					<div style="font-size: 25px; margin: 0 10%">@wingStudy_02</div>
					<div
						style="font-size: 30px; font-weight: 900; margin: 5% 20% 0 30%">스테파니</div>
				</div>
			</div>
			<div class="btn-div">
				<input type="button" value="회원정보 수정" class="update-btn font-kor">
			</div>
			<div class="list-div">
				<div class="list-title">
					<p
						style="color: white; font-size: 20px; font-weight: bold; padding: 6%;"
						class="font-kor">소모임 목록</p>
					<div class="list-ul-container">
						<ul class="font-kor list-ul" style="padding: 0;">
							<li><p class="p-class">윙스터디 모임</p></li>
							<li><p class="p-class">윙스터디</p></li>
							<li><p class="p-class">윙</p></li>
						</ul>
					</div>
				</div>
			</div>
		</article>

		<article class="makeProfile-article font-kor">
			<div class="makeProfile-article-title font-kor">
				<p>소개글</p>
			</div>


			<!-- 	<div class="makeProfile-article-contents font-kor">
					<input type="text" class="makeProfile-infotext1 font-kor">
					<input type="text" class="makeProfile-infotext2 font-kor"
						placeholder="    #관심사 입력" id="tag" size="6">					
						<input type="hidden" value="" name="tag" id="rdTag" />
                        <ul id="tag-list">
                   
       				    </ul>
				</div> -->
				<div class="makeProfile-article-inputImg font-kor">
					<p>프로필 이미지 등록</p>
					<div class="uploadImg-div">
						<div><!-- 
							<span></span> -->
							
							
							
						</div>
						<div>
<!-- 							<label for="upFile">파일 첨부</label> <input type="file"
								name="upFile" id="upFile" style="display: none;"> -->
						</div>
					</div>
				</div>

<!-- 				onsubmit="return boardValidate();" -->
				
					<form name="profileFrm"
				action="${pageContext.request.contextPath}/member/profileUpdate.do"
				method="post" 
				enctype="multipart/form-data"
				id="tag-form"
				>
				
				<div class="input-group mb-3" style="padding: 0px;">
					<div class="custom-file">
						<input type="file" class="custom-file-input" name="upFile"
							id="upFile"> <label class="custom-file-label"
							for="upFile">파일을 선택하세요</label>
					</div>	
				</div>
				<input type="text" placeholder="프로필소개글" name="profileComment" id="profileComment" />
				
				
				
				
				<input type="text" placeholder="닉네임" />

				<div class="makeProfile-article-button font-kor">
					<input type="submit" value="프로필 카드 등록"
						class="makeProfile-btn-insert font-kor">
				</div>
			
			
			
				<input type="hidden" name="memberCode" id="memberCode" value="${memberLoggedIn.memberCode }" />
				<input type="hidden" name="memberCode" id="profileAge" value="${memberLoggedIn.memberBirth }" />
				<input type="hidden" name="memberCode" id="profileAge" value="${memberLoggedIn.memberGender }" />
			
				<div class="makeProfile-article-contents font-kor">
					<input type="text" class="makeProfile-infotext2 font-kor"
						placeholder="    #관심사 입력" id="tag" size="6">					
						<input type="hidden" value="" name="contentsCateCodes" id="rdTag" />
                        <ul id="tag-list">                   
       				    </ul>
				</div>
			
			</form>
		</article>

	</section>