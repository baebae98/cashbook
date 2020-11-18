<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="../../../dist/2.9.4/Chart.min.js"></script>
	
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/inc/chartMenu.jsp"></jsp:include>
	<div class="container">	
	<h1>chart10</h1>
	<p>연도별 가장 적게 쓴 월 지출</p>
	</div>
	<div class="container"><canvas id="chart"></canvas></div>		
</body>
<script>
$(document).ready(function(pointStyle){
    let chartData = {
       type: 'line', 
         data: {
            labels:['2018','2019','2020'],
            datasets:[{
               label:['년도별 가장 많이 쓴 월 지출'],
               backgroundColor: ['rgb(128, 250, 155, 1)','rgb(192, 128, 255, 1)','rgb(255, 128, 192, 1)'],
               borderColor: ['rgb(128, 250, 155, 1)','rgb(192, 128, 255, 1)','rgb(255, 128, 192, 1)'],
                  data:[],
                  fill: true,
                  showLine: false,
                  pointRadius: 15,
				  pointHoverRadius: 10, 
			 	  pointStyle:'star',
                  borderWidth: 1
            }]
         },  
    };
    
    $.ajax({
       url:'/admin/minOutMonthByYear',
       type:'get',
       success:function(data){
          console.log(data);
      
          
          $(data).each(function(key, value) {
             chartData.data.datasets[0].data.push(value.지출);
          });
          
          var ctx = document.getElementById('chart').getContext('2d');
          var chart = new Chart(ctx, chartData);
       }, 
    });
 });	
</script>
</body>
</html>