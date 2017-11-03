<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/HoneyJamGuestHouse/scripts/jquery.js"></script>
<title>HoneyJam</title>
<style>
.content {
	width: 900px;
	min-width: 900px;
	height: 600px;
	min-height: 600px;
	margin-top: 50px;
}

.content_bot {
	margin-top: 30px;
}

button {
	border-radius: 10px;
	background: #0283df;
	border: 0;
	outline: 0;
	color: #fff;
	cursor: pointer;
	border-radius: 30px;
}

.content_top {
	margin-bottom: 20px;
	font-size: 30px;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<div class="content">
		<div class="content_top">
			<h1>예약 취소 완료</h1>
		</div>


		<div class="content_bot">
			<button onclick="location.href='/HoneyJamGuestHouse'" style="padding: 10px 50px;">홈</button>
			<a href="${initParam.rootPath }/reservationSelectById"><button style="padding: 10px 50px;">예약확인(마이페이지)</button></a>
		</div>

	</div>
	<jsp:include page="/WEB-INF/footer_ver2.jsp"></jsp:include>

</body>
</html>