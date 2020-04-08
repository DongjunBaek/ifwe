<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴대전화 번경</title>
<script src="https://kit.fontawesome.com/5e1e16b3f4.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/index/login.css">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
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
		let rNum ;
		
		$("#search-id-btn-num").click(function(){
			console.log("12312312312");
			$.ajax({
				url:"${pageContext.request.contextPath}/sms/sms.do",
				method:"POST",
				data: {"phoneNum" : $("#member_phone").val()},
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
			console.log("rNum = ",rNum);
			if($("#number").val() != rNum){
				alert("인증번호가 맞지않습니다.");
				$("#number").val('');
			}else{
				alert("본인인증에 성공하셨습니다.");
				opener.document.getElementById("memberPhone").value = document.getElementById("member_phone").value
				window.close();
			}
		});
		
	});
</script>
</head>
<body>
<header>
	<div class="updatePhone-header bold-kor">
		<i class="fas fa-phone-alt" style="margin-right:2%;"></i> 휴대전화 등록/변경
	</div>
</header>

<section>
	<article class="updatePassword-artical">
		<div class="form-title font-kor">
			<span>등록하실 휴대폰 번호를 입력하고 인증하기 버튼을 눌러주세요.</span><br />
			<p>휴대폰으로 전송된 인증번호를 확인 후 입력해주시면 정보변경이 완료됩니다.</p>
		</div>
		
		
		 <div class="search-id-div updatePhone-container" id="search-id-div">
	                <div class="login-input">
	                	<i class="fas fa-phone-alt index-i-class"></i>
	                	<input class="input-box" type="text" name="member_phone" id="member_phone" placeholder="전화번호">
	                	<input type="button" value="인증번호받기" class="index-search-btn" id="search-id-btn-num"/>
	                </div>
	                 
	                 <div class="search-number-container updatePhone-div" id="search-number-container-id" >
		                 <div class="search-title bold-kor">
		                    <p>인증번호</p>
		                 </div>
		                 <div class="number-input">
		                 	<i class="fas fa-mobile-alt index-i-class"></i>
		                 	<input class="input-box" type="text" name="number" id="number" placeholder="인증번호">	
		                 	<input type="submit" value="확인" class="index-search-btn" id="search-btn-check"/>	
		                 </div>
	             </div>
            </div>
	</article>
</section>

</body>
</html>