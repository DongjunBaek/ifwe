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
let cPage = 1;
var boardCategory;
$(document).ready(function(){     
			boardCategory = "notice";
			console.log(boardCategory)
			$.ajax({
				url : "${pageContext.request.contextPath}/admin/adminBoardList.do",
				data : {boardCategory : boardCategory},
				asyn : false,
				success : data =>{
					console.log(data);

					$parentDiv = $("#appendList");
					$parentDiv.empty();
					$(".pageBar_appendList").empty();
	
					$.each(data[2], function(idx,value){
					console.log(idx);
					console.log(value);
					console.log(value.memberCode);			
					
					$parentDiv.append("<tr><td><a href='${pageContext.request.contextPath}/admin/adminBoardDetail.do?boardNo="+value.boardNo+"'>"+(value.boardCate == "notice"?"[공지] " : value.boardCate == "qna"?"[문의] ":"[요청] ")+value.boardTitle+"</a></td>"
							+"<td>"+moment("/Date("+value.boardDate+")/").format("YYYY-MM-DD").toString()+"</td></tr>");				
					}); 
					
					
				 	cPage = data[0];
	     			var tPage = data[1];
	     			var pageBarSize = 5;
	     			var pageStart = Math.floor((cPage-1)/pageBarSize)*pageBarSize+1; 
	     			var pageEnd = pageStart+pageBarSize-1;
	     			var pageNo = pageStart;
	     			console.log(pageStart);
	     			console.log(tPage);
	      			$children4 = $("<div class='pageBar_noticeList'></div>");
	       			if(cPage <= 1){
	       				$children4.append($("<button class='listForBoard' onclick='reloadFunctionToAjax("+(1)+")' value="+(1)+">[이전]</button>"));
	       			}else{
	       				$children4.append($("<button class='listForBoard' onclick='reloadFunctionToAjax("+(cPage-1)+")' value="+(cPage-1)+">[이전]</button>"));
	       			}
	       			
	       			for( var i = pageStart; i <= pageEnd;i++){
	       				if(i == cPage){
	       					$children4.append($("<button class='listForBoard' onclick='reloadFunctionToAjax("+(i)+")' value="+(i)+"><strong>"+i+"</strong></button>"));
	       				}else{
	       					$children4.append($("<button class='listForBoard' onclick='reloadFunctionToAjax("+(i)+")' value="+(i)+">"+i+"</button>"));
	       				}
	       				if(i == tPage){
	       					break;
	       				}
	       			}
	       			
	       			if(cPage == tPage){
	       				$children4.append($("<button class='listForBoard' onclick='reloadFunctionToAjax("+(tPage)+")' value="+(tPage)+">[다음]</button>"));
	       			}else{
	       				$children4.append($("<button class='listForBoard' onclick='reloadFunctionToAjax("+(cPage+1)+")' value="+(cPage+1)+">[다음]</button>"));
	       			}
	      				
	       			$(".pageBar_appendList").append($children4);
					
					
				},
				error : function(x,h,r){
					console.log(x,h,r);
				}
			});
		});
    $(function(){
        $(".notice_menu").click(function(){
			boardCategory = $(this).attr("id");
			console.log(boardCategory)
			$.ajax({
				url : "${pageContext.request.contextPath}/admin/adminBoardList.do",
				data : {boardCategory : boardCategory},
				asyn :false,
				success : data =>{
					console.log(data);

					$parentDiv = $("#appendList");
					$parentDiv.empty();
					$(".pageBar_appendList").empty();
					
					$.each(data[2], function(idx,value){
					console.log(idx);
					console.log(value);
					console.log(value.boardLevel);
					
				/* 	$parentDiv.append("<tr><td onclick='boardTitleClick()'><form id='boardNoFrm'><input type='hidden' name='boardNo' value='"+value.boardNo+"'>"+(value.boardCate == "notice"?"[공지] " : value.boardCate == "qna"?"[문의] ":"[신고] ")+value.boardTitle+"</td>"
							+"<td>"+moment("/Date("+value.boardDate+")/").format("YYYY-MM-DD").toString()+"</td>"+"<td>"+value.boardNo+"</td></tr>");				
					});  */
					if(value.boardCate == 'notice'){
						$parentDiv.append("<tr><td><a href='${pageContext.request.contextPath}/admin/adminBoardDetail.do?boardNo="+value.boardNo+"'>"+(value.boardCate == "notice"?"[공지] " : value.boardCate == "qna"?"[문의] ":"[요청] ")+value.boardTitle+"</a></td>"
								+"<td>"+moment("/Date("+value.boardDate+")/").format("YYYY-MM-DD").toString()+"</td></tr>");		
					}else if(value.boardCate=='qna' && value.boardLevel == 1){
						$parentDiv.append("<tr><td><a href='${pageContext.request.contextPath}/admin/adminBoardAnswerDetail.do?boardNo="+value.boardNo+"'>"+(value.boardCate == "notice"?"[공지] " : value.boardCate == "qna"?"[문의] ":"[요청] ")+value.boardTitle+"</a>  <span class='answerSucess'>[등록완료]</span> </td>"
								+"<td>"+moment("/Date("+value.boardDate+")/").format("YYYY-MM-DD").toString()+"</td></tr>");	
					}else if(value.boardCate=='qna' && value.boardLevel == 0){						
						$parentDiv.append("<tr><td><a href='${pageContext.request.contextPath}/admin/adminBoardAnswer.do?boardNo="+value.boardNo+"'>"+(value.boardCate == "notice"?"[공지] " : value.boardCate == "qna"?"[문의] ":"[요청] ")+value.boardTitle+"</a></td>"
								+"<td>"+moment("/Date("+value.boardDate+")/").format("YYYY-MM-DD").toString()+"</td></tr>");				
					}else if(value.boardCate=='report' && value.boardDel == 'd'){						
						$parentDiv.append("<tr><td><a href='${pageContext.request.contextPath}/admin/adminBoardAnswer.do?boardNo="+value.boardNo+"'>"+(value.boardCate == "notice"?"[공지] " : value.boardCate == "qna"?"[문의] ":"[요청] ")+value.boardTitle+"</a> <span class='answerSucess'>[요청완료]</span> </td>"
								+"<td>"+moment("/Date("+value.boardDate+")/").format("YYYY-MM-DD").toString()+"</td></tr>");				
					}
					else{
						$parentDiv.append("<tr><td><a href='${pageContext.request.contextPath}/admin/adminBoardReport.do?boardNo="+value.boardNo+"'>"+(value.boardCate == "notice"?"[공지] " : value.boardCate == "qna"?"[문의] ":"[요청] ")+value.boardTitle+"</a></td>"
								+"<td>"+moment("/Date("+value.boardDate+")/").format("YYYY-MM-DD").toString()+"</td></tr>");				
						
					}
					
					}); 
			
			
				 	cPage = data[0];
	     			var tPage = data[1];
	     			var pageBarSize = 5;
	     			var pageStart = Math.floor((cPage-1)/pageBarSize)*pageBarSize+1; 
	     			var pageEnd = pageStart+pageBarSize-1;
	     			var pageNo = pageStart;
	     			console.log(pageStart);
	     			console.log(tPage);
	      			$children4 = $("<div class='pageBar_noticeList'></div>");
	       			if(cPage <= 1){
	       				$children4.append($("<button class='listForBoard' onclick='reloadFunctionToAjax("+(1)+")' value="+(1)+">[이전]</button>"));
	       			}else{
	       				$children4.append($("<button class='listForBoard' onclick='reloadFunctionToAjax("+(cPage-1)+")' value="+(cPage-1)+">[이전]</button>"));
	       			}
	       			
	       			for( var i = pageStart; i <= pageEnd;i++){
	       				if(i == cPage){
	       					$children4.append($("<button class='listForBoard' onclick='reloadFunctionToAjax("+(i)+")' value="+(i)+"><strong>"+i+"</strong></button>"));
	       				}else{
	       					$children4.append($("<button class='listForBoard' onclick='reloadFunctionToAjax("+(i)+")' value="+(i)+">"+i+"</button>"));
	       				}
	       				if(i == tPage){
	       					break;
	       				}
	       			}
	       			
	       			if(cPage == tPage){
	       				$children4.append($("<button class='listForBoard' onclick='reloadFunctionToAjax("+(tPage)+")' value="+(tPage)+">[다음]</button>"));
	       			}else{
	       				$children4.append($("<button class='listForBoard' onclick='reloadFunctionToAjax("+(cPage+1)+")' value="+(cPage+1)+">[다음]</button>"));
	       			}
	      				
	       			$(".pageBar_appendList").append($children4);
			
					
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
    
    
    function reloadFunctionToAjax(no){
    	/* console.log("버튼클릭"); */
    	cPage = no;
    	
    		$.ajax({
    			url : "${pageContext.request.contextPath}/admin/adminBoardList.do",
    			data : {boardCategory : boardCategory,
    					cPage : cPage},
    			asyn :false,
    			success : data =>{
    				console.log(data);

    				$parentDiv = $("#appendList");
    				$parentDiv.empty();
    				$(".pageBar_appendList").empty();
    				
    				$.each(data[2], function(idx,value){
    				console.log(idx);
    				console.log(value);
    				console.log(value.boardLevel);
    				
    			/* 	$parentDiv.append("<tr><td onclick='boardTitleClick()'><form id='boardNoFrm'><input type='hidden' name='boardNo' value='"+value.boardNo+"'>"+(value.boardCate == "notice"?"[공지] " : value.boardCate == "qna"?"[문의] ":"[신고] ")+value.boardTitle+"</td>"
    						+"<td>"+moment("/Date("+value.boardDate+")/").format("YYYY-MM-DD").toString()+"</td>"+"<td>"+value.boardNo+"</td></tr>");				
    				});  */
    				if(value.boardCate == 'notice'){
    					$parentDiv.append("<tr><td><a href='${pageContext.request.contextPath}/admin/adminBoardDetail.do?boardNo="+value.boardNo+"'>"+(value.boardCate == "notice"?"[공지] " : value.boardCate == "qna"?"[문의] ":"[요청] ")+value.boardTitle+"</a></td>"
    							+"<td>"+moment("/Date("+value.boardDate+")/").format("YYYY-MM-DD").toString()+"</td></tr>");		
    				}else if(value.boardCate=='qna' && value.boardLevel == 1){
    					$parentDiv.append("<tr><td><a href='${pageContext.request.contextPath}/admin/adminBoardAnswerDetail.do?boardNo="+value.boardNo+"'>"+(value.boardCate == "notice"?"[공지] " : value.boardCate == "qna"?"[문의] ":"[요청] ")+value.boardTitle+"</a>  <span class='answerSucess'>[등록완료]</span> </td>"
    							+"<td>"+moment("/Date("+value.boardDate+")/").format("YYYY-MM-DD").toString()+"</td></tr>");	
    				}else if(value.boardCate=='qna' && value.boardLevel == 0){						
    					$parentDiv.append("<tr><td><a href='${pageContext.request.contextPath}/admin/adminBoardAnswer.do?boardNo="+value.boardNo+"'>"+(value.boardCate == "notice"?"[공지] " : value.boardCate == "qna"?"[문의] ":"[요청] ")+value.boardTitle+"</a></td>"
    							+"<td>"+moment("/Date("+value.boardDate+")/").format("YYYY-MM-DD").toString()+"</td></tr>");				
    				}
    				else{
    					$parentDiv.append("<tr><td><a href='${pageContext.request.contextPath}/admin/adminBoardReport.do?boardNo="+value.boardNo+"'>"+(value.boardCate == "notice"?"[공지] " : value.boardCate == "qna"?"[문의] ":"[요청] ")+value.boardTitle+"</a></td>"
    							+"<td>"+moment("/Date("+value.boardDate+")/").format("YYYY-MM-DD").toString()+"</td></tr>");				
    				}
    				
    				}); 
    		
    		
    			 	cPage = data[0];
         			var tPage = data[1];
         			var pageBarSize = 5;
         			var pageStart = Math.floor((cPage-1)/pageBarSize)*pageBarSize+1; 
         			var pageEnd = pageStart+pageBarSize-1;
         			var pageNo = pageStart;
         			console.log(pageStart);
         			console.log(tPage);
          			$children4 = $("<div class='pageBar_noticeList'></div>");
           			if(cPage <= 1){
           				$children4.append($("<button class='listForBoard' onclick='reloadFunctionToAjax("+(1)+")' value="+(1)+">[이전]</button>"));
           			}else{
           				$children4.append($("<button class='listForBoard' onclick='reloadFunctionToAjax("+(cPage-1)+")' value="+(cPage-1)+">[이전]</button>"));
           			}
           			
           			for( var i = pageStart; i <= pageEnd;i++){
           				if(i == cPage){
           					$children4.append($("<button class='listForBoard' onclick='reloadFunctionToAjax("+(i)+")' value="+(i)+"><strong>"+i+"</strong></button>"));
           				}else{
           					$children4.append($("<button class='listForBoard' onclick='reloadFunctionToAjax("+(i)+")' value="+(i)+">"+i+"</button>"));
           				}
           				if(i == tPage){
           					break;
           				}
           			}
           			
           			if(cPage == tPage){
           				$children4.append($("<button class='listForBoard' onclick='reloadFunctionToAjax("+(tPage)+")' value="+(tPage)+">[다음]</button>"));
           			}else{
           				$children4.append($("<button class='listForBoard' onclick='reloadFunctionToAjax("+(cPage+1)+")' value="+(cPage+1)+">[다음]</button>"));
           			}
          				
           			$(".pageBar_appendList").append($children4);
    				
    			},
    			error : function(x,h,r){
    				console.log(x,h,r);
    			}
    		});
    		}
    
    
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
                <h2>요청게시판</h2>
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
            <div class="pageBar_appendList">
            </div>
        </div>
    </section>
	
</body>
<style>
.pageBar_noticeList{
	display: flex;
  	justify-content: center;
	align-content: center;
	margin : 0 auto;
	margin-top : 30px;
}

.listForBoard{
    display: block;
    border: none;
    outline: none;
    align-content: center;
    font-size: 20px;
    margin-right: 30px;
    margin-top: 3%;
    cursor : pointer;
}
</style>
</html>