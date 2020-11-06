<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정페이지</title>
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
  			<h1>ModifyNotice</h1>
  			<p>공지사항 수정 페이지입니다.</p>
		</div>
	</div>
	<div class="container">
	<h1>공지사항 수정페이지</h1>
	<form method="post" action="/admin/modifyNotice">
				<table class="table table-bordered table-hover">
					<tr>
						<td>notice_id</td>
						<td><input type="text" name="noticeId" id="noticeId" value="${notice.noticeId}" readonly="readonly"></td>
					</tr>
					<tr>
						<td>notice_title</td>
						<td><input type="text" name="noticeTitle" id="noticeTitle" value="${notice.noticeTitle}"></td>
					</tr>
					<tr>
						<td>notice_content</td>
						<td><textarea name="noticeContent" id="noticeContent">${notice.noticeContent}</textarea></td>
					</tr>
					<tr>
						<td>notice_date</td>
						<td><input type="text" name="noticeDate" id="noticeDate" value="${notice.noticeDate}" readonly="readonly"></td>
					</tr>
					
					<tr>
						<td colspan="2">
							<button type="submit">수정</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
</body>
</html>