<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/mainInclude.jsp">
	<jsp:param value="연락처 변경" name="pageTitle"/>
</jsp:include>

<style>
.updateEmailPhone-article{width:1200px;height:1000px;margin:3% auto; background-color:white;padding:3%;}
.update-tbl{margin:7% auto;border-top:1px solid #ebebeb;border-bottom:1px solid #ebebeb;}
.update-tbl-title{font-size:25px;padding:5%;width:200px;height:200px;background-color:#ebebeb}
.update-tbl-content{font-size:20px; width:800px;margin-left:3%;}
.updateEmailPhone-btn{margin-top:4%}
.update-tbl tr:not(:last-child){border-bottom:1px solid #cbcbcb;}
</style>
<c:if test="${not empty msg }">
	<script>
		alert("${msg}");
	</script>
</c:if>

<script>
	$(function(){
		$("#updatePhone").click(function(){
			console.log("123123");
			window.open("${pageContext.request.contextPath}/member/updatePhonePUPUP.do", "a", "width=500, height=400, left=300, top=200"); 
			
		});
		
		$("#updateEmail").click(function(){
			console.log("0000");
			window.open("${pageContext.request.contextPath}/member/updateEmailPOPUP.do", "a", "width=500, height=400, left=300, top=200"); 
			
		});
		
		var func = "javascript:${close}()";
		/* $(opener.location).attr("href", func); */
		self.close();
		
	});
</script>
<section style="margin:0;">
	<article class="updateEmailPhone-article">
		<div class="profile-update-div-in bold-kor">
   			<p>연락처 변경</p>
   			<span style="font-size:18px;">${memberLoggedIn.memberId }</span><span>님의 연락처 정보입니다. </span><br />
   			<span>회원정보는 개인정보처리방침에 따라 안전하게 보호되며, 회원님의 명백한 동의 없이 공개 또는 제 3자에게 제공되지 않습니다.</span>
   		</div>
   		
		<table class="update-tbl">
			<tbody>
				<tr>
					<th>
						<div class="update-tbl-title bold-kor">
							사용자 이름
						</div>
					</th>
					<td>
						<div class="update-tbl-content">
							<p class="bold-kor">${memberLoggedIn.memberName }</p>
							<span style="font-size:12px">실명 정보(이름, 생년월일, 성별, 개인 고유 식별 정보)가 변경된 경우 본인 확인을 통해 정보를 수정하실 수 있습니다</span> <br />
							<input type="button" value="수정" class="updateEmailPhone-btn"/>
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<div class="update-tbl-title bold-kor">
							휴대전화
						</div>
					</th>
					<td>
						<div class="update-tbl-content">
							<p class="bold-kor">${memberLoggedIn.memberPhone==null?"휴대폰번호를 등록주세요":memberLoggedIn.memberPhone }</p>
							<span style="font-size:12px">아이디, 비밀번호 찾기 등 본인확인이 필요한 경우에 사용할 휴대전화입니다.</span> <br />
							<input type="button" value="수정" class="updateEmailPhone-btn" id="updatePhone"/>
						
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<div class="update-tbl-title bold-kor">
							이메일
						</div>
					</th>
					<td>
						<div class="update-tbl-content">
							<p class="bold-kor">${memberLoggedIn.memberEmail }</p>
							<span style="font-size:12px">ifwe 서비스 변경/개편/종료, 프로모션 등 대부분 안내에 사용할 이메일 주소입니다.</span> <br />
							<input type="button" value="수정" class="updateEmailPhone-btn" id="updateEmail"/>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</article>
</section>
</body>
</html>