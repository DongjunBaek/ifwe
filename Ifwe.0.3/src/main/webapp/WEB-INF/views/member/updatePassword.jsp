<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/mainInclude.jsp">
	<jsp:param value="비밀번호변경" name="pageTitle"/>
</jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>    
<script src='https://www.google.com/recaptcha/api.js'></script>
<script>
$(document).ready(function() {
    /* $("#test_btn").click(function() {
        $.ajax({
            url: '/spring/VerifyRecaptcha',
            type: 'post',
            data: {
                recaptcha: $("#g-recaptcha-response").val()
            },
            datatype:"int",
            success: function(data) {
            	console.log(data);
            	
                switch (data) {
                    case 0:
                        alert("자동 가입 방지 봇 통과");
                        break;

                    case 1:
                        alert("자동 가입 방지 봇을 확인 한뒤 진행 해 주세요.");
                        break;

                    default:
                        alert("자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : " + Number(data) + "]");
                        break;
                }
            },
            error:(x,s,e)=>{
            	console.log(x,s,e)
            }
        });
    }); */
    
    
    console.log($("#password-old").val());
});
$(function(){
	$("#password-old").blur(function(){
		console.log($("#password-old").val());
	});
	
	
	
	
});


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
		console.log(rNum);
		if($("#number").val() != rNum){
			alert("인증번호가 맞지않습니다.");
			$("#number").val('');
		}else{
			alert("본인인증에 성공하셨습니다.")
			window.close();
		}
	});
	
});

function passwordCheck(){
	if($("#password-old").val()==""){
		alert('현재 비밀번호를 입력해주세요.');
		$("#password-old").focus();
	}
	else if($("#password-new").val()==""){
		alert('새 비밀번호를 입력해주세요.');
		$("#password-new").focus();
	}else if($("#password-new-chk").val()==""){
		alert('새 비밀번호 확인을 입력해주세요.');
		$("#password-new-chk").focus();
	}else if($("#password-new-chk").val() != $("#password-new").val()){
		alert('새 비밀번호와 비밀번호 확인이 맞지않습니다.');
		$("#password-new-chk").focus();
	}else if($("#password-old").val() == $("#password-new").val()){
		alert("현재 비밀번호와 같습니다.");
	}else{
		return true;
	}
	
	return false;
}
</script>
<section style="margin:0;">
	<article class="updatePassword-artical">
		<div class="profile-update-div-in bold-kor">
   			<p>비밀번호 변경</p>
   			<span>안전한 비밀번호로 내정보를 보호하세요.</span>
   			<ul style = "padding:3%;">
   				<li style="color:red">다른 아이디/사이트에서 사용하지 않는 비밀번호</li>
   				<li><span style="color:red">이전에 사용하지 않은 비밀번호</span>가 안전합니다.</li>
   			</ul>
   		</div>
   		<form name="updatePasswordForm" method="post" action="${pageContext.request.contextPath }/member/updatePasswordFrm.do" onsubmit="return passwordCheck();"> 
   			<div class="updatePassword-div-container">
   				<div class="updatePassword-old">
   					<input type="password" name="password-old" id="password-old" class="updatePassword-inputs bold-kor" placeholder="현재 비밀번호"/>
   				</div>
   				
   				<div class="updatePassword-new">
   					<input type="password" name="password-new" id="password-new" class="updatePassword-inputs bold-kor" placeholder="새 비밀번호"/>
   				</div>
   				<div class="updatePassword-new-chk">
   					<input type="password" name="password-new-chk" id="password-new-chk" class="updatePassword-inputs bold-kor" placeholder="새 비밀번호 확인"/>
   				</div>
   				
   				<div class="g-recaptcha recaptcha-div" data-sitekey="6Lc99-IUAAAAAJQ4feb_nklFZQk4xLgczuilCIyE"></div>
   				
   				<div class="updatePassword-btn" style="margin-top:10%;">
   					<input type="submit" value="확인" class="updatePassword-inputs bold-kor" style="background-color:#2756a6;" />
   				</div>
   				<div class="updatePassword-btn" style="margin-top:2%;">
   					<input type="reset" value="취소" class="updatePassword-inputs bold-kor" style="color:black" />
   				</div>
   			</div>
   			
   			<input type="hidden" name="memberId" value="${memberLoggedIn.memberId }" />
   		</form>


	</article>	
</section>

</body>
</html>