<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

	<%
		if (request.getParameter("find").equals("id")) {
	%>
	<form name="form1" action="${initParam.rootPath }/memberSelect"
		method="post" onsubmit="return findIdCheck();">
		<input type="text" name="phoneNum" placeholder="Phone Number"
			id="phoneNum"> <br> 
		<input type="submit" value="아이디 찾기">
		<br>
	</form>
	<%
		} else if (request.getParameter("find").equals("pw")) {
	%>
	<form name="form1" action="${initParam.rootPath }/memberSelect"
		method="post" onsubmit="return findPwCheck();">
		<input type="text" name="email" placeholder="Id(Email)" id="email">
		<br> 
		<input type="submit" value="비밀번호 찾기"> <br>
	</form>
	<%
		}
	%>

</body>
</html>