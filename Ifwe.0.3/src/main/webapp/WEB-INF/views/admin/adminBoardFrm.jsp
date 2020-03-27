<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminNotice</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adminInclude.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adminBoardFrm.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adminBoardFrm2.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/boardForm.css">
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/226b55f414.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.6.0/moment.min.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.js"></script>
<script>
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
		$("#search").selectric();
		
		
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
			url : '${pageContext.request.contextPath}/board/insertBoardImg.do',
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
				$(el).summernote('editor.insertImage', data[2]);
				$('summernote').append('<img src="'+data[2]+'" width = "400", height = "auto" />');
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
<body>
	
	<section>
	<jsp:include page="/WEB-INF/views/common/adminInclude.jsp"></jsp:include>
        <div class="title_wrap">
            <h1>notice</h1>
        </div>		
        <div class="section-title-box">
			<p>공지사항 등록</p>
		</div>
		<form action="${pageContext.request.contextPath }/board/insertBoard.do" autocomplete="off" method="POST" onsubmit="return boardValidate();" enctype = "multipart/form-data">
			<div class="board">
				<div class="white_bgm">
						<div class="select-boxs">
      						<input type="hidden" name="boardCate" value="notice"> 
<!-- 	                        <select name="boardCate" id="search">
	                            <option value="notice" selected>공지사항</option>
	                        </select> -->
	                    </div>
					<div class="wrap_1">
						<label id="main_title">제목</label> 
						<input type="text" id="title" class="no-border" name="boardTitle">
						<h3 class="writer">작성자 : ${memberLoggedIn.memberId}</h3>
					</div>
					<hr>
					<h3 class="main_content">내용</h3>
					<br /><br />
				<textarea name="boardContent" id="summernote" cols="30" rows="10"></textarea>
				<input type="hidden" name="memberCode" id="memberCode" value="${memberLoggedIn.memberCode }">
				<input type="hidden" name="viewName" value="admin/adminNotice">
				<div class="btn_wrap">
	           		<input type="submit" id="modify_1" value="등록" class="no-border">
	       		 </div>
				</div>
			</div>
		</form>
    </section>
	
</body>
</html>