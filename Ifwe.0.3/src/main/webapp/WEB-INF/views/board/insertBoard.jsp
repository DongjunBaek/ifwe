<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/afterLoginCommon.css">
<script src="https://kit.fontawesome.com/5e1e16b3f4.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery.selectric.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Fredoka+One&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/mainboard.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/selectric.css">
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/selectric.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/boardForm.css">
<script>

	$(document).ready(function() {
		$('#summernote').summernote({
			placeholder : 'content',
			minHeight : 400,
			maxHeight : null,
			focus : true,
			lang : 'ko-KR',
		});
		$("#search").selectric();
	});
</script>
<style>
* {
	border: 0;
}

</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/mainInclude.jsp"></jsp:include>

	<section>
		<div class="section-title-box">
			<p>게시판</p>
			<p>ifwe를 사용하시면서 궁금한 점이나 신고사항을 적어주세요</p>
		</div>
		<div class="board">
			<div class="white_bgm">
				 <div class="select-box">
                        <select name="search" id="search">
                            <option value="">공지사항</option>
                            <option value="">문의사항</option>
                            <option value="">신고사항</option>
                        </select>
                    </div>
				<div class="wrap_1">
					<label id="main_title">제목</label> 
					<input type="text" id="title">
					<h3 class="writer">작성자 : abc123</h3>
				</div>
				<hr>
				<h3 class="main_content">내용</h3>
				<br /><br />
			<textarea name="summernote" id="summernote" cols="30" rows="10"></textarea>
			<div class="btn_wrap">
           		<input type="button" id="modify_1" value="등록">
       		 </div>
			</div>
		</div>
	</section>

</body>
</html>