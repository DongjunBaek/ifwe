<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/mainInclude.jsp">
	<jsp:param value="프로필카드" name="pageTitle"/>
</jsp:include>
	<section class="profile-section">
        <div class="section-frofile-title">프로필</div>
        <div class="section-frofilecard-box">
            <div class="section-frofileimg">
                <img src="${pageContext.request.contextPath }/resources/upload/member/frofileimg/ex2.jpg" alt="">
            </div>
            <p class="frofile-id">${memberLoggedIn.memberId }</p>
            <p class="frofile-name">${profile.profileName }</p>
            <div class="section-friendbutton">친구요청</div>
        </div>
        <div class="section-frofileinfo-box">
            <div class="section-frofileinfo-wrapper">
                <ul>
                    <li><p>회원정보</p></li>
                    <p>생년월일: ${memberLoggedIn.memberBirth }</p>
                    <p>거주: ${memberLoggedIn.memberAddr }</p>
                    <p>성별: ${profile.profileGender=='F'?'여':'남' }</p>
                    <li><p>소개글</p></li>
                    <p>${profile.profileComment } </p>
                    <li><p>관심키워드</p></li>
                    <div class="hashtag-wrapper">
                        <div class="hashtag-box">#영어공부</div>
                        <div class="hashtag-box">#영어공부</div>
                        <div class="hashtag-box">#영어공부</div>
                        <div class="hashtag-box">#영어공부</div>
                    </div>
                </ul>
            </div>
        </div>
    </section>


</body>
<script>
$(()=>{
	
	
	
})


console.log("onload On");
		
	/* 	location.href="${pageContext.request.contextPath}/Friend/selectFriendList.do?memberCode="+41; */
		var a = ${memberLoggedIn.memberCode };
		$.ajax({
			url:"<%=request.getContextPath()%>/friend/selectFriendList",
			type: "GET", 
			 data:{"memberCode":a},
	/* 		dataType: "text",  */
			beforeSend: function(){
				console.log("beforeSend");
			},
			success: function(data){
				
				console.log("success");
				console.log("data :", data);
				
		/* 		$(".friend-lists").append("<div class='friend-list'><div class='friend-img'><img src='${pageContext.request.contextPath }/resources/upload/member/frofileimg/ex2.jpg' alt='' /></div><div class='friend-name font-kor friend-name-profile'>김원재</div></div>"); 
		 */		
				
				$.each(data,function(idx,value){
					console.log(idx);
					console.log(value);
				
					$(".friend-lists").append("<div class='friend-list'    ><div class='friend-img'><img src='${pageContext.request.contextPath }/resources/upload/member/frofileimg/ex2.jpg' id='profileImg' value='"+value.memberCode+"'  alt='' /></div><div class='friend-name font-kor friend-name-profile' id='profileId' value='"+value.memberCode+"' >"+value.memberPname+"</div></div>"); 
					
			
					
				})
				
			},
			error: function(jqxhr, textStatus, errorThrown){
		
				console.log("ajax처리실패!", jqxhr, textStatus, errorThrown);
			}, 
			complete: function(){
		
				console.log("complete");
				
			}
			
		});
	

</script>

</html>