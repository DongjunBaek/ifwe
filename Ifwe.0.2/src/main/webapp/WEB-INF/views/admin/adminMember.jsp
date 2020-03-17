<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminMember</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adminInclude.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adminMember.css">
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/226b55f414.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/adminInclude.jsp"></jsp:include>
	
	 <section>
        <div class="title_wrap">
            <h1>member</h1>
            <div class="search_member">
                <i class="fas fa-search"></i>
                <input type="text" id="srh_member" class="srh_member" placeholder="회원명을 입력하세요">
            </div>
            <div class="btn_wrap">
                <input type="button" id="drop_member" class="btn_member" value="탈퇴회원">
                <input type="button" id="report_member" class="btn_member" value="휴면회원">
            </div>
            
            <div class="member_list">
                <table class="member_list_title">
                    <thead>
                        <tr>
                            <th>아이디</th>
                            <th>회원명</th>
                            <th>생년월일</th>
                            <th>이메일</th>
                            <th>전화번호</th>
                            <th>거주지</th>
                            <th>신고여부</th>
                            <th>가입일</th>
                            <th>탈퇴 | 휴면</th>
                        </tr>
                    </thead>
                    <tr>
                        <td>abc123</td>
                        <td>장여주</td>
                        <td>1999-09-22</td>
                        <td>abc123@naver.com</td>
                        <td>010-1232-1232</td>
                        <td>경기도 남양주시</td>
                        <td>0</td>
                        <td>2020-3-11</td>
                        <td><input type="button" id="drop" class="drop" value="탈퇴">
                            <input type="button" id="quit" class="quit" value="휴면"></td>
                    </tr>
                    <tr>
                        <td>abc123</td>
                        <td>장여주</td>
                        <td>1999-09-22</td>
                        <td>abc123@naver.com</td>
                        <td>010-1232-1232</td>
                        <td>경기도 남양주시</td>
                        <td>0</td>
                        <td>2020-3-11</td>
                        <td><input type="button" id="drop" class="drop" value="탈퇴">
                            <input type="button" id="quit" class="quit" value="휴면"></td>
                    </tr>
                    <tr>
                        <td>abc123</td>
                        <td>장여주</td>
                        <td>1999-09-22</td>
                        <td>abc123@naver.com</td>
                        <td>010-1232-1232</td>
                        <td>경기도 남양주시</td>
                        <td>0</td>
                        <td>2020-3-11</td>
                        <td><input type="button" id="drop" class="drop" value="탈퇴">
                            <input type="button" id="quit" class="quit" value="휴면"></td>
                    </tr>
                    <tr>
                        <td>abc123</td>
                        <td>장여주</td>
                        <td>1999-09-22</td>
                        <td>abc123@naver.com</td>
                        <td>010-1232-1232</td>
                        <td>경기도 남양주시</td>
                        <td>0</td>
                        <td>2020-3-11</td>
                        <td><input type="button" id="drop" class="drop" value="탈퇴">
                            <input type="button" id="quit" class="quit" value="휴면"></td>
                    </tr>
                    <tr>
                        <td>abc123</td>
                        <td>장여주</td>
                        <td>1999-09-22</td>
                        <td>abc123@naver.com</td>
                        <td>010-1232-1232</td>
                        <td>경기도 남양주시</td>
                        <td>0</td>
                        <td>2020-3-11</td>
                        <td><input type="button" id="drop" class="drop" value="탈퇴">
                            <input type="button" id="quit" class="quit" value="휴면"></td>
                    </tr>
                    <tr>
                        <td>abc123</td>
                        <td>장여주</td>
                        <td>1999-09-22</td>
                        <td>abc123@naver.com</td>
                        <td>010-1232-1232</td>
                        <td>경기도 남양주시</td>
                        <td>0</td>
                        <td>2020-3-11</td>
                        <td><input type="button" id="drop" class="drop" value="탈퇴">
                            <input type="button" id="quit" class="quit" value="휴면"></td>
                    </tr>
                    <tr>
                        <td>abc123</td>
                        <td>장여주</td>
                        <td>1999-09-22</td>
                        <td>abc123@naver.com</td>
                        <td>010-1232-1232</td>
                        <td>경기도 남양주시</td>
                        <td>0</td>
                        <td>2020-3-11</td>
                        <td><input type="button" id="drop" class="drop" value="탈퇴">
                            <input type="button" id="quit" class="quit" value="휴면"></td>
                    </tr>
                    <tr>
                        <td>abc123</td>
                        <td>장여주</td>
                        <td>1999-09-22</td>
                        <td>abc123@naver.com</td>
                        <td>010-1232-1232</td>
                        <td>경기도 남양주시</td>
                        <td>0</td>
                        <td>2020-3-11</td>
                        <td><input type="button" id="drop" class="drop" value="탈퇴">
                            <input type="button" id="quit" class="quit" value="휴면"></td>
                    </tr>
                    <tr>
                        <td>abc123</td>
                        <td>장여주</td>
                        <td>1999-09-22</td>
                        <td>abc123@naver.com</td>
                        <td>010-1232-1232</td>
                        <td>경기도 남양주시</td>
                        <td>0</td>
                        <td>2020-3-11</td>
                        <td><input type="button" id="drop" class="drop" value="탈퇴">
                            <input type="button" id="quit" class="quit" value="휴면"></td>
                    </tr>
                    <tr>
                        <td>abc123</td>
                        <td>장여주</td>
                        <td>1999-09-22</td>
                        <td>abc123@naver.com</td>
                        <td>010-1232-1232</td>
                        <td>경기도 남양주시</td>
                        <td>0</td>
                        <td>2020-3-11</td>
                        <td><input type="button" id="drop" class="drop" value="탈퇴">
                            <input type="button" id="quit" class="quit" value="휴면"></td>
                    </tr>
                    <tr>
                        <td>abc123</td>
                        <td>장여주</td>
                        <td>1999-09-22</td>
                        <td>abc123@naver.com</td>
                        <td>010-1232-1232</td>
                        <td>경기도 남양주시</td>
                        <td>0</td>
                        <td>2020-3-11</td>
                        <td><input type="button" id="drop" class="drop" value="탈퇴">
                            <input type="button" id="quit" class="quit" value="휴면"></td>
                    </tr>
                    <tr>
                        <td>abc123</td>
                        <td>장여주</td>
                        <td>1999-09-22</td>
                        <td>abc123@naver.com</td>
                        <td>010-1232-1232</td>
                        <td>경기도 남양주시</td>
                        <td>0</td>
                        <td>2020-3-11</td>
                        <td><input type="button" id="drop" class="drop" value="탈퇴">
                            <input type="button" id="quit" class="quit" value="휴면"></td>
                    </tr>
                    <tr>
                        <td>abc123</td>
                        <td>장여주</td>
                        <td>1999-09-22</td>
                        <td>abc123@naver.com</td>
                        <td>010-1232-1232</td>
                        <td>경기도 남양주시</td>
                        <td>0</td>
                        <td>2020-3-11</td>
                        <td><input type="button" id="drop" class="drop" value="탈퇴">
                            <input type="button" id="quit" class="quit" value="휴면"></td>
                    </tr>
                
                </table>
                
            </div>
        </div>
            
    </section>

</body>
</html>