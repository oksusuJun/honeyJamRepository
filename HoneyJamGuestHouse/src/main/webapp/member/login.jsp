<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HoneyJam</title>
<style type="text/css">
* {
	margin: 0 auto;
	padding: 0;
	list-style: none;
	text-decoration: none;
}

.loginform {
	width: 400px;
}

.loginform>form>button {
	width: 400px;
	height: 70px;
	background: pink;
	color: #fff;
	margin-top: 10px;
	font-weight: bold;
	font-size: 16px;
	line-height: 70px;
	outline: 0;
	border: 0;
	cursor: pointer;
}

form {
	text-align: center;
}

input {
	width: 400px;
	height: 50px;
	margin-top: 20px;
}

.loginform_help {
	width: 100%;
	height: 30px;
	text-align: left;
	line-height: 30px;
	margin-top: 10px;
}

.loginform_help>a {
	color: #008489;
}

.loginform_bot {
	margin-top: 20px;
	width: 100%;
	height: 70px;
	line-height: 70px;
	border-top: 1px solid #dce0e0;
}

.loginform_bot>button {
	width: 100px;
	height: 30px;
	text-align: center;
	outline: 0;
	border: 1px solid pink;
	border-radius: 5px;
	background: #fff;
	cursor: pointer;
	margin-left: 10px;
}

.logo {
	margin-top: 30px;
	width: 400px;
	text-align: center;
	height: 100px;
	line-height: 125px;
}
</style>
</head>

<body>
	<div class="logo">
		<a href="${initParam.rootPath }/main.jsp	"><img src="/HoneyJamGuestHouse/img/logo.png" alt="img"></a>
	</div>
	<div class="loginform">
		<form action="${initParam.rootPath }/login" method="post">
			<input type="text" name="email" placeholder="Id(Email)"><br> <input type="password" name="password"
				placeholder="password"><br>

			<div class="loginform_help">
				<a href="#">아이디 찾기</a> <a href="#">비밀번호 찾기</a>
			</div>
			<button type="submit">로그인</button>
			<div class="loginform_bot">
				꿀잼게스트하우스 계정이 없으세요? <button><a href="${initParam.rootPath }/member/join.jsp">회원가입</a></button>
			</div>

		</form>

	</div>

	
<c:if test="${requestScope.errorMessage !=null}">
	<script>
	alert("에러: "+ "${requestScope.errorMessage }");
	</script>
</c:if>

</body>
</html>
