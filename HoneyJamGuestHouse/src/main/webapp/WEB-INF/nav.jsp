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
	height: 40px;
	font-size: 16px;
	outline: none;
	border: 0px;
	text-align: center;
	line-height: 40px;
}

option {
	font-size: 16px;
}

.combobox {
	width: 200px;
	height: 40px;
	margin-top: 6px;
	font-size: 18px;
	outline: none;
	border: 0px;
	text-align: center;
}

.nav {
	width: 100%;
	height: 50px;
	background: rgba(0, 0, 0, 0.1);
	text-align: center;
}

.submit {
	background: #FF5A5F;
	width: 100px;
	height: 38px;
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
			</select> 
			<input type="submit" name="search" class="submit" value="검색">
		</form>
