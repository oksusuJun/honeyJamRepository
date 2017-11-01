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
<!-- roomId 잘 들어오는지 확인 -->
${sessionScope.roomId }
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>

	<c:choose>
		<c:when test="${sessionScope.gender eq '남성'}">
			<style>
button {
	display: none;
}
</style>
		</c:when>
		<c:otherwise>
			<style>
button {
	display: block;
}
</style>
		</c:otherwise>
	</c:choose>

	<c:choose>
		<c:when test="${sessionScope.roomId eq '201' }">
			<div class="body">
				<div class="title">임의제목</div>
				<div class="img">
					<img alt="img" src="../img/2인실.jpg"
						style="width: 59.5%; margin-right: 0.5%"> <img alt="img"
						src="../img/2인실_1.jpg" style="width: 40%">
				</div>
				<div class="content">
					<div class="content_top">꿀잠게스트하우스 방정보(HoneyJamGusetHouse
						Room)</div>
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
								<td style="background: rgba(0, 0, 0, 0.2);">${sessionScope.roomId }</td>
								<td></td>
								<td>${sessionScope.price }</td>
								<td>${sessionScope.price }</td>
								<td><button>예약</button></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>
		<c:when test="${sessionScope.roomId eq '401' }">
			<div class="body">
				<div class="title">임의제목</div>
				<div class="img">
					<img alt="img" src="../img/4인실.jpg"
						style="width: 59.5%; margin-right: 0.5%"> <img alt="img"
						src="../img/4인실_1.jpg" style="width: 40%">
				</div>
				<div class="content">
					<div class="content_top">꿀잠게스트하우스 방정보(HoneyJamGusetHouse
						Room)</div>
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
								<td style="background: rgba(0, 0, 0, 0.2);">${sessionScope.roomId }</td>
								<td></td>
								<td>${sessionScope.price }</td>
								<td>${sessionScope.price }</td>
								<td><button>예약</button></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>
		<c:when test="${sessionScope.roomId eq '601' }">
			<div class="body">
				<div class="title">임의제목</div>
				<div class="img">
					<img alt="img" src="../img/6인실.jpg"
						style="width: 59.5%; margin-right: 0.5%"> <img alt="img"
						src="../img/6인실_1.jpg" style="width: 40%">
				</div>
				<div class="content">
					<div class="content_top">꿀잠게스트하우스 방정보(HoneyJamGusetHouse
						Room)</div>
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
								<td style="background: rgba(0, 0, 0, 0.2);">${sessionScope.roomId }</td>
								<td></td>
								<td>${sessionScope.price }</td>
								<td>${sessionScope.price }</td>
								<td><button>예약</button></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>
		<c:when test="${sessionScope.roomId eq '801' }">
			<div class="body">
				<div class="title">임의제목</div>
				<div class="img">
					<img alt="img" src="../img/8인실.jpg"
						style="width: 59.5%; margin-right: 0.5%"> <img alt="img"
						src="../img/8인실_1.jpg" style="width: 40%">
				</div>
				<div class="content">
					<div class="content_top">꿀잠게스트하우스 방정보(HoneyJamGusetHouse
						Room)</div>
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
								<td style="background: rgba(0, 0, 0, 0.2);">${sessionScope.roomId }</td>
								<td></td>
								<td>${sessionScope.price }</td>
								<td>${sessionScope.price }</td>
								<td><button>예약</button></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>

	</c:choose>

</body>
</html>