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
<script>
function boardContentDel(){
	if(!confirm("해당 게시글을 삭제하시겠습니까?")) 
	
		return;
	location.href="${pageContext.request.contextPath}/admin/boardCommentDelete.do?boardNo="+${board.boardNo};
}
function boardCommentValidate(){
	console.log($("#boardReple").text());
	return true;
	
}
/* function boardContentUpdate(){
	location.href="${pageContext.request.contextPath}/admin/boardCommentUpdateFrm.do";
} */
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
                <p>${board.boardDate}</p>
                <p>${member.memberName }</p>
            </div>
            <div class="content_wrap">
                <h3>내용</h3>
                <textarea id="board_content" class="board_content"  readonly><c:out value='${board.boardContent.replaceAll("\\\<.*?\\\>","")}'></c:out></textarea>
            </div>
        </div>
         <div class="boardRepleBack">
            <h3>답변</h3>
            <form id="boardRepleFrm" action="${pageContext.request.contextPath}/admin/boardCommentUpdateFrm.do" method="post" onsubmit="return boardCommentValidate();">
				<input type="hidden" name = "boardNo" value = "${board.boardNo }" /> 
                <input type="hidden" name="memberCode" id="memberCode" value="${board.memberCode }">
            	<textarea id="boardReple" name="commentContent" class="boardReple">${boardComment.commentContent}</textarea>
				<%-- <input type="hidden" name="commentContent" id="commentContent" value="${boardComment.commentContent }"/>  --%> 
                <div class="btn_reple_wrap">
                    <input type="submit" id="board_reple_btn" class="btn_boardReple" value="답변수정">
                </div>
            </form>
                <div class="btn_reple_wrap">
                    <input type="submit" id="board_reple_btn" class="btn_boardRepleDel" value="답변 삭제" onclick="boardContentDel()">
                </div>
        </div>
    </section>
    

</body>
</html>