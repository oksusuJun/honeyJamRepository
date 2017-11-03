<%@page import="java.sql.Date"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="toDay"/>
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
					href="${initParam.rootPath}/reservationSelectById">예약조회</a> <a href="${initParam.rootPath}/boardSelect">내가
					작성한 리뷰 </a> <a href="${initParam.rootPath}/member/delete.jsp">탈퇴 </a>
				<c:if test="${sessionScope.loginMember.email == 'admin'}">
				<a href="${initParam.rootPath }/member/admin.jsp">관리자 페이지</a>
				</c:if>
					<br>
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
						<td>결제 현황</td>
						<td>예약 취소
						</td>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${requestScope.reservation }" var="reservation">
						<tr>
							<td style="width: 70px;">${reservation.reservationId }</td>
							<td style="width: 100px">${reservation.email }</td>
							

							<td style="width: 150px">
							<fmt:formatDate value="${reservation.checkIn}" pattern="yyyyMMdd"/>
							</td>

							<td style="width: 150px">
							<fmt:formatDate value="${reservation.checkOut}" pattern="yyyyMMdd"/>
							</td>


							<td style="width: 50px">${reservation.numberOfGuests }</td>
							<td style="width: 70px;">${reservation.roomId }</td>
							<td style="width: 70px">${reservation.gender }</td>
							<td style="width: 70px">
								<c:choose>
									<c:when test="${reservation.paymentStatus == 0 }">
										결제 완료
									</c:when>
									<c:when test="${reservation.paymentStatus == 1 }">
										무통장 입금 - 입금 대기
									</c:when>
								</c:choose>
							</td>
							<td style="width: 150px">
							<c:set scope="page" var="current" value="<%=new Date(System.currentTimeMillis()) %>"/>
							<c:choose>
							<c:when test="${reservation.checkIn >= current }">
							<button type="button" onclick="location.href='/HoneyJamGuestHouse/reservationDelete?reservationId=${reservation.reservationId}&checkIn=${reservation.checkIn }'"> 
								예약 취소
								</button>
							</c:when>
							<c:otherwise>
								예약 확정
							</c:otherwise>
							</c:choose>
						
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>