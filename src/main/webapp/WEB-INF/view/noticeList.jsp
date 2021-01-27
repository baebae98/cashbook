<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<!-- w3schools.com bootstrap -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	 <!-- 상단 메뉴 바 -->
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<!-- 상단 바 밑에 있는 점보 -->
	<div class="jumbotron jumbotron-fluid bg-warning">
  		<div class="container">
  			<h1>NoticeList</h1>
  			<p>공지사항 페이지 입니다.</p>
		</div>
	</div>
	<!-- 공지 -->
	<div class="container">
	<div><a class="" href="${pageContext.request.contextPath}/admin/addNotice">공지사항 추가</a> </div>
		<table class="table table-bordered table-hover">
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
						<!--<a href="${pageContext.request.contextPath}/admin/noticeOne?noticeId=${n.noticeId}">${n.noticeId}</a>-->
						<a href="${pageContext.request.contextPath}/admin/noticeOne/${n.noticeId}">${n.noticeId}</a>
					</td>
					<td>${n.noticeTitle}</td>
					<td>${n.noticeDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div style="margin-left:35%">
		<ul class="pagination">
			<!--  현재 페이지가 1보다 클시 -->
			<!--  현재 페이지가 1일 시 -->
			<c:choose>
				<c:when test="${currentPage > '1'}">
					<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/noticeList/1/5">처음</a></li>
					<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/noticeList/${currentPage-1}/5">이전</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item disabled"><a class="page-link">처음</a></li>		
					<li class="page-item disabled"><a class="page-link">이전</a></li>		
				</c:otherwise>
			</c:choose>
			<!-- 현재 페이지 표시 -->
			<li class="page-item"><a class="page-link">${currentPage}</a></li>
			<!--  현재 페이지가 마지막 페이지 보다 작을 시 -->
			<!--  현재 페이지가 마지막 페이지 일 시 -->
			<c:choose>
				<c:when test="${currentPage < lastPage}">
					<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/noticeList/${currentPage+1}/5">다음</a></li>
					<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/noticeList/${lastPage}/5">맨끝</a></li>
				</c:when>
				<c:otherwise>		
					<li class="page-item disabled"><a class="page-link">다음</a></li>		
					<li class="page-item disabled"><a class="page-link">맨끝</a></li>		
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
	</div>
</body>
</html>