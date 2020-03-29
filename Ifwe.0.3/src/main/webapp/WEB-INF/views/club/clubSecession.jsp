<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Club Secession</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/club/clubinclude.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/club/clubsecession.css">
<script src="https://kit.fontawesome.com/5e1e16b3f4.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Fredoka+One&display=swap" rel="stylesheet">
<script>

$(function(){
	$(".deletebtn").click(function(){
		$("#exampleModal").modal();
	});
	
	
});

function clubSecession(){
	location.href="${pageContext.request.contextPath }/club/secessionEnd.do?clubCode=${club.clubCode}";
	
};




</script>


</head>
<body>
<jsp:include page="/WEB-INF/views/common/clubInclude.jsp"></jsp:include>
    <section class="flotclass">
              <div class="section-block">
                  <div class="section-wrapper">
                      <p>회원정보</p>
                  </div>
              </div>
              <div class="shc-section-memberinfo">
                  <p class="memberinfo-profilename">${clubLoggedIn.profileName }</p>
                  <p class="memberinfo-grade">회원등급 : ${clubLoggedIn.clubGrade=='member'?'일반회원':'준회원' }</p>
                  <p class="memberinfo-enroll">가입일 : ${clubLoggedIn.clubEnrolldate }</p>
              </div>
              <input type="button" value="탈퇴하기" class="deletebtn">
              
          </section>
	
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">소모임 탈퇴</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <span class="modal-body-span">${club.clubTitle }</span>&nbsp;소모임을 탈퇴하시겠습니까?
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" onclick="clubSecession();">탈퇴하기</button>
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
		      </div>
		    </div>
		  </div>
		</div>
	
	

</body>
</html>