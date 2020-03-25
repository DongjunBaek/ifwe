<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/common/mainInclude.jsp">
	<jsp:param value="게시글 상세보기" name="pageTitle"/>
</jsp:include>

<script>
function boardOneUpdate(){
	location.href = "";
}
function boardOneDelete(){
	var checkDelBoardOne = prompt("삭제하시겠습니까?(Y or N)");
	console.log(checkDelBoardOne);
	
	$.ajax({
		
		url : "",
		success : function(data){
			console.log(data);
		},
		error : function(x,h,r){
			console.log(x,h,r);
		}
	});
}

/* 온로드 함수 */
$(function(){
	
});
</script>

<style>

/* 0324 동준 여주에게 물어보고 css 조정해야할듯... */
@font-face {
	font-family: 'GmarketSansLight';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.boardDetail-div-title {
	width: 100%;
	height: 10%;
}
.titlebox2{
	margin-top: 4%;
}
.boardDetail-div-content {
	width: 90%;
	min-height: 60%;
	background-color: #ebebeb;
	margin-left: 5%;
	margin-top: 3%;
	padding-top: 1%;
	display: flex;
	flex-direction: column;
}

.boardDetail-div-title-center {
	width: 100%;
	height: 100%;
	position: relative;
	top: 50%;
	left: 50%;
	transform: translateY(-50%) translateX(-50%);
	
}

.boardDetail-div-title-center div:first-child {
	float : left;
	margin-left: 5%;
	padding-top : 1%;
	height: 50%;
	font-size: 32px;
	position: relative;
	top: 50%;
	border-top: 5px solid #2756a6;	
}
.boardDetail-div-title-center div:nth-child(2){
	float : right;
	width : 2%;
}
.boardDetail-div-title-center div:nth-child(3){
	width : 8.2%;
	margin-right : 5%;
	font-size: 26px;
	line-height: 60px;
}
.boardDetail-div-title-center div:nth-child(4){
	width: 8.2%;
    margin-right: 5%;
    font-size: 20px;
    line-height: 60px;
}
.boardDetail-div-title-center div:nth-child(5){
	margin-right : 5%;
	border: none;
}

.boardDetail-div-content-date {
	margin-left: 5%;
	height: 50%;
	font-size: 32px;
	position: relative;
	top: 50%;
	border-bottom: 8px solid #2756a6;
}
.boardDetail-div-title-2-1{
	margin-left : 5%;	
	width : 8%;
	height: 100%;
	float: left;
	
}
.boardDetail-div-title-2-2{
	float : right;
	width: 84%;
}
#boardDetal-profile-img{
	width: 100px;
	height: 100px;
	background-image: url("../resources/upload/admin/board/20200324_200732838_465.jpg");
	background-size: cover;
	border-radius: 50%; 
	float: left;
}
.boardDetail-div-title-2-1-name{
	width: 55%;
	height: 100%;
	float: right;
	font-size: 24px;
    line-height: 103px;
}

.boardDetail-div-content div {
	position: relative;
	margin-left: 5%;
	margin-top: 3%;
	width: 90%;
}
.title-2-2-title{
	font-size: 48px;
}
.boardDetail_bgcolor{
	margin-top : 3%;
	background-color: white;
	min-height: 1080px;
}
.boardDetail-div-writerBox p{
	font-size: 32px;
}
.boardDetail-div-dateBox{
	float: right;
    margin-right: 12%;
    margin-bottom: 2%;
    font-size : 28px;
}
.boardDetail-div-optionBox{
	margin-right : 2%;
	float: right;
}
.boardDetail-div-optionBox i{
	float: right;
}
</style>
	
	<section class="boardDetail_bgcolor">
		<div class="boardDetail-div-title">
			
			<div class="boardDetail-div-title-center">			
				<div>${board.boardCate == notice?"공지 사항":board.boardCate == "qna"?"문의 사항":"신고 사항	" }</div>
				<div class="boardDetail-div-dateBox">
					<p> ${board.boardDate }</p>
				</div>										
				<div class="boardDetail-div-optionBox">
					<i class="fas fa-caret-down"></i>
				</div>
				
			</div>
		</div>
		<div class="boardDetail-div-title titlebox2">
			<div class="boardDetail-div-title-2-1">
				<div id="boardDetal-profile-img">
					
				</div>
			
			</div>
			<div class="boardDetail-div-title-2-2">
				<div class="title-2-2-title">${board.boardTitle }</div>
				<div class="boardDetail-div-writerBox">
					<p> 작성자 </p>
				</div>
			</div>		
		</div>
 		<div class="boardDetail-div-content">

			<div>
				<p> ${board.boardContent }</p>
			</div>

		</div>
		 
	</section>
</body>
</html>