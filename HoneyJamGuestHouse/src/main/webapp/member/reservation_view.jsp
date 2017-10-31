<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${sessionScope.loginMember ==null}">
<jsp:forward page="/member/login.jsp"/> 
</c:if>

<jsp:include page="/member/mypage.jsp"></jsp:include>
<br><br>


<h1>내방 예약조회</h1>
<c:forEach items="${requestScope.reservation }" var="reservation">
	예약번호 : ${reservation.reservationId }<br>
	예약자 id : ${reservation.email }<br>
	체크인 날짜 : ${reservation.checkIn }<br>
	체크아웃 날짜 : ${reservation.checkOut }<br>
	인원 : ${reservation.numberOfGuests }<br>
	방 번호 : ${reservation.roomId }<br>
	성별 : ${reservation.gender }<br> 
	
</c:forEach>



</body>
</html>