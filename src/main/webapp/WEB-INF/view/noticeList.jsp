<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<!-- 공지 -->
	<h1>공지사항</h1>
	<div><a href="/admin/addNotice">[공지사항 추가]</a> </div>
		<table border="1">
		<thead>
			<tr>
				<th>noticeId</th>
				<th>noticeTitle</th>
				<th>noticeDate</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="n" items="${noticeList}">
				<tr>
					<td>
						<a href="/admin/noticeOne?noticeId=${n.noticeId}">
							${n.noticeId}
						</a>
					</td>
					<td>${n.noticeTitle}</td>
					<td>${n.noticeDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
		<c:if test="${currentPage == 1 }">
		<a href="/admin/noticeList?currentPage=${currentPage+1}">다음</a>
	</c:if>
	<c:if test="${currentPage == lastPage }">
		<a href="/admin/noticeList?currentPage=${currentPage-1}">이전</a>
	</c:if>
	<c:if test="${currentPage > 1 && currentPage < lastPage}">
		<a href="/admin/noticeList?currentPage=${currentPage-1}">이전</a>
		<a href="/admin/noticeList?currentPage=${currentPage+1}">다음</a>
	</c:if>
</body>
</html>