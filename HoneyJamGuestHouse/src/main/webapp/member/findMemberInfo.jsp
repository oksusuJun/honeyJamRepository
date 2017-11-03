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

</head>
<body>
	
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<div class="content">
		<div class="contents">
	
			<%
				if (request.getParameter("find").equals("id")) {
			%>
				<h1>ID 찾기</h1>
			<form name="form1" action="${initParam.rootPath }/memberSelect" method="post">
				<input type="text" name="phoneNum" placeholder="Phone Number" id="phoneNum" required> <input type="submit"
					value="아이디 찾기" id="value">
			</form>
			<%
				} else if (request.getParameter("find").equals("pw")) {
			%>
				<h1>Password 찾기</h1>
			<form name="form1" action="${initParam.rootPath }/memberSelect" method="post" >
				<input type="text" name="email" placeholder="Id(Email)" id="email" required> 
				<br>
				<input type="text" name="PhoneNumber" placeholder="PhoneNumber" id="pwPhoneNum" required>
				<br>
				<input type="submit" value="비밀번호 찾기">
			</form>
			<%
				}
			%>
		</div>
	</div>
	<jsp:include page="/WEB-INF/footer_ver2.jsp"></jsp:include>
</body>
</html>