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
			<td>방 번호</td>
			<td>체크인 날짜</td>
			<td>체크아웃 날짜</td>
			<td>인원</td>
			<td>성별</td>
			<td>총 결제금액</td>
		</tr>
	</thead>
	<tbody>
			<tr>
				<td>${sessionScope.roomId}</td>
				<td>${sessionScope.checkIn }</td>
				<td>${sessionScope.checkOut }</td>
				<td>${sessionScope.people }</td>
				<td>${sessionScope.gender }</td>
				<td>${sessionScope.price * sessionScope.people }</td>
			</tr>
	</tbody>
</table>


</body>
</html>