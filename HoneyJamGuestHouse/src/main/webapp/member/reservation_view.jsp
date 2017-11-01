<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/HoneyJamGuestHouse/scripts/jquery.js"></script>
<title>HoneyJam</title>
</head>
<style>
* {
	margin: 0 auto;
	padding: 0px;
	text-align: center;
	list-style: none;
	text-decoration: none;
	color: #000;
}

.body {
	margin-top: 100px;
	max-width: 960px;
	min-width: 960px;
}

.body_left {
	width: 17%;
	float: left;
}

.myinfo {
	width: 100%;
	height: 200px;
	float: left;
	line-height: 200px;
	background: #525f78;
	color: #fff;
}

.menu {
	width: 100%;
	min-height: 200px;
	float: left;
	background: #a4a4a4;
}

.menu>a {
	border-bottom: 0.1px solid grey;
	color: #fff;
	width: 90%;
	float: left;
	text-align: left;
	height: 40px;
	line-height: 40px;
	padding-left: 10%;
}

.content {
	width: 70%;
	float: left;
	padding-left: 10%;
}

.content h1 {
	margin-bottom: 40px;
}

table {
	border-collapse: collapse;
	margin: 20px auto;
	width: 100%;
	font-size: 13px;
}

thead {
    font-weight: bold;
	font-size: 14px;
}

td, th {
	border: 1px solid black;
	text-align: center;
	padding: 10px;
}
</style>

<body>

	<c:if test="${sessionScope.loginMember ==null}">
		<jsp:forward page="/member/login.jsp" />
	</c:if>
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>


	<div class="body">
		<div class="body_left">
			<div class="myinfo">
				${sessionScope.loginMember.email } 님<br> 환영합니다.
			</div>
			<div class="menu">
				<a href="${initParam.rootPath }/member/mypage.jsp">내 정보 조회 </a> <a href="${initParam.rootPath}/member/edit.jsp">내 정보 수정 </a> <a
					href="${initParam.rootPath}/reservationSelect">예약조회</a> <a href="${initParam.rootPath}/boardSelect">내가
					작성한 리뷰 </a> <a href="${initParam.rootPath}/member/delete.jsp">탈퇴 </a><br>
			</div>
		</div>

		<div class="content">
			<h1>예약 조회</h1>
			<table>
				<thead>
					<tr>
						<td>예약<br>번호</td>
						<td>ID</td>
						<td>체크 인</td>
						<td>체크 아웃</td>
						<td>예약 인원</td>
						<td>객실</td>
						<td>성별</td>
						<td>결제<br>현황
						</td>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td>A1234</td>
						<td>test@test.com</td>
						<td>2018년 1월 1일</td>
						<td>2018년 1월 2일</td>
						<td>2 명</td>
						<td>202호</td>
						<td>남</td>
						<td>결제 완료</td>
					</tr>
					<c:forEach items="${requestScope.reservation }" var="reservation">
						<tr>
							<td style="width: 70px;">${reservation.reservationId }</td>
							<td style="width: 100px">${reservation.email }</td>
							<td style="width: 150px">${reservation.checkIn }</td>
							<td style="width: 150px">${reservation.checkOut }</td>
							<td style="width: 50px">${reservation.numberOfGuests }</td>
							<td style="width: 70px;">${reservation.roomId }</td>
							<td style="width: 70px">${reservation.gender }</td>
							<td style="width: 70px">${reservation.paymentStatus }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>