<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chart7</title>

<link href="/resources/cash.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/inc/chartMenu.jsp"></jsp:include>
	<div class="container">	
	<h1>chart7</h1>
	<p>연도별 가장 많이 번 월 수입</p>
	</div>
	<div class="container"><canvas id="radar"></canvas></div>			
</body>
<script>
$(document).ready(function(){
    let chartData = {
       type: 'polarArea', 
         data: {
            labels:[2018,2019,2020],
            datasets:[{
               label:'연도별 가장 많이 번 수입',
               backgroundColor: ['rgb(128, 192, 255)','rgb(192, 128, 255)','rgb(255, 128, 192)'],
               borderColor: ['rgba(255, 255, 255, 0.5)','rgba(255, 255, 255, 0.5)','rgba(255, 255, 255, 0.5)'],
                  data:[],
                  borderWidth: 1
            }]
         }
    };
    
    $.ajax({
       url:'/admin/maxMonthByYear',
       type:'GET',
       success:function(data){
          console.log(data);
         
          
          $(data).each(function(key, value) {
            // chartData.data.labels.push(value.YEAR);
             chartData.data.datasets[0].data.push(value.수입);
          });
          
          var ctx = document.getElementById('chart').getContext('2d');
          var chart = new Chart(ctx, chartData);
       },
    });
 });
</script>
<body>
   <div class="container">
      <canvas id="chart"></canvas>
   </div>
</body>
</html>