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
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<div class="contents">
	<p>GuestHouse</p>
	<p>독특한 숙소를 예약하고, 현지인처럼 </p>
	<p>살아보세요</p>
		<form class="nav" action="">
			<input type="text" name="checkin" placeholder="checkin"> <input type="text" name="checkout" placeholder="checkout">
			<input type="text" name="people" placeholder="인원수"> <input type="text" name="gender" placeholder="성별"> 
			<input type="submit" name="search" value="검색" style="width: 100px; height: 60px;">
		</form>
	</div>
	<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>


</body>
</html>
