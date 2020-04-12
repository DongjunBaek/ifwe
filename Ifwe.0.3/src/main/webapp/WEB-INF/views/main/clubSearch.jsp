<%@page import="com.kh.ifwe.club.model.vo.Count"%>
<%@page import="java.util.List"%>
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
/* 0405 club_pagebar_btn css add dongjun */
.club_pageBar_btn{
	display: flex;
	width: 100%;
	height: 150px;
	border-radius: 50px;
  	justify-content: center;
	align-content: center;
	/* border: 1.5px solid #0288D1; */
	margin : 0 auto;
	
}

.list-club-pagebtn{
    display: block;
    border: none;
    outline: none;
   	background-color: rgba(0,0,0,0);
    align-content: center;
    font-size: 20px;
    margin-right: 4%;
    height: 60px;
    border-radius: 50px;
    line-height: 60px;
    margin-top: 3%;
    width: 100px;
}
.friend-name-profile{
	cursor: text;	
}
.club-leader img{
	width: 155px;
	height: 100%;
}
</style>
<script>
let checkCurrentPage = 1;
$(function(){
    $("#search1").selectric();
    $("#search2").selectric();

    $("#cate-Classify div").click(function(){

        $("#cate-Classify div").css("background-color","#beceea");
        $(this).css("background-color","#2756a6");

    });
    
    $("[name=goclub]").on("click",function(){
    	let clubCode = $(this).attr("data-clubCode");
    	console.log(clubCode);
    	location.href="${pageContext.request.contextPath }/club/clubMain.do?clubCode="+clubCode;
    });
    


	$(".list-club-pagebtn").hover(function(){
		$(this).css("color","white").css("background","#ffc862");
	},function(){
		$(this).css("color","#3b3b3b").css("background","rgba(0,0,0,0)");
	});
});
function pageBar_btn(cPageNo){
	location.href = "${pageContext.request.contextPath}/club/clubSearch?cPage="+cPageNo;
}


</script>
<style>
.card-container:nth-child(n+4) {
	margin-top:3%;
}
</style>
<script>

