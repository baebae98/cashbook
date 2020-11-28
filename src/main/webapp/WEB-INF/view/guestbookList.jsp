<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GuestBook</title>
<!-- w3schools.com bootstrap -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script>
	$(document).ready(function(){
		$('#addguestbookBtn').click(function(){
			if($('#guestbookWriter').val().length < 1){
				alert('작성자를 입력해 주세요.');
				return
			}else if($('#guestbookTitle').val().length < 1){
				alert('제목을 입력해 주세요.');
				return
			}else if($('#guestbookContent').val().length < 1){
				alert('내용을 입력해 주세요.');
				return
			}
			$('#addGuestbookForm').submit();
		});
	})
  </script>
</head>
<body>
	 <!-- 상단 메뉴 바 -->
	 <jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	  <!-- 상단 바 밑에 있는 점보 -->
		<div class="jumbotron jumbotron-fluid bg-warning">
	  		<div class="container">
	  			<h1>GuestBook</h1>
	  			<p>방명록 페이지 입니다.</p>
			</div>
		</div>
	<div class="container">
	<!-- 방명록 리스트 -->
	<table class="table table-hover">
			<c:forEach var="g" items="${guestbookList}">
				<thead class="table-active">
					<tr>
						<th>no.${g.guestbookId }</th>
						<th class="fs-20">${g.guestbookWriter }</th>
						<th class="align-right">Date.${g.guestbookDate }</th>
						<th class="align-right"><a class="color-red" href="${pageContext.request.contextPath}/admin/modifyGuestbook/${g.guestbookId }">수정</a></th>
						<th class="align-right"><a class="color-red" href="${pageContext.request.contextPath}/admin/removeGuestbook/${g.guestbookId }">삭제</a></th>
					</tr>
				</thead>
				<tbody>			
					<tr>
						<td colspan="2">제목 :${g.guestbookTitle}</td>
						<td colspan="2">내용 :${g.guestbookContent}</td>
					</tr>
				</tbody>
			</c:forEach>
	</table>
	<!-- 방명록 작성 -->
		<form id="addGuestbookForm" action="${pageContext.request.contextPath}/admin/addGuestbook" method="post">
			<table class="table table-borderless" style="border:1px solid #EAEAEA;">
				<tr>
					<th>작성자 : </th>
					<td><input type="text" class="form-control" name="guestbookWriter" id="guestbookWriter"></td>
					<td rowspan="2"><button type="button" id="addguestbookBtn" class="btn btn-outline-dark">작성</button></td>
				</tr>
				<tr>
					<th>제목 : </th>
					<td><input class="form-control" name="guestbookTitle" id="guestbookTitle"/></td>
				</tr>
				<tr>
					<th>내용 : </th>
					<td><textarea class="form-control" name="guestbookContent" id="guestbookContent"></textarea></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>