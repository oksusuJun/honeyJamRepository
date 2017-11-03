<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script src="/HoneyJamGuestHouse/scripts/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HoneyJam</title>
<script>
	function findIdCheck() {
		var f = document.form1;
		var phoneNum = f.phoneNum.value;
		var flag = false;

		if (phoneNum.length > 13) {
			alert("핸드폰 번호를 정확히 입력하세요");
			f.phoneNum.value = '';
			f.phoneNum.focus();
			return flag;
		} else if (phoneNum.length == 0) {
			alert("핸드폰 번호를 입력해주셔야 ID를 찾아드릴 수 있어요!!");
			f.phoneNum.value = '';
			f.phoneNum.focus();
			return flag;
		} else {
			flag = true;
			return flag;
		}
	}

	function findPwCheck() {
		var f = document.form1;
		var email = f.email.value;
		var flag = false;
		
		if (email.lengh == 0) {
			alert("가입시 등록하신 Email(ID)를 입력하시면 비밀번호를 찾아드릴게요~!!");
			return flag;
		} else {
			flag = true;
			return flag;
		}
	}
</script>
<style>
.content {
	width: 900px;
	min-width: 900px;
	height: 600px;
	min-height: 600px;
	margin-top: 50px;
}

table {
	border-collapse: collapse;
	width: 100%;
}

table td {
	padding: 12px 10px;
	border: 1px solid black;
}

.content_bot {
	margin-top: 30px;
}
button{
	border-radius: 10px;
	background: #0283df;
	border: 0;
	outline: 0;
	color: #fff;
	cursor: pointer;
	border-radius: 30px;
}
.content_top{
margin-bottom: 20px;
font-size: 30px;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<div class="content">
		<div class="content_top">
			<p>회원 정보 찾기가 완료되었습니다.</p>
		</div>
		<c:choose>
		<c:when test="${requestScope.email != null }">
			<table>
			<tr>
				<td colspan="2">ID(Email) 조회 정보</td>
			</tr>
			<tr>
				<td>ID(Email)</td>
				<td>${requestScope.email }</td>
			
		</table>
		</c:when>
		<c:when test="${requestScope.password != null }">
		<table>
			<tr>
				<td colspan="2">비밀번호 조회 정보</td>
			</tr>
			<tr>
				<td>Password</td>
				<td>${requestScope.password }</td>
			
		</table>
		</c:when>
		<c:when test="${requestScope.nullCheck eq null }">
		<table>
			<tr>
				<td colspan="2">회원 조회 정보</td>
			</tr>
			<tr>
				<td>조회 내용</td>
				<td>입력하신 내용으로 조회된 회원은 없습니다.</td>
			
		</table>
		</c:when>
		</c:choose>


		<div class="content_bot">
			<button onclick="location.href='/HoneyJamGuestHouse'" style="padding: 10px 50px;">홈</button>
			<a href="${initParam.rootPath }/reservationSelectById"><button style="padding: 10px 50px;">예약확인(마이페이지)</button></a>
		</div>

	</div>
	<jsp:include page="/WEB-INF/footer_ver2.jsp"></jsp:include>
</body>
</html>