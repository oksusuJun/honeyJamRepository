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
<h1>2/3 카드 결제</h1>
		<table>
			<tr>
				<td>결제방법</td>
				<td>카드</td>
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
				<td>결제금액</td>
				<td>30,000원</td>
			</tr>
			<tr>
				<td>카드번호</td>
				<td><input></td>
			</tr>
		</table>
		<button onclick="location.href='./payment3-2.jsp'" style="padding:10px 50px; display:block; margin:0 auto;">결제하기</button>
	</div>
</body>
</html>