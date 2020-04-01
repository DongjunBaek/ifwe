<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminMember</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adminInclude.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adminEvent.css">
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/226b55f414.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
<script>
function noEvent() {
if (event.keyCode == 116) {
event.keyCode= 2;
return false;
}
else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82))
{
return false;
}
}
document.onkeydown = noEvent;

function EventFrm(){
	location.href="${pageContext.request.contextPath}/admin/adminEventFrm.do";
}
function EventDel(){
	if(!confirm("해당 게시글을 삭제하시겠습니까?")) 
		return;
}
</script>

</head>
<body>

   <section>
	<jsp:include page="/WEB-INF/views/common/adminInclude.jsp"></jsp:include>
        <div class="title_wrap">
            <h1>event</h1>
        </div>
        <div class="event">
            <div class="event_title">
                <h2>이벤트</h2>
                <input type="button" id="write" class="write" value="이벤트 등록" onclick="EventFrm()">
            </div>
            <table>
                <thead>
                    <th>제목</th>
                    <th>파일명</th>
                    <th>시작일</th>
                    <th>종료일</th>
                    <th>수정</th>
                    <th>삭제</th>
                </thead>
                
                <c:forEach items="${eventList}" var="eventList">                	
                <tr>
                    <td>${eventList.eventTitle}</td>
                    <td>${eventList.eventImgOri }</td>
                    <td>${eventList.eventStart }</td>
                    <td>${eventList.eventEnd }</td>
                    <td>
                    <form action="${pageContext.request.contextPath}/admin/adminEventUpdateFrm.do?eventCode=${eventList.eventCode }" method="post">
                    	<input type="hidden" name="eventCode" value="${eventList.eventCode }"/>
                    	<input type="submit" id="modify" class="modify" value="수정">
                    </form>
                    </td>
                    <td>
			        <form action="${pageContext.request.contextPath}/admin/adminEventDel.do?eventCode=${eventList.eventCode }" method="post">
                        <input type="hidden" name="eventCode" value="${eventList.eventCode }"/>
                        <input type="submit" id="delete" class="delete" value="삭제" onclick="EventDel()">  
                    </form> 
                    </td>
                </tr>
                </c:forEach>
            </table>
        </div>
    </section>
</body>
</html>