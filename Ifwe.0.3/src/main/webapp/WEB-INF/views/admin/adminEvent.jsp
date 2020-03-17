<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/adminInclude.jsp"></jsp:include>

   <section>
        <div class="title_wrap">
            <h1>event</h1>
        </div>
        <div class="event">
            <div class="event_title">
                <h2>이벤트</h2>
                <input type="button" id="write" class="write" value="이벤트 등록">
            </div>
            <table>
                <thead>
                    <th>제목</th>
                    <th>파일명</th>
                    <th>작성일</th>
                    <th>수정 | 삭제</th>
                </thead>
                <tr>
                    <td>[1]이벤트 입니다</td>
                    <td>event.jpg</td>
                    <td>2020-03-11</td>
                    <td><input type="button" id="modify" class="modify" value="수정">
                        <input type="button" id="delete" class="delete" value="삭제"></td>    
                </tr>
                <tr>
                    <td>[1]이벤트 입니다</td>
                    <td>event.jpg</td>
                    <td>2020-03-11</td>
                    <td><input type="button" id="modify" class="modify" value="수정">
                        <input type="button" id="delete" class="delete" value="삭제"></td>    
                </tr>
                <tr>
                    <td>[1]이벤트 입니다</td>
                    <td>event.jpg</td>
                    <td>2020-03-11</td>
                    <td><input type="button" id="modify" class="modify" value="수정">
                        <input type="button" id="delete" class="delete" value="삭제"></td>    
                </tr>
                <tr>
                    <td>[1]이벤트 입니다</td>
                    <td>event.jpg</td>
                    <td>2020-03-11</td>
                    <td><input type="button" id="modify" class="modify" value="수정">
                        <input type="button" id="delete" class="delete" value="삭제"></td>    
                </tr>
                <tr>
                    <td>[1]이벤트 입니다</td>
                    <td>event.jpg</td>
                    <td>2020-03-11</td>
                    <td><input type="button" id="modify" class="modify" value="수정">
                        <input type="button" id="delete" class="delete" value="삭제"></td>    
                </tr>
                <tr>
                    <td>[1]이벤트 입니다</td>
                    <td>event.jpg</td>
                    <td>2020-03-11</td>
                    <td><input type="button" id="modify" class="modify" value="수정">
                        <input type="button" id="delete" class="delete" value="삭제"></td>    
                </tr>
            </table>
        </div>
    </section>
</body>
</html>