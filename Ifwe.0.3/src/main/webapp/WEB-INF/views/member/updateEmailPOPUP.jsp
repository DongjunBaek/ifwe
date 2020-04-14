<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴대전화 번경</title>
<script src="https://kit.fontawesome.com/5e1e16b3f4.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/index/login.css">
<style>
@font-face { font-family: 'GmarketSansMedium'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff'); font-weight: normal; font-style: normal; }
@font-face { font-family: 'GmarketSansLight'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff') format('woff'); font-weight: normal; font-style: normal; }
.font-kor{
    font-family : 'GmarketSansLight';
}
.bold-kor{
    font-family: 'GmarketSansMedium';
}
.font-eng{
    font-family: 'Fredoka One';
}
.updatePhone-header{
	height:20px;
	padding:2%;
	background-color:#2756a6;color:white;
}
.updatePhone-div{margin-top:10%;}
   .updatePassword-artical{
    max-width: max-content;
    margin: 5% auto;
   
   }
</style>

<script>
$(function(){
	
	let rNum;
	$("#search-email-btn-num").click(function(){
		console.log("12312312312");
		$.ajax({
			url:"${pageContext.request.contextPath}/mailSender",
			method:"POST",
			data: {"memberEmail" : $("#memberEmail").val()},
			async:false,
			success: function(data){
				console.log("성공",data);
				rNum = data;
				console.log(rNum);
			},
			error:function(x,s,e){
				console.log(x,s,e);
			}
		});
	});
	
	$("#search-btn-check").click(function(){
		console.log($("#number").val());
		console.log(rNum);
		if($("#number").val() != rNum){
			alert("인증번호가 맞지않습니다.");
			$("#number").val('');
		}else{
			alert("본인인증에 성공하셨습니다.");
			$("[name=updateEmailFrm]").submit();
			window.close();
		}
	});
	
});
</script>
</head>
<body>
<header>
	<div class="updatePhone-header bold-kor">
		<i class="fas fa-at" style="margin-right:2%;"></i> 이메일 등록/변경
	</div>
</header>

<section>
	<article class="updatePassword-artical">
		<div class="form-title font-kor">
			<span>등록/변경하실 이메일 주소를 입력하고 인증하기 버튼을 눌러주세요.</span><br />
			<p>이메일로 전송된 인증코드를 확인 후 입력해주시면 정보변경이 완료됩니다.</p>
		</div>
		
		<form method="POST" action="${pageContext.request.contextPath }/member/updateEmailFrm.do" name="updateEmailFrm">
		 <div class="search-id-div updatePhone-container" id="search-id-div">
	                <div class="login-input">
	                
	                	<i class="fas fa-at index-i-class"></i>
	                	<input class="input-box" type="email" name="memberEmail" id="memberEmail" placeholder="이메일주소">
	                	<input type="button" value="인증코드받기" class="index-search-btn" id="search-email-btn-num"/>
	                </div>
	                 
	                 <div class="search-number-container updatePhone-div" id="search-number-container-id" >
		                 <div class="search-title bold-kor">
		                    <p>인증코드</p>
		                 </div>
		                 <div class="number-input">
		                 	<i class="fas fa-mobile-alt index-i-class"></i>
		                 	<input class="input-box" type="text" name="number" id="number" placeholder="인증코드">	
		                 	<input type="button" value="확인" class="index-search-btn" id="search-btn-check"/>	
		                 </div>
	             </div>
            </div>
            <input type="hidden" name="memberId" value="${memberLoggedIn.memberId }" />
            
		</form>
               
	</article>
</section>

</body>
</html>