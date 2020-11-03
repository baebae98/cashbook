<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.sunday{color : #FF0000;}
</style>
</head>
<body>
	<h1>Index</h1>
	<h3>공지사항</h3>
	<table border="1">
		<thead>
			<tr>
				<th>notice_id</th>
				<th>notice_title</th>
				<th>notice_date</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="notice" items="${noticeList}">
				<tr>
					<td>${notice.noticeId}</td>
					<td>${notice.noticeTitle}</td>
					<td>${notice.noticeDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 다이어리 -->
	 <div>
      ${currentMonth}월 수입 합계 : ${sumIn}
   </div>
   <div>
      ${currentMonth}월 지출 합계 : ${sumOut}
   </div>

	<h3>
	<a href="/cashbookByMonth?currentYear=${currentYear}&currentMonth=${currentMonth-1 }">[이전달]</a>
	${currentYear }년${currentMonth}월
	<a href="/cashbookByMonth?currentYear=${currentYear}&currentMonth=${currentMonth+1 }">[다음달]</a>
	</h3>
	
	<div>
		<table border="1">
			<thead>
				<tr>
					<th class="sunday">일</th>		
					<th>월</th>		
					<th>화</th>		
					<th>수</th>		
					<th>목</th>		
					<th>금</th>		
					<th>토</th>		
				</tr>
			</thead>
			<tbody>
				<tr>
					<!-- 이게 for문 대신. 1~31까지 -->
					<c:forEach var="i" begin="1" end="${lastDay+(firstDayOfWeek-1) }" step="1">
						<c:if test="${i-(firstDayOfWeek-1) < 1 }">
							<td>&nbsp;</td>
						</c:if>
						<c:if test="${i-(firstDayOfWeek-1) > 0 }">
							<c:if test="${i%7 == 1}">
								<td class="sunday">${i-(firstDayOfWeek-1)}</td>
							</c:if>
							<c:if test="${i%7 !=1}">
							<td>${i-(firstDayOfWeek-1)}</td>
							</c:if>
						</c:if>
						<c:if test="${i%7 == 0}">
							<tr></tr>
						</c:if>
					</c:forEach>
					
					<c:if test="${(lastDay+(firstDayOfWeek-1)) % 7 !=0}">
						<c:forEach begin="1" end="${7- ((lastDay+(firstDayOfWeek-1)) % 7)}" step="1">
							<td>&nbsp;</td>
						</c:forEach>
					</c:if>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>