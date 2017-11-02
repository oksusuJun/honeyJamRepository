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
@font-face {
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

.div1 {
	width: 800px;
	height: 300px;
}

thead>tr>td {
	color: blue;
	font-weight: bold;
	font-family: myFont;
	font-size: 30px;
}
</style>
<body>
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/nav.jsp"></jsp:include>

	<br><br>
	<%-- 검색 후 예약할 수 있는 방목록 --%>
	<h1>예약가능한 방목록</h1>
	<c:if test="${not empty requestScope.errorMessage }">
		<script>
			alert("에러: " + "${requestScope.errorMessage }");
		</script>
	</c:if>
	<div class="div1">
		<table>
			<thead>
				<tr>
					<td>방번호</td>
					<td>성별</td>
					<td>방 최대 수용 인원</td>
					<td>가격</td>
					<td>선택</td>
				</tr>
			</thead>
			<tbody>
				<!-- List에 담겨온 예약가능한 room을 for문으로 선택가능하도록 만들어준다. -->
					<!-- 현준 : jstl 로 작성하면 다시 이 값을 던져줄 수 있지 않을까...... -->
				
		 		<c:forEach items="${sessionScope.availableRoomList }" var="rooms">

					<tr>		
					 	<td style="width: 70px;">${rooms.roomId}</td>
						<td style="width: 150px">${rooms.gender}</td>
						<td style="width: 150px">${rooms.availableBed} 개</td>
						<td style="width: 50px">${rooms.price}원</td>
						<td>					
							<a href="${initParam.rootPath }/roomInfo/room_info.jsp?roomId=${rooms.roomId}&gender=${rooms.gender}&price=${rooms.price}" >

								<button>상세보기</button>
							</a>
						</td>
					</tr> 
				</c:forEach> 
				
			</tbody>
		</table>
	</div>
	<jsp:include page="/WEB-INF/footer_ver2.jsp"></jsp:include>
</body>
</html>