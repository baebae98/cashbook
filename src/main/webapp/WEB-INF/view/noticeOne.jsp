<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1>공지사항 상세보기</h1>
	<table border="1">
		<tr>
			<td>noticeID</td>
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
	<a href="/admin/modifyNotice?noticeId=${notice.noticeId}">수정</a>
	<a href="/admin/removeNotice?noticeId=${notice.noticeId}">삭제</a>
</body>
