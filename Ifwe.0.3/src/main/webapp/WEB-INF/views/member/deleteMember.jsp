<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/afterLoginCommon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/deleteMember.css">
<script src="https://kit.fontawesome.com/5e1e16b3f4.js"></script>
<meta charset="UTF-8">
<title>IFWE 회원탈퇴</title>
<script>
$(document).ready(function(){
	
});
function checkboxTrue(){
	
	if(!$("#delete").prop("checked")) {
		console.log('1111');
		alert('동의해주세요');
		return false;
		
	}
	else {
		console.log('ggg');
		return true;
	}
}
</script>
</head>
<body>
<header>
        <div class="nav-container">
            <div class="logo-box"></div>
            <div class="nav-content-right">
                <div class="nav-right-icon2">
                    <i class="fas fa-bell" style="font-size:35px;color: white;" ></i>
                </div>
                <div class="nav-right-icon1">
                    <i class="fas fa-sort-down fa-2x" id="nav-arrowicon" style="color: white;"></i>
                </div>
                <div class="nav-clubimg">
                	<img src="${pageContext.request.contextPath }/resources/upload/member/frofileimg/ex2.jpg" alt="" />
                </div>
                <!-- 문보라수정 -->
                <div class="nav-right-leader font-kor">
                    <p style="color: white; margin:0;">@ ${memberLoggedIn.memberId }</p>
                    <p style="color: white;margin:0;">${memberLoggedIn.memberName } 님</p>
                </div>
            </div>
        </div>
        <div class="nav-myfrofile-box" id="nav-mypagebox">
             <p id="mypagebutton">마이페이지</p>
             <div class="nav-box-line"></div>
             <p id="logoutbutton">로그아웃</p>
         </div>
    </header>
    
    
<section class="deleteMember-section font-kor">
	<article class="deleteMember-article">
		<div class="deleteMember-title bold-kor">
			<p>탈퇴안내</p>
			<span class="font-kor" style="font-size:16px;">회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</span>
		</div>
		<div class="deleteMember-subTitle">
			<div class="subTitle-first">
				<i class="fas fa-check blue-color"></i>
				<span class="bold-kor">사용하고 계신 아이디(<span class="blue-color">${memberLoggedIn.memberId }</span>)는 탈퇴할 경우 재사용 및 복구가 불가능합니다.</span>
				<p class="subTitle-p-class">탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.</p>
			</div>
			<br />
			<div class="subTitle-second">
				<i class="fas fa-check blue-color"></i>
				<span class="bold-kor">탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</span>
				<p class="subTitle-p-class">회원정보 및 가입소모임, 친구목록 등 개인형 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다. <br />
				삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.</p>
				<table class="update-tbl">
			<tbody>
				<tr>
					<th>
						<div class="update-tbl-title bold-kor">
							소모임
						</div>
					</th>
					<td>
						<div class="update-tbl-content">
							<p>가입 소모임, 소모임활동 내역</p>
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<div class="update-tbl-title bold-kor">
							내정보
						</div>
					</th>
					<td>
						<div class="update-tbl-content">
							<p>이름 , 이메일, 생년월일, 핸드폰 번호</p>
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<div class="update-tbl-title bold-kor">
							친구목록
						</div>
					</th>
					<td>
						<div class="update-tbl-content">
							<p>내 친구목록, 주고받은 메세지 내역</p>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
			</div>
		</div>
		
		<div class="deleteMember-checkdiv">
			<div class="checkdiv-title bold-kor">
				<p class="red-color">탈퇴 후에는 아이디 <span style="color:#2756a6;">${memberLoggedIn.memberId }</span> 로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다. <br />
					게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다.</p>
			</div>
			<div class="chekcbox-div">
				<input type="checkbox" name="delete" id="delete" />
				<label for="delete" class="bold-kor">안내 사항을 모두 확인하였으며, 이에 동의합니다.</label> <br />
				<form action="${pageContext.request.contextPath }/member/deleteForm.do" method="POST" onsubmit="return checkboxTrue();">
					<input type="submit" value="확인" class="deleteBtn bold-kor" id="deleteBtn" />
					<input type="hidden" name="memberId" value="${memberLoggedIn.memberId }" />
				</form>
			</div>
		</div>
	</article>
</section>
</body>
</html>