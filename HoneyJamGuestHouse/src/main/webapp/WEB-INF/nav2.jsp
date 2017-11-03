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
			} else if ($("#input1").val() >= $("#input2").val()) {
				alert("체크인,체크아웃 날짜를 확인해주세요.");
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
::-webkit-input-placeholder {
	text-align: center;
}
</style>
<form class="nav" action="/HoneyJamGuestHouse/roomSearch">
	<input type="text" name="checkin" placeholder="checkin" class="calendar" id="input1" autocomplete="off"> 
	<input type="text" name="checkout" placeholder="checkout" class="calendar" id="input2" autocomplete="off"> 
	<input type="button" name="search" class="submit" value="검색" onclick="check">
</form>