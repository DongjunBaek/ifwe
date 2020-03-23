<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/mainInclude.jsp">
	<jsp:param value="마이페이지" name="pageTitle"/>
</jsp:include>
<script>
$(document).ready(function(){
	$(".ul-container").css('display','none');
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
				<tr style="border-bottom:1px solid #ebebeb">
					<th>
						<div class="update-tbl-title-delete bold-kor">
							소모임
						</div>
					</th>
					<td>
						<div class="update-tbl-content">
							<p>가입 소모임, 소모임활동 내역</p>
						</div>
					</td>
				</tr>
				<tr style="border-bottom:1px solid #ebebeb">
					<th>
						<div class="update-tbl-title-delete bold-kor">
							내정보
						</div>
					</th>
					<td>
						<div class="update-tbl-content">
							<p>이름 , 이메일, 생년월일, 핸드폰 번호</p>
						</div>
					</td>
				</tr>
				<tr >
					<th>
						<div class="update-tbl-title-delete bold-kor">
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