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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adminBoardAnswer.css">
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/226b55f414.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.6.0/moment.min.js"></script>
<script>
function boardCommentValidate(){
	console.log(보내기);
	return true;
}
</script>
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
                <p>${member.memberName }</p>
            </div>
            <div class="content_wrap">
                <h3>내용</h3>
                <textarea id="board_content" class="board_content" row="40" cols="40" readonly><c:out value='${board.boardContent.replaceAll("\\\<.*?\\\>","")}' /></textarea>
            </div>
        </div>
         <div class="boardRepleBack">
            <h3>답변</h3>
            <form id="boardRepleFrm">
				<input type="hidden" name = "boardNo" value = "${board.boardNo }" /> 
                <input type="hidden" name="memberCode" id="memberCode" value="${board.memberCode }">
				<textarea id="boardReple" name="commentContent" class="boardReple" row="40" cols="40"></textarea>
                <div class="btn_reple_wrap">
                    <input type="submit" id="board_reple_btn" class="btn_boardReple" value="답변등록">
                </div>
            </form>
        </div>
    </section>
    

</body>
</html>