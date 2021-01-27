<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- w3schools.com bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		//$('#id').focus();//커서가 id로 감
		//$('#id').blur(function(){//커서가 없으면
			//alert('blur test!');

			//비동기 요청으로 #id값을 서버에 보내고 #id값이 중복되는 값인지 아닌지 받아옴. 
			//동기로 처리하면 페이지가 바뀌어서 비동기로 처리
			$.ajax({
				url:'/admin/idCheck',
				type:'post',
				data:{id:$('#id').val()},
				success:function(data){
					alert(data); //경고창으로 data출력
					if(data == 'yes'){
						alert($('#id').val()+'는 사용가능한 ID입니다.');
						$('#pw').focus();
						}else{
						alert($('#id').val()+'사용중인 ID입니다.');
						$('#id').val('');
						$('#id').focus();
					}
				}
			});

		}); 
	});
</script>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div class="jumbotron jumbotron-fluid bg-warning">
  		<div class="container">
  			<h1>AddMember</h1>
  			<p>회원가입 페이지 입니다.</p>
		</div>
	</div>
	<div class="form-group container">
	<form method="post" action="${pageContext.request.contextPath}/admin/addMember" >
		<div>
			  <label for="uname">ID :</label> 
			  <input class="form-control" placeholder="Enter ID" type="text" id="id" name="id">
		</div>
		<div>
			<label for="pwd">PW :</label> 
			<input class="form-control" placeholder="Enter password" type="password" id="pw" name="pw">
		</div>
		<br>
		<div>
			<button class="btn btn-primary" type="submit" id="addMember">addMember</button>
		</div>
	</form>
	</div>
</body>
</html>