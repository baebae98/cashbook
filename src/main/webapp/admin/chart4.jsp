<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chart4</title>

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
	<h1>chart4</h1>
	</div>

		<div class="container"> <!-- 호출 -->
			<span>각 년도에 따른 월별 총 수입 :</span>
			<input type="text" id="year">
			<button id="totalMonthlyInByYearChart" type="button">Chart</button>
		</div>
		<div class="container">
			<canvas id="myChart"></canvas>
		</div>
</body>
<script>
$('#totalMonthlyInByYearChart').click(function(data){
	$.ajax({
		url:'/admin/totalMonthlyInByYear/'+$('#year').val(),
		type:'get',
		success: function(data) {	
			var ctx = document.getElementById('myChart').getContext('2d');
			var chart = new Chart(ctx, {
				 // The type of chart we want to create
			    type: 'bar', //chart 종류: 바,곡선...등

			    // The data for our dataset
			    data: {
			        labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July','August','September','October','November','December'],
			        datasets: [{
			            label: '각 년도 월별 수입',
			            backgroundColor: [
			            	 'rgb(255, 128, 128)',
			            	    'rgb(255, 192, 128)',
			            	    'rgb(255, 255, 128)',
			            	    'rgb(192, 255, 128)',
			            	    'rgb(128, 255, 128)',
			            	    'rgb(128, 255, 192)',
			            	    'rgb(128, 255, 255)',
			            	    'rgb(128, 192, 255)',
			            	    'rgb(128, 128, 255)',
			            	    'rgb(192, 128, 255)',
			            	    'rgb(255, 128, 255)',
			            	    'rgb(255, 128, 192)'
			                
			            ],
			            borderColor: [
			            	'rgba(255, 99, 132, 1)',
			                'rgba(54, 162, 235, 1)',
			                'rgba(255, 206, 86, 1)',
			                'rgba(75, 192, 192, 1)',
			                'rgba(153, 102, 255, 1)',
			                'rgba(255, 159, 64, 1)',
			                'rgba(255, 99, 132, 1)',
			                'rgba(54, 162, 235, 1)',
			                'rgba(255, 206, 86, 1)',
			                'rgba(75, 192, 192, 1)',
			                'rgba(153, 102, 255, 1)',
			                'rgba(255, 159, 64, 1)'
			            ],
			            //data 속성의 배열값은 ajax호출 후 결과값으로 채워야 한다.
			            data: [data.January, data.February, data.March,  data.April,  data.May,  data.June,  data.July, data.August, data.September, data.October, data.November, data.December],
			        	borderWidth: 1
			        }]
			    },

			    // Configuration options go here
			    options: {}
			});
		}
	});
});
</script>
</html>