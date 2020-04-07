<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminMember</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adminInclude.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adminMember.css">
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/226b55f414.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.6.0/moment.min.js"></script>

<script>
let cPage = 1;
var memberRole;
$(document).ready(function(){	
		memberRole = "member";
		$.ajax({
			url : "${pageContext.request.contextPath }/admin/memberList.do",
			data : {memberRole : memberRole},
			asyn:false,
			success : data =>{
			
				console.log(data[0]);
/* 				console.log(data[cnt]); */
				$parentDiv = $("#appendList");
				$parentDiv.empty();
				$(".pageBar_appendList").empty();
				$.each(data[2], function(idx, value){
					
					console.log(idx);
					console.log(value);
					
				$parentDiv.append("<tr><td>"+value.memberId+"</td>"+"<td>"+value.memberName+"</td>"
						+"<td>"+moment("/Date("+value.memberBirth+")/").format("YYYY-MM-DD").toString()+"</td>"
						+"<td>"+value.memberEmail+"</td>"+"<td>"+value.memberPhone+"</td>"
						+"<td>"+value.memberAddr+"</td>"+"<td>"+value.memberSuspension+"</td>"
						+"<td>"+moment("/Date("+value.memberEnrolldate+")/").format("YYYY-MM-DD").toString()+"</td>"
						+"<td><form id='dropFrm' action='${pageContext.request.contextPath }/admin/drop.do' method='get'><input type='hidden' name='memberCode' value='"+value.memberCode+"'><input type='submit' id='drop' class='drop' value='탈퇴' onclick='deleteNotice();'></form></td></tr>");
				});
				
			 	cPage = data[0];
     			var tPage = data[1];
     			var pageBarSize = 5;
     			var pageStart = Math.floor((cPage-1)/pageBarSize)*pageBarSize+1; 
     			var pageEnd = pageStart+pageBarSize-1;
     			var pageNo = pageStart;
     			console.log(pageStart);
     			console.log(tPage);
      			$children4 = $("<div class='pageBar_memberList'></div>");
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
       		/* 	hoverBtnForPageBar();
        	 */
				
			},
		 	error : function(x,h,r){
        		console.log(x,h,r);
        	}
			
		});
	});
	

$(function(){
	$(".btn_member").click(function(){
		memberRole = $(this).attr("id");
		/* var cnt = 0; */
		$.ajax({
			url : "${pageContext.request.contextPath }/admin/memberList.do",
			data : {memberRole : memberRole},
			success : data =>{
			
				console.log(data);
/* 				console.log(data[cnt]); */
				$parentDiv = $("#appendList");
				$parentDiv.empty();
				$(".pageBar_appendList").empty();
				$.each(data[2], function(idx, value){
					
					console.log(idx);
					console.log(value);
					
					console.log("data[2]",data[2]);
					
				$parentDiv.append("<tr><td>"+value.memberId+"</td>"+"<td>"+value.memberName+"</td>"
						+"<td>"+moment("/Date("+value.memberBirth+")/").format("YYYY-MM-DD").toString()+"</td>"
						+"<td>"+value.memberEmail+"</td>"+"<td>"+value.memberPhone+"</td>"
						+"<td>"+value.memberAddr+"</td>"+"<td>"+value.memberSuspension+"</td>"
						+"<td>"+moment("/Date("+value.memberEnrolldate+")/").format("YYYY-MM-DD").toString()+"</td>"
						+"<td>"+(value.memberRole == "h"?"<form id='cancelFrm' action='${pageContext.request.contextPath }/admin/cancel.do' method='get'><input type='hidden' name='memberCode' value='"+value.memberCode+"'><input type='submit' id='quit' class='quit' value='휴면해지' onclick='cancelMember();'>"
													  :"<form id='dropFrm' action='${pageContext.request.contextPath }/admin/drop.do' method='get'><input type='hidden' name='memberCode' value='"+value.memberCode+"'><input type='submit' id='drop' class='drop' value='탈퇴' onclick='dropMember();'>")+"</td></form></tr>");
	
				});
				
			 	cPage = data[0];
     			var tPage = data[1];
     			var pageBarSize = 5;
     			var pageStart = Math.floor((cPage-1)/pageBarSize)*pageBarSize+1; 
     			var pageEnd = pageStart+pageBarSize-1;
     			var pageNo = pageStart;
     			console.log(pageStart);
     			console.log(tPage);
      			$children4 = $("<div class='pageBar_memberList'></div>");
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
       	/* 		hoverBtnForPageBar();
		 */		 
				
				
			},
		 	error : function(x,h,r){
        		console.log(x,h,r);
        	}
			
		});
	});
});



