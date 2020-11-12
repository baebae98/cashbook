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
	<h1>chart4</h1>
	</div>
	
	
</body>
<script type="text/javascript">
	$.ajax({
		url:'',
		type:'',
		data:{},
		success:function(data){
			/*
			* data(json문자열) -> 데이ㅏ셋(char..)..
			*/
			}
		});
</script>
</html>