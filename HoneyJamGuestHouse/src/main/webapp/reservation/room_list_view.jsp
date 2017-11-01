<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>방 목록</h1> 
<!-- session에서 값이 들어오는지 TEST -->
checkIn : ${sessionScope.checkIn}<br>
checkOut : ${sessionScope.checkOut}<br>
인원 : ${sessionScope.people}<br>
성별 : ${sessionScope.gender}<br>
---------방 목록--------------<br>
<c:forEach items="${sessionScope.roomList }" var="rooms">
	${rooms }<br>
</c:forEach>

</body>
</html>