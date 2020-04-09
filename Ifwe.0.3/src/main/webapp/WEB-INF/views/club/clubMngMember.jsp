<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Club Management</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/club/clubinclude.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/club/clubmngmember.css">
<script src="https://kit.fontawesome.com/5e1e16b3f4.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Fredoka+One&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery.selectric.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/selectric.css">
<script>
$(function(){
	$(".member-ranking").selectric();
	
	
	
	
});

</script>

</head>
<body>
<jsp:include page="/WEB-INF/views/common/clubInclude.jsp"></jsp:include>
  <section class="flotclass">
      <div class="section-block">
          <div class="section-wrapper">
              <p class="section-boradmenu">소모임 관리</p>
             <c:if test="${club.premiumCode == null }">
                
                 </c:if>
                 <c:if test="${club.premiumCode == 'premium' }">
                 <div class="shc-premiumbox">
                     <p>프리미엄 사용중</p>
                 </div>
                 </c:if>
                 <c:if test="${club.premiumCode == 'gold' }">
                 <div class="shc-premiumbox">
                     <p>골드 사용중</p>
                 </div>
                 </c:if>
                 <c:if test="${club.premiumCode == 'sliver' }">
                 <div class="shc-premiumbox">
                     <p>골드 사용중</p>
                 </div>
                 </c:if>
          </div>
      </div>

      <div class="shc-section-memberlist-container">
          <p>회원관리</p>
          <div class="shc-section-memberlist-box">
              <table class="shc-friendtable">

                  <tr>
                      <th>사진</th>
                      <th>닉네임</th>
                      <th>등급</th>
                      <th>탈퇴</th>
                  </tr>
                    <c:if test="${not empty clubMember }">
                    <c:forEach items="${clubMember }" var="cmember">
                      <tr>
	                       <td>
	                          <div class="shc-table-img">
	                              <img src="${pageContext.request.contextPath }/resources/upload/profile/${cmember.profileImgRe}" alt="">
	                          </div>
	                      </td>
	                      <td>${cmember.profileName }</td>
	                      <td>
	                          <div class="table-selectsize-div">
	                              <select name="" id="" class="member-ranking">
	                                  <option value="master" ${cmember.clubGrade=='master'?'selected':'' }>마스터</option>
	                                  <option value="member" ${cmember.clubGrade=='member'?'selected':'' }>일반회원</option>
	                                  <option value="nomal" ${cmember.clubGrade=='nm'?'selected':'' }>준회원</option>
	                              </select>
	                          </div>
	                      </td>
	                      <td>
	                          <button type="button" class="table-secession" 
	                          onclick="location.href='${pageContext.request.contextPath}/club/memberDelete.do?memberCode=${cmember.memberCode }'">탈퇴</button>
	                      </td>
	                  </tr>
                
                    </c:forEach>
                    </c:if>
              </table>
                  
              </div>

              <button type="button" class="membertable-savebutton">저장하기</button>
      </div>
      
  </section>

</body>
</html>