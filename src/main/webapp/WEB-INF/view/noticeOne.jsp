<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
<!-- w3schools.com bootstrap -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<!-- 상단 바 밑에 있는 점보 -->
	<div class="jumbotron jumbotron-fluid bg-warning">
  		<div class="container">
  			<h1>NoticeOne</h1>
  			<p>${notice.noticeId}번 공지사항 상세보기 페이지입니다.</p>
		</div>
	</div>
	<div class="container">
	<table class="table table-bordered table-hover">
		<tr>
			<td>noticeId</td>
			<td>${notice.noticeId}</td>
		</tr>
		<tr>
			<td>제 목</td>
			<td>${notice.noticeTitle}</td>
		</tr>
		<tr>
			<td>내 용</td>
			<td>${notice.noticeContent}</td>
		</tr>
		<tr>
			<td>날 짜</td>
			<td>${notice.noticeDate}</td>
		</tr>
	</table>
	<!--<a class="text-dark" href="/admin/modifyNotice?noticeId=${notice.noticeId}">[수정]</a>
	<a class="text-dark" href="/admin/removeNotice?noticeId=${notice.noticeId}">[삭제]</a>-->
	<a class="text-adrk" href="/admin/modifyNotice/${notice.noticeId}">[수정]</a>
	<a class="text-adrk" href="/admin/removeNotice/${notice.noticeId}">[삭제]</a>
	</div>
</body>
