<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- if/for문을 대신해주는 코드 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addCashbook</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div class="container">
	<h1>addCashbook</h1>
	<form method="post" action="/admin/addCashbook">
		<table class="table table-bordered table-hover">
			<tr>
				<td>cashbook_date</td>
				<td>
					<!-- <input type="text" name="cashbookDate" value="${param.currentYear}-${param.currentMonth}-${param.currentDay}" readonly="readonly">-->
					<input type="text" name="cashbookDate" value="${currentYear}-${currentMonth}-${currentDay}" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>cashbook_kind</td>
				<td>
					<input type="radio" name="cashbookKind" value="수입">수입
					<input type="radio" name="cashbookKind" value="지출">지출
				</td>
			</tr>
			<tr>
				<td>cashbook_name</td>
				<td>
					<select name="categoryName">
						<c:forEach var="c" items="${categoryList }">
							<option value="${c.categoryName}">${c.categoryName}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>cashbook_price</td>
				<td>
					<input type="text" name="cashbookPrice">
				</td>
			</tr>
			<tr>
				<td>cashbook_content</td>
				<td>
					<input type="text" name="cashbookContent">
				</td>
			</tr>
		</table>
		<button type="submit">수입/지출 입력</button>
	</form>
	</div>
</body>
</html>