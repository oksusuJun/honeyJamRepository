<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">

table {
    border-collapse: collapse;
    width: 70%;
}

table, th, td {
    border: 1px solid black;
}

</style>

<body>


<c:if test="${sessionScope.loginMember.email != 'admin'}">
		<jsp:forward page="/main.jsp" />
</c:if>

<jsp:include page="/WEB-INF/header.jsp"></jsp:include>

<br>
<h1>
${requestScope.date} 에 해당하는 예약들 
</h1>
<br>

<table>

	<tr>
		<th>예약번호</th>
		<th>예약자 email</th>
		<th>예약 인원</th>
		<th>체크인 날짜</th>
		<th>체크아웃 날짜</th>
		<th>해당 예약 삭제</th>
		
		
	</tr>
<c:forEach items="${requestScope.list}" var="reservation">

	<tr>
		<td>${reservation.reservationId}</td>
		<td>${reservation.email}</td>
		<td>${reservation.numberOfGuests}</td>
	<td><fmt:formatDate value="${reservation.checkIn}" pattern="yyyy-MM-dd"/></td>
	<td><fmt:formatDate value="${reservation.checkOut}" pattern="yyyy-MM-dd"/></td>
		<td><button type="button" 
		onclick="location.href='/HoneyJamGuestHouse/reservationDelete?reservationId=${reservation.reservationId}'">예약건 삭제</button></td>
		
	</tr>
</c:forEach>


</table>


</body>
</html>