function hoverBtnForPageBar(){
	$(".list-club-pagebtn").hover(function(){
		
		$(this).css("color","white").css("background","#ffc862");
		if($(this).text() == checkCurrentPage){
			$(this).children().css("color","white").css("background","#ffc862");
		}
		
	},function(){
		$(this).css("color","#3b3b3b").css("background","rgba(0,0,0,0)");
		if($(this).text() == checkCurrentPage){
			$(this).children().css("color","#3b3b3b").css("background","rgba(0,0,0,0)");
		}
	});
}
$(function(){
	$("[name=clubSearchKeyword]").keydown(function(key){
		if(key.keyCode == 13) {
		$("#searchSomoimDivContainer").css('display','none');
		let searchType = $("[name=searchType]").val();
		let clubSearchKeyword = $("[name=clubSearchKeyword]").val();
		let clubLocation = $("[name=clubLocation]").val();
		let memberCode = ${memberLoggedIn.memberCode};
		/* console.log(searchType,clubSearchKeyword,clubLocation,memberCode); */

		console.log("onLoadclubList open");
	    var allData = {"searchType": searchType, "clubSearchKeyword": clubSearchKeyword, "clubLocation":clubLocation,"memberCode":memberCode };
		



		
		$.ajax({
			url:"${pageContext.request.contextPath}/club/clubSearchKeyword.do",
			data: allData,
			dataType:"json",
			asyn: false,
			success:data => {

				var listForClub = data[1];
				var listForProfile= data[6];
				var listForGender = data[7];
				var listForAge = data[8];
				
				/* console.log('data7',listForGender);
				console.log('data8',listForAge); */

				
				
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
					for(let i=0;i<listForClub.length;i++){
						var maleCnt = 0;
						$.each(listForGender,function(idx,elem){
							if(listForClub[i].clubCode == elem.clubCode){
								maleCnt = elem.maleCount;
							}
						});
						
						
						$("#searchSomoimDivContainer").append(
								'<div class="card-container"><div class="club-img"><img src="${pageContext.request.contextPath }/resources/upload/club/maintitleimg/'+listForClub[i].clubImgRe+'" alt="" /></div>'+
		                        '<div class="club-leader"><img src="${pageContext.request.contextPath }/resources/upload/profile/'+listForProfile[i].profileImgRe+'" alt="" /></div>'+
		                        '<div class="information-container"><p class="club-leader-name font-hk friend-name-profile">@ '+listForClub[i].memberId+'</p><p class="club-name-search font-hk">'+listForClub[i].clubTitle+'</p>'+
		                        '<p class="club-location font-hk"><i class="fas fa-map-marker-alt"></i>'+listForClub[i].clubLocation+'</p>'+
		                        '<div class="information-box"><br><p class="people-title font-hk">정원수 </p><span class="information-fontsize">'+listForClub[i].clubCurrent+'</span>/'+listForClub[i].clubMax+'</div>'+
		                        '<div class="information-box"><br><p class="people-title font-hk">남여비율</p><span class="information-fontsize">'+(maleCnt/listForClub[i].clubCurrent)*10+		                        
		                        '</span><span class="information-fontsize2">:</span><span class="information-fontsize3">'
		                        +(1-(maleCnt/listForClub[i].clubCurrent))*10+
		                        '</span></div>'+
		                        '<div class="information-box lastbox"><br><p class="people-title font-hk">평균나이</p><span class="information-fontsize">'+Math.floor(listForAge[i]/listForClub[i].clubCurrent)+'세</span></div>'+
		                        '<button class="information-botton font-hk" name="goclub" data-clubCode='+listForClub[i].clubCode+'>자세히 보기</button></div></div>'
								);
						
					}

					$("[name=searchType]").val('');
					$("[name=clubSearchKeyword]").val('');
					$("[name=clubLocation]").val('');
					$("[name=goclub]").click(function(){
						let clubCode = $(this).attr("data-clubCode");
				    	/* console.log(clubCode); */
				    	location.href="${pageContext.request.contextPath }/club/clubMain.do?clubCode="+clubCode;
					})

				    $("[name=goclub]").click(function(){
				    	let clubCode = $(this).attr("data-clubCode");
				    	console.log(clubCode);
				    	location.href="${pageContext.request.contextPath }/club/clubMain.do?clubCode="+clubCode;
				    }); 

					

					
					
					/* 
						0406 ajax pageBar button
						
					*/
				 	var tPage = data[2];
					var cPage = data[3];
					var pageBarSize = 5;
         			var pageStart = (Math.floor((cPage-1)/pageBarSize))*pageBarSize+1;  
         			var pageEnd = pageStart+pageBarSize-1;
         			var pageNo = pageStart;
/*          			console.log("tpage",tPage);
         			console.log("cPage",cPage);
         			console.log("pageStart",pageStart);
         			console.log("pageEnd",pageEnd);
         			console.log("pageNo",pageNo); */
         			
					$parentDIV = $(".club_pageBar_btn");
					$parentDIV.empty();
					
					if(cPage <= 1){
						$parentDIV.append("<button onclick='pageBar_search_btn(1);' value="+1+" class='list-club-pagebtn'>Back</button>");	
					}else{
						$parentDIV.append("<button onclick='pageBar_search_btn("+(cPage-1)+");' value="+(cPage-1)+" class='list-club-pagebtn'>Back</button>");
					}
					
					for( var i = pageStart; i <= pageEnd; i++){
						
						if(i == cPage){
							$parentDIV.append("<button onclick='pageBar_search_btn("+(i)+");' value="+(i)+" class='list-club-pagebtn'><strong>"+i+"</strong></button>");
						}else{
							$parentDIV.append("<button onclick='pageBar_search_btn("+(i)+");' value="+(i)+" class='list-club-pagebtn'>"+i+"</button>");
						}
						
						if(i == tPage){
							break;
						}
					}
					
					if(cPage == tPage){
						$parentDIV.append("<button onclick='pageBar_search_btn("+tPage+");' value="+tPage+" class='list-club-pagebtn'>Next</button>");	
					}else{
						$parentDIV.append("<button onclick='pageBar_search_btn("+(cPage+1)+");' value="+(cPage+1)+" class='list-club-pagebtn'>Next</button>");
					}
					checkCurrentPage = cPage;
					hoverBtnForPageBar();
					
					$("#club-search").val(data[4]);
					
					
				}
			
			},
			error:(x,s,e) =>{
				console.log("Error Search Club");
				console.log(x,s,e);
			}
		}); 
		
			}
		
	});
	
	
	
	
    
});




