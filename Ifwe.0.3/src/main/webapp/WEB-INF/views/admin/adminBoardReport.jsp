<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminNotice</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adminInclude.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adminBoardAnswerDetail.css">
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/226b55f414.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.6.0/moment.min.js"></script>
</head>
<body>
	<section>
	<jsp:include page="/WEB-INF/views/common/adminInclude.jsp"></jsp:include>
       <div class="title_wrap">
            <h1>${board.boardCate }</h1>
        </div>
        <div class="board_content_wrap">
            <div class="content_title_wrap">
                <h3>제목</h3>
                <input type="text" id="content_title" class="content_title" value="${board.boardTitle }" readonly>
                <p>${board.boardDate }</p>
            </div>
            <div class="content_wrap">
                <h3>내용</h3>
                <textarea id="board_content" class="board_content" row="40" cols="40" readonly><c:out value='${board.boardContent.replaceAll("\\\<.*?\\\>","")}' /></textarea>
            </div>
        </div>
        	 <div class="btn_reple_wrap">
             	<input type="submit" id="board_reple_btn" class="btn_boardRepleDel" value="요청 처리" onclick="boardReport()">
             </div>
    </section>

</body>
<style>
.btn_reple_wrap::after{
	content : "";
	display : block;
	clear : both;
}
.btn_reple_wrap{
	width : 1400px;
	height: 30px;
	margin-left : 400px;
	text-align : center;
}
.btn_boardRepleDel{
	margin-right: 640px;
}
#board_reple_btn {
    margin-top: 30px;
    text-align: center;
}
</style>

</html>