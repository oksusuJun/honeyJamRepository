<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/HoneyJamGuestHouse/scripts/jquery.js"></script>
<title>Insert title here</title>
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
.text1{
width: 165px;
height: 59px;
float: left;
background: #f9f9f9;
line-height: 60px;
border-bottom: 1px solid gray; 
border-right: 1px solid gray;
}
.text2{
	width: 410px;
	height: 59px;
	float: right;
	line-height: 60px;
	border-bottom: 1px solid gray; 
}
.text2 > input {
width: 200px;
height: 27px;
}
form > button{
margin-top : 30px;
width: 95%;
height: 60px;
background: #fff;
outline: none;
border: 2px solid pink;
border-radius: 5px;
font-size: 20px;
cursor: pointer;
}
</style>
</head>


<script>
	function checkVals() {
		var f = document.edit;
		if (f.oldPass.value.length == 0) {
			alert("기존 비밀번호를 입력하세요");
			f.oldPass.focus();
			return false;
		} else if (f.nickname.value.length == 0) {
			alert("닉네임을 입력하세요");
			f.nickname.focus();
			return false;
		} else if (f.phoneNum.value.length == 0) {
			alert("전화번호를 입력하세요");
			f.phoneNum.focus();
			return false;
		} else if (f.password.value != f.password1.value) {
			alert("새 비밀번호를 다시 확인해주세요")
			f.password.value = "";
			f.password1.value = "";
			f.password.focus();
			return false;
		} else if (f.oldPass.value != "${sessionScope.loginMember.password}") {
			alert("기존 비밀번호가 틀렸어요");
			f.oldPass.value = "";
			f.oldPass.focus();
			return false;
		} else {
			return true;
		}

	}

	function checkPassword() {
		var f = document.edit;
		if (f.password.value != f.password1.value) {
			alert("새 비밀번호를 다시 확인해주세요")
			f.password.value = "";
			f.password1.value = "";
			f.password.focus();
			return false;
		} else if (f.oldPass.value != "${sessionScope.loginMember.password}") {
			alert("기존 비밀번호가 틀렸어요");
			f.oldPass.value = "";
			f.oldPass.focus();
			return false;
		} else {
			return true;
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
				<a href="${initParam.rootPath }/member/mypage.jsp">내 정보 조회 </a> <a href="${initParam.rootPath}/member/edit.jsp">내 정보 수정 </a> <a
					href="${initParam.rootPath}/member/reservation_view.jsp">예약조회</a> <a href="${initParam.rootPath}/member/boardSelect">내가
					작성한 리뷰 </a> <a href="${initParam.rootPath}/member/delete.jsp">탈퇴 </a><br>
			</div>
		</div>

		<div class="content">
			<h1>회원정보수정</h1>
			<form action="${initParam.rootPath }/memberEdit" method="post" name="edit" onsubmit="return checkVals();">
				<div class="text1" style="border-top: 1px solid gray">아이디(Email) :</div>
				<div class="text2" style="border-top: 1px solid gray">${sessionScope.loginMember.email }</div>
				<div class="text1">기존 비밀번호 : </div><div class="text2"><input type="password" name="oldPass"></div>
				<div class="text1">새 비밀번호 : </div><div class="text2"><input type="password" name="password"></div>
				<div class="text1">새 비밀번호 재확인 : </div><div class="text2"><input type="password" name="password1"></div>
				<div class="text1">닉네임 : </div><div class="text2"><input type="text" name="nickname" value="${sessionScope.loginMember.nickname }"></div>
				<div class="text1">전화번호 : </div><div class="text2"><input type="text" name="phoneNum" value="${sessionScope.loginMember.phoneNum }"></div>
				<button>정보수정</button>
			</form>
			<c:if test="${requestScope.errorMessage != null }">
				<script>
					alert("에러: " + "${requestScope.errorMessage}");
				</script>
			</c:if>
		</div>
	</div>

</body>
</html>