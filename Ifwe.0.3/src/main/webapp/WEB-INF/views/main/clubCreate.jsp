<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/mainInclude.jsp">
	<jsp:param value="소모임 생성" name="pageTitle"/>
</jsp:include>

<script>
$(function(){
    $("#search1").selectric();
    $("#search2").selectric();
    
    $("[name=concert]").click(function(){
    	$(this).css('background','#2756a6');
    	$(this).css('border','#2756a6');
    	$(this).next().css('background','');
    	$(this).next().next().css('background','');    	
    });
    $("[name=study]").click(function(){
    	$(this).css('background','#2756a6');
    	$(this).css('border','#2756a6');
    	$(this).next().css('background','');
    	$(this).prev().css('background','');
    });
    $("[name=music]").click(function(){
    	$(this).css('background','#2756a6');
    	$(this).css('border','#2756a6');
    	$(this).prev().css('background','');
    	$(this).prev().prev().css('background','');
    });
    
});
</script>
<style>,nm,n k,n,m,n k,,nm,,nk n,nk 
" bvb cgm,n lm
	.select-boxs{
		width:200px;
		float:left;
	}
    .thin-font{
        font-weight: 100;
    }
    #container{ 
        margin: 6%;
        height: 1160px;
    }
    .number-createclub{
        font-size: 35px;
        display: inline;
        margin-right: 4%;
    }
    .title{
        font-size: 25px;
        display: inline;
        font-weight: 100;
    }
    .inputs{
        margin-left: 6%;
        margin-top: 2%;
    }
    .inputs .buttons{
        border: 1px solid #ffc862;
        background-color: #ffc862;
        color: white;
        font-size: 20px;
        border-radius: 20px;
        outline: 0;
        width: 195px;
        height: 45px;
        margin: 0 2% 0 0 ;
    }
    .info-container{
        margin-bottom:5%
    }
    .span-post{
        color:rgb(235, 42, 14); 
        margin-left: 5%;
        font-size: 25px;
    }
    .span-people{
        color:rgb(56, 209, 9);; 
        margin-left: 5%;
        font-size: 25px
    }
    .input-text{
        width: 970px;
        height: 60px;
        font-size: 20px;
        border-radius: 20px;
        outline: 0;
        border: 0;
        background-color: #ebebeb;;
    }
    .input-file{
        width: 700px;
        height: 60px;
        font-size: 20px;
        border-radius: 20px;
        outline: 0;
        border: 0;
        background-color: #ebebeb;;
    }

    .upload-hidden{
        width: 0;
        height: 0;
        padding: 0;
        overflow: hidden;
        border: 0;
    }
    .file-label{
        margin-left: 3%;
        padding:1.5%;
        font-size: 25px;
        vertical-align: middle;
        background-color: #ffc862;;
        cursor: pointer;
        color: white;
        border-radius: 5px;
    }
    .c-btn{
        width: 400px;
        height: 65px;
        background-color: rgb(50, 87, 161);
        color: white;
        font-size: 25px;
        border-radius: 20px;
        border: 1px solid rgb(50, 87, 161);
        outline: 0;
        margin-bottom:2%;
    }


 
</style>
	<section>
		<div id="container" >
                <form action="">
                    <div id="first" class="info-container">
                        <div class="number-createclub font-kor">01</div>
                        <div class="font-kor title thin-font">어떤 소모임을 만드실건가요?</div>
                        <div class="inputs">




                        </div>
                    </div>
                    <div id="second" class="info-container">
                        <div class="number-createclub font-kor">02</div>
                        <div class="font-kor title thin-font">소모임 키워드를 4개이하로 입력해주세요</div>
                        <span class="font-kor span-post thin-font">단어 앞에 #을 붙여서 입력하세요</span>
                        <div class="inputs">
                            <input type="text" name="keywords" class="font-kor input-text thin-font" placeholder="       예)   #영어 #영어회화 #스터디모임 #서울/경기">
                        </div>
                    </div>
                    <div id="third" class="info-container">
                        <div class="number-createclub font-kor">03</div>
                        <div class="font-kor title thin-font">소모임명을 정해주세요</div>
                        <div class="inputs">
                            <input type="text" name="somoim-name" class="font-kor input-text thin-font">
                        </div>
                    </div>
                    <div id="fourth" class="info-container">
                        <div class="number-createclub font-kor">04</div>
                        <div class="font-kor title thin-font">소모임 소개글을 입력하세요</div>
                        <div class="inputs">
                            <input type="text" name="somoim-info" class="font-kor input-text thin-font" >
                        </div>
                    </div>
                    <div id="fifth" class="info-container">
                        <div class="number-createclub font-kor">05</div>
                        <div class="font-kor title thin-font">소모임 주 활동지역을 설정해주세요</div>
                          <div class="inputs">
                            <div class="select-boxs">
	                        <select name="search" id="search1">
	                            <option value="">전체</option>
	                            <option value="">지역별</option>
	                            <option value="">모임명</option>
	                        </select>
                    	</div>
                            <span class="font-kor thin-font span-people"></span>
                        </div>
                    </div>
                    <div id="sixth" class="info-container">
                        <div class="number-createclub font-kor">06</div>
                        <div class="font-kor title thin-font">소모임 인원수를 정해주세요</div>
                        <div class="inputs">
                            <div class="select-boxs">
	                        <select name="search" id="search2">
	                            <option value="">전체</option>
	                            <option value="">지역별</option>
	                            <option value="">모임명</option>
	                        </select>
                    	</div>
                            <span class="font-kor thin-font span-people">최대 25명</span>
                        </div>
                    </div>
                    <div id="seventh" class="info-container">
                        <div class="number-createclub font-kor">07</div>
                        <div class="font-kor title thin-font">소모임 배너에 들어갈 대표이미지를 지정해주세요</div>
                        <div class="inputs">
                            <input name="fileName" id="" class="font-kor input-file thin-font">
                            <label for="input-file" class="file-label font-kor">파일첨부</label>
                            <input type="file" id="input-file" class="upload-hidden">
                        </div>
                    </div>
                    <div id="create-btn" class="inputs">
                        <input type="button" value="소모임 생성" class="font-kor c-btn">
                    </div>
                </form>
            </div>
	
	
	</section>

</body>
</html>