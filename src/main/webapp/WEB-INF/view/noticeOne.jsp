<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<tr>
				<c:forEach var="nf" items="${notice.noticefileList}">
				<td>
					첨부파일
				</td>
				<td>
					<a href="${pageContext.request.contextPath}/upload/${nf.noticefileName}">${nf.noticefileName}</a>
				</td>
				</c:forEach>
			</tr>
	</table>
	<!--<a class="text-dark" href="${pageContext.request.contextPath}/admin/modifyNotice?noticeId=${notice.noticeId}">[수정]</a>
	<a class="text-dark" href="${pageContext.request.contextPath}/admin/removeNotice?noticeId=${notice.noticeId}">[삭제]</a>-->
	<a class="text-adrk" href="${pageContext.request.contextPath}/admin/modifyNotice/${notice.noticeId}">[수정]</a>
	<a class="text-adrk" href="${pageContext.request.contextPath}/admin/removeNotice/${notice.noticeId}">[삭제]</a>

	<br><br>
	<h3>댓글목록</h3>
	<table border="1">
		<c:forEach var="c" items="${notice.commentList}">
			<tr>
				<td>${c.commentContent}</td>
				<td>
					<a href="${pageContext.request.contextPath}/removeComment/${c.commentId}/${notice.noticeId}">삭제</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	<form action="${pageContext.request.contextPath}/addComment" method="post">
		<input type="hidden" name="noticeId" value="${notice.noticeId}">
		<textarea name="commentContent" rows="3" cols="50"></textarea>
		<button type="submit">댓글입력</button>
	</form>
</div>
</body>
