<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 추가페이지</title>
<style type="text/css">
input {
  width:200px;
  height:100px;
  font-size:20px;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div class="jumbotron jumbotron-fluid bg-warning">
  		<div class="container">
  			<h1>AddNotice</h1>
  			<p>공지사항 추가페이지 입니다.</p>
		</div>
	</div>
	<div class="container">
	<form method="post" action="/admin/addNotice">
		<table class="table table-bordered table-hover">
			<tr>
				<td>제목</td>
					<td><input type="text" name="noticeTitle"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type="text" name="noticeContent"></td>
			</tr>
		</table>
			<button type="submit">공지사항 추가!</button>
	</form>
	</div>
</body>
</html>