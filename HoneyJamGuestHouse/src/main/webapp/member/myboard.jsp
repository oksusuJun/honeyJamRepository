<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${sessionScope.loginMember ==null}">
<jsp:forward page="/member/login.jsp"/> 
</c:if>

<jsp:include page="/member/mypage.jsp"></jsp:include>
<br><br>

</body>
</html>