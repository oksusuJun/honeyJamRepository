<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/HoneyJamGuestHouse/scripts/jquery.js"></script>
<title>Insert title here</title>
<script>

function radioCheck() {
	   // 결제방식이 선택되었는지 체크 -> 선택 x -> 선택하라는 메세지
	   var paymentList = document.form1.payment;
	   var flag = false;
	   // 하나만 선택이된다하더라도 일단 값은 다 넘어온다. --> 배열로~~~~
	   for (var i = 0; i < paymentList.length; i++) {
	      if (paymentList[i].checked) {
	         flag = true;
	         return flag;
	      } 
	   }
	   if (!flag) {
	      alert("결제수단을 선택해주세요");
	      return false;
	      
	   }
	}
</script>
</head>
<style>

* {
	font-family: sans-serif;
}

.content {
	width: 1000px;
	min-width: 1000px;
	min-height: 540px;
	height: 540px;
	margin-top: 60px;

}

.content_top {
   width: 100%;
   float: left;
}

.text1 {
	width: 40%;
	float: left;
	height: 50px;
	line-height: 50px;
	font-weight: bold;

}

.text2 {

	width: 60%;
	float: right;
	height: 50px;
	line-height: 50px;

}

.next {
   width: 100%;
   height: 60px;
}


#btn1 {
	border-radius: 10px;
	background: #0283df;
	border: 0;
	outline: 0;
	color: #fff;
	cursor: pointer;
	border-radius: 30px;
	width: 70%;
	height: 50px;
	margin-top: 20px;

}
.radiobtn { 
	margin-top: 30px;
	float: left;
	width: 100%;
	height: 30px;
}

</style>

<body>

	<jsp:include page="/WEB-INF/header.jsp" />
	<div class="content">
		<h1>최종 예약정보</h1>


		<div class="content_top">


         <div class="text1">방 번호 :</div>
         <div class="text2">${sessionScope.roomId}호</div>
         <div class="text1">체크인 날짜 :</div>
         <div class="text2">${sessionScope.checkIn }</div>
         <div class="text1">체크아웃 날짜 :</div>
         <div class="text2">${sessionScope.checkOut }</div>
         <div class="text1">인원 :</div>
         <div class="text2">${sessionScope.people }명</div>
         <div class="text1">성별 :</div>
         <div class="text2">${sessionScope.gender }</div>
         <div class="text1">총 결제금액 :</div>
         <div class="text2">${sessionScope.price * sessionScope.people }원</div>


		</div>
		<form name="form1" method="post" action="/HoneyJamGuestHouse/reservationInsert" onsubmit="return radioCheck()">
			<div class="radiobtn">
				결제 방법 : <label>신용카드 : <input type="radio" name="payment" value="신용카드"></label> 
								<label>무통장입금 : <input type="radio" name="payment" value="무통장입금"></label>
			</div>
				<input type="submit" value="예약완료"  id="btn1">
		</form>

	</div>
	<jsp:include page="/WEB-INF/footer_ver2.jsp"></jsp:include>




</body>
</html>