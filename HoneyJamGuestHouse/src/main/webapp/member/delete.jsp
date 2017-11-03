<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/HoneyJamGuestHouse/scripts/jquery.js"></script>
<title>HoneyJam</title>
<style type="text/css">
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

.menu > ul > li :hover{
background: #555555;
color: #fff;
}

.menu>ul>li>a {
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
	width: 165px;
	height: 59px;
	float: left;
	background: #f9f9f9;
	line-height: 60px;
	border-bottom: 1px solid gray;
	border-right: 1px solid gray;
}

.text2 {
	width: 410px;
	height: 59px;
	float: right;
	line-height: 60px;
	border-bottom: 1px solid gray;
}

.text2>input {
	width: 200px;
	height: 27px;
}

form>button {
	margin-top: 30px;
	width: 95%;
	height: 60px;
	background: #fff;
	outline: none;
	border: 2px solid #FF5A5F;
	border-radius: 5px;
	font-size: 20px;
	cursor: pointer;
}

.content_text {
	width: 100%;
	height: 100px;
	line-height: 100px;
	font-size: 24px;
}
</style>
</head>

<script>
	function checkform() {

		var f = document.delete_form;

		if (f.email.value.length == 0) {
			alert("이메일을 입력하세요");
			f.email.focus();
		} else if (f.password.value.length == 0) {
			alert("비밀번호를 입력하세요");
			f.password.focus();
		} else {
			f.submit();
		}

	}
</script>

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
				<ul>
					<li><a href="${initParam.rootPath }/member/mypage.jsp">내 정보 조회 </a></li>
					<li><a href="${initParam.rootPath}/member/edit.jsp">내 정보 수정 </a></li>
					<li><a href="${initParam.rootPath }/reservationSelectById">예약조회</a></li>
					<li><a href="${initParam.rootPath}/boardSelect">내가 작성한 리뷰 </a></li>
					<li><a href="${initParam.rootPath }/member/delete.jsp">탈퇴 </a></li>
					
					<c:if test="${sessionScope.loginMember.email == 'admin'}">
					<li><a href="${initParam.rootPath }/member/admin.jsp">관리자 페이지</a></li>
				</c:if>
					</ul>
				<br>
			</div>
		</div>
		<div class="content">
			<div class="content_text">ID와 비밀번호를 다시한번 입력해주세요</div>
			<form action="${initParam.rootPath}/deleteMember" method="post" name="delete_form">
				<div class="text1" style="border-top: 1px solid gray">아이디(email) :</div>
				<div class="text2" style="border-top: 1px solid gray">
					<input type="text" name="email">
				</div>
				<div class="text1">password :</div>
				<div class="text2">
					<input type="password" name="password">
				</div>
				<button type="button" onclick="checkform();">회원탈퇴</button>
			</form>

		</div>


		<c:if test="${requestScope.errorMessage != null}">
			<script>
				alert("에러: " + "${requestScope.errorMessage}");
			</script>
		</c:if>

	</div>

</body>
</html>