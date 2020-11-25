<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/inc/chartMenu.jsp"></jsp:include>
	<div class="container">	
	<h1>chart9</h1>
	<p>연도별 가장 많이 쓴 월 지출</p>
	</div>
	   <div class="container"><canvas id="chart"></canvas> </div>
</body>
<script>
$(document).ready(function(){
    let chartData = {
       type: 'radar', 
         data: {
            labels:['2018','2019','2020'],
            datasets:[{
               label:['년도별 가장 많이 쓴 월 지출'],
               backgroundColor: ['rgb(128, 192, 255, 0.5)','rgb(192, 128, 255, 0.5)','rgb(255, 128, 192, 0.5)'],
               borderColor: 'rgba(255, 255, 255, 0.5)',
                  data:[],
                  borderWidth: 1
            }]
         }
    };
    
    $.ajax({
       url:'${pageContext.request.contextPath}/admin/maxOutMonthByYear',
       type:'get',
       success:function(data){
          console.log(data);
      
          
          $(data).each(function(key, value) {
             chartData.data.datasets[0].data.push(value.지출);
          });
          
          var ctx = document.getElementById('chart').getContext('2d');
          var chart = new Chart(ctx, chartData);
       }
    });
 });

</script>
</html>