<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chart8</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	<link rel="stylesheet" type="text/css" href="../../../dist/2.9.4/Chart.min.css">
	<link rel="stylesheet" type="text/css" href="./content-security-policy.css">
	<script src="../../../dist/2.9.4/Chart.min.js"></script>
	<script src="../utils.js"></script>
	<script src="content-security-policy.js"></script>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/inc/chartMenu.jsp"></jsp:include>
<div class="container">	
	<h1>chart8</h1>
	<p>연도별 가장 적게 번 월 수입</p>
	</div>
	<div class="container"><canvas id="line"></canvas></div>		
</body>
<script>
$(document).ready(function(){
    let chartData = {
       type: 'line', 
         data: {
            labels:[2018,2019,2020],
            datasets:[{
               label:'연도별 가장 적게 번 수입',
               backgroundColor: ['rgb(128, 200, 255)','rgb(192, 128, 255)','rgb(255, 128, 192)'],
               borderColor: ['rgba(255, 255, 255, 0.5)','rgba(255, 255, 255, 0.5)','rgba(255, 255, 255, 0.5)'],
                  data:[],
                  borderWidth: 1,
				  pointRadius: 10,
				  pointHoverRadius: 15,
                  fill: false,
                  showLine: false // no line shown
            }]
         }
    };
    
    $.ajax({
       url:'/admin/minMonthByYear',
       type:'GET',
       success:function(data){
          console.log(data);
         
          
          $(data).each(function(key, value) {
            // chartData.data.labels.push(value.YEAR);
             chartData.data.datasets[0].data.push(value.수입);
          });
          
          var ctx = document.getElementById('chart-0').getContext('2d');
          var chart = new Chart(ctx, chartData);
       },
    });
 });
</script>
<body>
   <div class="container">
      <canvas id="chart-0"></canvas>
   </div>
</body>
</html>