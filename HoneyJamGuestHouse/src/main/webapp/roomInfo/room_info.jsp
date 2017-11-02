

<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>HoneyJam</title>
<meta charset="UTF-8">
<script src="/HoneyJamGuestHouse/scripts/jquery.js"></script>

<style type="text/css">
* {
	padding: 0;
	margin: 0 auto;
}

.body {
	width: 1100px;
	min-width: 1100px;
	padding-top: 2%;
}

.content {
	margin-top: 30px;
}

.title {
	width: 100%;
	height: 50px;
	text-align: left;
	font-size: 24px;
}

.img {
	width: 100%;
	height: 500px;
	float: left;
}

.img>img {
	float: left;
	height: 500px;
}

.content {
	width: 100%;
	float: left;
	border: 1px solid gray;
}

.content_top {
	width: 100%;
	height: 30px;
	text-align: left;
	margin-left: 20px;
	line-height: 30px;
}

table {
	width: 100%;
}

table>thead>tr {
	background: rgba(0, 0, 0, 0.2);
	text-align: left;
	margin-left: 5px;
	height: 30px;
}

table>tbody>tr {
	width: 100%;
	height: 170px;
	line-height: 170px;
}

button {
	width: 100px;
	height: 50px;
	background: #0283df;
	border: 0;
	outline: 0;
	color: #fff;
	cursor: pointer;
}
</style>
</head>
<body>
	<!-- header 가져오기 -->
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>

	<!-- 성별이 없으면 메인에서 있다면 검색화면에서 옴 -->
	<%
		if (request.getParameter("gender").equals("0")) {
	%>
	<style>
button {
	display: none;
}
</style>
	<%
		} else {
	%>
	<style>
button {
	display: block;
}
</style>
	<%
		}
	%>
	<%
		if (request.getParameter("roomId").equals("201")) {
	%>
	<div class="body">
		<div class="title">임의제목</div>
		<div class="img">
			<img alt="img" src="../img/2인실.jpg" style="width: 59.5%; margin-right: 0.5%"> <img alt="img" src="../img/2인실_1.jpg"
				style="width: 40%">
		</div>
		<div class="content">
			<div class="content_top">꿀잠게스트하우스 방정보(HoneyJamGusetHouse Room)</div>
			<table cellspacing="0">
				<thead>
					<tr>
						<th width="12.5%">객실이름</th>
						<th width="32.5%">포함상품&상품안내</th>
						<th width="15%">예약가능인원</th>
						<th width="20%">1박당 요금</th>
						<th width="20%">예약하기</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${sessionScope.roomMap }" var="rooms">
						<tr>
							<td style="width: 70px;">${rooms.value.roomId }</td>
							<td style="width: 150px">${rooms.value.gender }</td>
							<td style="width: 150px">${rooms.value.availableBed }개</td>
							<td style="width: 50px">${rooms.value.price }원</td>
							<td><a href="${initParam.rootPath }/roomInfo/room_info.jsp?roomId=${rooms.value.roomId }">
									<button>상세보기</button>
							</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<%
		} else if (request.getParameter("roomId").equals("401")) {
	%>
	<div class="body">
		<div class="title">임의제목</div>
		<div class="img">
			<img alt="img" src="../img/4인실.jpg" style="width: 59.5%; margin-right: 0.5%"> <img alt="img" src="../img/4인실_1.jpg"
				style="width: 40%">
		</div>
		<div class="content">
			<div class="content_top">꿀잠게스트하우스 방정보(HoneyJamGusetHouse Room)</div>
			<table cellspacing="0">
				<thead>
					<tr>
						<th width="12.5%">객실이름</th>
						<th width="32.5%">포함상품&상품안내</th>
						<th width="15%">예약가능인원</th>
						<th width="20%">1박당 요금</th>
						<th width="20%">예약하기</th>
					</tr>
				</thead>
				<tbody>
						<c:forEach items="${sessionScope.roomMap }" var="rooms">
						<tr>
							<td style="width: 70px;">${rooms.value.roomId }</td>
							<td style="width: 150px">${rooms.value.gender }</td>
							<td style="width: 150px">${rooms.value.availableBed }개</td>
							<td style="width: 50px">${rooms.value.price }원</td>
							<td><a href="${initParam.rootPath }/roomInfo/room_info.jsp?roomId=${rooms.value.roomId }">
									<button>상세보기</button>S
							</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<%
		} else if (request.getParameter("roomId").equals("601")) {
	%>
	<div class="body">
		<div class="title">임의제목</div>
		<div class="img">
			<img alt="img" src="../img/6인실.jpg" style="width: 59.5%; margin-right: 0.5%"> <img alt="img" src="../img/6인실_1.jpg"
				style="width: 40%">
		</div>
		<div class="content">
			<div class="content_top">꿀잠게스트하우스 방정보(HoneyJamGusetHouse Room)</div>
			<table cellspacing="0">
				<thead>
					<tr>
						<th width="12.5%">객실이름</th>
						<th width="32.5%">포함상품&상품안내</th>
						<th width="15%">예약가능인원</th>
						<th width="20%">1박당 요금</th>
						<th width="20%">예약하기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="background: rgba(0, 0, 0, 0.2);">${requestScope.room.roomId }</td>
						<td></td>
						<td>${requestScope.room.price }</td>
						<td>${requestScope.room.price }</td>
						<td><button>예약</button></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<%
		} else if (request.getParameter("roomId").equals("801")) {
	%>
	<div class="body">
		<div class="title">임의제목</div>
		<div class="img">
			<img alt="img" src="../img/8인실.jpg" style="width: 59.5%; margin-right: 0.5%"> <img alt="img" src="../img/8인실_1.jpg"
				style="width: 40%">
		</div>
		<div class="content">
			<div class="content_top">꿀잠게스트하우스 방정보(HoneyJamGusetHouse Room)</div>
			<table cellspacing="0">
				<thead>
					<tr>
						<th width="12.5%">객실이름</th>
						<th width="32.5%">포함상품&상품안내</th>
						<th width="15%">예약가능인원</th>
						<th width="20%">1박당 요금</th>
						<th width="20%">예약하기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="background: rgba(0, 0, 0, 0.2);">${requestScope.room.roomId }</td>
						<td></td>
						<td>${requestScope.room.price }</td>
						<td>${requestScope.room.price }</td>
						<td><button>예약</button></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<%
		}
	%>


</body>
</body>
</html>