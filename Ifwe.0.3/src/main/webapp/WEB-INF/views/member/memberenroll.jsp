<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1,2,3</title>
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
    integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/enrollpage.css">
    <style>
        @media ( max-width: 1920px) {
            .background-black{
                width: 540px;
                height: 500px;
                border-radius: 30px;
                background-color: black;
                position: absolute;
                top: 41.5%;
                opacity: 0.5;
            }
        }
        @media ( max-width:  1600px) {
            .background-black{
                width: 540px;
                height: 500px;
                border-radius: 30px;
                background-color: black;
                position: absolute;
                top: 41.5%;
                opacity: 0.5;
            }
        }

    </style>
    <script>
        $(document).ready(function() {
            console.log($('.enroll-article-second'));
            $('.enroll-article-second').css('display','none');
            $('.enroll-article-third').css('display','none');
        });

       $(function(){
        $(".img-container-img").hover(function(){
            $(this).find('.background-black').css('display','none');
            console.log(this);
        },function(){
            $(this).find('.background-black').css('display','');
        });

        $(".img-container-img").click(function(){
        	$('.enroll-article-first').css('display','none');
        	$('.enroll-article-second').css('display','');
        });
        $(".phone-btn-container").click(function(){
            alert('본인인증성공!')
            $(".enroll-article-second>.enroll-hyphen").css('background-color','lightgrey');
            $(".enroll-article-second>.enroll-container-number").css('color','lightgrey');
        	$('.enroll-article-third').css('display','inline-block');
        });
       });

    </script>
