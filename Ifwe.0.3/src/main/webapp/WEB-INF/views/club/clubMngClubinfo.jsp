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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/club/clubmngclubinfo.css">
<script src="https://kit.fontawesome.com/5e1e16b3f4.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Fredoka+One&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery.selectric.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/selectric.css">


<script>
$(function(){
	
	$("#input-upfile").on("change",function(e){
		let $file = $(e.target);
		
		if($file.prop('files')[0] === undefined){
		}else{
			$(".upfilename").val($file.prop('files')[0].name);
		}
		
	});
	
});

function checkClubMax(){
	if(${club.premiumCode == 'premium' }){
		console.log($("[name=clubMax]").val());
		if($("[name=clubMax]").val()>2000) {
			alert("최대 인원은 2000명입니다.");
			$("[name=clubMax]").val('');
			$("[name=clubMax]").focus();
			return false;
		}
	}else if(${club.premiumCode == null }){
		console.log($("[name=clubMax]").val());
		if($("[name=clubMax]").val()>100) {
			if(confirm("기본등급의 최대 인원은 100명입니다.등급을 올리시겠습니까?")){
				location.href = "${pageContext.request.contextPath}/member/membership.do?memberCode="+${memberLoggedIn.memberCode};
			}
			$("[name=clubMax]").val('');
			$("[name=clubMax]").focus();
			return false;
		}
	}else if(${club.premiumCode == 'gold' }){
		console.log($("[name=clubMax]").val());
		if($("[name=clubMax]").val()>1000) {
			if(confirm("골드등급의 최대 인원은 1000명입니다.등급을 올리시겠습니까?")){
				location.href = "${pageContext.request.contextPath}/member/membership.do?memberCode="+${memberLoggedIn.memberCode};
			}
			$("[name=clubMax]").val('');
			$("[name=clubMax]").focus();
			return false;
		}
	}else if(${club.premiumCode == 'silver'}){
		console.log($("[name=clubMax]").val());
		if($("[name=clubMax]").val()>500) {
			if(confirm("실버등급의 최대 인원은 500명입니다.등급을 올리시겠습니까?")){
				location.href = "${pageContext.request.contextPath}/member/membership.do?memberCode="+${memberLoggedIn.memberCode};
			}
			$("[name=clubMax]").val('');
			$("[name=clubMax]").focus();
			return false;
		}
	}
	return true;
}

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
        <form action="${pageContext.request.contextPath }/club/mngclubinfo.do" method="post" 
        	  enctype="multipart/form-data" autocomplete="off" onsubmit="return checkClubMax()">
        	<input type="hidden" name="clubCode" value="${club.clubCode }" />
            <div class="shc-section-memberlist-container">
                <p>소모임 정보 수정</p>
                <div class="shc-section-clubinfobox">
                    <i class="fas fa-circle"></i>
                    <span>모임명</span><br>
                    <input type="text" name="clubTitle" id="" class="clubnameinput" value="${club.clubTitle }">
                    <br>
                    
                    <i class="fas fa-circle"></i>
                    <span>소개글</span><br>
                    <input type="text" name="clubContent" id="" class="clubcontentinput" value="${club.clubContent }">
                    <br>    
                    
                    <i class="fas fa-circle"></i>
                    <span>지역</span><br>
                    <div class="shc-selectbox">
                        <select name="clubLocation" id="locationselect">
                            <option value="서울" ${club.clubLocation=='서울'?'selected':'' }>서울시</option>
                            <option value="경기" ${club.clubLocation=='경기'?'selected':'' }>경기도</option>
                            <option value="강원" ${club.clubLocation=='강원'?'selected':'' }>강원도</option>
                            <option value="충북" ${club.clubLocation=='충북'?'selected':'' }>충청북도</option>
                            <option value="충남" ${club.clubLocation=='충남'?'selected':'' }>충청남도</option>
                            <option value="경북" ${club.clubLocation=='경북'?'selected':'' }>경상북도</option>
                            <option value="경남" ${club.clubLocation=='경남'?'selected':'' }>경상남도</option>
                            <option value="전북" ${club.clubLocation=='전북'?'selected':'' }>전라북도</option>
                            <option value="전남" ${club.clubLocation=='전남'?'selected':'' }>전라남도</option>
                            <option value="제주특별자치도" ${club.clubLocation=='제주특별자치도'?'selected':'' }>제주도</option>
                        </select>
                    </div>
                    <i class="fas fa-circle"></i>
                    <span>인원수</span><br>
                    <div class="inputDivDivs">
                      	<input type="number" name="clubMax" class="clubnameinput" style=" width:200px; height:40px;" value="${club.clubMax }"/>
                      	<c:if test="${club.premiumCode == 'premium' }">
                      	<span style="color :#2756a6 ; font-size:16px;">최대 2000 명</span>
						</c:if>
                      	<c:if test="${club.premiumCode == 'gold' }">
                      	<span style="color :#2756a6 ; font-size:16px;">최대 1000 명</span>
						</c:if>
                      	<c:if test="${club.premiumCode == 'silver' }">
                      	<span style="color :#2756a6 ; font-size:16px;">최대 500 명</span>
						</c:if>
                      	<c:if test="${club.premiumCode == null }">
                      	<span style="color :#2756a6 ; font-size:16px;">최대 100 명</span>
						</c:if>
                      
                    </div>
                    <i class="fas fa-circle"></i>
                    <span>배너 이미지</span><br>
                    <input type="hidden" name="clubImgReName" value="${club.clubImgRe }" />
                    <input type="text" name="" id="" class="upfilename" value="${club.clubImgOri }" readonly>
                    <label for="input-upfile" class="upfilelabel">파일첨부</label>
                    <input type="file" name="upFile" id="input-upfile" class="upfileinput">
                    
                </div>
                
                <button type="submit" class="clubinfo-savebutton">저장하기</button>
            </div>
            
        </form>
    </section>
    
    <script>
    $(function(){
    	$("#locationselect").selectric();
    	
    });
    </script>

</body>
</html>