$(function(){
	$(".srh_member").keydown(function(e){
		
		if(e.keyCode == 13){
		var memberName = $("#memberNameInput").val();
			
		$.ajax({
			url : "${pageContext.request.contextPath }/admin/searchMember.do",
			data : {memberName : memberName},
			success : data =>{
			
				console.log(data);
				$parentDiv = $("#appendList");
				$parentDiv.empty();
				$.each(data, function(idx, value){
					
					console.log(idx);
					console.log(value);
					
				$parentDiv.append("<tr><td>"+value.memberId+"</td>"+"<td>"+value.memberName+"</td>"
						+"<td>"+moment("/Date("+value.memberBirth+")/").format("YYYY-MM-DD").toString()+"</td>"
						+"<td>"+value.memberEmail+"</td>"+"<td>"+value.memberPhone+"</td>"
						+"<td>"+value.memberAddr+"</td>"+"<td>"+value.memberSuspension+"</td>"
						+"<td>"+moment("/Date("+value.memberEnrolldate+")/").format("YYYY-MM-DD").toString()+"</td>"
						+"<td>"+(value.memberRole == "h"?"<form id='cancelFrm' action='${pageContext.request.contextPath }/admin/cancel.do' method='get'><input type='hidden' name='memberCode' value='"+value.memberCode+"'><input type='submit' id='quit' class='quit' value='휴면해지' onclick='cancelMember();'>"
													  :"<form id='dropFrm' action='${pageContext.request.contextPath }/admin/drop.do' method='get'><input type='hidden' name='memberCode' value='"+value.memberCode+"'><input type='submit' id='drop' class='drop' value='탈퇴' onclick='dropMember();'>")+"</td></form></tr>");
	
				});
				
				
			},
		 	error : function(x,h,r){
        		console.log(x,h,r);
        	}
			
		});
		
		}
	});
});


$(function(){
	$("#membersrh").click(function(){
		var memberName = $("#memberNameInput").val();
			
		
		$.ajax({
			url : "${pageContext.request.contextPath }/admin/searchMember.do",
			data : {memberName : memberName},
			success : data =>{
			
				console.log(data);
				$parentDiv = $("#appendList");
				$parentDiv.empty();
				$.each(data, function(idx, value){
					
					console.log(idx);
					console.log(value);
					
				$parentDiv.append("<tr><td>"+value.memberId+"</td>"+"<td>"+value.memberName+"</td>"
						+"<td>"+moment("/Date("+value.memberBirth+")/").format("YYYY-MM-DD").toString()+"</td>"
						+"<td>"+value.memberEmail+"</td>"+"<td>"+value.memberPhone+"</td>"
						+"<td>"+value.memberAddr+"</td>"+"<td>"+value.memberSuspension+"</td>"
						+"<td>"+moment("/Date("+value.memberEnrolldate+")/").format("YYYY-MM-DD").toString()+"</td>"
						+"<td>"+(value.memberRole == "h"?"<form id='cancelFrm' action='${pageContext.request.contextPath }/admin/cancel.do' method='get'><input type='hidden' name='memberCode' value='"+value.memberCode+"'><input type='submit' id='quit' class='quit' value='휴면해지' onclick='cancelMember();'>"
													  :"<form id='dropFrm' action='${pageContext.request.contextPath }/admin/drop.do' method='get'><input type='hidden' name='memberCode' value='"+value.memberCode+"'><input type='submit' id='drop' class='drop' value='탈퇴' onclick='dropMember();'>")+"</td></form></tr>");
	
				});
			},
        	 error : function(x,h,r){
        		 console.log(x,h,r);
        	 }
         });
				
		
	});
});


function dropMember(){
	if(!confirm("해당 회원을 탈퇴 처리하시겠습니까?")) 
		return;
	
	$("#dropFrm").submit();
	
}
function cancelMember(){
	if(!confirm("해당 회원의 휴면상태를 해지 시키겠습니까?")) 
		return;
	
	$("#cancelFrm").submit();
	
}
</script>

