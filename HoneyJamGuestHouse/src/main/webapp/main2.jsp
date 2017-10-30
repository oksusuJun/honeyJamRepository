<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="${initParam.rootPath }/main.jsp">메인으로 </a>
<hr>


<c:choose>
	<c:when test="${sessionScope.loginMember != null}">
		<h1>${sessionScope.loginMember.email}님 환영합니다.</h1>
		<a href="${initParam.rootPath }/member/mypage.jsp">마이페이지</a><br>
		<a href="${initParam.rootPath }/logout">로그아웃</a>
	</c:when>
	
	<c:otherwise>
		<a href="${initParam.rootPath}/member/join.jsp">회원가입</a><br>
		<a href="${initParam.rootPath}/member/login.jsp">로그인</a><br>
	</c:otherwise>


</c:choose>

</body>
</html> 
