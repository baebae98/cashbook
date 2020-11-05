<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
	<!-- 공지 -->
	<h1>공지</h1>
	<div>
		<table border="1">
		<thead>
			<tr>
				<th>notice_id</th>
				<th>notice_title</th>
				<th>notice_content</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="var" items="${noticeList}">
				<tr>
					<td>${var.noticeId}</td>
					<td>${var.noticeTitle}</td>
					<td>${var.noticeContent}</td> <!-- n.getNoticeContent() -->
				</tr>
			</c:forEach>
		</tbody>	
		</table>
	</div>
	<h1>로그인</h1>
	<form action="/login" method="post">
		<div>
			ID : <input type="text" name="id">
		</div>
		<div>
			PW : <input type="password" name="pw">
		</div>
		<div>
			<button type="submit">로그인</button>
		</div>
	</form>
</body>
</html>