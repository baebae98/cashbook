<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<!-- w3schools.com bootstrap -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- 상단 바 -->
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<div class="container">
		 <ul class="navbar-nav">
		 	<li class="nav-item active">
      			<a class="nav-link" href="${pageContext.request.contextPath}/admin/index">[CashBookProject]</a>
   			</li>
		 </ul>
		 </div>
	</nav>
	<!-- 상단 바 밑에 있는 점보 -->
	<div class="jumbotron jumbotron-fluid bg-warning">
  		<div class="container">
  			<h1>Log-in</h1>
  			<p>로그인 해주세요!</p>
		</div>
	</div>
	<div class="container">
	<!-- 공지 -->
	<h1>공지</h1>
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
	<h1>로그인</h1>
	<form action="${pageContext.request.contextPath}/login" method="post"  class="was-validated">
		<div class="form-group">
    <label for="uname">ID :</label>
    <input type="text" class="form-control" id="uname" placeholder="Enter username" name="id" required>
    	<div class="valid-feedback">Greate!</div>
   	 <div class="invalid-feedback">Please enter your ID.</div>
  </div>
  <div class="form-group">
    <label for="pwd">Password:</label>
    <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pw" required>
    	<div class="valid-feedback">Greate!</div>
    	<div class="invalid-feedback">Please enter your password.</div>
  </div>
		<div>
			<button type="submit" class="btn btn-primary">로그인</button>
		</div>
	</form>
	</div>
</body>
</html>