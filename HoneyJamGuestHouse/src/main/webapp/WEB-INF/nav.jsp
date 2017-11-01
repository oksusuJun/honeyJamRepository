<%@ page contentType="text/html; charset=UTF-8"%>
<style type="text/css">
* {
	padding: 0;
	margin: 0 auto;
}

::-webkit-input-placeholder {
	font-size: 18px;
	margin-left: 10px;
}

input {
	width: 200px;
	height: 50px;
	margin-top: 7.5px;
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
	height: 50px;
	margin-top: 6px;
	font-size: 18px;
	outline: none;
	border: 0px;
	text-align: center;
}

.nav {
	width: 100%;
	height: 70px;
	background: rgba(0, 0, 0, 0.1);
	text-align: center;
}

.submit {
	background: #FF5A5F;
	width: 100px;
	height: 48px;
	color: #fff;
}

.people {
	width: 200px;
	height: 50px;
	font-size: 18px;
	outline: none;
	border: 0px;
	text-align: center;
}

::-webkit-input-placeholder {
	text-align: center;
}
</style>

<form class="nav" action="/HoneyJamGuestHouse/roomSearch">
	<input type="text" name="checkin" placeholder="checkin" class="calendar"> <input type="text" name="checkout"
		placeholder="checkout" class="calendar"> <input type="text" name="people" placeholder="인원수" class="people"> <select
		class="combobox" name="gender">
		<option value="">성별을 선택해주세요</option>
		<option value="남성">남성</option>
		<option value="여성">여성</option>
	</select> <input type="submit" name="search" class="submit" value="검색">
</form>
