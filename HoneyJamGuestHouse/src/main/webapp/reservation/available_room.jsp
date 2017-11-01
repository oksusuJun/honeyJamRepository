<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HoneyJam</title>
<script src="/HoneyJamGuestHouse/scripts/jquery.js"></script>
<script src="/HoneyJamGuestHouse/scripts/jquery-ui.js"></script>
<link rel="stylesheet" href="/HoneyJamGuestHouse/css/cal.css">
<script type="text/javascript">
	$(function() {

		$(".calendar").datepicker({
			buttonImageOnly : true,
			numberOfMonths : 2,
			dateFormat : "yymmdd"
		});
	});
</script>
</head>
<style type="text/css">
@font-face{
	font-family: myFont;
	src: url('/HoneyJamGuestHouse/font/HoonWhitecatR.ttf');
}
* {
	margin: 0 auto;
	padding: 0px;
	text-align: center;
	list-style: none;
	text-decoration: none;
	color: #000;
}
table {
	border-collapse: collapse;
	width: 100%;
}

td, tr {
	border: 1px solid black;
}
.div1{
width: 800px;
height: 300px;
}
thead > tr > td{
color: blue;
font-weight: bold;
font-family: myFont;
font-size: 30px;
}
</style>
<body>
<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/nav.jsp"></jsp:include>

<%-- 검색 후 예약할 수 있는 방목록 --%>
<h1>예약가능한 방목록</h1>
<c:if test="${not empty requestScope.errorMessage }">
	<script>
		alert("에러: "+ "${requestScope.errorMessage }");
	</script>
</c:if>
<div class="div1">
			<table>
				<thead>
					<tr>
						<td>방번호</td>
						<td>성별</td>
						<td>남은 Bed</td>
						<td>가격</td>
						<td>선택</td>
					</tr>
				</thead>
				<tbody>
				<!-- List에 담겨온 예약가능한 room을 for문으로 선택가능하도록 만들어준다. -->
					<c:forEach items="${requestScope.room }" var="room">
						<tr>
							<td style="width: 70px;">201${room.roomId }</td>
							<td style="width: 150px">여성전용${room.gender }</td>
							<td style="width: 150px">4${room.availableBed }개</td>
							<td style="width: 50px">20,000${room.price }원</td>
						</tr>
						<a href="'/room_info.jsp?roomId='+${room.roomId }+'&roomPrice='${room.price }">
						<button>예약하기</button>
						</a >
					</c:forEach>
					    <tr>
							<td style="width: 70px;">201${room.roomId }</td>
							<td style="width: 150px">여성전용${room.gender }</td>
							<td style="width: 150px">4${room.availableBed }개</td>
							<td style="width: 50px">20,000${room.price }원</td>
							<td style="width: 100px"><button type="submit">예약하기</button></td>
						
						</tr>
				</tbody>
		</table>
</div>
<jsp:include page="/WEB-INF/footer_ver2.jsp"></jsp:include>
</body>
</html>