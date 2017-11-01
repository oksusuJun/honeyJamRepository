<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
table {
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
<h1>최종 예약정보(결제직전)</h1>

<table>
	<thead>
		<tr>
			<td>방 이름</td>
			<td>방 번호</td>
			<td>체크인 날짜</td>
			<td>체크아웃 날짜</td>
			<td>인원</td>
			<td>성별</td>
			<td>결제금액</td>
		</tr>
	</thead>
	<tbody>
			<tr>
				<td>${requestScope.reservation.reservationId }</td>
				<td>${requestScope.reservation.email }</td>
				<td>${requestScope.reservation.checkIn }</td>
				<td>${requestScope.reservation.checkOut }</td>
				<td>${requestScope.reservation.numberOfGuests }</td>
				<td>${requestScope.reservation.roomId }</td>
				<td>${requestScope.reservation.gender }</td>
				<td>${requestScope.reservation.paymentStatus }</td>
			</tr>
	</tbody>
</table>


</body>
</html>