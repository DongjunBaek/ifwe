<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminMember</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adminInclude.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adminEvent.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adminEventFrm.css">
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/226b55f414.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
</head>
<body>

   <section>
	<jsp:include page="/WEB-INF/views/common/adminInclude.jsp"></jsp:include>
        <div class="title_wrap">
            <h1>event</h1>
        </div>
        
         <div class="event2_title">
            <h2>이벤트 등록</h2>
        </div>
        <form action="${pageContext.request.contextPath}/admin/eventInsert.do"
         method="post" enctype="multipart/form-data">
            <div class="board_content_wrap">
                <div class="content_title_wrap">
                    <h3>제목</h3>
                    <input type="text" name="eventTitle" class="content_title">
                    <div class="event_date_wrap">
                        <i class="fas fa-calendar-alt"></i><label for="eventStart">이벤트 시작일</label>
                        <input type="date" name="eventStart" class="event_date">
                        <br>
                        <i class="fas fa-calendar-alt"></i><label for="eventEnd">이벤트 종료일</label>
                        <input type="date" name="eventEnd" class="event_date">
                    </div>
                </div>

                <div class="content_wrap">
                    <h3>내용</h3>
                    <textarea name="eventContent" class="board_content"></textarea>
                </div>
                <div class="content_img_wrap">
                    <label for="upfile">파일첨부</label>
                    <input type="file" name="upFile" id="upFile">
                </div>
                <div class="btn_event_wrap">
                    <input type="submit" id="event_insert_btn" class="btn_event" value="이벤트 등록">
                </div>
            </div>
        </form> 
        
        
   </section>