<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Enroll Update</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/afterLoginCommon.css">
<script src="https://kit.fontawesome.com/5e1e16b3f4.js" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/748cfe3a61.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Fredoka+One&display=swap" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/update.css">
<style>
   .update-second{
       width: 1100px;
       min-height: 500px;
       float: left;
       margin-top: 2%;
   }
   .update-title{
       width: 1100px;
       height: 75px;
   }
   .update-title-p{
       font-size: 35px;
       margin-left: 5%;
       margin-top:2%;
   }
   .update-form{
       /* margin-top: 3%; */
       width: 1100px;
       height: 750px;
       background-color: white;
       float: left;
   }
   .first-form,.second-form{
       margin-top: 6%;
       width: 480px;
       height: 580px;
       float: left;
       margin-left:6.3%
   }
   .update-form-input{
       border:1px solid #ebebeb;
       /* margin-bottom: 5%; */
   }
   .label{
       font-size: 20px;
       margin: 4% 0 5% 0;
   }
   .input{
       width: 260px;
       height: 44px;
       font-size: 20px;
   }
   .input-long{
       width: 400px;
       height: 44px;
   }
   .update-button{
       margin-top: 10%;
       width: 345px;
       height: 50px;
       background-color: #ffc862;
       border: 0;
       outline: 0;
       border-radius: 20px;
       color: white;
       font-size: 20px;
   }
   
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/mainInclude.jsp"></jsp:include>
<section>
   <article class="first">
       <div class="intro-div">
           <div class="img-div">
           	<img src="${pageContext.request.contextPath }/resources/upload/member/frofileimg/ex2.jpg" alt="" />
           </div>
           <div class="myname-div font-kor">
               <div style="font-size: 25px;margin:0 10% ">@wingStudy_02</div>
               <div style="font-size:30px;font-weight: 900;margin:5% 20% 0 30%" >스테파니</div>
           </div>
       </div>
       <div class="btn-div">
           <input type="button" value="회원정보 수정" class="update-btn font-kor">
           <input type="button" value="프로필 카드" class="update-btn font-kor">
       </div>
       <div class="list-div">
           <div class="list-title">
               <p style="color: white;font-size: 20px;font-weight: bold; padding: 6%;" class="font-kor">소모임 목록</p>
               <div class="list-ul-container">
                   <ul class="font-kor list-ul" style="padding: 0;">
                        <li><p class="p-class">윙스터디 모임</p></li>
                        <li><p class="p-class">윙스터디</p></li>
                        <li><p class="p-class">윙</p></li>
                    </ul>
                </div>
            </div>
        </div>
    </article>
    <article class="update-second bold-font">
        <div class="update-title">
            <p class="update-title-p">회원정보 수정</p>
        </div>
        <div class="update-form font-kor">
            <form action="">
                <div class="first-form" >
                    <div id="name">
                        <div class="label">이름</div>
                        <input type="text" name="name" class="update-form-input input">
                    </div>
                    <div id="birthday">
                        <div class="label">생년월일</div>
                        <div class="label">1999 년 07 월 11 일</div>
                    </div>
                    <div id="address">
                        <div class="label">주소</div>
                        <input type="text" name="address" class="update-form-input input-long">
                    </div>
                    <div id="gender">
                        <div class="label">성별</div>
                        <input type="text" name="gender" class="update-form-input input">
                    </div>
                    <div id="email">
                        <div class="label">이메일</div>
                        <input type="text" name="email" class="update-form-input input-long">
                    </div>
                </div>

                <div class="second-form" >
                    <div id="nickName">
                        <div class="label">닉네임</div>
                        <input type="text" name="nickName" class="update-form-input input">
                    </div>
                    <div id="id">
                        <div class="label">아이디</div>
                        <div class="label">wingStudy_02</div>
                    </div>
                    <div id="password">
                        <div class="label">비밀번호</div>
                        <input type="password" name="password" class="update-form-input input-long">
                    </div>
                    <div id="password-chk">
                        <div class="label">비밀번호 확인</div>
                        <input type="text" name="passwordChk" class="update-form-input input">
                    </div>
                    <div id="update-button">
                        <input type="button" value="회원정보 수정" class="update-button bold-font">
                    </div>
                </div>
            </form>
        </div>
    </article>
    
</section>



</body>
</html>