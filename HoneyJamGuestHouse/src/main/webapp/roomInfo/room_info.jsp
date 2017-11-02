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

.content {
	width: 1100px;
	min-width: 1100px;
	text-align: center;
}

p {
	width: 50%;
	float: left;
	text-align: left;
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
</style>
	<%
		} else {
	%>
	<style>
</style>
	<%
		}
	%>
	<%
		if (request.getParameter("roomId").equals("201") || request.getParameter("roomId").equals("202")) {
	%>
	<div class="body">
		<div class="title">2인실</div>
		<div class="img">
			<img alt="img" src="../img/2인실.jpg" style="width: 59.5%; margin-right: 0.5%"> <img alt="img" src="../img/2인실_1.jpg"
				style="width: 40%">
		</div>
		<div class="content">
			<div class="content_top">
				<h1>시설안내</h1>
				<button>예약하기</button>

			</div>

			<p style="font-size: 15px; color: green">
				<img src="../images/freewifi.gif" style="width: 70px; height: 70px" align="middle"> 무료WiFi : 전객실 및 공용구역에서 Wi-Fi 를 무료로 이용
				가능 합니다.
			</p>
			<p style="font-size: 15px; color: green">
				<img src="../images/breakfast.gif" style="width: 70px; height: 70px" align="middle"> 무료조식 : 토스트, 커피, 우유, 쥬스, 계란(또는 치즈)
				,햄,과일,셀러드
			</p>
			<p style="font-size: 15px; color: green">
				<img src="../images/concierge.gif" style="width: 70px; height: 70px" align="middle"> 컨시어지 : 여행의 도우미, 여행지, 식당 추천, 여행 계획 및
				동선 Tip
			</p>
			<p style="font-size: 15px; color: green">
				<img src="../images/freemap.gif" style="width: 70px; height: 70px" align="middle"> 무료지도 : 자체 제작한 숙소 주변 맛집 지도와 무료 관광 지도
				구비
			</p>
			<p style="font-size: 15px; color: green">
				<img src="../images/freetowel.gif" style="width: 70px; height: 70px" align="middle"> 무료타월
			</p>
			<p style="font-size: 15px; color: green">
				<img src="../images/kitchen.gif" style="width: 70px; height: 70px" align="middle"> 주방시설 : 공용주방 , 인덕션, 전자렌지, 식기류 등 취사시설
				완비
			</p>
			<p style="font-size: 15px; color: green">
				<img src="../images/LaundryService.gif" style="width: 70px; height: 70px" align="middle"> 코인세탁실 : 세탁기(유료), 건조기(유료),
				다리미시설(무료)
			</p>
			<p style="font-size: 15px; color: green">
				<img src="../images/luggageStorage.gif" style="width: 70px; height: 70px" align="middle"> 짐보관 서비스 : 체크인 전, 체크아웃 후 무료 짐보관
				서비스
			</p>
			<p style="font-size: 15px; color: green">
				<img src="../images/nosmoke.gif" style="width: 70px; height: 70px" align="middle"> 금연건물 : 쾌적한 환경을 위해 객실, 공동구역 등 건물 내 전구역
				금연
			</p>
			<p style="font-size: 15px; color: green">
				<img src="../images/pc.gif" style="width: 70px; height: 70px" align="middle"> 공용PC : 로비에서 이용 가능
			</p>
			<p style="font-size: 15px; color: green">
				<img src="../images/restroom.gif" style="width: 70px; height: 70px" align="middle"> 휴게실 : 카페 분위기의 넓은 공용공간
			</p>
			<p style="font-size: 15px; color: green">
				<img src="../images/rocker.gif" style="width: 70px; height: 70px" align="middle"> 개인사물함 : 각 객실에 개인 물품 보관을 위한 개인 사물함 구비
			</p>
			<p style="font-size: 15px; color: green">
				<img src="../images/security.gif" style="width: 70px; height: 70px" align="middle"> 보안 : 출입구, 공동구역 CCTV 운영, 야간시간대 출입구
				보안설정
			</p>
			<p style="font-size: 15px; color: green">
				<img src="../images/terrace.gif" style="width: 70px; height: 70px" align="middle"> 야외테라스
			</p>
			<p style="font-size: 15px; color: green">
				<img src="../images/washitems.gif" style="width: 70px; height: 70px" align="middle"> 세면도구 : 샴푸, 린스, 바디워시, 비누 제공
			</p>
		</div>
	</div>
	<%
		} else if (request.getParameter("roomId").equals("401") || request.getParameter("roomId").equals("402")) {
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
									<button>상세보기</button>
							</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<%
		} else if (request.getParameter("roomId").equals("601") || request.getParameter("roomId").equals("602")) {
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
		} else if (request.getParameter("roomId").equals("801") || request.getParameter("roomId").equals("802")) {
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
