<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chart6</title>

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
	<h1>chart6</h1>
	</div>
	<div class="container"> <!-- 호출 -->
		<span>각 년도에 따른 월별 총 수익(수입-지출) :</span>
		<input type="text" id="year">
		<button id="totalMonthlyOutByYearChart" type="button">Chart</button>
	</div>
	<div class="container">
		<canvas id="myChart"></canvas>
	</div>
	
	
	
</body>
<script>
$('#totalMonthlyOutByYearChart').click(function(data){
$.ajax({
    url: '/admin/totalAverageInAndOutByYear/'+$('#year').val(),
    type: 'get',
    success: function(data) {
       console.log(data[0].수입); 
       var context = document.getElementById('myChart').getContext('2d');
       var chart = new Chart(context, {
          type: 'bar',
           data: {
               labels: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
               datasets: [{
                   label: '수입',
                   backgroundColor: 'rgba(128, 255, 128, 0.5)',
                   borderColor: 'rgba(0, 0, 0, 0)',
                   data: [data[0].수입, data[1].수입, data[2].수입, data[3].수입, data[4].수입, data[5].수입, data[6].수입, data[7].수입, data[8].수입, data[9].수입, data[10].수입, data[11].수입]
               },{
                   label: '지출',
                   backgroundColor: 'rgba(255, 128, 128, 0.5)',
                   borderColor: 'rgba(0, 0, 0, 0)',
                   data: [data[0].지출, data[1].지출, data[2].지출, data[3].지출, data[4].지출, data[5].지출, data[6].지출, data[7].지출, data[8].지출, data[9].지출, data[10].지출, data[11].지출]
               },{
                   label: '수익',
                   backgroundColor: 'rgba(128, 128, 255, 0.5)',
                   borderColor: 'rgba(0, 0, 0, 0)',
                   data: [data[0].수익, data[1].수익, data[2].수익, data[3].수익, data[4].수익, data[5].수익, data[6].수익, data[7].수익, data[8].수익, data[9].수익, data[10].수익, data[11].수익]
               }]
           },
         //  options: {}
       });
    }
 });
});
</script>
</html>