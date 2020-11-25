<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴바</title>
<!-- w3schools.com bootstrap -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<div class="container">
		<ul class="navbar-nav ">
	 <li class="nav-item active">
	<a class="nav-link" href="${pageContext.request.contextPath}/admin/index">[CashBookProject]</a>
	</li>
	 <li class="nav-item active">
	<a class="nav-link" href="${pageContext.request.contextPath}/admin/index">[HOME]</a>
	</li>
	 <li class="nav-item active">
	<a class="nav-link" href="${pageContext.request.contextPath}/admin/cashbookByMonth/-1/-1">[CashBook]</a>
	</li>
	
	<li class="nav-item active">
	<a class="nav-link" href="${pageContext.request.contextPath}/admin/cashbookList/1">[CashBookList]</a>
	</li>
	
	<li class="nav-item active">
		<a class="nav-link" href="${pageContext.request.contextPath}/admin/noticeList/1/5">[Notice]</a>
	</li>
	 <li class="nav-item active">
	<a class="nav-link" href="${pageContext.request.contextPath}/admin/chart1.jsp">[Chart]</a>
	</li>
	 <li class="nav-item active">
	<a class="nav-link" href="${pageContext.request.contextPath}/admin/addMember">[addMember]</a>
	</li>
	<li class="nav-item active">
	<a class="nav-link text-danger" href="${pageContext.request.contextPath}/admin/logout">[Log-out]</a>
	</li>
	</ul>
	</div>
	</nav>
	
</body>
</html>