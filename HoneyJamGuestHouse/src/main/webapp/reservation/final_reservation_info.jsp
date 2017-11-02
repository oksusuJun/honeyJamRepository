<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
@font-face {
	font-family: myFont;
	src: url('/HoneyJamGuestHouse/font/HoonWhitecatR.ttf');
}

* {
	margin: 0 auto;
	padding: 0px;
	text-align: center;
	list-style: none;
	text-decoration: none;
	color: #000;
}

table {
	border-collapse: collapse;
	width: 100%;
}

td, tr {
	border: 3px solid pink;
}

.content {
	width: 900px;
	min-height: 600px;
	height: 600px;
}

h1 {
	margin-bottom: 50px;
}

thead>tr>td {
	color: blue;
	font-weight: bold;
	font-family: myFont;
	font-size: 30px;
	height: 50px;
}

tbody>tr>td {
	height: 40px;
	width: 150px;
}

button {
	width: 100px;
	height: 30px;
	background: #fff;
	outline: 0;
	border: 2px solid #FF5A5F !important;
	cursor: pointer;
	border-radius: 30px;
	font-weight: bold;
}
</style>
<body>

<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/nav.jsp"></jsp:include>
<br>
<br>
	<%-- 검색 후 예약할 수 있는 방목록 --%>
	<h1>최종 예약정보(결제직전)</h1>
	
	<div class="content">
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
						<td>${sessionScope.roomId}호</td>
						<td>${sessionScope.checkIn }</td>
						<td>${sessionScope.checkOut }</td>
						<td>${sessionScope.people }명</td>
						<td>${sessionScope.gender }</td>
						<td>${sessionScope.price * sessionScope.people }원</td>
					</tr>
			</tbody>
		</table>
	</div>
	<jsp:include page="/WEB-INF/footer_ver2.jsp"></jsp:include>

</body>
</html>