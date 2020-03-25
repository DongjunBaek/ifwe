<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/mainInclude.jsp">
	<jsp:param value="소모임 검색" name="pageTitle"/>
</jsp:include>
<style>
/* section{
	width:1580px;
} */
.classify-menu{
	color:white;
}
</style>
<script>
$(function(){
    $("#search1").selectric();
    $("#search2").selectric();

    $("#cate-Classify div").click(function(){

        $("#cate-Classify div").css("background-color","#beceea");
        $(this).css("background-color","#2756a6");

    });
    
    $("[name=goclub]").click(function(){
    	let clubCode = $(this).attr("data-clubCode");
    	console.log(clubCode);
    	location.href="${pageContext.request.contextPath }/club/clubMain.do?clubCode="+clubCode;
    });
    
	$(".friend-name-profile").click(function(){
		location.href="${pageContext.request.contextPath }/member/profile.do"
	});
    
    
});

</script>
<style>
.card-container:nth-child(n+4) {
	margin-top:3%;
}
</style>
<script>
$(function(){
	
	$("[name=somoim-search-btn]").click(function(){
		$("#searchSomoimDivContainer").css('display','none');
		let searchType = $("[name=searchType]").val();
		let clubSearchKeyword = $("[name=clubSearchKeyword]").val();
		let clubLocation = $("[name=clubLocation]").val();
		console.log(searchType,clubSearchKeyword,clubLocation);
		
		
		console.log("dkdkdkdkdk");
	    var allData = {"searchType": searchType, "clubSearchKeyword": clubSearchKeyword, "clubLocation":clubLocation };
		
		console.log(searchType);
		
		
		$.ajax({
			url:"${pageContext.request.contextPath}/club/clubSearchKeyword.do",
			data: allData,
			success:data => {
				console.log(data);	
				
				
				if(data.length == 0){
					alert("검색결과가 없습니다.");
					$("[name=searchType]").val('');
					$("[name=clubSearchKeyword]").val('');
					$("[name=clubLocation]").val('');
					$("#allSomoimDivContainer").css('display','');
				}else{
					$("#allSomoimDivContainer").css('display','none');
					$("#searchSomoimDivContainer").css('display','');
					$("#searchSomoimDivContainer").html(" ");
					for(let i=0;i<data.length;i++){
						console.log(data[i]);
						
						$("#searchSomoimDivContainer").append(
								'<div class="card-container"><div class="club-img"><img src="${pageContext.request.contextPath }/resources/upload/club/maintitleimg/'+data[i].clubImgRe+'" alt="" /></div>'+
		                        '<div class="club-leader"><img src="${pageContext.request.contextPath }/resources/upload/member/frofileimg/ex2.jpg" alt="" /></div>'+
		                        '<div class="information-container"><p class="club-leader-name font-hk friend-name-profile">@ '+data[i].memberId+'</p><p class="club-name-search font-hk">'+data[i].clubTitle+'</p>'+
		                        '<p class="club-location font-hk"><i class="fas fa-map-marker-alt"></i>'+data[i].clubLocation+'</p>'+
		                        '<div class="information-box"><br><p class="people-title font-hk">정원수 </p><span class="information-fontsize">1</span>/'+data[i].clubMax+'</div>'+
		                        '<div class="information-box"><br><p class="people-title font-hk">남여비율</p><span class="information-fontsize">23</span><span class="information-fontsize2">:</span><span class="information-fontsize3">4</span></div>'+
		                        '<div class="information-box lastbox"><br><p class="people-title font-hk">평균나이</p><span class="information-fontsize">28세</span></div>'+
		                        '<button class="information-botton font-hk" name="goclub" data-clubCode='+data[i].clubCode+'>자세히 보기</button></div></div>'
								);
						
					}
					$("[name=searchType]").val('');
					$("[name=clubSearchKeyword]").val('');
					$("[name=clubLocation]").val('');
					
					
				}
			
			},
			error:(x,s,e) =>{
				console.log("에러 ㅡㅡ ");
				console.log(x,s,e);
			}
		});
		
		
	});
	
	
	
	
});
</script>
	    <section>
            <div class="wrapper-right container-clubsearch">
                <div class="search-box">
                    <div class="select-box">
                        <select name="searchType" id="search1">
                            <option value="">전체</option>
                            <option value="club_title">모임명</option>
                            <option value="hashtag">해쉬태그명</option>
                        </select>
                    </div>
                        <div class="select-box" style="margin-left:3%;">
                       		<select name="clubLocation" id="search2">
		                         <option value="" disabled selected>지역</option>
		                         <option value="서울">서울시</option>
		                         <option value="경기">경기도</option>
		                         <option value="강원">강원도</option>
		                         <option value="충북">충청북도</option>
		                         <option value="충남">충청남도</option>
		                         <option value="경북">경상북도</option>
		                         <option value="경남">경상남도</option>
		                         <option value="전북">전라북도</option>
		                         <option value="전남">전라남도</option>
		                         <option value="제주특별자치도">제주도</option>
                     		</select>
                    </div>
                    <div class="searh-icon">
                        <i class="fas fa-search"></i>
                    </div>
                        <input type="text" name="clubSearchKeyword" id="club-search" placeholder="검색어를 입력하세요">
                        <input type="button" value="검색" name="somoim-search-btn" />          
                </div>
                <p class="cate-title font-hk">스터디</p>
                <div class="cate-Classify" id="cate-Classify">
                    <div class="classify-menu-box"><p class="classify-menu font-hk">#영어모임</p></div>
                    <div class="classify-menu-box"><p class="classify-menu font-hk">#영어모임</p></div>
                    <div class="classify-menu-box"><p class="classify-menu font-hk">#영어모임</p></div>
                    <div class="classify-menu-box"><p class="classify-menu font-hk">#영어모임</p></div>
                </div>
                <div class="card-wrapper" id="allSomoimDivContainer">
                <c:if test="${not empty clubList }">
                <c:forEach items="${clubList }" var="list">
                    <div class="card-container">
                        <div class="club-img">
                        	<img src="${pageContext.request.contextPath }/resources/upload/club/maintitleimg/${list.clubImgRe}" alt="" />
                        </div>
                        <div class="club-leader">
                        	<img src="${pageContext.request.contextPath }/resources/upload/member/frofileimg/ex2.jpg" alt="" />
                        </div>
                        <div class="information-container">
                            <p class="club-leader-name font-hk friend-name-profile">@ ${list.memberId}</p>
                            <p class="club-name-search font-hk">${list.clubTitle }</p>
                            <p class="club-location font-hk"><i class="fas fa-map-marker-alt"></i>${list.clubLocation }</p>
    
                            <div class="information-box">
                                <br>
                                <p class="people-title font-hk">정원수 </p>
                                <span class="information-fontsize">1</span>/${list.clubMax }
                            </div>
                            <div class="information-box">
                                    <br>
                                    <p class="people-title font-hk">남여비율</p>
                                    <span class="information-fontsize">23</span>
                                    <span class="information-fontsize2">:</span>
                                    <span class="information-fontsize3">4</span>
                            </div>
                            <div class="information-box lastbox">
                                    <br>
                                    <p class="people-title font-hk">평균나이</p>
                                    <span class="information-fontsize">28세</span>
                            </div>
                            <button class="information-botton font-hk" name="goclub" data-clubCode=${list.clubCode }>자세히 보기</button>
                        </div>
                    </div>
                   
                </c:forEach>
                </c:if>    
    
                </div>
                
               	<div class="card-wrapper" id="searchSomoimDivContainer">
               	</div>
                
                
            </div>
    </section>

</body>
</html>