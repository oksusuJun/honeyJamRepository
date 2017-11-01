<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>HoneyJam</title>
<script src="/HoneyJamGuestHouse/scripts/jquery.js"></script>
<script src="/HoneyJamGuestHouse/scripts/jquery-ui.js"></script>
<link rel="stylesheet" href="/HoneyJamGuestHouse/css/cal.css">

<style type="text/css">
@font-face {
	font-family: myFont;
	src: url('/HoneyJamGuestHouse/font/HoonWhitecatR.ttf');
}

.contents {
	width: 100%;
	height: 650px;
	background-image: url("img/main.jpg");
	background-repeat: no-repeat;
	background-size: 100%;
	font-family: myFont;
}

.nav {
	width: 65%;
	height: 100px;
	background: rgba(0, 0, 0, 0.3);
	text-align: center;
	min-width: 1000px
}

::-webkit-input-placeholder {
	font-size: 18px;
	margin-left: 10px;
}

input {
	width: 200px;
	height: 60px;
	margin-top: 17.5px;
	font-size: 16px;
	outline: none;
	border: 0px;
	text-align: center;
}

option {
	font-size: 16px;
}

.combobox {
	width: 200px;
	height: 62px;
	margin-top: 17.5px;
	font-size: 18px;
	outline: none;
	border: 0px;
	text-align: center;
}

.text {
	width: 1080px;
	height: 300px;
	padding-top: 80px;
}

.text_p {
	padding-left: 8%;
	padding-top: 70px;
}

.text_p>p {
	font-size: 48px;
	text-align: left;
}

.p1 {
	font-weight: bold;
}

.submit {
	background: #FF5A5F;
	width: 100px;
	height: 58px;
	color: #fff;
	cursor: pointer;
}

.people {
	width: 200px;
	height: 60px;
	font-size: 18px;
	outline: none;
	border: 0px;
	text-align: center;
}

::-webkit-input-placeholder {
	text-align: center;
}

body {
	
}

.slide {
	width: 100%;
	height: 300px;
}

.slide_img {
	width: 100%;
	height: 100%;
	overflow: hidden;
	position: relative;
}

.slide_img>img {
	width: 50%;
	height: 100%;
	float: left;
	position: absolute;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		var now = 0;
		var imgs = $(".slide_img > img");
		var limit = imgs.length - 1;

		imgs.eq(now).siblings().css({
			"left" : "-50%"
		});

		setInterval(function() {
			var pre = now;

			now = now >= limit ? 0 : now + 1;

			imgs.eq(now).css({
				"left" : "50%"
			});
			imgs.eq(pre).animate({
				"left" : "-50%"
			}, 1000);
			imgs.eq(now).animate({
				"left" : "0%"
			}, 1000);
		}, 2000);
	});

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
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<div class="contents">
		<div class="text">
			<div class="text_p">
				<p class="p1" style="color: #FF5A5F !important;">꿀JAM GuestHouse</p>
				<p style="color: #484848 !important;">꿀JAM 에 오신걸 환영합니다</p>
				<p style="color: #484848 !important;">(꿀잼도 되고 꿀잠도 됨 ㅎ)</p>
			</div>
		</div>
		<form class="nav" action="/HoneyJamGuestHouse/roomSearch">

			<input type="text" name="checkin" placeholder="checkin" class="calendar"> 
			<input type="text" name="checkout" placeholder="checkout" class="calendar"> 

			<select class="combobox" name="people">
					<option value="">인원을 선택해주세요</option>
					<option value="1">1명</option>
					<option value="2">2명</option>
					<option value="3">3명</option>
					<option value="4">4명</option>
					<option value="5">5명</option>
					<option value="6">6명</option>
					<option value="7">7명</option>
					<option value="8">8명</option>
			</select>
			<select class="combobox" name="gender">
				<option value="">성별을 선택해주세요</option>
				<option value="남성">남성</option>
				<option value="여성">여성</option>
			</select> <input type="submit" name="search" class="submit" value="검색">

		</form>
	</div>
	<div class="slide">
		<div class="slide_img">
			<img src="img/2인실.jpg" alt="img"> <img src="img/2인실_1.jpg" alt="img"> <img src="img/4인실.jpg" alt="img"> <img
				src="img/4인실_1.jpg" alt="img"> <img src="img/6인실.jpg" alt="img"> <img src="img/6인실_1.jpg" alt="img"> <img
				src="img/8인실.jpg" alt="img"> <img src="img/8인실_1.jpg" alt="img">
		</div>
	</div>

	</div>
	<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>

</body>
</html>
