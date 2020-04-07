<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/Login_dormantMember.css">
<script src="https://kit.fontawesome.com/226b55f414.js" crossorigin="anonymous"></script>
<script src="js/jquery-3.4.1.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<title>Login_dormantMember</title>
<script>
console.log(${member.memberCode});
</script>
</head>
<body>
	<!-- 0406 여주
	로그인 후 휴면계정 해지 페이지 -->
	<section>
        <div class="main_wrap">
            <div class="white_card_back">
                <img src="resources/images/index/logo_black.png" class="logo_black" width="82px" height="37px" alt="">
                <br>
                <i class="fas fa-user-clock"></i>
                <h1>휴면계정 해지</h1>
                <div class="yellow_border"></div>
                <p>회원님은 1년이상 로그인을 하지않아 현재 휴면상태입니다.<br>
		                    아래 버튼을 클릭하여 휴면해지 신청하세요.<br>
		                    요청 완료는 1~3일 정도 소요됩니다</p>
		        <form id="Release_member" action="${pageContext.request.contextPath }/admin/dormantNotice.do" method="POST">
		        	<input type="hidden" name="memberCode" value="${member.memberCode }">
	                <input type="submit" id="btn_member_Release" value="휴면해지 신청하기">
		        </form>
            </div>
        </div>
    </section>
</body>
</html>