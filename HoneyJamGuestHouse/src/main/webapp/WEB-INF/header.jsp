<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(function() {
		$(".mainmenu > li").on("mouseover", function() {
			$(this).children(".submenu").stop().slideDown();
		});
		$(".mainmenu > li").on("mouseleave", function() {
			$(this).children(".submenu").stop().slideUp();
		});
	});
	function pop1() {
		alert("로그인이 필요합니다.");
		
	}
</script>
<style type="text/css">
* {
	margin: 0 auto;
	list-style: none;
	padding: 0;
	text-align: center;
	color: black;
	list-style: none;
	text-decoration: none;
}

body {
	min-width: 1080px;
}

header {
	margin: 0 auto;
	width: 100%;
	height: 49px;
	border-bottom: 1px solid #000;
	padding-top: 5px;
	padding-bottom: 5px;
}

.header_left {
	margin-left: 15%;
	float: left;
	height: 100%;
	width: 40%;
}

.header_left_img {
	width: 20%;
	float: left;
	border-right: 1px solid #000;
	height: 100%;
}
.header_left_img > a > img{
	width: 80%;
	height: 80%;
	margin-top: 5px;
}

.header_left_menu {
	float: left;
	width: 70%;
	height: 100%;
}

.mainmenu {
	float: left;
	width: 100px;
	z-index: 10;
	position: relative;
}

.mainmenu>li {
	height: 50px;
}

.mainmenu>li>a {
	line-height: 50px;
}

.submenu {
	display: none;
}

.submenu>li {
	width: 100%;
	float: none;
	height: 30px;
	height: 40px;
	background-color: rgba(0, 0, 0, 0.8);
}

.submenu>li>a {
	line-height: 40px;
	color: #fff;
}

.header_right {
	width: 15%;
	margin-right: 15%;
	float: right;
	height: 100%;
}

.header_right>ul {
	width: 100%;
	height: 100%;
}

.header_right>ul>li {
	width: 40%;
	height: 100%;
	float: left;
	background: #fff;
	cursor: pointer;
	border: 1px solid #000;
	outline: none;
	border: 0px;
}

.header_right>ul>li>a {
	line-height: 49px;
}
</style>

<header>
	<div class="header_left">
		<div class="header_left_img">
			<a href="${initParam.rootPath }/main.jsp"> <img src="/HoneyJamGuestHouse/img/logo.png" alt="img" title="img"></a>
		</div>
		<div class="header_left_menu">
			<ul class="mainmenu">
				<li><a href="${initParam.rootPath }/roomInfo/room_info.jsp?roomId=201&gender=0">소개</a>
					<ul class="submenu">
						<li><a href="${initParam.rootPath }/roomInfo/room_info.jsp?roomId=201&gender=0">2인실</a></li>
						<li><a href="${initParam.rootPath }/roomInfo/room_info.jsp?roomId=401&gender=0">4인실</a></li>
						<li><a href="${initParam.rootPath }/roomInfo/room_info.jsp?roomId=601&gender=0">6인실</a></li>
						<li><a href="${initParam.rootPath }/roomInfo/room_info.jsp?roomId=801&gender=0">8인실</a></li>
					</ul></li>
			</ul>
			<ul class="mainmenu">
				<li><a href="#">예약</a>
					<c:choose>
						<c:when test="${sessionScope.loginMember != null}">
							<ul class="submenu">
								<li><a href="#">예약하기</a></li>
								<li><a href="#">예약조회</a></li>
							</ul>
						</c:when>
						<c:otherwise>
							<ul class="submenu">
								<li><a href="#">예약하기</a></li>
								<li><a href="${initParam.rootPath }/member/login.jsp" onclick="pop1()">예약조회</a></li>
							</ul>
						</c:otherwise>
					</c:choose>
					</li>
			</ul>
			<ul class="mainmenu">
				<li><a href="${initParam.rootPath }/board/QnA.jsp">커뮤니티</a>
					<ul class="submenu">
						<li><a href="${initParam.rootPath }/board/QnA.jsp">QnA</a></li>
						<li><a href="${initParam.rootPath }/boardSelect">리뷰게시판</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
	<div class="header_right">
		<c:choose>
			<c:when test="${sessionScope.loginMember != null}">
				<ul>
					<li><a href="${initParam.rootPath }/logout">로그아웃</a></li>
					<li><a href="${initParam.rootPath }/member/mypage.jsp">마이페이지</a></li>
				</ul>
			</c:when>

			<c:otherwise>
				<ul>
					<li><a href="${initParam.rootPath }/member/login.jsp" id="maintologin">로그인</a></li>
					<li><a href="${initParam.rootPath }/member/join.jsp">회원가입</a></li>
				</ul>
			</c:otherwise>
		</c:choose>

	</div>
</header>