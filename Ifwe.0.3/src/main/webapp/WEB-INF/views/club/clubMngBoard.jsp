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
    

})


</script>



</head>
<body>
<jsp:include page="/WEB-INF/views/common/clubInclude.jsp"></jsp:include>
     <section class="flotclass">
         <div class="section-block">
             <div class="section-wrapper">
                 <p class="section-boradmenu">소모임 관리</p>
                 <div class="shc-premiumbox">
                     <p>프리미엄 사용중</p>
                 </div>
             </div>
         </div>
         <div class="shc-section-board-container">
             <input type="button" value="추가 +" class="boardplusbtn" id="boardplusbtn">
             <p>게시판 관리</p>
			
			<form action="${pageContext.request.contextPath }/clubboard/insertlist.do" id="tag-form" 
				  method="post" autocomplete="off">
				  
				  
				  <input type="hidden" name="clubCode" value="${club.clubCode }" />
             <div class="shc-boardlist-box">
                 <ul id="board-ul">
                     <li>
                         <i class="fas fa-circle circleicon"></i>
                         <span class="boardlistspan">공지사항</span>
                     </li>
                     <li>
                         <i class="fas fa-circle circleicon"></i>
                         <span class="boardlistspan">일정캘린더</span>
                     </li>
                     <li>
                         <i class="fas fa-circle circleicon"></i>
                         <span class="boardlistspan">자유게시판</span>
                     </li>
                   	<c:if test="${not empty clubBoardList}">
                   	<c:forEach items="${ clubBoardList}" var="boardList">
	                
	                <li>
                        <i class="fas fa-circle circleicon"></i>
                         <span class="boardlistspan">${boardList.boardName }</span>
                   	</li>   	
                   	
                   	</c:forEach>
                   	</c:if>
                     
                     
                 </ul>
             </div>
             <input type="hidden" name="boardTitleList" id="boradtitlehidden">
             <div class="btncenter">
                 <input type="submit" value="저장하기" class="shc-savebtn">
             </div>

			</form>

         </div>
     </section>



</body>
</html>