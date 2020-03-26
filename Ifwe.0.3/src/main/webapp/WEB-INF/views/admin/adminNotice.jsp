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
<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.6.0/moment.min.js"></script>

<script>

$(document).ready(function(){     
	   
			var boardCategory = "notice";
			console.log(boardCategory)
			$.ajax({
				url : "${pageContext.request.contextPath}/admin/adminBoardList.do",
				data : {boardCategory : boardCategory},
				success : data =>{
					console.log(data);

					$parentDiv = $("#appendList");
					$parentDiv.empty();

					$.each(data, function(idx,value){
					console.log(idx);
					console.log(value);
					
					$parentDiv.append("<tr><td>"+(value.boardCate == "notice"?"[공지] " : value.boardCate == "qna"?"[문의] ":"[신고] ")+value.boardTitle+"</td>"
							+"<td>"+moment("/Date("+value.boardDate+")/").format("YYYY-MM-DD").toString()+"</td></tr>");
						
					}); 
				},
				error : function(x,h,r){
					console.log(x,h,r);
				}
			});
		});
    
    $(function(){
        $(".notice_menu").click(function(){
			var boardCategory = $(this).attr("id");
			console.log(boardCategory)
			$.ajax({
				url : "${pageContext.request.contextPath}/admin/adminBoardList.do",
				data : {boardCategory : boardCategory},
				success : data =>{
					console.log(data);

					$parentDiv = $("#appendList");
					$parentDiv.empty();

					$.each(data, function(idx,value){
					console.log(idx);
					console.log(value);
					
					$parentDiv.append("<tr><td>"+(value.boardCate == "notice"?"[공지] " : value.boardCate == "qna"?"[문의] ":"[신고] ")+value.boardTitle+"</td>"
							+"<td>"+moment("/Date("+value.boardDate+")/").format("YYYY-MM-DD").toString()+"</td></tr>");				
					}); 
				},
				error : function(x,h,r){
					console.log(x,h,r);
				}
			});
		});
    });
    $(function(){
    	$("#qna").click(function(){
    		$(".write").css("display","none");
    	});
    	$("#report").click(function(){
    		$(".write").css("display","none");
    	});
    	$("#notice").click(function(){
    		$(".write").css("display","block");
    	});
    	
    	$(".write").click(function(){
    		location.href="${pageContext.request.contextPath}/admin/boardForm.do";
    	})
    });
    
    

</script>



</head>
<body>
	
	<section>
	<jsp:include page="/WEB-INF/views/common/adminInclude.jsp"></jsp:include>
        <div class="title_wrap">
            <h1>notice</h1>
        </div>

        <div class="menu_wrap">
            <div class="notice_menu" id="notice">
                <div class="border"></div>
                <h2>공지사항</h2>
            </div>
            <div class="notice_menu"  id="qna">
                <div class="border"></div>
                <h2>1:1문의</h2>
            </div>
            <div class="notice_menu" id="report">
                <div class="border"></div>
                <h2>신고게시판</h2>
            </div>
        </div>

        <div class="notice1">
		    <div class="notice1_title">
		        <input type="button" id="write" class="write" value="게시글 작성">
		    </div>
	    
            <table>
                <thead>
                    <tr>
                        <th>제목</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody id="appendList">
                </tbody>
            </table>
        </div>
    </section>
	
</body>
</html>