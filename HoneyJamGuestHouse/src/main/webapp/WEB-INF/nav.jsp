<%@ page contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	$(function() {

		$(".calendar").datepicker({
			buttonImageOnly : true,
			numberOfMonths : 2,
			dateFormat : "yymmdd"
		});
	});

	$(document).ready(function() {
		$(".submit").click(function() {
			if ($("#input1").val() == "") {
				alert("체크인 날짜를 선택해주세요.");
			} else if ($("#input2").val() == "") {
				alert("체크아웃 날짜를 선택해주세요.");
			} else if ($("#input3").val() == "") {
				alert("인원수를 선택해주세요.");
			} else if ($("#input4").val() == "") {
				alert("성별을 선택해주세요.");
			} else {
				$(".submit").attr("type", "submit");
			}

		});
	});
</script>
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


	<input type="text" name="checkin" placeholder="checkin" class="calendar" id="input1" autocomplete="off"> 
	<input type="text" name="checkout" placeholder="checkout" class="calendar" id="input2" autocomplete="off"> 
	<select class="combobox" name="people" id="input3">
		<option value="">인원을 선택해주세요</option>
		<option value="1">1명</option>
		<option value="2">2명</option>
		<option value="3">3명</option>
		<option value="4">4명</option>
		<option value="5">5명</option>
		<option value="6">6명</option>
		<option value="7">7명</option>
		<option value="8">8명</option>
	</select> <select class="combobox" name="gender" id="input4">
		<option value="">성별을 선택해주세요</option>
		<option value="남성">남성</option>
		<option value="여성">여성</option>
	</select> <input type="button" name="search" class="submit" value="검색" onclick="check">
</form>