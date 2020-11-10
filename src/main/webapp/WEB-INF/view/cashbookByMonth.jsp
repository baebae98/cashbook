<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<style type="text/css">
	.sunday a {
				color: #FF0000;
			}
	.saturday a {
				color: #0000FF;
			}
	.weekday a {
				color: #000000;
			}
			
			th {
				width: ${100/7}%;
			}
			td {
				height: 80px;
				vertical-align: top;
			}
	.cashbookTableMenu {
				width: 100%;
				text-align: center;
			}
			
	.cashbookTableMenu td {
				vertical-align: middle;
			}
			th {
				width: ${100/7}%;
				text-align: center;
				background-color: #F9F9FB;
			}
			td {
				height: 120px;
				vertical-align: top;
			}
			.diaryTable td {
				height: 130px;
				vertical-align: top;
			}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
			<div class="jumbotron jumbotron-fluid bg-warning">
  		<div class="container">
  			<h1>CashbookByMonth</h1>
  			<p>CashbookByMonth페이지 입니다.</p>
		</div>
	</div>
		<div class="container">
	<!--월 수입/지출 합계 -->
	<table class="cashbookTableMenu">
		<tr>
			<td width="20%">
				<div class="card">
					<div class="card-header bg-primary"><font size="3em" color="white">수입 합계</font></div>
				<div class="card-body">
					<font size="5.5em"><script>document.write(addComma(${sumIn}));</script></font>
					</div>
				</div>
			</td>
			
			<td width="15%" style="text-align: right;">
				
				<a class="btn btn-dark" href="/admin/cashbookByMonth/${currentYear}/${currentMonth - 1}">←</a>
				
			</td>
			<td width="30%">
				<h3>${currentYear}년 ${currentMonth}월</h3>
			</td>
			<td width="15%" style="text-align: left;">
				<a class="btn btn-dark" href="/admin/cashbookByMonth/${currentYear}/${currentMonth + 1}">→</a>
			</td>
			<td width="20%">
				<div class="card">
					<div class="card-header bg-danger"><font size="3em" color="white">지출 합계</font></div>
				<div class="card-body">
					<font size="5.5em"><script>document.write(addComma(${sumOut}));</script></font>
						</div>
					</div>
				</td>
			</tr>
	</table>
	<!-- <ul class="pagination">
	 <li class="page-item"><a class="page-link" href="/admin/cashbookByMonth?currentYear=${currentYear}&currentMonth=${currentMonth-1 }">[이전달]</a></li>
			<span>${currentYear }년${currentMonth}월</span>
	 <li class="page-item"><a class="page-link" href="/admin/cashbookByMonth?currentYear=${currentYear}&currentMonth=${currentMonth+1 }">[다음달]</a></li>
		
		<li class="page-item"><a href="/admin/cashbookByMonth/${currentYear}/${currentMonth - 1}">[이전달]</a></li>
							<span>${currentYear }년${currentMonth}월</span>
		<li class="page-item"><a href="/admin/cashbookByMonth/${currentYear}/${currentMonth + 1}">[다음달]</a></li>
	</ul>-->
	<!-- 다이어리
	 -->
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th class="sunday">일</th>		
					<th>월</th>		
					<th>화</th>		
					<th>수</th>		
					<th>목</th>		
					<th>금</th>		
					<th>토</th>		
				</tr>
			</thead>
			<tbody>
				<tr>
					<!-- 이게 for문 대신. 1~31까지 -->
					<c:forEach var="i" begin="1" end="${lastDay+(firstDayOfWeek-1) }" step="1">
						<c:if test="${i-(firstDayOfWeek-1) < 1 }">
							<td>&nbsp;</td>
						</c:if>
						<c:if test="${i-(firstDayOfWeek-1) > 0 }">
							<td>
							<!--<div><!-- 날짜 
									<a href="/admin/cashbookByDay?currentYear=${currentYear}&currentMonth=${currentMonth}&currentDay=${i-(firstDayOfWeek-1)}">
										${i-(firstDayOfWeek-1)}
									</a>
								</div>-->
								<!-- 일요일 -->
								<c:if test="${i % 7 == 1}">
									<div class="sunday">
										<!--<a href="/admin/cashbookByDay?currentYear=${currentYear}&currentMonth=${currentMonth}&currentDay=${i-(firstDayOfWeek-1)}">${i - (firstDayOfWeek - 1)}  -->
										<a href="/admin/cashbookByDay/sunday/${currentYear}/${currentMonth}/${i-(firstDayOfWeek-1)}">${i-(firstDayOfWeek-1)}</a>
									</div>
								</c:if>
								
								<!-- 토요일 -->
								<c:if test="${i % 7 == 0}">
									<div class="saturday">
										<!--<a href="/admin/cashbookByDay?currentYear=${currentYear}&currentMonth=${currentMonth}&currentDay=${i - (firstDayOfWeek - 1)}">${i - (firstDayOfWeek - 1)}</a>  -->
										<a href="/admin/cashbookByDay/saturday/${currentYear}/${currentMonth}/${i - (firstDayOfWeek - 1)}">${i - (firstDayOfWeek - 1)}</a>
									</div>
								</c:if>
								
								<!-- 평일 (월요일 ~ 금요일) -->
								<c:if test="${i % 7 != 1 && i % 7 != 0}">
									<div class="weekday">
										<!-- <a href="/admin/cashbookByDay?currentYear=${currentYear}&currentMonth=${currentMonth}&currentDay=${i - (firstDayOfWeek - 1)}">${i - (firstDayOfWeek - 1)}</a> -->
										<a href="/admin/cashbookByDay/weekday/${currentYear}/${currentMonth}/${i - (firstDayOfWeek - 1)}">${i - (firstDayOfWeek - 1)}</a>
									</div>
								</c:if>
							<!-- 지출/수입 목록이 있는 날씨를 cashList에서 검색 -->
							<c:forEach var="c" items="${cashList}">
								<c:if test="${i-(firstDayOfWeek-1)== c.dday }">
									<c:if test="${c.cashbookKind == '수입' }">
										<div><font color="blue">수입 :</font><script>document.write(addComma(${c.cashbookPrice}));</script></div>
								</c:if>
									<c:if test="${c.cashbookKind == '지출' }">
										<div><font color="red">지출 :</font><script>document.write(addComma(${c.cashbookPrice}));</script></div>
								</c:if>
								</c:if>
							</c:forEach>
							</td>
							</c:if>
						<c:if test="${i%7 == 0}">
							<tr></tr>
						</c:if>
					</c:forEach>
					
					<c:if test="${(lastDay+(firstDayOfWeek-1)) % 7 !=0}">
						<c:forEach begin="1" end="${7- ((lastDay+(firstDayOfWeek-1)) % 7)}" step="1">
							<td>&nbsp;</td>
						</c:forEach>
					</c:if>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>