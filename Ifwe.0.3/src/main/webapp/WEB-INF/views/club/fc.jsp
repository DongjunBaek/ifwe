<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>FullCalendar Example</title>
<link rel=" shortcut icon"
	href="${pageContext.request.contextPath }/resources/image/favicon.ico">

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/vendor/css/fullcalendar.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/vendor/css/bootstrap.min.css">
<link rel="stylesheet"
	href='${pageContext.request.contextPath }/resources/vendor/css/select2.min.css' />
<link rel="stylesheet"
	href='${pageContext.request.contextPath }/resources/vendor/css/bootstrap-datetimepicker.min.css' />

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/main.css">

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/club/clubinclude.css">

<style>
textarea, input,select{
border: 1px solid #ebebeb;
}
</style>
</head>

<body>
<jsp:include page="/WEB-INF/views/common/clubInclude.jsp"></jsp:include>
      <section class="flotclass">
        <div class="section-block">
          <div class="section-wrapper">
            <p class="section-boradmenu">일정캘린더</p>
          </div>
            <div class="calendar-wrapper">
           
	

<%-- <jsp:include page="/WEB-INF/views/common/clubInclude.jsp"></jsp:include> --%>
	<div class="container">

		<!-- 일자 클릭시 메뉴오픈 -->
		<div id="contextMenu" class="dropdown clearfix">
			<ul class="dropdown-menu dropNewEvent" role="menu"
				aria-labelledby="dropdownMenu"
				style="display: block; position: static; margin-bottom: 5px;">
				<li><a tabindex="-1" href="#">카테고리1</a></li>
				<li><a tabindex="-1" href="#">카테고리2</a></li>
				<li><a tabindex="-1" href="#">카테고리3</a></li>
				<li><a tabindex="-1" href="#">카테고리4</a></li>
				<li class="divider"></li>
				<li><a tabindex="-1" href="#" data-role="close">Close</a></li>
			</ul>
		</div>

		<div id="wrapper">
			<div id="loading"></div>
			<div id="calendar"></div>
		</div>


		<!-- 일정 추가 MODAL -->
		<div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title"></h4>
					</div>
					<div class="modal-body">

						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-allDay">하루종일</label> <input
									class='allDayNewEvent' id="edit-allDay" type="checkbox"></label>
							</div>
						</div>

						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-title">일정명</label> <input
									class="inputModal" type="text" name="edit-title"
									id="edit-title" required="required" />
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-start">시작</label> <input
									class="inputModal" type="text" name="edit-start"
									id="edit-start" />
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-end">끝</label> <input
									class="inputModal" type="text" name="edit-end" id="edit-end" />
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-type">구분</label> <select
									class="inputModal" type="text" name="edit-type" id="edit-type">
									<option value="카테고리1">카테고리1</option>
									<option value="카테고리2">카테고리2</option>
									<option value="카테고리3">카테고리3</option>
									<option value="카테고리4">카테고리4</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-color">색상</label> <select
									class="inputModal" name="color" id="edit-color">
									<option value="#D25565" style="color: #D25565;">빨간색</option>
									<option value="#9775fa" style="color: #9775fa;">보라색</option>
									<option value="#ffa94d" style="color: #ffa94d;">주황색</option>
									<option value="#74c0fc" style="color: #74c0fc;">파란색</option>
									<option value="#f06595" style="color: #f06595;">핑크색</option>
									<option value="#63e6be" style="color: #63e6be;">연두색</option>
									<option value="#a9e34b" style="color: #a9e34b;">초록색</option>
									<option value="#4d638c" style="color: #4d638c;">남색</option>
									<option value="#495057" style="color: #495057;">검정색</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-desc">설명</label>
								<textarea rows="4" cols="50" class="inputModal" name="edit-desc"
									id="edit-desc"></textarea>
							</div>
						</div>
					</div>
					<div class="modal-footer modalBtnContainer-addEvent">
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary" id="save-event">저장</button>
					</div>
					<div class="modal-footer modalBtnContainer-modifyEvent">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
						<button type="button" class="btn btn-primary" id="updateEvent">저장</button>
						<input hidden="clubCode" value="${club.clubCode}" />
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->

		
	
	</div>
	<!-- /.container -->
	
	   
            </div>
        </div>
        
        
                
                
            </section>
            

	<script
		src="${pageContext.request.contextPath }/resources/vendor/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/vendor/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/vendor/js/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/vendor/js/fullcalendar.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/vendor/js/ko.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/vendor/js/select2.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/vendor/js/bootstrap-datetimepicker.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/main.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/addEvent.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/editEvent.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/etcSetting.js"></script>
		
		
		
		<script>

		$(()=>{
			
		
		   console.log("onload On");
		 
		      var a = ${memberLoggedIn.memberCode };
		      $.ajax({
		         url:"<%=request.getContextPath()%>/club/checkmaster",
		         type: "GET", 
		          data:{"memberCode":${memberLoggedIn.memberCode },
		        	  	"clubCode":${club.clubCode}},
	
		         beforeSend: function(){
		            console.log("beforeSend");
		         },
		         success: function(data){
		            
		            console.log("success");
		            console.log("data :", data);          
		            
		            
		         },
		         error: function(jqxhr, textStatus, errorThrown){
		      
		            console.log("ajax처리실패!", jqxhr, textStatus, errorThrown);
		         }, 
		         complete: function(){
		      
		            console.log("complete");
		            
		         }
		         
		      });
		   
		</script>
</body>
</html>