</head>
<body>
    <header>
        <span><img src="${pageContext.request.contextPath }/resources/images/index/logo_black.png" alt="" style="width: 80px; height: 35px;"></span>
    </header>
    <section>
        <article class="enroll-article-first">
            <div class="enroll-container">
                <div class="enroll-hyphen"></div>
                <div class="enroll-container-number bold-kor">01</div>
                <div class="enroll-container-posts">
                    <p class="font-kor" style="font-size: 30px;">반가워요!</p>
                    <p class="bold-kor" style="font-size: 45px;">어떤 소모임에</p>
                    <p class="bold-kor" style="font-size: 45px;">가입하고 싶으신가요?</p>
                </div>
                <div class="img-container">
                    <div class="img-concert img-container-img">
                        <div class="img-container-img-container">
                            <div class="img-hyphen"></div>
                            <div class="img-title">공연·전시</div>
                            <div class="img-container-posts-container">
                                <div class="posts-container font-kor">
                                    <div class="posts-container-post">내가 좋아하는 음악과 춤을</div>
                                    <div class="posts-container-post">즐거운 사람들과 함께 즐겨보세요</div>
                                </div>
                                <div class="posts-container-posts-icon">
                                    <p style="padding: 10%; font-size: 40px;">&nbsp;></p>
                                </div>
                            </div>
                        </div>
                        <div class="background-black">
                            <div class="img-container-img-container">
                                <div class="img-hyphen"></div>
                                <div class="img-title">공연·전시</div>
                                <div class="img-container-posts-container">
                                    <div class="posts-container font-kor">
                                        <div class="posts-container-post">내가 좋아하는 음악과 춤을</div>
                                        <div class="posts-container-post">즐거운 사람들과 함께 즐겨보세요</div>
                                    </div>
                                    <div class="posts-container-posts-icon">
                                        <p style="padding: 10%; font-size: 40px;">&nbsp;></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="img-study img-container-img">
                        <div class="img-container-img-container">
                            <div class="img-hyphen"></div>
                            <div class="img-title">스터디</div>
                            <div class="img-container-posts-container">
                                <div class="posts-container font-kor">
                                    <div class="posts-container-post">내가 좋아하는 음악과 춤을</div>
                                    <div class="posts-container-post">즐거운 사람들과 함께 즐겨보세요</div>
                                </div>
                                <div class="posts-container-posts-icon">
                                    <p style="padding: 10%; font-size: 40px;">&nbsp;></p>
                                </div>
                            </div>
                        </div>
                        <div class="background-black">
                            <div class="img-container-img-container">
                                <div class="img-hyphen"></div>
                                <div class="img-title">스터디</div>
                                <div class="img-container-posts-container">
                                    <div class="posts-container font-kor">
                                        <div class="posts-container-post">내가 좋아하는 음악과 춤을</div>
                                        <div class="posts-container-post">즐거운 사람들과 함께 즐겨보세요</div>
                                    </div>
                                    <div class="posts-container-posts-icon">
                                        <p style="padding: 10%; font-size: 40px;">&nbsp;></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="img-music img-container-img">
                        <div class="img-container-img-container">
                            <div class="img-hyphen"></div>
                            <div class="img-title">음악·댄스</div>
                            <div class="img-container-posts-container">
                                <div class="posts-container font-kor">
                                    <div class="posts-container-post">내가 좋아하는 음악과 춤을</div>
                                    <div class="posts-container-post">즐거운 사람들과 함께 즐겨보세요</div>
                                </div>
                                <div class="posts-container-posts-icon">
                                    <p style="padding: 10%; font-size: 40px;">&nbsp;></p>
                                </div>
                            </div>
                        </div>
                        <div class="background-black">
                            <div class="img-container-img-container">
                                <div class="img-hyphen"></div>
                                <div class="img-title">음악·댄스</div>
                                <div class="img-container-posts-container">
                                    <div class="posts-container font-kor">
                                        <div class="posts-container-post">내가 좋아하는 음악과 춤을</div>
                                        <div class="posts-container-post">즐거운 사람들과 함께 즐겨보세요</div>
                                    </div>
                                    <div class="posts-container-posts-icon">
                                        <p style="padding: 10%; font-size: 40px;">&nbsp;></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </article>

        <article class="enroll-article-second">
            <div class="enroll-hyphen"></div>
            <div class="enroll-container-number bold-kor">02</div>
            <div class="phone-posts font-kor">
                <p class="phone-post">안전한 회원가입을 위해</p>
                <p class="phone-post">본인인증을 해주십쇼.</p>
            </div>
            <div class="phone-btn-container">
                <div class="phone-btn">
                    <p class="bold-kor phone-btn-p">휴대폰 인증</p>
                    <p class="font-kor phone-btn-p" style="font-size: 15px;">본인인증 기관을 통해 본인인증 후 회원가입</p>
                </div>
            </div>
        </article>

        <article class="enroll-article-third">
            <div class="enroll-hyphen"></div>
            <div class="enroll-container-number bold-kor">03</div>
            <div class="font-kor info-posts">
                <p class="phone-post">회원님의 정보를 입력헤주세요.</p>
            </div>
            <div class="enroll-form">
                <form action="">
                    <div class="form-left">
                        <div id="name">
                            <div class="label font-kor">이름</div>
                            <input type="text" name="name" class="input">
                        </div>
                        <div id="birth">
                            <div class="label font-kor">생년월일</div>
                            <input type="text" name="year" style="width: 132px;height: 44px;">
                            <span class="birth-label font-kor">년</span>
                            <input type="text" name="month" style="width: 73px;height: 44px;">
                            <span class="birth-label font-kor">월</span>
                            <input type="text" name="day" style="width: 73px;height: 44px;">
                            <span class="birth-label font-kor">일</span>
                        </div>
                        <div id="addr">
                            <div class="label font-kor">주소</div>
                            <input type="text" name="addr" style="width: 400px;height: 44px;">
                        </div>
                        <div id="gender">
                            <div class="label font-kor">성별</div>
                            <input type="button" name="male" value="남" class="gender-button font-kor">
                            <input type="button" name="female" value="여" class="gender-button font-kor">
                        </div>
                    </div>
                    <div class="form-right">
                        <div id="id">
                            <div class="label font-kor">아이디</div>
                            <input type="text" class="input" name="id"><span class="font-kor" style="color: rgb(56, 209, 9);">사용가능한 아이디입니다.</span>
                        </div>
                        <div id="pwd">
                            <div class="label font-kor">비밀번호</div>
                            <input type="password" class="input" name="password" autocomplete="off">
                        </div>
                        <div id="pwdchk">
                            <div class="label font-kor">비밀번호 확인</div>
                            <input type="password" name="passwordCheck" class="input" autocomplete="off">
                            <span class="font-kor" style="color:rgb(235, 42, 14)">비밀번호가 다릅니다.</span>
                        </div>
                        <div id="email">
                            <div class="label font-kor">이메일</div>
                            <input type="email" name="email" style="width: 400px; height: 44px;">
                        </div>
                        <div id="enroll-btn">
                            <input type="button" value="회원가입" class="enroll-btn bold-kor">
                        </div>
                    </div>
                </form>
            </div>
        </article>

    </section>
    <footer class="font-kor"> kh academy </footer>
</body>
</html>