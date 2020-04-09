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

<!-- 0326 게시글 수정 작업 -->

<script>
	$(document).ready(function() {
		$('#summernote').val("${board.boardContent}");
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
/* 		$("#search").selectric(); */
		
		console.log($('summernote'));
		console.log($('#summernote'));
		
		$("#modify_2").click(function(){
			console.log(this);
			$("#updateFrm").submit();
		})
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
<style>
.no-border{
border:0;}
.wrap_1 {
    height: 50px;
    padding-top: 10px;
}

.wrap_1 input {
    line-height: normal;
    width: 1000px;
    height: 50px;
    outline : none;
}

.wrap_1 label {
    display: inline-block;
    max-width: 100%;
    margin-bottom: 5px;
    /* font-weight: 700; */
    padding-left: 25px;
    margin-right: 25px;
    font-size: 20px;
}
</style>

	<section>
		<jsp:include page="/WEB-INF/views/common/adminInclude.jsp"></jsp:include>
	  <div class="title_wrap">
            <h1>notice</h1>
        </div>		
        <div class="section-title-box">
			<p>${board.boardCate }</p>
		</div>
				
			<form id="updateFrm" action="${pageContext.request.contextPath }/board/updateBoard.do" autocomplete="off" method="POST" onsubmit="return boardValidate();" enctype = "multipart/form-data">
			<div class="board">
				<div class="white_bgm">
					<div class="select-boxs">
	                        <select name="boardCate" id="search">
	                            <option value="notice" ${board.boardCate=='notice'?"selected":"" } selected>공지사항</option>
	                          <%--   <option value="qna" ${board.boardCate=='qna'?"selected":"" }>문의사항</option>
	                            <option value="report" ${board.boardCate=='report'?"selected":"" }>신고사항</option> --%>
	                        </select>
	                    </div>
					<div class="wrap_1">
						<label id="main_title">제목</label> 
						<input type="text" id="title" class="no-border" name="boardTitle" value="${board.boardTitle}">
						<%-- <h3 class="writer">작성자 : ${memberLoggedIn.memberId}</h3> --%>
					</div>
					<hr>
					<h3 class="main_content">내용</h3>
					<br /><br />
				<textarea name="boardContent" id="summernote" cols="30" rows="10"></textarea>
				<input type="hidden" name="memberCode" id="memberCode" value="${memberLoggedIn.memberCode }">
				<input type="hidden" name = "boardNo" value = "${board.boardNo }" />
				<div class="btn_wrap">
	           		<input type="submit" id="modify_1" value="수정" class="no-border">
	       		 </div>
				</div>
			</div>
		</form>
	</section>

</body>
<style>
input {
	padding:0;
}
</style>
</html>