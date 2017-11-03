<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/HoneyJamGuestHouse/scripts/jquery.js"></script>
<title>Honey</title>
<style>
.content {
	width: 900px;
	min-width: 900px;
	height: 600px;
	min-height: 600px;
	margin-top: 50px;
}

table {
	border-collapse: collapse;
	width: 100%;
}

table td {
	padding: 12px 10px;
	border: 1px solid black;
}

.content_bot {
	margin-top: 30px;
}
button{
	border-radius: 10px;
	background: #0283df;
	border: 0;
	outline: 0;
	color: #fff;
	cursor: pointer;
	border-radius: 30px;
}
.content_top{
margin-bottom: 20px;
font-size: 30px;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<div class="content">
		<div class="content_top">
			<p>예약이 완료 되었습니다.</p>
			<p>꿀잠을 이용해 주셔서 감사합니다.</p>
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
			<tr>
				<td>날짜</td>
				<td>${sessionScope.checkIn }~${sessionScope.checkOut }</td>
			</tr>
			<tr>
				<td>결제수단</td>
				<td>${sessionScope.paymentStatus }</td>
			</tr>
			<tr>
				<td>예약인원</td>
				<td>${sessionScope.people }명</td>
			</tr>
			<tr>
				<td>결제금액</td>
				<td>${sessionScope.price * sessionScope.people }원</td>
			</tr>
		</table>

		<div class="content_bot">
			<button onclick="location.href='/HoneyJamGuestHouse'" style="padding: 10px 50px;">홈</button>
			<a href="${initParam.rootPath }/reservationSelect"><button style="padding: 10px 50px;">예약확인(마이페이지)</button></a>
		</div>
	</div>
	<jsp:include page="/WEB-INF/footer_ver2.jsp"></jsp:include>

</body>
</html>