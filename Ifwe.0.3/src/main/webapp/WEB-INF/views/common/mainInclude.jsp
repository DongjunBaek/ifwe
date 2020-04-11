<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${param.pageTitle }</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery.selectric.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.6.0/moment.min.js"></script>
<script src="https://kit.fontawesome.com/5e1e16b3f4.js"></script>
<link href="https://fonts.googleapis.com/css?family=Fredoka+One&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/selectric.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/categori.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/mainboard.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/membership.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/deleteMember.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/mypage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/afterLoginCommon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/afterLogin-css.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/boardForm.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/profile.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/makeProfile.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/update.css">
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.js"></script>
<script>
$(function(){
   $("#nav-arrowicon").click(function(){
        $("#nav-mypagebox").slideToggle(300);
    });
   
   $("#mypagebutton").click(function(){
	   location.href="${pageContext.request.contextPath }/member/mypage.do?memberCode=${memberLoggedIn.memberCode}";
   });
   
   $(".logo-box").click(function(){
   	location.href="${pageContext.request.contextPath }/main/mainPage.do?memberCode=${memberLoggedIn.memberCode}";
   })
   
   $("#somoim-create").click(function(){
	   location.href = "${pageContext.request.contextPath}/club/clubCreate.do";
   });
   $("#somoim-search").click(function(){
	   location.href = "${pageContext.request.contextPath}/club/clubSearch.do";
   });
   $("#main-board").click(function(){
	   location.href = "${pageContext.request.contextPath}/board/mainBoard.do";
   });
   $("#information").click(function(){
   });
   
   $("#buy-membership").click(function(){
	   location.href = "${pageContext.request.contextPath}/member/membership.do?memberCode=${memberLoggedIn.memberCode}";
   });
   
   $("#logoutbutton").click(function(){
	   location.href = "${pageContext.request.contextPath}/member/logout.do";
   });
   
   $(".nav-right-icon2").click(function(){
	   location.href = "${pageContext.request.contextPath}/member/mypage.do?memberCode=${memberLoggedIn.memberCode}";
   });
   /* var msgCount = ${msgCount}
   console.log(msgCount) */
   
   
   $(".fa-comment-dots").click(function(){
	   $(".nav-msg-cantainer").slideToggle(500,function(){
		  $.ajax({
				data:{
					  "memberCode" : ${memberLoggedIn.memberCode}
			 		  },
	        	url:"${pageContext.request.contextPath}/friend/selectfriendmsg.do",
	        	type:"GET",
	        	success:function(data){
	        		if(data>0){
	        			console.log(data);
	        			
	        			};
	        	},
	        	error: function(jqxhr, textStatus, errorThrown){
	        		
	        	}
	   		});
	  }); 
   });
	   
   
   $(".navmsg-receive").click(function(){
	  $(".navmsg-receive").css("background-color","#2756a6"); 
	  $(".navmsg-send").css("background-color","#beceea"); 
   });
   
   $(".navmsg-send").click(function(){
		  $(".navmsg-receive").css("background-color","#beceea"); 
		  $(".navmsg-send").css("background-color","#2756a6"); 
	   });
   
   
   $(".navmsg-friend-list").each(function(idx,item){
	  
	  $(item).click(function(){
		  var friendCode = $(item).children("input[name=friendCode]").val();
		  var friendId = $(item).children("input[name=memberId]").val();
		  var friendName = $(item).children("p").text();
		  var memberCode = ${memberLoggedIn.memberCode};
		  
		  var memberimgsrc = $(".nav-clubimg").children("img").attr("src");
		  
		  $("#msglistbox").empty();
		  
			 $.ajax({
				data:{
					  "friendCode":friendCode,
	        	  	  "memberCode":${memberLoggedIn.memberCode}
			 		  },
	        	url:"${pageContext.request.contextPath}/friend/msgList.do",
	        	type:"GET",
	        	success:function(data){
	        		
				 	$(".navmsg-receive").click(function(){
				 		$("#msglistbox").empty();
	        			$(data).each(function(idx,msglist){
	        				if(msglist.memberCode ==memberCode){
	        				
			        			var msgstart =  '<div class="navmsg-msg-list">'+
			        							'<input type="hidden" name="msgcontent" value="'+msglist.msgContent+'"/>'+
			        							'<input type="hidden" name="msgCode" value="'+msglist.msgCode+'"/>'+
							                    '<i class="fas fa-circle"></i>'+
							                    '<p class="navmsg-member">'+friendName+'님의 메세지</p>'+
							                    '<p class="navmsg-date">'+moment("/Date("+msglist.msgDate+")/").format("YYYY-MM-DD").toString()+'</p>';
							    var msgnew = '';                
							    var msgend = '</div>';
							    
							    if(msglist.msgView == 'n'){
							    	msgnew = '<div class="navmsg-listimg-box">'+
					                         '    NEW'+
					                         '</div>';
							    }
							    
			        			$("#msglistbox").append(msgstart+msgnew+msgend);
	        				}
	        				
	        			});
						
	        			$(".navmsg-msg-list").each(function(idx,val){
	        				
	        				$(val).click(function(){
	        					var msgCode = $(val).children("input[name=msgCode]").val();
	        					var msgContent = $(val).children("input[name=msgcontent]").val();
	        					var friendimgsrc = $(item).children(".navmsg-img").children("img").attr("src");
	        					
	        					$.ajax({
	        						data:{
	        							  "msgCode":msgCode,
	        					 		  },
	        			        	url:"${pageContext.request.contextPath}/friend/updatefriendmsg.do",
	        			        	type:"POST",
	        			        	success:function(success){
	        			        		
	        			        		if(success>0){
	        			        			$(item).trigger("click");
	        			        		}
	        			        	},
	        			        	error: function(jqxhr, textStatus, errorThrown){
	        			        	}
	        						
	        					});
	        					
	        				    
	        				    $(".receive-container").animate({left:"-500px"},500,function(){
	        				    	$(".memberinfo-imgbox").children("img").attr("src",friendimgsrc);
		        					$(".memberinfoid").text(friendId);
		        				    $(".memberinfoname").text(friendName);
		        				    $(".sendmsg-content").text(msgContent);
	        				    	
	        				    	$(".receive-container").animate({left:"35px"},800)
	        				    });
			        			$(".send-container").animate({left:"-500px"},500,function(){
			        				$(".myinfo-imgbox").children("img").attr("src",memberimgsrc);
			        				$(".send-container").animate({left:"35px"},800)
			        			});
	        				    
	        				    
	        				});
	        				
	        			});
	        		
			 	 	}); 
	        	   $(".navmsg-send").click(function(){
	        		   $("#msglistbox").empty();
	        			$(data).each(function(idx,msglist){
	        				if(msglist.memberCode ==friendCode){
	        				
			        			var msgstart =  '<div class="navmsg-msg-list">'+
			        							'<input type="hidden" name="msgcontent" value="'+msglist.msgContent+'"/>'+
							                    '<i class="fas fa-circle"></i>'+
							                    '<p class="navmsg-member">내가 보낸 메세지</p>'+
							                    '<p class="navmsg-date">'+moment("/Date("+msglist.msgDate+")/").format("YYYY-MM-DD").toString()+'</p>';
							    var msgnew = '';                
							    var msgend = '</div>';
							    
							    
			        			$("#msglistbox").append(msgstart+msgnew+msgend);
	        				}
	        				
	        			});
	        			
	        			$(".navmsg-msg-list").each(function(idx,val){
	        				var msgContent = $(val).children("input[name=msgcontent]").val();
	        				var msgId = '${memberLoggedIn.memberId}';
	        				var msgnickname = '${memberLoggedIn.profileName}';
	        				$(val).click(function(){
	        					
		        			    $(".receive-container").animate({left:"-500px"},500,function(){
	        				    	$(".memberinfo-imgbox").children("img").attr("src",memberimgsrc);
		        					$(".memberinfoid").text(msgId);
		        				    $(".memberinfoname").text(msgnickname);
		        				    $(".sendmsg-content").text(msgContent);
	        				    	
	        				    	$(".receive-container").animate({left:"35px"},800)
	        				    });
			        			$(".send-container").animate({left:"-500px"},500);
	        				
	        				});
	        				
	        			});
	        			
	        		   
	        		   
	        	   });
	        	   $(".navmsg-receive").trigger("click");
	        		
	        	},
	        	error: function(jqxhr, textStatus, errorThrown){
	        		
	        	}
			 
			 });
			 
			 
			 $("#navmsgsubmit-btn").click(function(){
				 var sendcontent = $("#sendContent").val();
				 
				 $.ajax({
					data:{
						  "memberCode":friendCode,
		        	  	  "memberFrom":${memberLoggedIn.memberCode},
		        	  	  "msgContent":sendcontent
				 		  },
		        	url:"${pageContext.request.contextPath}/friend/insertfriendmsg.do",
		        	type:"POST",
		        	success:function(data){
		        		
		        		if(data > 0){
		        			$(".receive-container").animate({left:"-500px"},1000);
		        			$(".send-container").animate({left:"-500px"},1000,function(){
			        			$("#sendContent").val('');
		        			});
		        			$(item).trigger("click");
		        		}
		        		
		        		
		        	},
		        	error: function(jqxhr, textStatus, errorThrown){
		        		
		        	}
					 
					 
					 
					 
				 });
				 
				 
			 });
			 
			 
			 
			 
			 
			 
			 
			 
	 	 });
 	  });
	  
   
   
   
   
   
   
   
   
   
});
</script>
<style>
p{
margin:0;	
}
.font-black{
color:black;
text-decoration: none;}
a:hover{
text-decoration: none;
}
.fa-comment-dots{
    float: right;
    color:white;
    font-size: 40px;
    margin-top: 45px;
    margin-left: 30px;
    cursor: pointer;
    position:relative;
}
.talk-count{
	background-color: #fa3e3e;
    border-radius: 2px;
    color: white;
    padding: 1px 3px;
    font-size: 10px;
    position: absolute;
    top: 45px;
    right:-7px;
}


