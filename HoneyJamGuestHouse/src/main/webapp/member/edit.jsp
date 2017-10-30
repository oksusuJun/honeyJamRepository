<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원정보수정</h1>
<form action="${initParam.rootPath }/memberEdit" method="post">
email : ${sessionScope.loginMember.email }<br>
password : <input type="password" name="password"><br>
nickname : <input type="text" name="text" value="${sessionScope.loginMember.nickname }"><br>
phone number : <input type="text" name="text" value="${sessionScope.loginMember.phoneNum }"><br>
<p>
<button type="submit">제출</button>
</form>
</body>
</html>