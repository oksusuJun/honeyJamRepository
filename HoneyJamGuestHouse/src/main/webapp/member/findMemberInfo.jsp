<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script src="/HoneyJamGuestHouse/scripts/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HoneyJam</title>
<style type="text/css">
* {
	margin: 0 auto;
	padding: 0;
}

.content {
	width: 600px;
	height: 620px;
}
.contents {
	width: 100%;
	height: 100px;
	line-height: 100px;
	padding-top: 180px;
}

#phoneNum {
	width: 39%;
	height: 50px;
	float: left;
}

#value {
	width: 59%;
	height: 50px;
	float: right;
}
</style>
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
</head>
<body>
	${requestScope.find }
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<div class="content">
		<div class="contents">
	
			<%
				if (request.getParameter("find").equals("id")) {
			%>
				<h1>ID 찾기</h1>
			<form name="form1" action="${initParam.rootPath }/memberSelect" method="post" onsubmit="return findIdCheck();">
				<input type="text" name="phoneNum" placeholder="Phone Number" id="phoneNum"> <input type="submit"
					value="아이디 찾기" id="value">
			</form>
			<%
				} else if (request.getParameter("find").equals("pw")) {
			%>
				<h1>Password 찾기</h1>
			<form name="form1" action="${initParam.rootPath }/memberSelect" method="post" onsubmit="return findPwCheck();">
				<input type="text" name="email" placeholder="Id(Email)" id="email"> <input type="submit" value="비밀번호 찾기">
			
			</form>
			<%
				}
			%>
		</div>
	</div>
	<jsp:include page="/WEB-INF/footer_ver2.jsp"></jsp:include>
</body>
</html>