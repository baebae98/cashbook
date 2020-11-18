<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chart1</title>

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
	<h1>chart1</h1>
	<p>연도별 총 수입</p>
	</div>
</body>
<script>
   $(document).ready(function(){
      let chartData = {
         type: 'line', 
           data: {
              labels:[2018,2019,2020],
              datasets:[{
                 label:'연도별 평균 수입', 
                 fill : false,
                 backgroundColor: ['rgb(215, 225, 100)','rgb(255, 255, 128)','rgb(192, 255, 128)'],
                  borderColor: 'rgba(255, 55, 100)',
                    data:[],
                    borderWidth: 1
              }]
           }
      };
      
      $.ajax({
         url:'/admin/totalInByYear',
         type:'GET',
         success:function(data){
            console.log(data);           
            $(data).each(function(key, value) { 
               chartData.data.datasets[0].data.push(value.수입);
            });
            
            var ctx = document.getElementById('chart').getContext('2d');
            var chart = new Chart(ctx, chartData);
         },
        
      });
   });
</script>
<body>
	<!-- 배경 -->	
   <div class="container">
      <canvas id="chart"></canvas>
   </div>
   <div><canvas id="bar"></canvas></div>	
</body>
</html>