function pageBar_search_btn(cPageNo){
	
	$("#searchSomoimDivContainer").css('display','none');
	let searchType_ = $("[name=searchType]").val();
	let clubSearchKeyword_ = $("[name=clubSearchKeyword]").val();
	let clubLocation_ = $("[name=clubLocation]").val();
	let memberCode_ = ${memberLoggedIn.memberCode};
/* 	console.log(searchType_,clubSearchKeyword_,clubLocation_,memberCode_); */
	
	
	
    var allData = {
    		"searchType": searchType_,
    		"clubSearchKeyword": clubSearchKeyword_,
    		"clubLocation":clubLocation_,
    		"memberCode":memberCode_,
    		"cPage":cPageNo};
	
	
	
	
	$.ajax({
		url:"${pageContext.request.contextPath}/club/clubSearchKeyword.do",
		data: allData,
		dataType:"json",
		asyn: false,
		success:data => {
			
			/* console.log(data); */	
			$("#searchSomoimDivContainer").empty();
			/* console.log(data[1]); */
			var listForClub = data[1];
			var listForProfile= data[6];
			var listForGender = data[7];
			var listForAge = data[8];
			
/* 			console.log('data7',listForGender);
			console.log('data8',listForAge); */

			
			
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
				for(let i=0;i<listForClub.length;i++){
					/* console.log(listForClub[i]); */
					
					var maleCnt = 0;
					$.each(listForGender,function(idx,elem){
						if(listForClub[i].clubCode == elem.clubCode){
							maleCnt = elem.maleCount;
						}
					});
					console.log(maleCnt);
					
					$("#searchSomoimDivContainer").append(
							'<div class="card-container"><div class="club-img"><img src="${pageContext.request.contextPath }/resources/upload/club/maintitleimg/'+listForClub[i].clubImgRe+'" alt="" /></div>'+
	                        '<div class="club-leader"><img src="${pageContext.request.contextPath }/resources/upload/profile/'+listForProfile[i].profileImgRe+'" alt="" /></div>'+
	                        '<div class="information-container"><p class="club-leader-name font-hk friend-name-profile">@ '+listForClub[i].memberId+'</p><p class="club-name-search font-hk">'+listForClub[i].clubTitle+'</p>'+
	                        '<p class="club-location font-hk"><i class="fas fa-map-marker-alt"></i>'+listForClub[i].clubLocation+'</p>'+
	                        '<div class="information-box"><br><p class="people-title font-hk">정원수 </p><span class="information-fontsize">'+listForClub[i].clubCurrent+'</span>/'+listForClub[i].clubMax+'</div>'+
	                        '<div class="information-box"><br><p class="people-title font-hk">남여비율</p><span class="information-fontsize">'+Math.trunc((maleCnt/listForClub[i].clubCurrent)*10)+
	                        
	                        '</span><span class="information-fontsize2">:</span><span class="information-fontsize3">'
	                        +Math.ceil((1-(maleCnt/listForClub[i].clubCurrent))*10)+
	                        '</span></div>'+
	                        '<div class="information-box lastbox"><br><p class="people-title font-hk">평균나이</p><span class="information-fontsize">'+Math.floor(listForAge[i]/listForClub[i].clubCurrent)+'세</span></div>'+
	                        '<button class="information-botton font-hk" name="goclub" data-clubCode='+listForClub[i].clubCode+'>자세히 보기</button></div></div>'
							);
					
				}
			    $("[name=goclub]").click(function(){
			    	let clubCode = $(this).attr("data-clubCode");
			    	/* console.log(clubCode); */
			    	location.href="${pageContext.request.contextPath }/club/clubMain.do?clubCode="+clubCode;
			    }); 

				
				/* 
					0406 ajax pageBar button
					
				*/
				var tPage = data[2];
				var cPage = data[3];
				var pageBarSize = 5;
     			var pageStart = (Math.floor((cPage-1)/pageBarSize))*pageBarSize+1;  
     			var pageEnd = pageStart+pageBarSize-1;
     			var pageNo = pageStart;
/*      			console.log("tpage",tPage);
     			console.log("cPage",cPage);
     			console.log("pageStart",pageStart);
     			console.log("pageEnd",pageEnd);
     			console.log("pageNo",pageNo); */
     			
				$parentDIV = $(".club_pageBar_btn");
				$parentDIV.empty();
				
				if(cPage <= 1){
					$parentDIV.append("<button onclick='pageBar_search_btn(1);' value="+1+" class='list-club-pagebtn'>Back</button>");	
				}else{
					$parentDIV.append("<button onclick='pageBar_search_btn("+(cPage-1)+");' value="+(cPage-1)+" class='list-club-pagebtn'>Back</button>");
				}
				
				for( var i = pageStart; i <= pageEnd; i++){
					
					if(i == cPage){
						$parentDIV.append("<button onclick='pageBar_search_btn("+(i)+");' value="+(i)+" class='list-club-pagebtn'><strong>"+i+"</strong></button>");
					}else{
						$parentDIV.append("<button onclick='pageBar_search_btn("+(i)+");' value="+(i)+" class='list-club-pagebtn'>"+i+"</button>");
					}
					
					if(i == tPage){
						break;
					}
				}
				
				if(cPage == tPage){
					$parentDIV.append("<button onclick='pageBar_search_btn("+tPage+");' value="+tPage+" class='list-club-pagebtn'>Next</button>");	
				}else{
					$parentDIV.append("<button onclick='pageBar_search_btn("+(cPage+1)+");' value="+(cPage+1)+" class='list-club-pagebtn'>Next</button>");
				}
				checkCurrentPage = cPage;
				hoverBtnForPageBar();
				
				$("#club-search").val(data[4]);
				
				
			}
		
		},
		error:(x,s,e) =>{
			console.log("Error Search Club");
			console.log(x,s,e);
		}
	});
	
}

