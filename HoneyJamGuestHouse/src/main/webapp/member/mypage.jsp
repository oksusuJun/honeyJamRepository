<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HoneyJam</title>
<script src="/HoneyJamGuestHouse/scripts/jquery.js"></script>
<style type="text/css">
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
	width: 60%;
	float: left;
	padding-left: 10%;
}

.content h1 {
	margin-bottom: 40px;
}

.text1 {
	width: 30%;
	float: left;
	text-align: center;
	height: 40px;
	line-height: 40px;
	border-right : 0.1px solid grey;
	background: #f9f9f9;
}
.text1,.text2{
	border-bottom: 0.1px solid grey;
}
.text2 {
	width: 69.8%;
	float: right;
	text-align: center;
	height: 40px;
	line-height: 40px
}
table{
width: 100%;
}
</style>
</head>
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
				<a href="${initParam.rootPath }/member/mypage.jsp">내 정보 조회 </a> <a href="${initParam.rootPath}/member/edit.jsp">내 정보 수정 </a>
				<a href="${initParam.rootPath }/reservationSelect">예약조회</a> <a href="${initParam.rootPath}/boardSelect">내가 작성한 리뷰 </a> 
				<a href="${initParam.rootPath }/member/delete.jsp">탈퇴 </a>
				
				<c:if test="${sessionScope.loginMember.email == 'admin'}">
				<a href="${initParam.rootPath }/member/admin.jsp">관리자 페이지</a>
				</c:if>
				<br>

			</div>
		</div>

		<div class="content">
			<h1>회원조회</h1>
			<table>
				<tr>
					<td class="text1" style="border-top: 0.1px solid gray">email</td>
					<td class="text2" style="border-top: 0.1px solid gray">${sessionScope.loginMember.email }</td>
				</tr>
				<tr>
					<td class="text1">password :</td>
					<td class="text2">****</td>
				</tr>
				<tr>
					<td class="text1">nickname :</td>
					<td class="text2">${sessionScope.loginMember.nickname }</td>
				</tr>
				<tr>
					<td class="text1">phone number :</td>
					<td class="text2">${sessionScope.loginMember.phoneNum }</td>
				</tr>
			</table>


		</div>
	</div>
</body>
</html>
