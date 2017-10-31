
<style type="text/css">
* {
	padding: 0;
	margin: 0 auto;
}

.nav {
	width: 100%;
	height: 50px;
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

.submit {
	width: 100px;
	height: 60px;
}
</style>

<form class="nav" action="">
	<input type="text" name="checkin" placeholder="checkin"> <input type="text" name="checkout" placeholder="checkout">
	<input type="text" name="people" placeholder="인원수"> <input type="text" name="gender" placeholder="성별"> <input
		type="submit" name="search" class="submit" value="검색">
</form>
