<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
table{
	border-collapse: collapse;
	width: 500px;
}

td, th {
	border: 1px solid black;
	text-align: center;
	padding: 5px;
}
</style>

<body>
<c:if test="${sessionScope.loginMember ==null}">
<jsp:forward page="/member/login.jsp"/> 
</c:if>

<jsp:include page="/member/mypage.jsp"></jsp:include>
<br><br>

<h1>내방 예약조회</h1>
<p>
<h2>예약목록</h2>
<table>
<thead>
	<tr>
		<td>
		예약번호
		</td>
		<td>
		예약자 id
		</td>
		<td>
		체크인 날짜
		</td>
		<td>
		체크아웃 날짜
		</td>
		<td>
		인원
		</td>
		<td>
		방 번호
		</td>
		<td>
		성별
		</td>
	</tr>
</thead>
<tbody>
<c:forEach items="${requestScope.reservation }" var="reservation">
	<tr>
		<td>
		${reservation.reservationId }
		</td>
		<td>
		${reservation.email }
		</td>
		<td>
		${reservation.checkIn }
		</td>
		<td>
		${reservation.checkOut }
		</td>
		<td>
		${reservation.numberOfGuests }
		</td>
		<td>
		${reservation.roomId }
		</td>
		<td>
		${reservation.gender }
		</td>		
	</tr>
</c:forEach>
</tbody>
</table>
	

</body>
</html>