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
		});
		$("#search").selectric();
	});
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
		<div class="board">
			<div class="white_bgm">
				 <div class="select-boxs">
                        <select name="search" id="search">
                            <option value="">공지사항</option>
                            <option value="">문의사항</option>
                            <option value="">신고사항</option>
                        </select>
                    </div>
				<div class="wrap_1">
					<label id="main_title">제목</label> 
					<input type="text" id="title" class="no-border">
					<h3 class="writer">작성자 : abc123</h3>
				</div>
				<hr>
				<h3 class="main_content">내용</h3>
				<br /><br />
			<textarea name="summernote" id="summernote" cols="30" rows="10"></textarea>
			<div class="btn_wrap">
           		<input type="button" id="modify_1" value="등록" class="no-border">
       		 </div>
			</div>
		</div>
	</section>

</body>
</html>