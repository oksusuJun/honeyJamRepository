<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>내방 예약조회</h1>
예약번호 : ${sessionScope.reservation.reservationId }<br>
예약자 id : ${sessionScope.reservation.email }<br>
체크인 날짜 : ${sessionScope.reservation.checkIn }<br>
체크아웃 날짜 : ${sessionScope.reservation.checkOut }<br>
인원 : ${sessionScope.reservation.numberOfGuests }<br>
방 번호 : ${sessionScope.reservation.roomId }<br>
성별 : ${sessionScope.reservation.gender }<br> 
</body>
</html>