<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/mainInclude.jsp">
	<jsp:param value="멤버쉽 구매" name="pageTitle"/>
</jsp:include>
<script>
$(function(){
	let myPrice;
    $(".price").on('click',function(e){
	
		$(".price").css("background-color","white")
        .css("color","#2756a6")
	
	
        $(e.target).css("background-color","#2756a6")
                .css("color","white");
        
		var myPrices = $(e.target).attr("id").substring(0,1);
		myPrice = myPrices=='p'?9900:myPrices=='g'?5900:3900;
		/* console.log(myPrice); */
    });
    
    $(".addbtn").on('click', function(){
    	$(".membership-third").css("display","block");
    	
    	let checkval = $(".choice input[type=checkbox]:checked").val();
    	/* console.log(checkval); */ 
    	let checkvalCode = $(".choice input[type=checkbox]:checked").parent().children().eq(2).val(); 
    	/* console.log(checkvalCode); */
    	let premiumbtncolor = $("#premiumbtn").css("background-color")
	    let goldbtncolor = 	$("#goldbtn").css("background-color");
	    let silverbtncolor = $("#siverbtn").css("background-color");
	    
	    
		/* 차액 검사 */
 		$.ajax({
			url :"${pageContext.request.contextPath}/selectOneClub",
			data : {
				clubCode : checkvalCode				
			},
			type : "POST",
			success : function(data){
				console.log(data.premiumCode);
			},
			error : function(x,s,e){
				console.log(x,s,e)
			}
		});
 		/* 차액 검사 완료 */
	    
    	if(goldbtncolor == 'rgb(39, 86, 166)'){
    		
    		
    		let div = $(".payment-lists");
    		
    		div.append('<div class="payment-list font-kor">'+
    	            	'<div class="name-checkbox bold">골드 GOLD'+
                   		'<input type="hidden" name="gold-membership" id="gold-membership" value="gold">'+
               			'</div>'+
		               	'<div class="list-club bold"><p >'+checkval+'</p></div>'+
		               	'<input type="hidden" class="myclubCode" name="myclubCode" value="'+checkvalCode+'">'+
		               	'<div class="list-duration "><p>무제한</p></div>'+
		               	'<div class="list-price bold"><p >5900원</p></div>'+
		               	'<div class=""><i class="far fa-trash-alt theDeleteMemberShip"></i></div>'+		               	
		         		'</div>');
		    		
    	}
    	
		if(premiumbtncolor == 'rgb(39, 86, 166)'){
		    		
		    		
		    		let div = $(".payment-lists");
		    		
		    		div.append('<div class="payment-list font-kor">'+
		    	            	'<div class="name-checkbox bold">프리미엄 PREMIUM'+
		                   		'<input type="hidden" name="pre-membership" id="pre-membership" value="premium">'+
		               			'</div>'+
				               	'<div class="list-club bold"><p >'+checkval+'</p></div>'+
				               	'<input type="hidden" class="myclubCode" name="myclubCode" value="'+checkvalCode+'">'+
				               	'<div class="list-duration "><p>무제한</p></div>'+
				               	'<div class="list-price bold"><p >9900원</p></div>'+
				               	'<div class=""><i class="far fa-trash-alt theDeleteMemberShip"></i></div>'+
				         		'</div>');
				    		
		    	}
		
		if(silverbtncolor == 'rgb(39, 86, 166)'){
			
			
			let div = $(".payment-lists");
			
			div.append('<div class="payment-list font-kor">'+
		            	'<div class="name-checkbox bold">실버 SILVER'+
		           		'<input type="hidden" name="silver-membership" id="silver-membership" value="silver">'+
		       			'</div>'+
		               	'<div class="list-club bold"><p >'+checkval+'</p></div>'+
		               	'<input type="hidden" class="myclubCode" name="myclubCode" value="'+checkvalCode+'">'+
		               	'<div class="list-duration "><p>무제한</p></div>'+
		               	'<div class="list-price bold"><p >3900원</p></div>'+
		               	'<div class=""><i class="far fa-trash-alt theDeleteMemberShip"></i></div>'+
		               	'</div>');
		    		
		}
		
		$(".name-checkbox input[type=checkbox]").click(function(){
			var silver = $("#silver-membership").prop("checked",true);
			var pre = $("#pre-membership").prop("checked",true);
			var gold = $("#gold-membership").prop("checked",true);
		
			console.log(pre);
			
			if(this==pre){
				$(".result-price").text(9900);
			}
			if(this==gold){
				$(".result-price").text(5900);
			}
			if(this==silver){
				$(".result-price").text(3900);
			}
			
		});
		
		/* 0331 멤버십 구매 수정 백동준 */
		
	    $(".theDeleteMemberShip").click(function(){
	    	/* console.log(this); */
	    	console.log($(this).parent().parent().parent());
	    	$(this).parent().parent().remove();
	    	
	    });
    });
    
    $(".choice input[type=checkbox]").click(function(){
    	
    	$(".choice input[type=checkbox]").prop("checked",false);
    	$(this).prop("checked",true);
    	
    	
    });
    

  	     
    	
  })
    
    
