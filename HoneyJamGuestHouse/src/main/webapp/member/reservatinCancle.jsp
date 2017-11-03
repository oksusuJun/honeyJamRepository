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
<h1>예약 취소</h1>

<div style="text-align: center;">
<p>예약이 정상적으로 취소 되었습니다.</p>
<p>다음에 꼭 다시 이용해주세요!</p>
</div>
		<table>
			<tr>
				<td colspan="2">예약 취소 정보</td>
			</tr>
		</table>
		
		<div style="text-align: center;">
		<button onclick="location.href='/HoneyJamGuestHouse'" style="padding:10px 50px;">홈</button>
		<button onclick="location.href='/HoneyJamGuestHouse/member/reservation_view.jsp'" style="padding:10px 50px;">예약확인(마이페이지)</button>
	</div>
	</div>
</body>
</html>