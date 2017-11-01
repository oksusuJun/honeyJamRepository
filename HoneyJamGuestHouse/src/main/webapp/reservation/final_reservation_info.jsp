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
<h1>예약할 방 조회</h1>

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
				<td>${reservation.reservationId }</td>
				<td>${reservation.email }</td>
				<td>${reservation.checkIn }</td>
				<td>${reservation.checkOut }</td>
				<td>${reservation.numberOfGuests }</td>
				<td>${reservation.roomId }</td>
				<td>${reservation.gender }</td>
				<td>${reservation.paymentStatus }</td>
			</tr>
	</tbody>
</table>


</body>
</html>