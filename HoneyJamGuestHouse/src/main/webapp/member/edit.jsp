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
nickname : <input type="text" name="nickname" value="${sessionScope.loginMember.nickname }"><br>
phone number : <input type="text" name="phoneNum" value="${sessionScope.loginMember.phoneNum }"><br>
<p>
<button type="submit">제출</button>
</form>

<c:if test="${requestScope.errorMessage != null }">
<script>
	alert("에러: "+"${requestScope.errorMessage}");
</script>
</c:if>
</body>
</html>