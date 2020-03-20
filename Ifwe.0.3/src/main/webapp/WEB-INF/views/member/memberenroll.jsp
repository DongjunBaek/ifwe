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
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
.enroll-btn{
border:0;}
</style>
<script>
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수
            var sido = data.sido;

            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            document.getElementById("sidohidden").value = sido;
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}

    $(document).ready(function() {
    	
        console.log($('.enroll-article-second'));
        $('.enroll-article-second').css('display','none');
        $('.enroll-article-third').css('display','none');
    });

   $(function(){
    $(".shc-img-box-float").hover(function(){
        $(this).find('.shc-black-fileter').removeClass("shc-filter-blackcolor");
    },function(){
        $(this).find('.shc-black-fileter').addClass("shc-filter-blackcolor");
    });

    $(".shc-img-box-float").click(function(){
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
$(function(){
	
	$("#memberId").blur(function(){
		let memberId = $("#memberId").val();
		
		let msg = "";
		let regex = /^[a-zA-Z]{1}[a-zA-Z0-9_]{5,11}$/;
		
		if(!regex.test(memberId) || memberId ==''){
			msg = "5~20자의 영문소문자,숫자와 특수기호만 사용 가능합니다.";
			$("#memberIdChk").text(msg).css("color","rgb(235, 42, 14)");
		}else{
			$("#memberIdChk").text('');
		}
	});	

	$("#password").blur(function(){
		
		let password = $("#password").val();
		
		let msg = "";
		let regex = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		
		if(regex.test(password)){
			msg = "사용가능한 비밀번호입니다.";
			$("#passwordChk").html(msg).css("color","#4EC407");
		}
		else{
			msg = "8~15자의 영문소문자,숫자,특수기호의 조합으로 사용 가능합니다."
			$("#passwordChk").html(msg).css("color","rgb(235, 42, 14)");
		}
		
	});
	
	$("#passwordCheck").blur(function(){
		
		let password = $("#password").val();
		let passchk = $("#passwordCheck").val();
		
		let	msg = "비밀번호가 일치하지않습니다.";
		if(password.trim() == passchk.trim()){
			$("#passwordChk2").text('');
		}else{
			$("#passwordChk2").text(msg).css("color","rgb(235, 42, 14)");
		}		
		
	});
	
	$("#memberName").blur(function(){
		
		let name = $("#memberName").val();
		let reg = /^[가-힣]{2,4}$/;
		let msg = "2~4자의 한글만 사용 가능합니다";	
		
		if(reg.test(name)){
			$("#nameChk").text('');
		}else{
		$("#nameChk").text(msg).css("color","rgb(235, 42, 14)");
		}
		
	});
	
	$("#year").blur(function(){
		let year = $(this).val();
		let today = new Date();
		let yearNow = today.getFullYear();
		
		
		if(1900 > year || year > yearNow){
			$("#yearChk").text("년도가 올바르지않습니다.").css("color","rgb(235, 42, 14)");
		}else{
			$("#yearChk").text("");
		}
		
	});
	
	$("#month").blur(function(){
		let month = $(this).val();
		if(month<1 || month>12){
			$("#monthChk").text("월이 올바르지않습니다.").css("color","rgb(235, 42, 14)");
		}else{
			$("#monthChk").text("");
		}
		
	});
	$("#day").blur(function(){
		let year = $("#year").val();
		let month = $("#month").val();
		let day = $(this).val();
		
		if(day<1 || day>31){
			$("#dayChk").text("일이 올바르지않습니다.").css("color","rgb(235, 42, 14)");
		}else if((month==4 || month==6 || month==9 || month==11) && day==31){
			$("#dayChk").text("");
		}else if(month==2){
			let isleap = (year%4 == 0 && (year%100 != 0 || year%400 == 0));
			
			if(day>29 || (day==29 && !isleap)){
				$("#dayChk").text("일이 올바르지않습니다.").css("color","rgb(235, 42, 14)");
			}else{
				$("#dayChk").text("");
			}
		}else{
			$("#dayChk").text("");
		}
		
	});
	
	
	$("#memberEmail").blur(function(){
		let email = $(this).val();
		let reg = /^[A-Za-z0-9]+[-A-Za-z0-9_]*[@]{1}[A-Za-z0-9]+[-A-Za-z0-9_]*[.]{1}[A-Za-z]{2,5}$/;
		
		if(reg.test(email)){
			$("#memberEmailChk").text("");
		}else{
			$("#memberEmailChk").text("이메일형식이 올바르지 않습니다.").css("color","rgb(235, 42, 14)");
		}
		
	});
	
	
	
	
	
	
});



function duplicate(){
	let memberId = $("#memberId").val();
	let password = $("#password").val();
	let passwordChk = $("#passwordCheck").val();
	let memberName = $("#memberName").val();
	let birthday1 = $("#year").val();
	let birthday2 = $("#month").val();
	let birthday3 = $("#day").val();
	let email = $("#memberEmail").val();
	
	let checkId = $("#memberIdChk").text();
	let checkpas = $("#passwordChk").text();
	let checkpaschk = $("#passwordChk2").text();
	let checkname = $("#nameChk").text();
	let checkbirth1 = $("#yearChk").text();
	let checkbirth2 = $("#monthChk").text();
	let checkbirth3 = $("#dayChk").text();
	let checkemail = $("#memberEmailChk").text();
	
	
	
	if(memberId.trim()=="" || checkId == "6~12자의 영문소문자,숫자만 사용 가능합니다." || checkId=="이미 사용중인 아이디입니다."){
		$("#memberId").focus();
		return false;
	}
	else if(password.trim()=="" || checkpas=="8~15자의 영문소문자,숫자,특수기호의 조합으로 사용 가능합니다."){
		$("#password").focus();
		return false;
	}
	else if(passwordChk.trim()=="" || checkpaschk=="비밀번호가 일치하지않습니다."){
		$("#passwordCheck").focus();
		return false;
	}
	else if(memberName.trim()=="" || checkname=="올바른 형식이아닙니다."){
		$("#memberName").focus();
		return false;
	}
	else if(birthday1.trim()=="" || checkbirth1=="올바른 형식이아닙니다."){
		$("#year").focus();
		return false;
	}
	else if(birthday2.trim()=="" || checkbirth2=="올바른 형식이아닙니다."){
		$("#month").focus();
		return false;
	}
	else if(birthday3.trim()=="" || checkbirth3=="올바른 형식이아닙니다."){
		$("#day").focus();
		return false;
	}
	else if(email.trim()=="" || checkemail=="올바른 형식이아닙니다."){
		$("#memberEmail").focus();
		return false;
	}
	else{
		return true;
	}
	
	return true;	
}



/* 생년월일 input:number 글자수제한 함수 */
function maxLengtYear(object){
	  if (object.value.length > object.maxLength){
	      object.value = object.value.slice(0, object.maxLength);
	    }  
	}
	function maxLengtMonth(object){
		  if (object.value.length > object.maxLength){
		      object.value = object.value.slice(0, object.maxLength);
		    }  
		}
	function maxLengtDay(object){
		  if (object.value.length > object.maxLength){
		      object.value = object.value.slice(0, object.maxLength);
		    }  
		}

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
					<div class="shc-culture-box shc-img-box-float">
                        <div class="shc-black-fileter shc-filter-blackcolor">
                            <div class="shc-img-container-box">
                                <div class="shc-container-header">
                                    <div class="shc-white-line"></div>
                                    <p class="shc-float-left">공연</p>
                                    <p class="shc-float-left"><i class="fas fa-circle"></i></p>
                                    <p class="shc-float-left">전시</p>
                                </div>
                                <div class="shc-container-bottom">
                                    <p>
				                                        내 취향에 맞는 공연, 전시, 뮤지컬을 <br>
				                                        소모임을 만들어 함께 즐겨보세요
                                    </p>
                                    <div class="shc-circle-box"><i class="fas fa-chevron-right"></i></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="shc-study-box shc-img-box-float">
                        <div class="shc-black-fileter shc-filter-blackcolor">
                                <div class="shc-img-container-box">
                                    <div class="shc-container-header">
                                        <div class="shc-white-line"></div>
                                        <p class="shc-float-left">스터디</p>
                                    </div>
                                    <div class="shc-container-bottom">
                                        <p>
				                                                혼자 공부하는게 어렵고 막막하다면 <br>
				                                                소모임을 통해 시작해보세요!
                                        </p>
                                        <div class="shc-circle-box"><i class="fas fa-chevron-right"></i></div>
                                    </div>
                                </div>
                            </div>
                    </div>
                    <div class="shc-music-box shc-img-box-float">
                       <div class="shc-black-fileter shc-filter-blackcolor">
                               <div class="shc-img-container-box">
                                   <div class="shc-container-header">
                                       <div class="shc-white-line"></div>
                                       <p class="shc-float-left">음악</p>
                                       <p class="shc-float-left"><i class="fas fa-circle"></i></p>
                                       <p class="shc-float-left">댄스</p>
                                   </div>
                                   <div class="shc-container-bottom">
                                       <p>
					                                           내가 좋아하는 음악과 춤을 <br>
					                                           즐거운 사람들과 함께 만들어가요!
                                       </p>
                                       <div class="shc-circle-box"><i class="fas fa-chevron-right"></i></div>
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
                <form action="${pageContext.request.contextPath }/member/enroll.do" method="post"
                	onsubmit="return duplicate();" autocomplete="off">
                    <div class="form-left">
                        <div id="name">
                            <div class="label font-kor">이름</div>
                            <input type="text" name="memberName" id="memberName" class="input"><br />
                            <span class="font-kor" id="nameChk"></span>
                        </div>
                        <div id="birth">
                            <div class="label font-kor">생년월일</div>
                            <input type="number" name="year" id="year" style="width: 132px;height: 44px;"
                            		placeholder="ex)1990" maxlength="4" oninput="maxLengtYear(this)">
                            <span class="birth-label font-kor">년</span>
                            <input type="number" name="month" id="month" style="width: 73px;height: 44px;"
                            	placeholder="ex)6" maxlength="2" oninput="maxLengtMonth(this)">
                            <span class="birth-label font-kor">월</span>
                            <input type="number" name="day" id="day" style="width: 73px;height: 44px;"
                            	placeholder="ex)20" maxlength="2" oninput="maxLengtDay(this)">
                            <span class="birth-label font-kor">일</span><br />
                            <span class="font-kor" id="yearChk"></span>
                            <span class="font-kor" id="monthChk"></span>
                            <span class="font-kor" id="dayChk"></span>
                        </div>
                        <div id="addr">
                            <div class="label font-kor">주소</div>
                            <input type="text" name="memberAddr" id="sample6_address" style="width: 400px;height: 44px;"
                            	   onclick="sample6_execDaumPostcode()" placeholder=" 클릭하세요" readonly>
                           	<input type="hidden" name="locCode" id="sidohidden"/>
                        </div>
                        <div class="label font-kor">성별</div>
                   		<div style="width: 180px;">
							<div class="radio-items">
								<div class="col-6">
									<input id="a1" class="only-sr checked" type="radio" name="memberGender" value="M" checked>
									<label for="a1">남</label>
								</div>
								<div class="col-6">
									<input id="a2" class="only-sr" type="radio" name="memberGender" value="F">
									<label for="a2">여</label>
								</div>
							</div>
						</div>
                    </div>
                    <div class="form-right">
                        <div id="id">
                            <div class="label font-kor">아이디</div>
                            <input type="text" class="input" id="memberId" name="memberId"><br />
                            <span class="font-kor" id="memberIdChk"></span>
                        </div>
                        <div id="pwd">
                            <div class="label font-kor">비밀번호</div>
                            <input type="password" class="input" id="password" 
                            name="memberPwd" autocomplete="off"><br />
                            <span class="font-kor" id="passwordChk"></span>
                        </div>
                        <div id="pwdchk">
                            <div class="label font-kor">비밀번호 확인</div>
                            <input type="password" name="passwordCheck" id="passwordCheck" class="input" autocomplete="off"><br />
                            <span class="font-kor" id="passwordChk2"></span>
                        </div>
                        <div id="email">
                            <div class="label font-kor">이메일</div>
                            <input type="email" name="memberEmail" id="memberEmail" style="width: 400px; height: 44px;"
                            		placeholder=" ex) abcd@naver.com"><br />
                            <span class="font-kor" id="memberEmailChk"></span>
                        </div>
                        <div id="enroll-btn">
                            <input type="submit" value="회원가입" class="enroll-btn bold-kor">
                        </div>
                    </div>
                </form>
            </div>
        </article>

<input type="hidden" id="sample6_postcode" placeholder="우편번호">
<input type="hidden" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
<input type="hidden" id="sample6_address" placeholder="주소"><br>
<input type="hidden" id="sample6_detailAddress" placeholder="상세주소">
<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">








    </section>
    <footer class="font-kor"> kh academy </footer>
</body>
</html>