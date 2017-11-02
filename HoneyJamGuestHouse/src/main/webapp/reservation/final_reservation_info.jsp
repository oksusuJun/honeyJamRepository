<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/HoneyJamGuestHouse/scripts/jquery.js"></script>
<script src="/HoneyJamGuestHouse/scripts/jquery-ui.js"></script>
<script>
function radioCheck() {
	// 결제방식이 선택되었는지 체크 -> 선택 x -> 선택하라는 메세지
	var paymentList = document.form1.payment;
	var flag = false;
	// 하나만 선택이된다하더라도 일단 값은 다 넘어온다. --> 배열로~~~~
	for (var i = 0; i < paymentList.length; i++) {
		if (paymentList[i].checked) {
			flag = true;
			break;
		}
	}
	if (!flag) {
		alert("결제수단을 선택해주세요");
	}
}
</script>
<link rel="stylesheet" href="/HoneyJamGuestHouse/css/cal.css">


<style type="text/css">
@font-face {
	font-family: myFont;
	src: url('/HoneyJamGuestHouse/font/HoonWhitecatR.ttf');
}

::-webkit-input-placeholder {
	text-align: center;
}
</style>
<script type="text/javascript">
	$(function() {

		$(".calendar").datepicker({
			buttonImageOnly : true,
			numberOfMonths : 2,
			dateFormat : "yymmdd"
		});
	});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/header.jsp" />
	<h1>최종 예약정보(결제직전)</h1>
	<div class="div1">
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
		
	</div>
	<form name="form1" method="post"  action="/HoneyJamGuestHouse/reservationInsert" onsubmit="radioCheck();">
		<p>
			결제 방법 : <label>신용카드 : <input type="radio" name="payment" value="creditCard"></label>
			<label>무통장입금 : <input type="radio" name="payment" value="account"></label>
		<p>
		<!-- 
		<%
		session.setAttribute("paymentStatus", "결제완료");
		%>
		 -->
		<input type="submit" value="Reservation">
		</form>
	<jsp:include page="/WEB-INF/footer_ver2.jsp"></jsp:include>


</body>
</html>