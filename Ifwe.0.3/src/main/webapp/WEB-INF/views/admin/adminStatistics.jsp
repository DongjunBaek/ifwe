<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminStatistics</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adminInclude.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adminStatistics.css">
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/226b55f414.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>

    let cateCode1;
    let cateCode2;
    let cateCode3;
    
    cateCodeList();
    searchKeywordList();
    memberEnrollList();
    
function cateCodeList(){
    
		var clubCatecode = "공연전시";
			$.ajax({
				url : "${pageContext.request.contextPath}/club/clubCateList.do",
				data : {clubCatecode : clubCatecode},
				async:false,
				success : data =>{
					
					cateCode1 = data;
					 
				},
				error : function(x,h,r){
					console.log(x,h,r);
				}
			});
			
				var clubCatecode2 = "스터디";
					$.ajax({
						url : "${pageContext.request.contextPath}/club/clubCateList.do",
						data : {clubCatecode : clubCatecode2},
						async:false,
						success : data =>{
							
						cateCode2 = data; 	
							
						},
						error : function(x,h,r){
							console.log(x,h,r);
						}
					});
			
				var clubCatecode3 = "음악댄스";
					$.ajax({
						url : "${pageContext.request.contextPath}/club/clubCateList.do",
						data : {clubCatecode : clubCatecode3},
						async:false,
						success : data =>{
		
								cateCode3 = data; 	

						},
						error : function(x,h,r){
							console.log(x,h,r);
						}
					});
					
	};
	
	 var rankArr = new Array();
 	 var searchKeywordArr = new Array()
 	 
function searchKeywordList(){
	var searchKeyword = "";
	$.ajax({
		url : "${pageContext.request.contextPath}/club/searchKeywordList.do",
		data : {searchKeyword : searchKeyword}, 
		async: false,
		success : data =>{
			/* console.log(data); 
			 */
				
			$.each(data, function(idx,value){
				/* console.log(idx);
				console.log(value);
				 */

				 rankArr[idx] = value.rank;
				 searchKeywordArr[idx] = value.searchKeyword;
				 
				 
			}); 
			
			
		},
		error : function(x,h,r){
			console.log(x,h,r);
		}
	});
	
	
}
 	
	var numArr = new Array(); 	 
	var DayArr = new Array(); 	 
 	 
 	function memberEnrollList(){
 		var num =  "";
 		$.ajax({
 			url : "${pageContext.request.contextPath}/admin/memberEnrollList.do",
 			data : {num : num}, 
 			async: false,
 			success : data =>{
 			
 				$.each(data, function(idx,value){
 						 console.log(value.num);
 						 console.log(value.Day);

 					  numArr[idx] = value.num;
 					  DayArr[idx] = value.Day;
 					  
 					  	console.log(numArr[idx]);
 					  	console.log(DayArr[idx]);
 					  
 				}); 
 				
 			},
 			error : function(x,h,r){
 				console.log(x,h,r);
 			}
 		});
 		
 		
 	}
 	 
searchKeywordList();

	google.charts.load('current', {'packages':['corechart']});

	google.charts.setOnLoadCallback(drawSarahChart);

 	google.charts.setOnLoadCallback(drawAnthonyChart);


			function drawSarahChart(){
				var data = new google.visualization.DataTable();
				
			    data.addColumn('string', 'clubCategory');
			    data.addColumn('number', 'number');
				
			    data.addRows([
			        ['공연전시', cateCode1.length],
			        ['스터디', cateCode2.length],
			        ['음악댄스', cateCode3.length]
			      ]);
			    
			    // Set options for Anthony's pie chart.
		        var options = {title:'clubCateCode list',
		                       width:600,
		                       height:380};

		        // Instantiate and draw the chart for Anthony's pizza.
		        var chart = new google.visualization.PieChart(document.getElementById('Sarah_chart_div'));
		        chart.draw(data, options);
		        
 }
		function drawAnthonyChart(){
					var data = new google.visualization.DataTable();
					
				    data.addColumn('string', 'searchKeyword');
				    data.addColumn('number', 'rank');
									    	
				    data.addRows([
				       
				        [''+searchKeywordArr[1], rankArr[0]],
				        [''+searchKeywordArr[2], rankArr[1]],
				        [''+searchKeywordArr[3], rankArr[2]],
				        [''+searchKeywordArr[4], rankArr[3]],
				        [''+searchKeywordArr[5], rankArr[4]]
				      ]);
				    
				    // Set options for Anthony's pie chart.
			        var options = {title:'clubCateCode list',
			                       width:600,
			                       height:380};

			        // Instantiate and draw the chart for Anthony's pizza.
			        var chart = new google.visualization.PieChart(document.getElementById('Anthony_chart_div'));
			        chart.draw(data, options);
				}
		
		
		memberEnrollList();
	
		
		google.charts.load('current', {'packages':['bar']});
	 	 
	    google.charts.setOnLoadCallback(drawStuff);
	 	
	    function drawStuff() {
	        var data = new google.visualization.arrayToDataTable([
	          ['EnrollDate', 'number'],
	          [''+DayArr[0], numArr[0]],
	          [''+DayArr[1], numArr[1]],
	          [''+DayArr[2], numArr[2]],
	          [''+DayArr[3], numArr[3]],
	          [''+DayArr[4], numArr[4]],
	          [''+DayArr[5], numArr[5]],
	          [''+DayArr[6], numArr[6]]
	        ]);

	        var options = {
	          title: 'memberEnrollDate List',
	          width: 1250,
	          legend: { position: 'none' },
	          chart: { title: 'memberEnrollDate',
	                   subtitle: 'number' },
	          bars: 'horizontal', // Required for Material Bar Charts.
	          axes: {
	            x: {
	              0: { side: 'top', label: 'Percentage'} // Top x-axis.
	            }
	          },
	          bar: { groupWidth: "90%" }
	        };

	        var chart = new google.charts.Bar(document.getElementById('top_x_div'));
	        chart.draw(data, options);
	        
	        
	      };
		
		
</script>
<style>
.columns{
	position: absolute;
    top: 200px;
    left : 400px;
}
.columns td h1{
	margin-bottom : 20px;
}
.colums 
</style>
</head>
<body>
	<section>
	<jsp:include page="/WEB-INF/views/common/adminInclude.jsp"></jsp:include>
        <div class="title_wrap">
            <h1>statistics</h1>
        </div>
	    <table class="columns">
	      <tr>
	        <td><h1>소모임 카테고리별 생성 차트</h1><div id="Sarah_chart_div" ></div></td>
	        <td><h1>소모임 해쉬태그 검색차트</h1><div id="Anthony_chart_div" ></div></td>
	      </tr>
	      <tr>
	        <td><h1 style="margin-top:30px;">주간 회원가입 수</h1><div id="top_x_div" style="width: 650px; height: 500px; margin-top: 20px; "></div></td>
	      </tr>
	    </table>
    </section>
</body>
</html>