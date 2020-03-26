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
$(document).ready(function(){

		var memberRole = "member";
		$.ajax({
			url : "${pageContext.request.contextPath }/admin/memberList.do",
			data : {memberRole : memberRole},
			success : data =>{
			
				console.log(data);
/* 				console.log(data[cnt]); */
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
						+"<td><form id='dropFrm' action='${pageContext.request.contextPath }/admin/drop.do' method='get'><input type='hidden' name='memberCode' value='"+value.memberCode+"'><input type='submit' id='drop' class='drop' value='탈퇴' onclick='deleteNotice();'></form></td></tr>");
	
				});
				
				
			},
		 	error : function(x,h,r){
        		console.log(x,h,r);
        	}
			
		});
	});
	

$(function(){
	$(".btn_member").click(function(){
		var memberRole = $(this).attr("id");
		/* var cnt = 0; */
		$.ajax({
			url : "${pageContext.request.contextPath }/admin/memberList.do",
			data : {memberRole : memberRole},
			success : data =>{
			
				console.log(data);
/* 				console.log(data[cnt]); */
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
            <%--       <<c:if test="${not empty searchList }">
	                   	<c:forEach items="${searchList }" var="searchMember">
	                   		<tr>
	                   			<td>${searchMember.memberId }</td>
	                   			<td>${searchMember.memberName }</td>
	                   			<td>${searchMember.memberBirth }</td>
	                   			<td>${searchMember.memberEmail }</td>
	                   			<td>${searchMember.memberPhone }</td>
	                   			<td>${searchMember.memberAddr }</td>
	                   			<td>${searchMember.memberSuspension }</td>
	                   			<td>${searchMember.memberEnrolldate }</td>
	                   			<td>${searchMember.memberRole =="h"?:}
	                   		</tr>
	                   	</c:forEach>
	                </c:if> --%>
                </table>
            </div>
    </section>

</body>
</html>
