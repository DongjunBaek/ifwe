<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/common/mainInclude.jsp">
	<jsp:param value="게시판글쓰기 " name="pageTitle"/>
</jsp:include>


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
<style>
.no-border{
border:0;}

</style>

	<section>
		<div class="section-title-box">
			<p>게시판</p>
			<p>ifwe를 사용하시면서 궁금한 점이나 신고사항을 적어주세요</p>
		</div>
				
		<form action="${pageContext.request.contextPath }/board/insertBoard.do" autocomplete="off" method="POST" onsubmit="return boardValidate();" enctype = "multipart/form-data">
			<div class="board">
				<div class="white_bgm">
					<div class="select-boxs">
	                        <select name="boardCate" id="search">
	                            <option value="notice">공지사항</option>
	                            <option value="qna">문의사항</option>
	                            <option value="report">신고사항</option>
	                        </select>
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
				<div class="btn_wrap">
	           		<input type="submit" id="modify_1" value="등록" class="no-border">
	       		 </div>
				</div>
			</div>
		</form>
	</section>
</body>

</html>