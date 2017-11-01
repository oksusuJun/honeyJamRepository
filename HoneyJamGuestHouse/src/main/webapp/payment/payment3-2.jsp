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
				<td>ID</td>
				<td>test@test.com</td>
			</tr>
			<tr>
				<td>예약자</td>
				<td>홍길동</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>010-5555-5555</td>
			</tr>
			<tr>
				<td>예약번호</td>
				<td>A1234</td>
			</tr>
			<tr>
				<td>객실이름</td>
				<td>202호</td>
			</tr>
			<tr>
				<td>날짜</td>
				<td>2018년 1월 1일 ~ 2018년 1월 2일</td>
			</tr>
			<tr>
				<td>결제수단</td>
				<td>카드</td>
			</tr>
			<tr>
				<td>승인번호</td>
				<td>6532-7848-1548-2654</td>
			</tr>
			<tr>
				<td>객실이름</td>
				<td>202호</td>
			</tr>
			<tr>
				<td>날짜</td>
				<td>2018년 1월 1일 ~ 2018년 1월 2일</td>
			</tr>
		</table>

		<div style="text-align: center;">
		<button onclick="location.href='/HoneyJamGuestHouse'" style="padding:10px 50px;">홈</button>
		<button onclick="location.href='/HoneyJamGuestHouse/member/reservation_view.jsp'" style="padding:10px 50px;">예약확인(마이페이지)</button>
	</div>
	</div>
</body>
</html>