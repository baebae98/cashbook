<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가계부 수정폼</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div class="jumbotron jumbotron-fluid bg-warning">
  		<div class="container">
  			<h1>modifyCashbook</h1>
  			<p>가계부 수정페이지 입니다.</p>
		</div>
	</div>
	<div class="container">
	<form method="post" action="${pageContext.request.contextPath}/admin/modifyCashbook">
	<table class="table table-bordered table-hover">
		<tr>
			<td>cashbook_id</td>
			<td><input type="text" name="cashbookId" id="cashbookId" value="${cashbook.cashbookId}" readonly="readonly"></td>
		</tr>
		<tr>
			<td>cashbook_kind</td>
			<td>
				<input type="radio" name="cashbookKind" value="수입">수입
				<input type="radio" name="cashbookKind" value="지출">지출
			</td>
		</tr>
		<tr>
			<td>category_name</td>
			<td>
					<select name="categoryName">
							<c:forEach var="c" items="${categoryList}">
								<c:if test="${c.categoryName == cashbook.categoryName}">
									<option value="${c.categoryName}" selected="selected">${c.categoryName}</option>
								</c:if>
								<c:if test="${c.categoryName != cashbook.categoryName}">
									<option value="${c.categoryName}">${c.categoryName}</option>
								</c:if>
							</c:forEach>
						</select>
			</td>
		</tr>
		<tr>
			<td>cashbook_price</td>
			<td>
				<input type="text" name="cashbookPrice" value="${cashbook.cashbookPrice }">
			</td>
		</tr>
		<tr>
			<td>cashbook_content</td>
			<td>
				<input type="text" name="cashbookContent" value="${cashbook.cashbookContent}">
			</td>
		</tr>
	</table>
	<button type="submit">입력</button>
</form>
	</div>
</body>
</html>