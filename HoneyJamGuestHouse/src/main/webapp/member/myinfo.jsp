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

<h1>회원조회</h1>
email : ${sessionScope.loginMember.email }<br>
password : **<br>
nickname : ${sessionScope.loginMember.nickname }<br>
phone number : ${sessionScope.loginMember.phoneNum }<br>


</body>
</html>