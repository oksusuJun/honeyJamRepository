<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<style type="text/css">
.contents {
	width: 100%;
	height: 500px;
}

.nav {
	width: 100%;
	height: 100px;
	background: rgba(0, 0, 0, 0.1);
	text-align: center;
}

::-webkit-input-placeholder {
	font-size: 18px;
	margin-left: 10px;
}

input {
	width: 200px;
	height: 60px;
	margin-top: 17.5px;
	font-size: 18px;
	outline: none;
	border: 0px;
}

.text {
	width: 1080px;
	height: 300px;
}

.text_p {
	padding-left: 8%;
	padding-top: 70px;
}

.text_p>p {
	font-size: 50px;
	text-align: left;
}

.p1 {
	color: pink;
	font-weight: bold;
}
.submit{
width: 100px;
height: 60px;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<div class="contents">
		<div class="text">
			<div class="text_p">
				<p class="p1">GuestHouse</p>
				<p>독특한 숙소를 예약하고, 현지인처럼</p>
				<p>살아보세요</p>
			</div>
		</div>
		<form class="nav" action="">
			<input type="text" name="checkin" placeholder="checkin">
			 <input type="text" name="checkout" placeholder="checkout">
			<input type="text" name="people" placeholder="인원수"> 
			<input type="text" name="gender" placeholder="성별"> 
			<input type="submit" name="search" class="submit" value="검색">
		</form>
	</div>
	<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>


</body>
</html>
