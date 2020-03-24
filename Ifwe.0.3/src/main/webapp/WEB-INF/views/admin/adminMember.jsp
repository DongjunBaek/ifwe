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
<script>
function allMember(){
	location.href="${pageContext.request.contextPath }/admin/member.do";
};
function dropMember(){
	location.href="${pageContext.request.contextPath }/admin/dropMember.do";
};
function dormantMember(){
	location.href="${pageContext.request.contextPath }/admin/dormantMember.do";
};
function drop(){
	location.href="${pageContext.request.contextPath }/admin/drop.do";
};
</script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/adminInclude.jsp"></jsp:include>
	
	 <section>
        <div class="title_wrap">
            <h1>member</h1>
            <div class="search_member">
                <i class="fas fa-search"></i>
                <input type="text" id="srh_member" class="srh_member" placeholder="회원명을 입력하세요">
            </div>
            <div class="btn_wrap">
            	<input type="button" id="all_member" class="btn_member" value="전체회원" onclick="allMember()">
                <input type="button" id="drop_member" class="btn_member" value="탈퇴회원" onclick="dropMember()">
                <input type="button" id="report_member" class="btn_member" value="휴면회원" onclick="dormantMember()">
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
                    <c:forEach items="${list}" var="member"> 
                    <tr>
                        <td>${member.memberId }</td>
                        <td>${member.memberName }</td>
                        <td>${member.memberBirth }</td>
                        <td>${member.memberEmail }</td>
                        <td>${member.memberPhone }</td>
                        <td>${member.memberAddr }</td>
                        <td>${member.memberSuspension }</td>
                        <td>${member.memberEnrolldate }</td>
                        <td></td>
                        <form id="memberCodeFrm" action="${pageContext.request.contextPath }/admin/cancel.do" method="get">
    							<input type="hidden" name="memberCode" value="${member.memberCode }" />
	                        <td><button type="submit" id="drop" class="drop">탈퇴</button></td>
    				    </form>	
                    </tr>
                   </c:forEach>
                </table>
                
            </div>
        </div>
            
        <div class="member_list_drop">
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
	                    <c:forEach items="${dropList}" var="member"> 
	                    <tr>
	                        <td>${member.memberId }</td>
	                        <td>${member.memberName }</td>
	                        <td>${member.memberBirth }</td>
	                        <td>${member.memberEmail }</td>
	                        <td>${member.memberPhone }</td>
	                        <td>${member.memberAddr }</td>
	                        <td>${member.memberSuspension }</td>
	                        <td>${member.memberEnrolldate }</td>
	                        <td>탈퇴</td>
	                    </tr>
	                   </c:forEach>
                </table>
                
            </div>
        </div>    
        
              <div class="member_list_dormant">
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
                        <c:forEach items="${dormantList}" var="member"> 
	                    <tr>
	                        <td>${member.memberId }</td>
	                        <td>${member.memberName }</td>
	                        <td>${member.memberBirth }</td>
	                        <td>${member.memberEmail }</td>
	                        <td>${member.memberPhone }</td>
	                        <td>${member.memberAddr }</td>
	                        <td>${member.memberSuspension }</td>
	                        <td>${member.memberEnrolldate }</td>
	                        <form id="memberCodeFrm" action="${pageContext.request.contextPath }/admin/cancel.do" method="get">
    							<input type="hidden" name="memberCode" value="${member.memberCode }" />
	                        <td><button type="submit" id="quit" class="quit">휴면해지</button></td>
    						</form>	
	                    </tr>
	                   </c:forEach>
                </table>
            </div>
        </div>    
    </section>



<script>
 $(document).ready(function(){
    
    $(".member_list").css("display","block");
    $(".member_list_drop").css("display","none");
    $(".member_list_dormant").css("display","none");
});
$(function(){
	$('#all_member').click(function(){
        
        $(".member_list").css("display","block").css("z-index","10");
        $(".member_list_drop").css("display","none").css("z-index","0");
        $(".member_list_dormant").css("display","none").css("z-index","0");

    });
    $('#drop_member').click(function(){

        $(".member_list").css("display","none").css("z-index","0");
        $(".member_list_drop").css("display","block").css("z-index","10");
        $(".member_list_dormant").css("display","none").css("z-index","0");

    });
    $('#report_member').click(function(){
        $(".member_list").css("display","none").css("z-index","0");
        $(".member_list_drop").css("display","none").css("z-index","0");
        $(".member_list_dormant").css("display","block").css("z-index","10");
    });

}); 
</script>

</body>
</html>
