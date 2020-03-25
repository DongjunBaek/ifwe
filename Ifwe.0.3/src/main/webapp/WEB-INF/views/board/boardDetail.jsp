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
		url:"",
		data : {boardNo : ${boardNo}},
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

.boardDetail-div-content {
	width: 90%;
	height: 60%;
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
	display: flex;
}

.boardDetail-div-title-center div:first-child {
	margin-left: 5%;
	height: 50%;
	font-size: 32px;
	position: relative;
	top: 50%;
	border-bottom: 8px solid #2756a6;
}


.boardDetail-div-content-date {
	margin-left: 5%;
	height: 50%;
	font-size: 32px;
	position: relative;
	top: 50%;
	border-bottom: 8px solid #2756a6;
}

.boardDetail-div-title-center div:last-child {
	width: 20%;
	height: 50%;
	position: relative;
	left: 43%;
	display: flex;
	top: 50%;
}

.boardDetail-div-title-center button {
	outline: none;
	border: none;
	flex: 1;
	margin-right: 10%;
	font-size: 20px;
	color: #ebebeb;
	background-color: #2756a6;
}

.boardDetail-div-title-center button:last-child {
	color: #ebebeb;
	background-color: #c0392b;
}

.boardDetail-div-content div {
	position: relative;
	margin-left: 5%;
	margin-top: 3%;
	width: 90%;
}
</style>

	<section>
		<div class="boardDetail-div-title">
			<div class="boardDetail-div-title-center">							
				<div>${board.boardTitle }</div>
				<div class="boardDetail-div-content-date">
					<p> ${board.boardDate }</p>
				</div>
				<div>
					<button onclick="boardOneUpdate();"> 수정 하기 </button>
					<button onclick="boardOneDelete();"> 삭제 하기 </button>
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