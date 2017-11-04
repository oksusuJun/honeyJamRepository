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

.content {
	width: 900px;
	min-height: 850px;
	height: 850px;
}

h1 {
	margin-bottom: 50px;
}

button {
	width: 120px;
	height: 40px;
	background: #fff;
	outline: 0;
	border: 2px solid #FF5A5F !important;
	cursor: pointer;
	border-radius: 30px;
	font-weight: bold;
}

.box {
	width: 100%;
	height: 200px;
	border: 1px solid gray;
	margin-top: 10px;
}

img {
	width: 27%;
	height: 180px;
	margin: 10px;
	float: left;
}
.boxIsKing{
width: 70%;
height : 100%;
float: right;
font-size: 14px;
}

.box_top {
	width: 33.3%;
	height: 100px;;
	float: left;
	line-height: 100px; 
}

.box_bot {
	width: 50%;
	height: 100px;
	line-height : 100px;
	float: left;
}
</style>
<body>
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/nav.jsp"></jsp:include>

	<br>
	<br>
	<%-- 검색 후 예약할 수 있는 방목록 --%>
	
	${sessionScope.checkIn}~${sessionScope.checkOut}
	
	<h1>예약가능한 방목록</h1>
	<c:if test="${not empty requestScope.errorMessage }">
		<script>
			alert("에러: " + "${requestScope.errorMessage }");
		</script>
	</c:if>
	
	
	<div class="content">

		<!-- List에 담겨온 예약가능한 room을 for문으로 선택가능하도록 만들어준다. -->
		<!-- 현준 : jstl 로 작성하면 다시 이 값을 던져줄 수 있지 않을까...... -->
		<c:forEach items="${sessionScope.availableRoomList }" var="rooms">
			<div class="box">
				<c:choose>
					<c:when test="${rooms.roomId eq '201' || rooms.roomId eq '202'}">
						<img src="/HoneyJamGuestHouse/img/2인실.jpg" alt="img" title="img">
					</c:when>
					<c:when test="${rooms.roomId eq '401' || rooms.roomId eq '402'}">
						<img src="/HoneyJamGuestHouse/img/4인실.jpg" alt="img" title="img">
					</c:when>
					<c:when test="${rooms.roomId eq '601' || rooms.roomId eq '602'}">
						<img src="/HoneyJamGuestHouse/img/6인실.jpg" alt="img" title="img">
					</c:when>
					<c:when test="${rooms.roomId eq '801' || rooms.roomId eq '802'}">
						<img src="/HoneyJamGuestHouse/img/8인실.jpg" alt="img" title="img">
					</c:when>
				</c:choose>
				<div class="boxIsKing">
					<div class="box_top"  style="width: 20%">Room : ${rooms.roomId}</div>
					<div class="box_top" style="width: 46.6%">숙박가능한 성별 : ${rooms.gender}</div>
					<div class="box_top">방 최대 수용인원 : ${rooms.availableBed} 명</div>
					<div class="box_bot">가격 : ${rooms.price}원</div>
					<div class="box_bot">
						<a href="${initParam.rootPath }/roomInfo/room_info.jsp?roomId=${rooms.roomId}&gender=${rooms.gender}&price=${rooms.price}">
							<button>상세보기</button>
						</a>
					</div>
				</div>


			</div>
		</c:forEach>


	</div>
	<jsp:include page="/WEB-INF/footer_ver2.jsp"></jsp:include>
</body>
</html>