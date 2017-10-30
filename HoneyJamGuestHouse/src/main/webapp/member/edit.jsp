<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
email : ${sessionScope.loginMember.email }
password : 
<c:choose>
	<c:when test="${sessionScope.loginMember.password == null }">
		${sessionScope.loginMember.password}
	</c:when>
	<c:otherwise>
		<c:set target="${sessionScope.loginMember }" property="password" value='<input type="password" name="password">'/>
	</c:otherwise>
</c:choose>

</body>
</html>