<style>

.pageBar_memberList{
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

</head>
<body>
	
	 <section>
	<jsp:include page="/WEB-INF/views/common/adminInclude.jsp"></jsp:include>
        <div class="title_wrap">
            <h1>member</h1>
            <form class="search_member" onsubmit="return false">
                <i class="fas fa-search"></i>
                <input type="text" name="memberName" id="memberNameInput" class="srh_member" placeholder="회원명을 입력하세요">
                <input type="button" id="membersrh" class="btn_member" value="검색">
            </form>
            <div class="btn_wrap">
            	<input type="button" id="member" class="btn_member" value="일반회원">
                <input type="button" id="d" class="btn_member" value="탈퇴회원">
                <input type="button" id="h" class="btn_member" value="휴면회원">
            </div>
            
            <div class="member_list">
                <table class="member_list_title">
                    <thead>
                        <tr>
                            <th>아이디</th>
                            <th>회원명</th>
                            <th>생년월일</th>
                            <th>이메일</th>
                            <th>전화번호</th>
                            <th>거주지</th>
                            <th>신고여부</th>
                            <th>가입일</th>
                            <th>회원상태</th>
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


<script>
function reloadFunctionToAjax(no){
	/* console.log("버튼클릭"); */
	cPage = no;
	
	$.ajax({
    	url : "${pageContext.request.contextPath}/admin/memberList.do",
    	data : {memberRole : memberRole,
    			cPage : cPage},
    	asyn:false,
    	success : data =>{
    		console.log(data[0]);
     		 $parentDiv = $("#appendList");
    		 $parentDiv.empty();
    		 $(".pageBar_appendList").empty();
 			$.each(data[2], function(idx, value){
				
				console.log(idx);
				console.log(value);
				
				console.log("data[2]",data[2]);
				
			$parentDiv.append("<tr><td>"+value.memberId+"</td>"+"<td>"+value.memberName+"</td>"
					+"<td>"+moment("/Date("+value.memberBirth+")/").format("YYYY-MM-DD").toString()+"</td>"
					+"<td>"+value.memberEmail+"</td>"+"<td>"+value.memberPhone+"</td>"
					+"<td>"+value.memberAddr+"</td>"+"<td>"+value.memberSuspension+"</td>"
					+"<td>"+moment("/Date("+value.memberEnrolldate+")/").format("YYYY-MM-DD").toString()+"</td>"
					+"<td>"+(value.memberRole == "h"?"<form id='cancelFrm' action='${pageContext.request.contextPath }/admin/cancel.do' method='get'><input type='hidden' name='memberCode' value='"+value.memberCode+"'><input type='submit' id='quit' class='quit' value='휴면해지' onclick='cancelMember();'>"
												  :"<form id='dropFrm' action='${pageContext.request.contextPath }/admin/drop.do' method='get'><input type='hidden' name='memberCode' value='"+value.memberCode+"'><input type='submit' id='drop' class='drop' value='탈퇴' onclick='dropMember();'>")
					+"</td></form></tr>");
	
    			    
                     
    		 });
 		 	cPage = data[0];
 			var tPage = data[1];
 			var pageBarSize = 5;
 			var pageStart = Math.floor((cPage-1)/pageBarSize)*pageBarSize+1; 
 			var pageEnd = pageStart+pageBarSize-1;
 			var pageNo = pageStart;
 			console.log(pageStart);
 			console.log(tPage);
  			$children4 = $("<div class='pageBar_memberList'></div>");
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
   			/* hoverBtnForPageBar();
    		 */ 
    	 },
    	 error : function(x,h,r){
    		 console.log(x,h,r);
    	 }
     });
			
};


/* function hoverBtnForPageBar(){
	$(".listForBoard").hover(function(){
		$(this).css("color","white").css("background-color","rgb(39, 86, 166)");
			
		if(cPage == $(this).val()){
			$(this).children().css("color","white");
		}
	}, function(){
		$(this).css("color","rgb(39, 86, 166)").css("background-color","white");
		
		if(cPage == $(this).val()){
			$(this).children().css("color","rgb(39, 86, 166)");
		}
	});
} */

</script>

</html>