</script>
 <section>
   <article class="membership-first">
       <div class="title-container font-kor">
           <p class="p-title bold">멤버십 구매</p>
           <p class="membership-p-content" style="color:#606060;">멤버십 구매해서 ifwe를 더욱 풍부하게 즐겨보세요!</p>
       </div>
   </article>
   <article class="membership-second">
       <div class="grade" id="premium">
           <div class="grade-icon"><i class="fas fa-crown" style="color:#c332f1;"></i></div>
           <div class="grade-content">
               <p class="p-grade-ko font-kor">프리미엄</p>
               <p class="p-grade-en bold">PREMIUM</p>
               <ul>
                       <p> <li class="font-kor" ><i class="fas fa-circle" style="color:#2756a6;font-size:0.5em; margin-right:10px;"></i>소모임 인원 추가</li></p>
                       <p> <li class="font-kor"><i class="fas fa-circle" style="color:#2756a6;font-size:0.5em; margin-right:10px;"></i>게시판 개수 추가</li></p>
               </ul>
           </div>
           <div class="grade-price"  >
				<button class="price font-kor" id="premiumbtn" >
                     9,900원 / 무제한
                </button>

           </div>
       </div>
       <div class="choice-container">
               <div class="choice">
                   <div class="choice-title bold" >적용할 소모임 선택</div>
                 	<c:if test="${not empty list }">
                   <c:forEach items="${list }" var="l" varStatus="vs">
                   		<c:if test="${l.premiumCode != 'premium'}">
		                   <div class="choice-checkbox font-kor">
		                      <input type="checkbox" name="membership-club" id="membership-club${vs.index }" value="${l.clubTitle }" ><label for="membership-club${vs.index }" >${l.clubTitle }</label>
		                      <input type="hidden" name ="clubCode" value="${l.clubCode }">
		                   </div>
	                   </c:if>
                   </c:forEach>
                   </c:if>
                   <!-- <div class="choice-checkbox font-kor">
                   		<input type="checkbox" name="membership-club2" id="membership-club2" value="댄스 모임" ><label for="membership-club2" >댄스 모임</label>
                   </div> -->
                  
               </div>
               <div class="add">
                   <button class="addbtn font-kor">담기</button>
               </div>
           </div>
       <div class="grade" id="gold">
           <div class="grade-icon"><i class="fas fa-crown" style="color:#ffc863;" ></i></div>
           <div class="grade-content" >
               <p class="p-grade-ko font-kor">골드</p>
               <p class="p-grade-en bold">GOLD</p>
               <ul >
                       <p><li class="font-kor" ><i class="fas fa-circle" style="color:#2756a6;font-size:0.5em; margin-right:10px;"></i>소모임 인원 추가</li></p>
                       <p> <li class="font-kor"><i class="fas fa-circle" style="color:#2756a6;font-size:0.5em; margin-right:10px;"></i>게시판 개수 추가</li></p>
               </ul>
           </div>
           <div class="grade-price font-kor">
               <button class="price font-kor" id="goldbtn" >
                    5,900원 / 무제한
               </button>
           </div>
       </div>
       <div class="grade" id="silver">
           <div class="grade-icon"><i class="fas fa-crown" style="color:#c7c7c7;"></i></div>
           <div class="grade-content" >
               <p class="p-grade-ko font-kor">실버</p>
               <p class="p-grade-en bold">SILVER</p>
               <ul>
                   <p><li class="font-kor" ><i class="fas fa-circle" style="color:#2756a6;font-size:0.5em; margin-right:10px;"></i>소모임 인원 추가</li></p>
                   <p> <li class="font-kor"><i class="fas fa-circle" style="color:#2756a6;font-size:0.5em; margin-right:10px;"></i>게시판 개수 추가</li></p>
                </ul>
            </div>
            <div class="grade-price font-kor">
                <button class="price font-kor" id="siverbtn" >
                     3,900원 / 무제한
                </button>
            </div>
        </div>
      
    </article>
    <article class="membership-third" style="display:none;">
        <div class="payment-container" >
            <div class="list-container">
                <div class="payment-title font-kor">
                    <div class="membership-name"><p>멤버십 명</p></div>
                    <div class="club-name "><p>소모임 명</p></div>
                    <div class="duration "><p>기간</p></div>
                    <div class="payment-price"><p>가격</p></div>
                </div>
              	<div class="payment-lists">
               
                   
                </div>
                <div class="result-container">
                    <div class="payment-border"><hr></div>
                        <div class="payment-result">
                            <p class="result-name font-kor"  >프리미엄 PREMIUM/ <span id="countMembership"></span></p><p class="result-price bold" id="totalprice" ></p>
                        </div>
                </div>
        
         	</div>  
        </div>
         		<div class="payment">
            <button class="paymentbtn font-kor">결제하기</button>
        		</div>
    </article>
</section>
<script type="text/javascript">
$(".paymentbtn").click(function(){
	
	var clubCode = $(".myclubCode");// 소모임 번호	
	var memberCode= ${memberLoggedIn.memberCode};// 구매한 회원 번호
	
	var memberrshipName=$(".name-checkbox");
	var prices = $(".list-price");
	
	for(var i =0; i < memberrshipName.length; i++){
		console.log($(memberrshipName[i]).children().eq(0).val());		
		console.log($(prices[i]).text().substring(0,4));		
		console.log($(clubCode[i]).val());
		
  		$.ajax({
		url: "${pageContext.request.contextPath}/member/membershipPay.do",
		data: {
			membershipName : $(memberrshipName[i]).children().eq(0).val(),
			clubCode : $(clubCode[i]).val(),
			price : $(prices[i]).text().substring(0,4),
			memberCode : memberCode
		},
		type: "POST",
		success: function(data){
			console.log(data);
		},
		error: function(x,s,e){
			console.log(x,s,e);
		}
		
		});
	}
	
	}); 
</script>






</body>
</html>