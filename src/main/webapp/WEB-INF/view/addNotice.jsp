<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 추가페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#addBtn').click(function(){
		let html = '<div><input type="file" name="noticefileList" class="noticefileList"></div>';
		$('#fileinput').append(html);
	});
	$('#delBtn').click(function(){
		$('#fileinput').children().last().remove();
	})
	$('#submitBtn').click(function(){
		let ck = true;
		$('.boardfile').each(function(index, item){
			console.log($(item).val());
			if($(item).val() == '') {
				ck = false;
			}
		})
		if(ck == false) { // if(ck)
			alert('선택하지 않은 파일이 있습니다');
		} else {
			$('#fileuploadFrom').submit();
		}
	});
});
</script>
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
	<form id="fileuploadFrom" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/admin/addNotice">
		<table class="table table-bordered table-hover">
			<tr>
				<td>제목</td>
					<td><input type="text" name="noticeTitle"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type="text" name="noticeContent"></td>
			</tr>
			<tr>
				<td>notice_file</td>
				<td>
					<div>
						<button type="button" id="addBtn">파일추가</button>
						<button type="button" id="delBtn">파일삭제</button>
					</div>
					<div id="fileinput"></div>
				</td>
			</tr>
		</table>
			<button type="button" id="submitBtn">공지사항 추가!</button>
	</form>
	</div>
</body>
</html>