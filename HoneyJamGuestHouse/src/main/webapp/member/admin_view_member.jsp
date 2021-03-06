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
<h2> 조회하는 회원 id: ${requestScope.member.email}</h2>
<h2> 조회하는 회원 닉네임: ${requestScope.member.nickname}</h2>
<h3>회원 전화번호 : ${requestScope.member.phoneNum}</h3><br><br><br>

해당 회원의 예약들 <br>

<table>
<tr>
	<th>예약번호</th>
	<th>체크인 날짜</th>
	<th>체크아웃 날짜</th>
	<th>삭제?</th>
</tr>

<c:forEach items="${requestScope.member.reservationList}" var="reservation">
<tr>
	<td>${reservation.reservationId}</td>
	<td><fmt:formatDate value="${reservation.checkIn}" pattern="yyyy-MM-dd"/></td>
	<td><fmt:formatDate value="${reservation.checkOut}" pattern="yyyy-MM-dd"/></td>
	<td><button type="button" onclick="location.href='/HoneyJamGuestHouse/reservationDelete?reservationId=${reservation.reservationId}'">예약건 삭제</button></td>
</tr>
</c:forEach>


</table>

<br>

해당 회원을 삭제하겠습니까? (회원삭제 ) : 
<button type="button" onclick="location.href='/HoneyJamGuestHouse/AdminDeleteMember?delete_email=${requestScope.member.email}'">삭제</button>



</body>
</html>