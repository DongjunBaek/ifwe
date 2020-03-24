<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/common/mainInclude.jsp">
	<jsp:param value="게시글 상세보기" name="pageTitle"/>
</jsp:include>

<script>
$(function(){
	
});
</script>

<style>

/* 0324 동준 */
.boardDetail-div-title{
	width : 100%;
	height: 40%;
	border : 1px solid red;
}
.boardDetail-div-content{
	width : 100%;
	height: 60%;
	border : 1px solid blue;
}
.boardDetail-div-title-center{
	width : 100%;
	height: 90%;
	border : 1px solid springGreen;
	position: relative;
	top : 50%;
	left : 50%;
	transform : translateY(-50%) translateX(-50%);
	
}
</style>

	<section>
		<div class="boardDetail-div-title">
			<div class="boardDetail-div-title-center">
				<p>${board.boardTitle }</p>
			</div>
		</div>
		<div class="boardDetail-div-content">
			<div class="boardDetail-div-title-center">
				<p>${board.boardContent }</p>
			</div>
		</div>
	</section>
</body>
</html>