.myinfo-textarea{
    outline: none;
    font-size: 20px;
    resize: none;
    border:none;
}
.nav-msg-cantainer{
	display:none;
}


</style>
</head>
<body>
<header>
		
        <div class="nav-container">
            <div class="logo-box"></div>
            <div class="nav-content-right">
            <i class="fas fa-comment-dots"></i>
            <c:if test="${not empty friendMsgCount && friendMsgCount!= 0 }">
             <span class="talk-count">${friendMsgCount }</span>
             </c:if>
                <div class="nav-right-icon2">
                    <i class="fas fa-bell" style="font-size:40px;color: white;" ></i>
                    <c:if test="${not empty msgCount && msgCount != 0}">
                    	<span class="bell-count">${msgCount }</span>
                    </c:if>
                </div>
                <div class="nav-right-icon1">
                    <i class="fas fa-sort-down fa-2x" id="nav-arrowicon" style="color: white;"></i>
                   
                </div>
                <div class="nav-clubimg">

                	<img src="${pageContext.request.contextPath }/resources/upload/profile/${memberLoggedIn.profileImgRe}" alt="" />

                </div>
                <!-- 문보라수정 -->
                <div class="nav-right-leader font-kor">
                    <p style="color: white; margin:0;">@ ${memberLoggedIn.memberId }</p>
                    <p style="color: white;margin:0;">${memberLoggedIn.memberName } 님</p>
                </div>
            </div>
            
            <div class="nav-msg-cantainer">
                    <div class="navmsg-friend-box">
                        <div class="navmsg-friend-title">
                                <i class="fas fa-user-alt"></i>
                                <span>친구목록</span>
                        </div>
						<c:if test="${not empty  friendList}">
						<c:forEach items="${friendList }" var="fl">
	                        <div class="navmsg-friend-list">
	                        	<input type="hidden" name="friendCode" value="${fl.friendCode }"/>
	                        	<input type="hidden" name="memberId" value="${fl.memberId }" />
	                            <div class="navmsg-img">
	                                <img src="${pageContext.request.contextPath }/resources/upload/profile/${fl.profileImgRe}" alt="">
	                            </div>
	                            <p>${fl.memberPname }</p>
	                        </div>
						</c:forEach>
						</c:if>


                    </div>
                    <div class="navmsg-msg-box">
                            <div class="navmsg-receive">
                            	받은메세지
                            </div>
                            <div class="navmsg-send">
                            	보낸메세지
                            </div>
							<div class="navmsg-msglist-box" id="msglistbox">
							
