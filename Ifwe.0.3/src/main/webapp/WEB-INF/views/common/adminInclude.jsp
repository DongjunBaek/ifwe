<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
$(function(){
	 $(".white_back1").click(function(){
		 location.href="${pageContext.request.contextPath }/admin/statistics.do";
	});
	 
	 $(".white_back2").click(function(){
		 location.href="${pageContext.request.contextPath }/admin/member.do";
	});
	 
	 $(".white_back3").click(function(){
		 location.href="${pageContext.request.contextPath }/admin/notice.do";
	});
	 
	 $(".white_back4").click(function(){
		 location.href="${pageContext.request.contextPath }/admin/event.do";
	});
	 
	 $(".back1").click(function(){
		 console.log("!11");
		 location.href = "${pageContext.request.contextPath}/index/mainpage.do";
	 });
});
</script>
<style>
#logo{
	z-index:9;
}
</style>
    <aside>
        <div class="bar_wrap">
            <div class="side_bar">
                <a href=""><img src="${pageContext.request.contextPath }/resources/images/main/white-logo.png" class="logo" id="logo"></a>
                <h1 class="title_1">statistics</h1>
                <h1 class="title_2">member</h1>
                <h1 class="title_3">notice</h1>
                <h1 class="title_4">event</h1>
            </div>
            <div class="hover_wrap">
            	<div class="back1" style="height:55px;"></div>
                <div class="white_back1"></div>
                <div class="white_back2"></div>
                <div class="white_back3"></div>
                <div class="white_back4"></div>
            </div>
        </div>
    </aside>