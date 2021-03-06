<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>HoneyJam</title>
<meta charset="UTF-8">
<script src="/HoneyJamGuestHouse/scripts/jquery.js"></script>
<script src="/HoneyJamGuestHouse/scripts/jquery-ui.js"></script>
<link rel="stylesheet" href="/HoneyJamGuestHouse/css/cal.css">

<style type="text/css">
@font-face{
	font-family: myFont;
	src: url('/HoneyJamGuestHouse/font/HoonWhitecatR.ttf');
}

* {
	padding: 0;
	margin: 0 auto;
}

.body {
	width: 1100px;
	min-width: 1100px;
	padding-top: 2%;
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


button {
	width: 100px;
	height: 50px;
	background: #0283df;
	border: 0;
	outline: 0;
	color: #fff;
	cursor: pointer;
	border-radius: 30px;
}

.content {
	width: 1100px;
	min-width: 1100px;
	text-align: center;
	margin-top: 30px;
	float: left;
}

.content_top {
	width: 100%;
	height: 80px;
	text-align: left;
	line-height: 30px;
}

.content_top>h1 {
	width: 70%;
	height: 100%;
	float: left;
}

.content_top>button {
	margin-right: 7.5%;
	width: 15%;
	height: 50%;
	width: 15%;
	float: right;
}

p {
	width: 50%;
	float: left;
	text-align: left;
	margin-top: 10px;
}

</style>
</head>
<body>
	<!-- header 가져오기 -->
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/nav.jsp"></jsp:include>

	<!-- 성별이 없으면 메인에서 있다면 검색화면에서 옴 -->
	<%
		if (request.getParameter("gender").equals("0")) {
	%>
	<style>

	button {
	display: none;
}
.content_top > h1 {
width: 100%;
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
		if (request.getParameter("roomId").equals("201") || request.getParameter("roomId").equals("202")) {
			// room_list_view 에서 request 로 넘어온 값을 받아서 다시 session으로 던진다.
			session.setAttribute("roomId", request.getParameter("roomId"));
			session.setAttribute("price", request.getParameter("price"));
	%>
	<div class="body">
		<div class="title" style="font-family: myFont; font-size: 50px;">♥2인실♥</div>
		<div class="img">
			<img alt="img" src="../img/2인실.jpg" style="width: 59.5%; margin-right: 0.5%"> <img alt="img" src="../img/2인실_1.jpg"
				style="width: 40%">
		</div>
		<div class="content">
			<div class="content_top">
				<h1>시설안내</h1>
				<c:choose>
					<c:when test="${sessionScope.loginMember == null }">
						<a href="${initParam.rootPath }/member/login.jsp"><button>로그인 후 예약하기</button></a>
					</c:when>
					<c:otherwise>
						<a href="${initParam.rootPath }/reservation/final_reservation_info.jsp"><button>예약하기</button></a>
					</c:otherwise>
				</c:choose>
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
			session.setAttribute("roomId", request.getParameter("roomId"));
			session.setAttribute("price", request.getParameter("price"));
	%>
	<div class="body">
		<div class="title" style="font-family: myFont; font-size: 50px;">♥4인실♥</div>
		<div class="img">
			<img alt="img" src="../img/4인실.jpg" style="width: 59.5%; margin-right: 0.5%"> <img alt="img" src="../img/4인실_1.jpg"
				style="width: 40%">
		</div>
		<div class="content">
			<div class="content_top">
				<h1>시설안내</h1>
				<c:choose>
					<c:when test="${sessionScope.loginMember == null }">
						<a href="${initParam.rootPath }/member/login.jsp"><button>로그인 후 예약하기</button></a>
					</c:when>
					<c:otherwise>
						<a href="${initParam.rootPath }/reservation/final_reservation_info.jsp"><button>예약하기</button></a>
					</c:otherwise>
				</c:choose>

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
		} else if (request.getParameter("roomId").equals("601") || request.getParameter("roomId").equals("602")) {
			session.setAttribute("roomId", request.getParameter("roomId"));
			session.setAttribute("price", request.getParameter("price"));
	%>
	<div class="body">
		<div class="title" style="font-family: myFont; font-size: 50px;">♥6인실♥</div>
		<div class="img">
			<img alt="img" src="../img/6인실.jpg" style="width: 59.5%; margin-right: 0.5%"> <img alt="img" src="../img/6인실_1.jpg"
				style="width: 40%">
		</div>
		<div class="content">
			<div class="content_top">
				<h1>시설안내</h1>
				<c:choose>
					<c:when test="${sessionScope.loginMember == null }">
						<a href="${initParam.rootPath }/member/login.jsp"><button>로그인 후 예약하기</button></a>
					</c:when>
					<c:otherwise>
						<a href="${initParam.rootPath }/reservation/final_reservation_info.jsp"><button>예약하기</button></a>
					</c:otherwise>
				</c:choose>

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
		} else if (request.getParameter("roomId").equals("801") || request.getParameter("roomId").equals("802")) {
			session.setAttribute("roomId", request.getParameter("roomId"));
			session.setAttribute("price", request.getParameter("price"));
	%>
	<div class="body">
		<div class="title" style="font-family: myFont; font-size: 50px;">♥8인실♥</div>
		<div class="img">
			<img alt="img" src="../img/8인실.jpg" style="width: 59.5%; margin-right: 0.5%"> <img alt="img" src="../img/8인실_1.jpg"
				style="width: 40%">
		</div>
		<div class="content">
			<div class="content_top">
				<h1>시설안내</h1>
				<c:choose>
					<c:when test="${sessionScope.loginMember == null }">
						<a href="${initParam.rootPath }/member/login.jsp"><button>로그인 후 예약하기</button></a>
					</c:when>
					<c:otherwise>
						<a href="${initParam.rootPath }/reservation/final_reservation_info.jsp"><button>예약하기</button></a>
					</c:otherwise>
				</c:choose>

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
		}
	%>


</body>
</body>
</html>