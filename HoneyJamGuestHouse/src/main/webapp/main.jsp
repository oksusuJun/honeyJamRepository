<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>HoneyJam</title>
<script src="/HoneyJamGuestHouse/scripts/jquery.js"></script>
<script src="/HoneyJamGuestHouse/scripts/jquery-ui.js"></script>
<link rel="stylesheet" href="/HoneyJamGuestHouse/css/cal.css">

<style type="text/css">
.contents {
	width: 100%;
	height: 650px;
	background-image: url("img/main10.jpg");
	background-repeat: no-repeat;
	background-size: 100%;
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

.text_p > p {
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
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<div class="contents">
		<div class="text">
			<div class="text_p">
				<p class="p1" style="color: #FF5A5F !important;">GuestHouse</p>
				<p style="color: #484848 !important;">꿀JAM 에 오신걸 환영합니다</p>
				<p style="color: #484848 !important;">(꿀잼도 되고 꿀잠도 됨 ㅎ)</p>
			</div>
		</div>
		<form class="nav" action="/HoneyJamGuestHouse/roomSearch">
			<input type="text" name="checkin" placeholder="checkin" class="calendar"> 
			<input type="text" name="checkout" placeholder="checkout" class="calendar"> 
			<input type="text" name="people" placeholder="인원수" class="people"> <select
				class="combobox" name="gender">
				<option value="">성별을 선택해주세요</option>
				<option value="남성">남성</option>
				<option value="여성">여성</option>
			</select> <input type="submit" name="search" class="submit" value="검색">
		</form>
	</div>
	<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>

</body>
</html>
