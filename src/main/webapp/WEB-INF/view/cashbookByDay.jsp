<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- if/for문을 대신해주는 코드 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cashbokByDay</title>
<!-- w3schools.com bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style type="text/css">
	.cashbookTableMenu {
				width: 100%;
				text-align: center;
			}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div class="jumbotron jumbotron-fluid bg-warning">
  		<div class="container">
  			<h1>CashbookByDay</h1>
  			<p>CashbookByDay페이지 입니다.</p>
		</div>
	</div>
	<div class="container">
	<table class="cashbookTableMenu">
		<tr>
			<td width="15%" style="text-align: right;">
				<a class="btn btn-dark" href="${pageContext.request.contextPath}/admin/cashbookByDay/pre/${currentYear}/${currentMonth}/${currentDay}"> << </a>
			</td>
			<td width="20%">
				<h3>${currentYear}년 ${currentMonth}월 ${currentDay}일</h3>
			</td>
			<td width="15%" style="text-align: left;">
				<a class="btn btn-dark" href="${pageContext.request.contextPath}/admin/cashbookByDay/next/${currentYear}/${currentMonth}/${currentDay}"> >> </a>
			</td>
		</tr>
	</table>
	<div align="left">
	<a class="btn btn-link" href="${pageContext.request.contextPath}/admin/addCashbook/${currentYear}/${currentMonth}/${currentDay}">수입/지출 입력</a>
	</div>
	<table class="table table-bordered table-hover">
		<thead>
			<tr class="text-center">
				<th>cashbookId</th>
				<th> cashbookKind</th>
				<th>categoryName</th>
				<th>cashbookPrice</th> 
				<th>cashbookContent</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="c" items="${cashbookList}">
				<tr>
				<td class="text-center">${c.cashbookId}</td>
				<td class="text-center">${c.cashbookKind}</td>
				<td class="text-center">${c.categoryName}</td>
				<td class="text-center">${c.cashbookPrice}</td>
				<td class="text-center">${c.cashbookContent}</td>
				<!-- <td><a href="${pageContext.request.contextPath}/admin/modifyCashbook?cashbookId=${c.cashbookId}">수정</a></td>
				<td class="text-center"><a href="${pageContext.request.contextPath}/admin/removeCashbook?cashbookId=${c.cashbookId}">삭제</a></td>-->
				<td class="text-center"><a class="btn btn-success" href="${pageContext.request.contextPath}/admin/modifyCashbook/${c.cashbookId}">수정</a></td>
				<td class="text-center"><a class="btn btn-danger" href="${pageContext.request.contextPath}/admin/removeCashbook/${c.cashbookId}">삭제</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</body>
</html>