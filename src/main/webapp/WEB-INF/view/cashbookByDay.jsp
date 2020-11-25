<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- if/for문을 대신해주는 코드 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<div> 
		<!-- ?target=pre&currentYear=${currentYear}&currentMonth=${currentMonth}&currentDay=${currentDay} -->
		<a href="${pageContext.request.contextPath}/admin/cashbookByDay/pre/${currentYear}/${currentMonth}/${currentDay}">
		이전
		</a>
			<span>${currentYear}년 ${currentMonth}월 ${currentDay}일</span>
		<!-- ?target=next&currentYear=${currentYear}&currentMonth=${currentMonth}&currentDay=${currentDay} -->
		<a href="${pageContext.request.contextPath}/admin/cashbookByDay/next/${currentYear}/${currentMonth}/${currentDay}">
		이후
		</a>
	</div>
	<!-- <a href="${pageContext.request.contextPath}/admin/addCashbook?currentYear=${currentYear}&currentMonth=${currentMonth}&currentDay=${currentDay}">수입/지출 입력</a>-->
	<a href="${pageContext.request.contextPath}/admin/addCashbook/${currentYear}/${currentMonth}/${currentDay}">수입/지출 입력</a>
	<table class="table table-bordered table-hover">
		<thead>
			<tr>
				<th>cashbookId</th>
				<th>cashbookKind</th>
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
				<td>${c.cashbookId}</td>
				<td>${c.cashbookKind}</td>
				<td>${c.categoryName}</td>
				<td>${c.cashbookPrice}</td>
				<td>${c.cashbookContent}</td>
				<!-- <td><a href="${pageContext.request.contextPath}/admin/modifyCashbook?cashbookId=${c.cashbookId}">수정</a></td>
				<td><a href="${pageContext.request.contextPath}/admin/removeCashbook?cashbookId=${c.cashbookId}">삭제</a></td>-->
				<td><a href="${pageContext.request.contextPath}/admin/modifyCashbook/${c.cashbookId}">수정</a></td>
				<td><a href="${pageContext.request.contextPath}/admin/removeCashbook/${c.cashbookId}">삭제</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</body>
</html>