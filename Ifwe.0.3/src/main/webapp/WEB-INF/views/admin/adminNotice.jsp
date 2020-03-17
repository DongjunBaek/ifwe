<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminNotice</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adminInclude.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adminNotice.css">
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/226b55f414.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>

<script>
    $(document).ready(function(){
	        
        $(".notice1").css("display","none");
        $(".notice2").css("display","none");
        $(".notice3").css("display","none");
    });
   $(function(){
        $('#menu1').click(function(){

            $(".notice1").css("display","block");
            $(".notice2").css("display","none");
            $(".notice3").css("display","none");
        });
        $('#menu2').click(function(){

            $(".notice2").css("display","block");
            $(".notice1").css("display","none");
            $(".notice3").css("display","none");
        });
        $('#menu3').click(function(){

            $(".notice3").css("display","block");
            $(".notice1").css("display","none");
            $(".notice2").css("display","none");
        });

    });
</script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/adminInclude.jsp"></jsp:include>
	
	  <section>
        <div class="title_wrap">
            <h1>notice</h1>
        </div>

        <div class="menu_wrap">
            <div class="notice_menu" id="menu1">
                <div class="border"></div>
                <h2>공지사항</h2>
            </div>
            <div class="notice_menu"  id="menu2">
                <div class="border"></div>
                <h2>1:1문의</h2>
            </div>
            <div class="notice_menu" id="menu3">
                <div class="border"></div>
                <h2>신고게시판</h2>
            </div>
        </div>

        <div class="notice1">
            <div class="notice1_title">
                <h2>공지사항</h2>
                <input type="button" id="write" class="write" value="게시글 작성">
            </div>
            <table>
                <thead>
                    <tr>
                        <th>제목</th>
                        <th>작성일</th>
                        <th>수정 | 삭제</th>
                    </tr>
                </thead>
                <tr>
                    <td>[공지]공지사항 입니다</td>
                    <td>2020-03-11</td>
                    <td><input type="button" id="modify" class="modify" value="수정">
                        <input type="button" id="delete" class="delete" value="삭제"></td>    
                </tr>
                <tr>
                    <td>[공지]공지사항 입니다</td>
                    <td>2020-03-11</td>
                    <td><input type="button" id="modify" class="modify" value="수정">
                        <input type="button" id="delete" class="delete" value="삭제"></td>    
                </tr>
                <tr>
                    <td>[공지]공지사항 입니다</td>
                    <td>2020-03-11</td>
                    <td><input type="button" id="modify" class="modify" value="수정">
                        <input type="button" id="delete" class="delete" value="삭제"></td>    
                </tr>
                <tr>
                    <td>[공지]공지사항 입니다</td>
                    <td>2020-03-11</td>
                    <td><input type="button" id="modify" class="modify" value="수정">
                        <input type="button" id="delete" class="delete" value="삭제"></td>    
                </tr>
                <tr>
                    <td>[공지]공지사항 입니다</td>
                    <td>2020-03-11</td>
                    <td><input type="button" id="modify" class="modify" value="수정">
                        <input type="button" id="delete" class="delete" value="삭제"></td>    
                </tr>
                <tr>
                    <td>[공지]공지사항 입니다</td>
                    <td>2020-03-11</td>
                    <td><input type="button" id="modify" class="modify" value="수정">
                        <input type="button" id="delete" class="delete" value="삭제"></td>    
                </tr>
                <tr>
                    <td>[공지]공지사항 입니다</td>
                    <td>2020-03-11</td>
                    <td><input type="button" id="modify" class="modify" value="수정">
                        <input type="button" id="delete" class="delete" value="삭제"></td>    
                </tr>
                <tr>
                    <td>[공지]공지사항 입니다</td>
                    <td>2020-03-11</td>
                    <td><input type="button" id="modify" class="modify" value="수정">
                        <input type="button" id="delete" class="delete" value="삭제"></td>    
                </tr>
                <tr>
                    <td>[공지]공지사항 입니다</td>
                    <td>2020-03-11</td>
                    <td><input type="button" id="modify" class="modify" value="수정">
                        <input type="button" id="delete" class="delete" value="삭제"></td>    
                </tr>
                <tr>
                    <td>[공지]공지사항 입니다</td>
                    <td>2020-03-11</td>
                    <td><input type="button" id="modify" class="modify" value="수정">
                        <input type="button" id="delete" class="delete" value="삭제"></td>    
                </tr>
                <tr>
                    <td>[공지]공지사항 입니다</td>
                    <td>2020-03-11</td>
                    <td><input type="button" id="modify" class="modify" value="수정">
                        <input type="button" id="delete" class="delete" value="삭제"></td>    
                </tr>
            </table>
        </div>

        <div class="notice2">
            <div class="notice2_title">
                <h2>1:1문의</h2>
            </div>
            <table>
                <thead>
                    <tr>
                        <th>제목</th>
                        <th>작성일</th>
                        <th>답변</th>
                    </tr>
                </thead>
                <tr>
                    <td>[문의]1:1문의 입니다</td>
                    <td>2020-03-11</td>
                    <td><input type="button" id="answer" class="answer" value="답변"></td>    
                </tr>
                <tr>
                    <td>[문의]1:1문의 입니다</td>
                    <td>2020-03-11</td>
                    <td><input type="button" id="answer" class="answer" value="답변"></td>    
                </tr>
                <tr>
                    <td>[문의]1:1문의 입니다</td>
                    <td>2020-03-11</td>
                    <td><input type="button" id="answer" class="answer" value="답변"></td>    
                </tr>
                <tr>
                    <td>[문의]1:1문의 입니다</td>
                    <td>2020-03-11</td>
                    <td><input type="button" id="answer" class="answer" value="답변"></td>    
                </tr>
                <tr>
                    <td>[문의]1:1문의 입니다</td>
                    <td>2020-03-11</td>
                    <td><input type="button" id="answer" class="answer" value="답변"></td>    
                </tr>
                <tr>
                    <td>[문의]1:1문의 입니다</td>
                    <td>2020-03-11</td>
                    <td><input type="button" id="answer" class="answer" value="답변"></td>    
                </tr>
                <tr>
                    <td>[문의]1:1문의 입니다</td>
                    <td>2020-03-11</td>
                    <td><input type="button" id="answer" class="answer" value="답변"></td>    
                </tr>
                <tr>
                    <td>[문의]1:1문의 입니다</td>
                    <td>2020-03-11</td>
                    <td>답변완료</td>    
                </tr>
                <tr>
                    <td>[문의]1:1문의 입니다</td>
                    <td>2020-03-11</td>
                    <td>답변완료</td>    
                </tr>
                <tr>
                    <td>[문의]1:1문의 입니다</td>
                    <td>2020-03-11</td>
                    <td>답변완료</td>    
                </tr>
                <tr>
                    <td>[문의]1:1문의 입니다</td>
                    <td>2020-03-11</td>
                    <td>답변완료</td>    
                </tr>
            </table>
        </div>

        <div class="notice3">
            <div class="notice3_title">
                <h2>신고게시판</h2>
            </div>
            <table>
                <thead>
                    <tr>
                        <th>제목</th>
                        <th>작성일</th>
                        <th>답변</th>
                    </tr>
                </thead>
                <tr>
                    <td>[신고]신고합니다</td>
                    <td>2020-03-11</td>
                    <td><input type="button" id="answer" class="answer" value="답변"></td>    
                </tr>
                <tr>
                    <td>[신고]신고합니다</td>
                    <td>2020-03-11</td>
                    <td><input type="button" id="answer" class="answer" value="답변"></td>    
                </tr>
                <tr>
                    <td>[신고]신고합니다</td>
                    <td>2020-03-11</td>
                    <td><input type="button" id="answer" class="answer" value="답변"></td>    
                </tr>
                <tr>
                    <td>[신고]신고합니다</td>
                    <td>2020-03-11</td>
                    <td><input type="button" id="answer" class="answer" value="답변"></td>    
                </tr>
                <tr>
                    <td>[신고]신고합니다</td>
                    <td>2020-03-11</td>
                    <td><input type="button" id="answer" class="answer" value="답변"></td>    
                </tr>
                <tr>
                    <td>[신고]신고합니다</td>
                    <td>2020-03-11</td>
                    <td><input type="button" id="answer" class="answer" value="답변"></td>    
                </tr>
                <tr>
                    <td>[신고]신고합니다</td>
                    <td>2020-03-11</td>
                    <td>답변완료</td>    
                </tr>
                <tr>
                    <td>[신고]신고합니다</td>
                    <td>2020-03-11</td>
                    <td>답변완료</td>    
                </tr>
                <tr>
                    <td>[신고]신고합니다</td>
                    <td>2020-03-11</td>
                    <td>답변완료</td>    
                </tr>
                <tr>
                    <td>[신고]신고합니다</td>
                    <td>2020-03-11</td>
                    <td>답변완료</td>    
                </tr>
                <tr>
                    <td>[신고]신고합니다</td>
                    <td>2020-03-11</td>
                    <td>답변완료</td>    
                </tr>
              
            </table>
        </div>


    </section>
	
</body>
</html>