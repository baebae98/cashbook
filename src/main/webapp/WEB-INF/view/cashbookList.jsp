<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CashbookList</title>
<!-- w3schools.com bootstrap -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<!-- 상단 바 밑에 있는 점보 -->
	<div class="jumbotron jumbotron-fluid bg-warning">
  		<div class="container">
  			<h1>cashbookList</h1>
  			<p>cashbookList페이지 입니다.</p>
		</div>
	</div>
	<div class="container">
	<a href="/admin/cashbookListExcel">전체 cashbook 리스트를 엑셀 파일로 다운!</a>
	<table class="table table-bordered table-hover">
		<thead>
			<tr>
				<th>cashbook_id</th>
				<th>cashbook_kind</th>
				<th>category_name</th>
				<th>cashbook_price</th>
				<th>cashook_content</th>
				<th>cashbook_date</th>
				<th>create_date</th>
				<th>update_date</th>
			</tr>
		</thead>
		<tbody>
			
			<c:forEach var="c" items="${cashbookList}">
				<tr>
				<td>${c.cashbookId }</td>
				<td>${c.cashbookKind }</td>
				<td>${c.categoryName }</td>
				<td>${c.cashbookPrice }</td>
				<td>${c.cashbookContent }</td>
				<td>${c.cashbookDate }</td>
				<td>${c.createDate }</td>
				<td>${c.updateDate }</td>	
				</tr>			
			</c:forEach>
			
		</tbody>
	</table>
	<ul style="text-align:center;" class="pagination">
			<c:if test="${currentPage>1}">
				<li class="page-item"><a class="page-link" href="/admin/cashbookList/${currentPage-1}">이전</a></li>
			</c:if>
			<li class="page-item"><a href="#" class="btn  ">${currentPage}</a></li>
			<c:if test="${currentPage<lastPage}">
				<li class="page-item"><a class="page-link" href="/admin/cashbookList/${currentPage+1}">다음</a></li>
			</c:if>
	</ul>
</body>
</html>