<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제</title>
<style>
	table {
		margin: 10px;
		border-collapse: collapse;
		margin: 10px auto;
		width : 90%;
	}
	
	table td {
		padding: 12px 10px;
		border: 1px solid black;
	}
	
	.wrapper {
		width: 960px;
		margin: 0 auto;
	}
</style>
</head>
<body>
<div class="wrapper">
<h1>3/3 카드 결제, 예약 완료</h1>

<div style="text-align: center;">
<p>예약이 완료 되었습니다.</p>
<p>꿀잠을 이용해 주셔서 감사합니다.</p>
</div>
		<table>
			<tr>
				<td colspan="2">예약 정보</td>
			</tr>
			<tr>
				<td>방 번호</td>
				<td>${sessionScope.reservation.roomId }</td>
			</tr>
			<tr>
				<td>예약자 ID</td>
				<td>${sessionScope.reservation.email }</td>
			</tr>
			<tr>
				<td>예약번호</td>
				<td>${sessionScope.reservation.reservationId }</td>
			</tr>
			<tr>
				<td>날짜</td>
				<td>${sessionScope.reservation.checkIn } 
					~
					${sessionScope.reservation.checkOut }</td>
			</tr>
			<tr>
				<td>결제수단</td>
				<td>카드</td>
			</tr>
		</table>

		<div style="text-align: center;">
		<button onclick="location.href='/HoneyJamGuestHouse'" style="padding:10px 50px;">홈</button>
		<button onclick="location.href='/HoneyJamGuestHouse/member/reservation_view.jsp'" style="padding:10px 50px;">예약확인(마이페이지)</button>
	</div>
	</div>
</body>
</html>