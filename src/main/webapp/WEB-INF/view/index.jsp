<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<!-- w3schools.com bootstrap -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script>
	//금액 숫자에 1000단위 콤마를 찍는 함수
	function addComma(num) {
				let regexp = /\B(?=(\d{3})+(?!\d))/g;
				return num.toString().replace(regexp, ',');
			}
  </script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<!-- 상단 바 밑에 있는 점보 -->
	<div class="jumbotron jumbotron-fluid bg-warning">
  		<div class="container">
  			<h1>Index</h1>
  			<p>메인페이지 입니다.</p>
		</div>
	</div>
	<div class="container">
	<!-- 공지 -->
	<div>공지사항<a style="float:right;" class="text-dark btn btn-link" href="${pageContext.request.contextPath}/admin/noticeList/1/5">more</a></div>
	<div>
		<table class="table table-hover">
		<thead>
			<tr>
				<th>notice_id</th>
				<th>notice_title</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="var" items="${noticeList}">
				<tr>
					<td>${var.noticeId}</td>
					<td>${var.noticeTitle}</td>
				</tr>
			</c:forEach>
		</tbody>	
		</table>
	</div>
	<!-- 수입/지출 -->
	<div>수입/지출 통계<a style="float:right;" class="text-dark btn btn-link" href="${pageContext.request.contextPath}/admin/cashbookByMonth/-1/-1">more</a></div>
	<div>
			<table class="table table-hover">
		<thead>
			<tr><th>날짜</th>
				<th>수입</th>
				<th>지출</th>
				<th>합계</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="io" items="${inOutList}">
				<tr>
				
					<!-- 날짜 , 수입 , 지출 , 합계 --><!-- 천단위 콤마 추가 addcomma.. -->
					<td>${io["날짜"]}</td>  <!-- io.get("날씨") -->
					<td><script>document.write(addComma(${io["수입"]}));</script></td>
					<td><script>document.write(addComma(${io["지출"]}));</script></td>
					<td><script>document.write(addComma(${io["합계"]}));</script></td>
				</tr>
			</c:forEach>
		</tbody>	
		</table>
	</div>
	</div>
</body>
</html>