<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원조회</h1>
email : ${sessionScope.loginMember.email }<br>
password : ${sessionScope.loginMember.password }<br>
nickname : ${sessionScope.loginMember.nickname }<br>
phone number : ${sessionScope.loginMember.phoneNum }<br>

</body>
</html>