<!-- 		                        <div class="navmsg-msg-list">
		                                <i class="fas fa-circle"></i>
		                                <p class="navmsg-member">닉네임테스트님의 메세지</p>
		                                <p class="navmsg-date">2020-03-11</p>
		                                <div class="navmsg-listimg-box">
		                                    NEW
		                                </div>
		                        </div>
		                        
 -->						</div>
                    </div>
                    <div class="navmsg-sendmsg-box">
                    <div class="receive-container">
                        <div class="sendmsg-memberinfo">
                            <div class="memberinfo-imgbox">
                                 <img src="" alt="">
                            </div>
                            <p class="memberinfoid"></p>
                            <p class="memberinfoname"></p>
                        </div>
                        <div class="sendmsg-content">

                        </div>
                    </div>
                    <div class="send-container">
                        <div class="sendmsg-memberinfo">
                            <div class="myinfo-imgbox">
                                    <img src="" alt="">
                            </div>
                            <p class="myinfoid">${memberLoggedIn.memberId }</p>
                            <p class="myinfoname">${memberLoggedIn.profileName}</p>
                        </div>
                        <textarea name="" id="sendContent" cols="46" rows="15" class="myinfo-textarea"></textarea>
                        <br>
                        <input type="button" value="보내기" class="navmsg-btn" id="navmsgsubmit-btn"> 
                    </div>
                            
                    </div>  

                </div>
            
            
            
            
            
            
            
            
            
            
            
            
        </div>
        <div class="nav-myfrofile-box" id="nav-mypagebox">
             <p id="mypagebutton">마이페이지</p>
             <div class="nav-box-line"></div>
             <p id="logoutbutton">로그아웃</p>
         </div>
    </header>
    <nav>    
        <div class="ul-container">
            <div class="ul-background">
                <ul class="ul-tag bold-kor">
                    <div class="blue-back" id="somoim-create">
                        <li><a href="${pageContext.request.contextPath }/club/clubCreate.do" class="font-black" >소모임 생성</a></li>
                    </div>
                    <div class="blue-back" id="somoim-search">
                    	<li>
                    	<a href="${pageContext.request.contextPath }/club/clubSearch.do" class="font-black">소모임 검색</a>
                    	</li>
                    </div>
                    <div class="blue-back" id="main-board">
                    	<li><a href="${pageContext.request.contextPath }/board/mainBoard.do" class="font-black">게시판</a></li>
                    </div>
                    <div class="blue-back" id="information">
                    	<li><a href="#" class="font-black">소개</a> </li>
                    </div>
                    <div class="blue-back" id="buy-membership">
                    	<li><a href="${pageContext.request.contextPath }/member/membership.do?memberCode=${memberLoggedIn.memberCode}" class="font-black">멤버쉽 구매</a></li>
                    </div>
                    <c:if test="${memberLoggedIn.memberCode == 10000 }">
                    <div class="blue-back" id="buy-membership">
                    <li><a href="${pageContext.request.contextPath }/admin/adminPage.do" class="font-black">관리자페이지</a></li>
               		 </div>
                    </c:if>
                </ul>
            </div>
        </div>
    </nav>