</script>
<style>
.card-container:nth-child(n+4) {
	margin-top:3%;
}
</style>
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
                        <!-- <input type="button" value="검색" name="somoim-search-btn" />           -->
                </div>
                <p class="cate-title font-hk"> </p>
                <div class="cate-Classify" id="cate-Classify">
                   <!--  <div class="classify-menu-box"><p class="classify-menu font-hk"></p></div>
                    <div class="classify-menu-box"><p class="classify-menu font-hk"></p></div>
                    <div class="classify-menu-box"><p class="classify-menu font-hk"></p></div>
                    <div class="classify-menu-box"><p class="classify-menu font-hk"></p></div> -->
                </div>
                <div class="card-wrapper" id="allSomoimDivContainer">
                <c:if test="${not empty clubList }">
                <c:forEach items="${clubList }" var="list" varStatus="vs">
                    <div class="card-container">
                        <div class="club-img">
                        	<img src="${pageContext.request.contextPath }/resources/upload/club/maintitleimg/${list.clubImgRe}" alt="" />
                        </div>
                        <div class="club-leader">
                        	<img src="${pageContext.request.contextPath }/resources/upload/profile/${profile[vs.index].profileImgRe}" alt="" />
                        </div>
                        <div class="information-container">
                            <p class="club-leader-name font-hk friend-name-profile">@ ${list.memberId}</p>
                            <p class="club-name-search font-hk">${list.clubTitle }</p>
                            <p class="club-location font-hk"><i class="fas fa-map-marker-alt"></i>${list.clubLocation }</p>
    
                            <div class="information-box">
                                <br>
                                <p class="people-title font-hk">정원수 </p>
                                <span class="information-fontsize">${list.clubCurrent }</span>/${list.clubMax }
                            </div>
                           
                            <div class="information-box">
                                    <br>
                                    <p class="people-title font-hk">남여비율</p>
                                    <c:if test="${not empty maleList }">
                                    <c:forEach items="${maleList }" var = "mList">
                                    <c:if test="${mList.clubCode eq list.clubCode }">
                                    <span class="information-fontsize"><fmt:formatNumber value="${(mList.maleCount/list.clubCurrent)*10 }" pattern="#"/> </span>
                                    <span class="information-fontsize2">:</span>
                                    <span class="information-fontsize3"><fmt:formatNumber value="${10-(mList.maleCount/list.clubCurrent)*10 }" pattern="#"/></span>
                                    </c:if>
                                    </c:forEach>
                                    </c:if>
                            </div>
                           
                            <div class="information-box lastbox">
                                    <br>
                                    <p class="people-title font-hk">평균나이</p>
                                    
                                    <span class="information-fontsize">
                                    <c:set var = "total" value = "0" />
                                    <c:forEach items="${ageList }" var="a">
                                    <c:if test="${a.clubCode eq list.clubCode }">
                                    	<c:set var="age" value="${a.age }"/>
                                    	<c:set var="total" value="${total+a.age}"/>
                                    </c:if>
                                    </c:forEach>
                                    	<fmt:formatNumber value="${total/list.clubCurrent }" pattern="#"/>
                                    세</span>
                                    
                            </div>
                            <button class="information-botton font-hk" name="goclub" data-clubCode=${list.clubCode }>자세히 보기</button>
                        </div>
                    </div>
                   
                </c:forEach>
                </c:if>
    
                </div>
                
               	<div class="card-wrapper" id="searchSomoimDivContainer">
               	</div>
                
                <div class= "club_pageBar_btn">
                	<c:if test="${tPage != 0 }">
                		<c:forEach var="i" begin="1" end="${tPage }" varStatus="vs">
                			<c:if test="${cPage == 1 && i == 1 }">
    	           				<button onclick="pageBar_btn(1);" value="1" class="list-club-pagebtn">Back</button>
                			</c:if>
                			<c:if test="${cPage != 1 && i == 1 }">
    	           				<button onclick="pageBar_btn('${i-1}');" value="${i-1 }" class="list-club-pagebtn">Back</button>
                			</c:if>
                			
                			<button onclick="pageBar_btn('${i }');" value="${i }" class="list-club-pagebtn">${i }</button>
                			
                			<c:if test="${cPage == tPage && i == tPage}">
                				<button onclick="pageBar_btn('${tPage }');" value="${tPage }" class="list-club-pagebtn">Next</button>
                			</c:if>
	               			<c:if test="${cPage != tPage && i == tPage}">
	               				<button onclick="pageBar_btn('${cPage+1 }');" value="${cPage+1}" class="list-club-pagebtn">Next</button>
	               			</c:if>
	               			
                		</c:forEach>
                	</c:if>
                </div>
            </div>
    </section>

</body>
<script type="text/javascript">
pageBar_search_btn(1);
</script>
</html>