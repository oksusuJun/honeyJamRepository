<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<c:if test="${sessionScope.loginMember ==null}">
		<jsp:forward page="/member/login.jsp" />
</c:if>

<form action="/HoneyJamGuestHouse/boardInsert" method="post">

제목: <input type="text" name="title"><br>
내용:
<textarea cols="70" rows="15" name="content"></textarea><br>
<button>등록</button>



</body>
</html>