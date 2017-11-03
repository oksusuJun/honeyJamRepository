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
	width: 90%;
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
<h1>2/3 결제 (무통장은 바로예약)</h1>
		<table>
			<tr>
				<td>결제방법</td>
				<td>무통장 입금</td>
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
				<td>계좌정보</td>
				<td>신한 9999-88888-77777 예금주 : 꿀잠</td>
			</tr>
			<tr>
				<td>결제금액</td>
				<td>30,000원</td>
			</tr>
			<tr>
				<td colspan="2">※ 예약 후 1시간 이내 입금되지 않을 경우 자동 취소 됩니다.</td>
			</tr>
		</table>
		<button onclick="location.href='./payment2-2.jsp'" style="padding: 10px 50px; display: block; margin: 0 auto;">예약하기</button>
	</div>
</body>
</html>

