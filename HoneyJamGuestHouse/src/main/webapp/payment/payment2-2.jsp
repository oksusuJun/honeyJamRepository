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
<h1>무통장입금 예약 완료</h1>

<div style="text-align: center;">
<p>예약이 완료 되었습니다.</p>
<p>꿀잠을 이용해 주셔서 감사합니다.</p>
<p>※ 1시간 이내 입금이 되지 않을 경우 자동 취소 됩니다.</p>
</div>
		<table>
			<tr>
				<td colspan="2">예약 정보</td>
			</tr>
			<tr>
				<td>방 번호</td>
				<td>${sessionScope.roomId }</td>
			</tr>
			<tr>
				<td>예약자 ID</td>
				<td>${sessionScope.email }</td>
			</tr>
			<!--  ####### 예약번호 나오게 수정해야함 ########
			<tr>
				<td>예약번호</td>
				<td>${sessionScope.reservationId }</td>   
			</tr>
			-->
			<tr>
				<td>날짜</td>
				<td>${sessionScope.checkIn } 
					~
					${sessionScope.checkOut }</td>
			</tr>
			<tr>
				<td>결제수단</td>
				<td>${sessionScope.paymentStatus }</td>
			</tr>
			<tr>
				<td>계좌번호</td>
				<td>신한 9999-88888-77777 예금주 : 꿀잠</td>
			</tr>
			<tr>
				<td>결제금액</td>
				<td>${sessionScope.price }</td>
			</tr>
		</table>

		<div style="text-align: center;">
		<button onclick="location.href='/HoneyJamGuestHouse'" style="padding:10px 50px;">홈</button>
		<button onclick="location.href='/HoneyJamGuestHouse/reservationSelectById'" style="padding:10px 50px;">예약확인(마이페이지)</button>
	</div>
	</div>
</body>
</html>