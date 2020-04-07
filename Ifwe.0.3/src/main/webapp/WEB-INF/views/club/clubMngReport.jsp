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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/club/clubmngboard.css">
<script src="https://kit.fontawesome.com/5e1e16b3f4.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Fredoka+One&display=swap" rel="stylesheet">
<c:if test="${not empty msg }">
	<script>
		$(()=>{
			alert("${msg}");
			console.log("${msg}")
		});
	</script>
</c:if>
<script>
$(function(){

    $("#boardplusbtn").click(function(){
        $("#board-ul").append("<li><i class='fas fa-circle circleicon'></i><input type='text' class='boardtitleinput'></li>");

    })



    var tag = {};
    var counter = 0;

    // 태그를 추가한다.
    function addTag (value) {
        tag[counter] = value; // 태그를 Object 안에 추가
        counter++; // counter 증가 삭제를 위한 del-btn 의 고유 id 가 된다.
        
    }

    // 최종적으로 서버에 넘길때 tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
    function marginTag () {
        return Object.values(tag).filter(function (word) {
            return word !== "";
        });
    }

    // 서버에 넘기기
    $("#tag-form").on("submit", function (e) {
        var value = marginTag(); // return array
        $("#boradtitlehidden").val(value); 
		
        console.log($("#boradtitlehidden").val());
        
        $(this).submit();
    });

    $(document).on("keypress",".boardtitleinput", function (e) {
        var self = $(this);

        // input 에 focus 되있을 때 엔터 및 스페이스바 입력시 구동
        if (e.key === "Enter") {

            var tagValue = self.val(); // 값 가져오기
            var reg = /^[가-힣]{1,8}$/;
            console.log(tagValue);
            // 값이 없으면 동작 ㄴㄴ
            if (tagValue !== "" && reg.test(tagValue)) {
                    
                // 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
                var result = Object.values(tag).filter(function (word) {
                    return word === tagValue;
                })
            
                // 태그 중복 검사
                if (result.length == 0) { 
                    $("#board-ul").append("<li><i class='fas fa-circle circleicon'></i><span class='newboardlistspan'>"+tagValue+"</span><span class='del-btn' idx='"+counter+"'>x</span></li>");
                    addTag(tagValue);
                    self.val("");
                   	console.log(tag[counter]);
                } else {
                    alert("태그값이 중복됩니다.");
                }
            }else{
                $("#boardtitleinput").val('');
            }

            $(this).parent().remove();


        }
    });

    // 삭제 버튼 
    // 삭제 버튼은 비동기적 생성이므로 document 최초 생성시가 아닌 검색을 통해 이벤트를 구현시킨다.
    $(document).on("click", ".del-btn", function (e) {
        var index = $(this).attr("idx");
        tag[index] = "";
        $(this).parent().remove();
    });
    
    $("#report").click(function(){
    	$("#myModal").show();
    });
    

})

    function close_pop(flag) {
        $('#myModal').hide();
    };
    
    function report_board(){
    	$("[name=reportFrm]").submit();
    }

</script>
<style>
.reportTable{width:100%;font-size:20px;}
.reportTable th{background-color:#ffc862;color:white;}
.reportTable th,.reportTable td{height:50px;}
.reportTable td:not(:last-child){height:50px;padding-left:20px;}
.reportBtn{width:47px;height:30px;color:white;}
/* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 20% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 30%; /* Could be more or less, depending on screen size */                          
        }
</style>


</head>
<body>
<jsp:include page="/WEB-INF/views/common/clubInclude.jsp"></jsp:include>
     <section class="flotclass">
         <div class="section-block">
             <div class="section-wrapper">
                 <p class="section-boradmenu">신고된 게시글 관리</p>
                 <div class="shc-premiumbox">
                     <p>프리미엄 사용중</p>
                 </div>
             </div>
         </div>
         <div class="shc-section-board-container">
             <input type="button" value="추가 +" class="boardplusbtn" id="boardplusbtn">
             <p>신고된 게시글 관리</p>
			<input type="hidden" name="clubCode" value="${club.clubCode }" />
             <div class="shc-boardlist-box">
                 <table class="reportTable">
                 	<thead>
                 	<tr>
                 		<th>글제목</th>
                 		<th>글내용</th>
                 		<th>작성자</th>
                 		<th style="width:100px;">신고처리</th>
                 	</tr>
                 	</thead>
                 	
                 	<tbody>
                 	<c:if test="${not empty reportList }">
                 	<c:forEach items="${reportList }" var="list">
                 	<tr>
                 		<td>${list.boardTitle }</td>
                 		<td>${list.boardContent }</td>
                 		<td>${list.profileName }</td>
                 		<td>
                 			<input type="button" value="신고" class="reportBtn" id="report" style="background-color:#ff0000"/>
                 			<input type="button" value="복원" class="reportBtn" style="background-color:#ffc862" />
                 		</td>
                 	</tr>
                 	
          <!-- The Modal -->
    <div id="myModal" class="modal">
      <!-- Modal content -->
      <div class="modal-content">
                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;"><i class="far fa-frown"></i>신고처리</span></b></span></p>
                <p style="text-align: center; line-height: 1.5;"><br />블라인드 처리 하시겠습니까?</p>
                <form name="reportFrm" action="${pageContext.request.contextPath }/club/blind.do" method="POST">
                <input type="hidden" name="boardNo" value="${list.boardNo }" />
                <input type="hidden" name="memberCode" value="${memberLoggedIn.memberCode }" />
                <input type="hidden" name="clubCode" value="${list.clubCode}" />
                <input type="hidden" name="clubBoardListNo" value="${cb.clubBoardlistNo}" />
                </form>
                <p><br /></p>
                <p><br /></p>
            <div style="display:inline-block;width:280px;cursor:pointer;background-color:#ED0000 ;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="report_board();">
                <span class="pop_bt" style="font-size: 13pt; color:white;" >
                     예
                </span>
            </div>
            <div style="display:inline-block;width:280px;cursor:pointer;background-color:#ffc862 ;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
                <span class="pop_bt" style="font-size: 13pt; color:white;" >
                     아니요
                </span>
            </div>
      </div>
 
    </div>
        <!--End Modal-->
                 	</c:forEach>
                 	</c:if>
                 	</tbody>
                 	
                 	
                 </table>
             </div>
         </div>
     </section>



</body>
</html>